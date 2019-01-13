From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 1/2] gpio: hlwd: Add basic IRQ support
Date: Sun, 13 Jan 2019 14:58:43 +0100
Message-ID: <20190113135844.13109-2-j.neuschaefer@gmx.net>
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

This patch implements level-triggered IRQs in the Hollywood GPIO driver.
Edge triggered interrupts are not supported in this GPIO controller, so
I moved their emulation into a separate patch.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---

I'm not entirely sure about the locking, but lockdep doesn't complain.
---
 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-hlwd.c | 136 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 136 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b5a2845347ec..f77180dd87bd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -258,6 +258,7 @@ config GPIO_HLWD
 	tristate "Nintendo Wii (Hollywood) GPIO"
 	depends on OF_GPIO
 	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
 	help
 	  Select this to support the GPIO controller of the Nintendo Wii.
 
diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index a63136a68ba3..9a93546f3d11 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -48,9 +48,107 @@
 
 struct hlwd_gpio {
 	struct gpio_chip gpioc;
+	struct irq_chip irqc;
 	void __iomem *regs;
+	int irq;
 };
 
+static void hlwd_gpio_irqhandler(struct irq_desc *desc)
+{
+	struct hlwd_gpio *hlwd =
+		gpiochip_get_data(irq_desc_get_handler_data(desc));
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long flags;
+	unsigned long pending;
+	int hwirq;
+
+	spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+	pending = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTFLAG);
+	pending &= hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTMASK);
+	spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
+
+	chained_irq_enter(chip, desc);
+
+	for_each_set_bit(hwirq, &pending, 32) {
+		int irq = irq_find_mapping(hlwd->gpioc.irq.domain, hwirq);
+
+		generic_handle_irq(irq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void hlwd_gpio_irq_ack(struct irq_data *data)
+{
+	struct hlwd_gpio *hlwd =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+
+	hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTFLAG, BIT(data->hwirq));
+}
+
+static void hlwd_gpio_irq_mask(struct irq_data *data)
+{
+	struct hlwd_gpio *hlwd =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	unsigned long flags;
+	u32 mask;
+
+	spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+	mask = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTMASK);
+	mask &= ~BIT(data->hwirq);
+	hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTMASK, mask);
+	spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
+}
+
+static void hlwd_gpio_irq_unmask(struct irq_data *data)
+{
+	struct hlwd_gpio *hlwd =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	unsigned long flags;
+	u32 mask;
+
+	spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+	mask = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTMASK);
+	mask |= BIT(data->hwirq);
+	hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTMASK, mask);
+	spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
+}
+
+static void hlwd_gpio_irq_enable(struct irq_data *data)
+{
+	hlwd_gpio_irq_ack(data);
+	hlwd_gpio_irq_unmask(data);
+}
+
+static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
+{
+	struct hlwd_gpio *hlwd =
+		gpiochip_get_data(irq_data_get_irq_chip_data(data));
+	unsigned long flags;
+	u32 level;
+
+	spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+
+	switch (flow_type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		level = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTLVL);
+		level |= BIT(data->hwirq);
+		hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTLVL, level);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		level = hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTLVL);
+		level &= ~BIT(data->hwirq);
+		hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTLVL, level);
+		break;
+	default:
+		spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
+		return -EINVAL;
+	}
+
+	spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
+	return 0;
+}
+
 static int hlwd_gpio_probe(struct platform_device *pdev)
 {
 	struct hlwd_gpio *hlwd;
@@ -92,7 +190,43 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 		ngpios = 32;
 	hlwd->gpioc.ngpio = ngpios;
 
-	return devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc, hlwd);
+	res = devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc, hlwd);
+	if (res)
+		return res;
+
+	/* Mask and ack all interrupts */
+	iowrite32be(0, hlwd->regs + HW_GPIOB_INTMASK);
+	iowrite32be(0xffffffff, hlwd->regs + HW_GPIOB_INTFLAG);
+
+	/*
+	 * If this GPIO controller is not marked as an interrupt controller in
+	 * the DT, return.
+	 */
+	if (!of_property_read_bool(pdev->dev.of_node, "interrupt-controller"))
+		return 0;
+
+	hlwd->irq = platform_get_irq(pdev, 0);
+	if (hlwd->irq < 0) {
+		dev_info(&pdev->dev, "platform_get_irq returned %d\n",
+			 hlwd->irq);
+		return hlwd->irq;
+	}
+
+	hlwd->irqc.name = "GPIO";
+	hlwd->irqc.irq_mask = hlwd_gpio_irq_mask;
+	hlwd->irqc.irq_unmask = hlwd_gpio_irq_unmask;
+	hlwd->irqc.irq_enable = hlwd_gpio_irq_enable;
+	hlwd->irqc.irq_set_type = hlwd_gpio_irq_set_type;
+
+	res = gpiochip_irqchip_add(&hlwd->gpioc, &hlwd->irqc, 0,
+				   handle_level_irq, IRQ_TYPE_NONE);
+	if (res)
+		return res;
+
+	gpiochip_set_chained_irqchip(&hlwd->gpioc, &hlwd->irqc,
+				     hlwd->irq, hlwd_gpio_irqhandler);
+
+	return 0;
 }
 
 static const struct of_device_id hlwd_gpio_match[] = {
-- 
2.20.1
