From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: convince line to become input in irq helper
Date: Wed, 22 Jun 2016 16:33:35 +0200
Message-ID: <1466606015-16326-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:33609 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752600AbcFVOdl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2016 10:33:41 -0400
Received: by mail-lf0-f50.google.com with SMTP id f6so75389329lfg.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2016 07:33:40 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

The generic IRQ helper library just checks if the IRQ line is
set as input before activating it for interrupts. As we
recently started to check things better with .get_dir() it
turns out that it's good to try to convince the line to become
an input before attempting to lock it as IRQ.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 58d822d7e8da..b9a6a5c69fbb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1010,6 +1010,23 @@ static int gpiochip_irq_reqres(struct irq_data *d)
 	if (!try_module_get(chip->gpiodev->owner))
 		return -ENODEV;
 
+	/*
+	 * If it is possible to switch this GPIO to an input
+	 * this is a good time to do it.
+	 */
+	if (chip->direction_input) {
+		struct gpio_desc *desc;
+		int ret;
+
+		desc = gpiochip_get_desc(chip, d->hwirq);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
+	        ret = chip->direction_input(chip, d->hwirq);
+		if (!ret)
+			clear_bit(FLAG_IS_OUT, &desc->flags);
+	}
+
 	if (gpiochip_lock_as_irq(chip, d->hwirq)) {
 		chip_err(chip,
 			"unable to lock HW IRQ %lu for IRQ\n",
-- 
2.4.11

