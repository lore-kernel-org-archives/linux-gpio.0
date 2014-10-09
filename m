From: Haojian Zhuang <haojian.zhuang@linaro.org>
Subject: [PATCH] gpio: pl061: hook request if gpio-ranges avaiable
Date: Thu,  9 Oct 2014 17:42:15 +0800
Message-ID: <1412847735-498-1-git-send-email-haojian.zhuang@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:51484 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754506AbaJIJn3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Oct 2014 05:43:29 -0400
Received: by mail-oi0-f53.google.com with SMTP id v63so1899680oia.40
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2014 02:43:29 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>

gpio-ranges property could binds gpio to pinctrl. But there may be some
gpios without pinctrl operation. So check whether gpio-ranges property
exists in device node first.

Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 84b49cf..d1813f0 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -52,28 +52,34 @@ struct pl061_gpio {
 
 	void __iomem		*base;
 	struct gpio_chip	gc;
+	int			uses_pinctrl;
 
 #ifdef CONFIG_PM
 	struct pl061_context_save_regs csave_regs;
 #endif
 };
 
-static int pl061_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int pl061_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
 	/*
 	 * Map back to global GPIO space and request muxing, the direction
 	 * parameter does not matter for this controller.
 	 */
-	int gpio = chip->base + offset;
+	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	int gpio = gc->base + offset;
 
-	return pinctrl_request_gpio(gpio);
+	if (chip->uses_pinctrl)
+		return pinctrl_request_gpio(gpio);
+	return 0;
 }
 
-static void pl061_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void pl061_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
-	int gpio = chip->base + offset;
+	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	int gpio = gc->base + offset;
 
-	pinctrl_free_gpio(gpio);
+	if (chip->uses_pinctrl)
+		pinctrl_free_gpio(gpio);
 }
 
 static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
@@ -264,6 +270,9 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 
 	spin_lock_init(&chip->lock);
 
+	/* Hook the request()/free() for pinctrl operation */
+	if (of_property_read_bool(dev->of_node, "gpio-ranges"))
+		chip->uses_pinctrl = true;
 	chip->gc.request = pl061_gpio_request;
 	chip->gc.free = pl061_gpio_free;
 	chip->gc.direction_input = pl061_direction_input;
-- 
1.9.1

