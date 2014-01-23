From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: vr41xx: mark GPIO lines used for IRQ
Date: Fri, 24 Jan 2014 00:07:57 +0100
Message-ID: <1390518477-10020-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:63209 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751616AbaAWXIK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2014 18:08:10 -0500
Received: by mail-wg0-f47.google.com with SMTP id m15so2295199wgh.14
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2014 15:08:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org

When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
the gpiolib so we can keep track of the usage centrally.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
It would be much appreciated if one of the MIPS people could
test this patch, thanks in advance. (I did compile-test it
with a MIPS cross compiler.)
---
 drivers/gpio/gpio-vr41xx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpio/gpio-vr41xx.c b/drivers/gpio/gpio-vr41xx.c
index b983bc079102..c6728cee0cfd 100644
--- a/drivers/gpio/gpio-vr41xx.c
+++ b/drivers/gpio/gpio-vr41xx.c
@@ -80,6 +80,7 @@ static DEFINE_SPINLOCK(giu_lock);
 static unsigned long giu_flags;
 
 static void __iomem *giu_base;
+static struct gpio_chip vr41xx_gpio_chip;
 
 #define giu_read(offset)		readw(giu_base + (offset))
 #define giu_write(offset, value)	writew((value), giu_base + (offset))
@@ -134,12 +135,31 @@ static void unmask_giuint_low(struct irq_data *d)
 	giu_set(GIUINTENL, 1 << GPIO_PIN_OF_IRQ(d->irq));
 }
 
+static unsigned int startup_giuint(struct irq_data *data)
+{
+	if (gpio_lock_as_irq(&vr41xx_gpio_chip, data->hwirq))
+		dev_err(vr41xx_gpio_chip.dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			data->hwirq);
+	/* Satisfy the .enable semantics by unmasking the line */
+	unmask_giuint_low(data);
+	return 0;
+}
+
+static void shutdown_giuint(struct irq_data *data)
+{
+	mask_giuint_low(data);
+	gpio_unlock_as_irq(&vr41xx_gpio_chip, data->hwirq);
+}
+
 static struct irq_chip giuint_low_irq_chip = {
 	.name		= "GIUINTL",
 	.irq_ack	= ack_giuint_low,
 	.irq_mask	= mask_giuint_low,
 	.irq_mask_ack	= mask_ack_giuint_low,
 	.irq_unmask	= unmask_giuint_low,
+	.irq_startup	= startup_giuint,
+	.irq_shutdown	= shutdown_giuint,
 };
 
 static void ack_giuint_high(struct irq_data *d)
-- 
1.8.4.2

