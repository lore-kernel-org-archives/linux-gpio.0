From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: make sure gpiod_to_irq() returns negative on NULL desc
Date: Wed, 15 Jun 2016 23:03:24 +0200
Message-ID: <1466024604-28014-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34076 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932084AbcFOVDd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2016 17:03:33 -0400
Received: by mail-lf0-f44.google.com with SMTP id j7so28225089lfg.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2016 14:03:32 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>

commit 54d77198fdfbc4f0fe11b4252c1d9c97d51a3264
("gpio: bail out silently on NULL descriptors")
doesn't work for gpiod_to_irq(): drivers assume that NULL
descriptors will give negative IRQ numbers in return.

It has been pointed out that returning 0 is NO_IRQ and that
drivers should be amended to treat this as an error, but that
is for the longer term: now let us repair the semantics.

Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Reported-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 58d822d7e8da..f39bf05993e7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2056,7 +2056,14 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	struct gpio_chip *chip;
 	int offset;
 
-	VALIDATE_DESC(desc);
+	/*
+	 * Cannot VALIDATE_DESC() here as gpiod_to_irq() consumer semantics
+	 * requires this function to not return zero on an invalid descriptor
+	 * but rather a negative error number.
+	 */
+	if (!desc || !desc->gdev || !desc->gdev->chip)
+		return -EINVAL;
+
 	chip = desc->gdev->chip;
 	offset = gpio_chip_hwgpio(desc);
 	if (chip->to_irq) {
-- 
2.4.11

