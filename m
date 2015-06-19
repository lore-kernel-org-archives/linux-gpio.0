From: Michael van der Westhuizen <michael@smart-africa.com>
Subject: [PATCH 1/2] gpio: bgpio: Teach gpio-generic about the pinctrl subsystem
Date: Fri, 19 Jun 2015 14:58:16 +0200
Message-ID: <1434718697-31335-2-git-send-email-michael@smart-africa.com>
References: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:33044 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751494AbbFSM6d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2015 08:58:33 -0400
Received: by wgez8 with SMTP id z8so89091619wge.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2015 05:58:32 -0700 (PDT)
In-Reply-To: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Kamlakant Patel <kamlakant.patel@linaro.org>, Michael van der Westhuizen <michael@smart-africa.com>

The basic MMIO gpio driver is unaware of the pinctrl subsystem,
and this lack of pinctrl awareness extends to drivers using bgpio
unless the drivers handle pinctrl interaction by overriding the
request and free methods of gpiochip.

Since pinctrl consumer interfaces are stubbed when pinctrl is not
enabled this implementation is very simple, and there is no
behaviour change when pinctrl is not enabled.

Tested on picoXcell pc3x3 using gpio-dwapb.

Signed-off-by: Michael van der Westhuizen <michael@smart-africa.com>
---
 drivers/gpio/gpio-generic.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index b92a690..be28ba2 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -58,6 +58,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/io.h>
 #include <linux/gpio.h>
 #include <linux/slab.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/basic_mmio_gpio.h>
@@ -467,11 +468,17 @@ static int bgpio_setup_direction(struct bgpio_chip *bgc,
 static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
 {
 	if (gpio_pin < chip->ngpio)
-		return 0;
+		return pinctrl_request_gpio(chip->base + gpio_pin);
 
 	return -EINVAL;
 }
 
+static void bgpio_free(struct gpio_chip *chip, unsigned gpio_pin)
+{
+	if (gpio_pin < chip->ngpio)
+		pinctrl_free_gpio(chip->base + gpio_pin);
+}
+
 int bgpio_remove(struct bgpio_chip *bgc)
 {
 	gpiochip_remove(&bgc->gc);
@@ -499,6 +506,7 @@ int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
 	bgc->gc.base = -1;
 	bgc->gc.ngpio = bgc->bits;
 	bgc->gc.request = bgpio_request;
+	bgc->gc.free = bgpio_free;
 
 	ret = bgpio_setup_io(bgc, dat, set, clr);
 	if (ret)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
