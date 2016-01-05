From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: generic: fix signedness bug found by cppcheck
Date: Tue,  5 Jan 2016 11:16:56 +0100
Message-ID: <1451989016-4126-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34113 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751543AbcAEKRD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 05:17:03 -0500
Received: by mail-lf0-f46.google.com with SMTP id y184so291101895lfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 02:17:02 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, David Binderman <dcb314@hotmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

cppcheck reports this:

(style) int result is returned as long value. If the return
value is long to avoid loss of information, then you have
loss of information.

This can be fixed with (1UL << pin) but that is the same
as using <linux/bitops.h> that already use 1UL so take
this approach.

Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-generic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index ea581dc23d44..053a7f0a83e6 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -58,6 +58,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/io.h>
 #include <linux/gpio.h>
 #include <linux/slab.h>
+#include <linux/bitops.h>
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/basic_mmio_gpio.h>
@@ -126,13 +127,13 @@ static unsigned long bgpio_read32be(void __iomem *reg)
 
 static unsigned long bgpio_pin2mask(struct bgpio_chip *bgc, unsigned int pin)
 {
-	return 1 << pin;
+	return BIT(pin);
 }
 
 static unsigned long bgpio_pin2mask_be(struct bgpio_chip *bgc,
 				       unsigned int pin)
 {
-	return 1 << (bgc->bits - 1 - pin);
+	return BIT(bgc->bits - 1 - pin);
 }
 
 static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
-- 
2.4.3

