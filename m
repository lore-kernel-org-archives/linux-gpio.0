From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 7/7] gpio: dwapb: use d->mask instead od BIT(bit)
Date: Sat, 22 Mar 2014 17:16:44 +0100
Message-ID: <1395505004-22650-8-git-send-email-bigeasy@linutronix.de>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@altera.com, delicious.quinoa@gmail.com, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: linux-gpio@vger.kernel.org

d->mask contains exact the same information as BIT(bit) so we could save
a few cycles here.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpio/gpio-dwapb.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 3c9cdda..ebfcf5c 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -113,7 +113,7 @@ static void dwapb_irq_enable(struct irq_data *d)
 
 	irq_gc_lock(igc);
 	val = readl(gpio->regs + GPIO_INTEN);
-	val |= BIT(d->hwirq);
+	val |= d->mask;
 	writel(val, gpio->regs + GPIO_INTEN);
 	irq_gc_unlock(igc);
 }
@@ -126,7 +126,7 @@ static void dwapb_irq_disable(struct irq_data *d)
 
 	irq_gc_lock(igc);
 	val = readl(gpio->regs + GPIO_INTEN);
-	val &= ~BIT(d->hwirq);
+	val &= d->mask;
 	writel(val, gpio->regs + GPIO_INTEN);
 	irq_gc_unlock(igc);
 }
@@ -158,7 +158,6 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = igc->private;
-	int bit = d->hwirq;
 	unsigned long level, polarity;
 
 	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
@@ -171,24 +170,24 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_BOTH:
-		level |= BIT(bit);
-		dwapb_toggle_trigger(gpio, bit);
+		level |= d->mask;
+		dwapb_toggle_trigger(gpio, d->hwirq);
 		break;
 	case IRQ_TYPE_EDGE_RISING:
-		level |= BIT(bit);
-		polarity |= BIT(bit);
+		level |= d->mask;
+		polarity |= d->mask;
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		level |= BIT(bit);
-		polarity &= ~BIT(bit);
+		level |= d->mask;
+		polarity &= ~d->mask;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		level &= ~BIT(bit);
-		polarity |= BIT(bit);
+		level &= ~d->mask;
+		polarity |= d->mask;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		level &= ~BIT(bit);
-		polarity &= ~BIT(bit);
+		level &= ~d->mask;
+		polarity &= ~d->mask;
 		break;
 	}
 
-- 
1.9.1
