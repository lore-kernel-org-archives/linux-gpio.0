From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 2/2] gpio: hlwd: Implement edge trigger emulation
Date: Sun, 13 Jan 2019 14:58:44 +0100
Message-ID: <20190113135844.13109-3-j.neuschaefer@gmx.net>
References: <20190113135844.13109-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190113135844.13109-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: linux-gpio@vger.kernel.org

Like the Spreadtrum EIC driver[1], this driver needs to emulate edge
triggered interrupts to support the generic gpio-keys driver.

[1]: https://www.spinics.net/lists/kernel/msg2764576.html

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/gpio/gpio-hlwd.c | 57 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index 9a93546f3d11..3d85e6a71b35 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -51,6 +51,8 @@ struct hlwd_gpio {
 	struct irq_chip irqc;
 	void __iomem *regs;
 	int irq;
+	u32 edge_emulation;
+	u32 rising_edge, falling_edge;
 };
 
 static void hlwd_gpio_irqhandler(struct irq_desc *desc)
@@ -61,10 +63,37 @@ static void hlwd_gpio_irqhandler(struct irq_desc *desc)
 	unsigned long flags;
 	unsigned long pending;
 	int hwirq;
+	u32 emulated_pending;
 
 	spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
 	pending = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTFLAG);
 	pending &= hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTMASK);
+
+	/* Treat interrupts due to edge trigger emulation separately */
+	emulated_pending = hlwd->edge_emulation & pending;
+	pending &= ~emulated_pending;
+	if (emulated_pending) {
+		u32 level, rising, falling;
+
+		level = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTLVL);
+		rising = level & emulated_pending;
+		falling = ~level & emulated_pending;
+
+		/* Invert the levels */
+		hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTLVL,
+				level ^ emulated_pending);
+
+		/* Ack all emulated-edge interrupts */
+		hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTFLAG,
+				emulated_pending);
+
+		/* Signal interrupts only on the correct edge */
+		rising &= hlwd->rising_edge;
+		falling &= hlwd->falling_edge;
+
+		/* Mark emulated interrupts as pending */
+		pending |= rising | falling;
+	}
 	spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 
 	chained_irq_enter(chip, desc);
@@ -120,6 +149,27 @@ static void hlwd_gpio_irq_enable(struct irq_data *data)
 	hlwd_gpio_irq_unmask(data);
 }
 
+static void hlwd_gpio_irq_setup_emulation(struct hlwd_gpio *hlwd, int hwirq,
+					  unsigned int flow_type)
+{
+	u32 level, state;
+
+	/* Set the trigger level to the inactive level */
+	level = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTLVL);
+	state = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_IN) & BIT(hwirq);
+	level &= ~BIT(hwirq);
+	level |= state ^ BIT(hwirq);
+	hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTLVL, level);
+
+	hlwd->edge_emulation |= BIT(hwirq);
+	hlwd->rising_edge &= ~BIT(hwirq);
+	hlwd->falling_edge &= ~BIT(hwirq);
+	if (flow_type & IRQ_TYPE_EDGE_RISING)
+		hlwd->rising_edge |= BIT(hwirq);
+	if (flow_type & IRQ_TYPE_EDGE_FALLING)
+		hlwd->falling_edge |= BIT(hwirq);
+}
+
 static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	struct hlwd_gpio *hlwd =
@@ -129,6 +179,8 @@ static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 
 	spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
 
+	hlwd->edge_emulation &= ~BIT(data->hwirq);
+
 	switch (flow_type) {
 	case IRQ_TYPE_LEVEL_HIGH:
 		level = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTLVL);
@@ -140,6 +192,11 @@ static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 		level &= ~BIT(data->hwirq);
 		hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTLVL, level);
 		break;
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_EDGE_BOTH:
+		hlwd_gpio_irq_setup_emulation(hlwd, data->hwirq, flow_type);
+		break;
 	default:
 		spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 		return -EINVAL;
-- 
2.20.1
