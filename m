From: Hoan Tran <hotran@apm.com>
Subject: [PATCH] gpio: dwapb: Add wakeup source support
Date: Fri,  8 Sep 2017 15:41:15 -0700
Message-ID: <1504910475-6682-1-git-send-email-hotran@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:35187 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753011AbdIHWod (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Sep 2017 18:44:33 -0400
Received: by mail-io0-f179.google.com with SMTP id i14so8514276ioe.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Sep 2017 15:44:32 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, lho@apm.com, kdinh@apm.com, Hoan Tran <hotran@apm.com>

This patch supports irq_set_wake for dwapb gpio. It allows GPIOs
to be configured as wakeup sources and wake the system from suspend.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
 drivers/gpio/gpio-dwapb.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c07ada9..5cdb7bc 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -77,6 +77,7 @@ struct dwapb_context {
 	u32 int_type;
 	u32 int_pol;
 	u32 int_deb;
+	u32 wake_en;
 };
 #endif
 
@@ -295,6 +296,22 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
+{
+	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = igc->private;
+	struct dwapb_context *ctx = gpio->ports[0].ctx;
+
+	if (enable)
+		ctx->wake_en |= BIT(d->hwirq);
+	else
+		ctx->wake_en &= ~BIT(d->hwirq);
+
+	return 0;
+}
+#endif
+
 static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 				   unsigned offset, unsigned debounce)
 {
@@ -385,6 +402,9 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		ct->chip.irq_disable = dwapb_irq_disable;
 		ct->chip.irq_request_resources = dwapb_irq_reqres;
 		ct->chip.irq_release_resources = dwapb_irq_relres;
+#ifdef CONFIG_PM_SLEEP
+		ct->chip.irq_set_wake = dwapb_irq_set_wake;
+#endif
 		ct->regs.ack = gpio_reg_convert(gpio, GPIO_PORTA_EOI);
 		ct->regs.mask = gpio_reg_convert(gpio, GPIO_INTMASK);
 		ct->type = IRQ_TYPE_LEVEL_MASK;
@@ -699,7 +719,8 @@ static int dwapb_gpio_suspend(struct device *dev)
 			ctx->int_deb	= dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
 
 			/* Mask out interrupts */
-			dwapb_write(gpio, GPIO_INTMASK, 0xffffffff);
+			dwapb_write(gpio, GPIO_INTMASK,
+				    0xffffffff & ~ctx->wake_en);
 		}
 	}
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-- 
1.9.1

