From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: vf610: Replaces comma between expression statements
 by semicolon
Date: Fri, 13 Feb 2015 21:04:42 +0800
Message-ID: <1423832682.6895.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:34812 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752466AbbBMNEs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Feb 2015 08:04:48 -0500
Received: by mail-pa0-f45.google.com with SMTP id rd3so12027687pab.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2015 05:04:48 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Agner <stefan@agner.ch>, Shawn Guo <shawn.guo@freescale.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-vf610.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 971c739..7bd9f20 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -244,16 +244,16 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	gc = &port->gc;
 	gc->of_node = np;
 	gc->dev = dev;
-	gc->label = "vf610-gpio",
-	gc->ngpio = VF610_GPIO_PER_PORT,
+	gc->label = "vf610-gpio";
+	gc->ngpio = VF610_GPIO_PER_PORT;
 	gc->base = of_alias_get_id(np, "gpio") * VF610_GPIO_PER_PORT;
 
-	gc->request = vf610_gpio_request,
-	gc->free = vf610_gpio_free,
-	gc->direction_input = vf610_gpio_direction_input,
-	gc->get = vf610_gpio_get,
-	gc->direction_output = vf610_gpio_direction_output,
-	gc->set = vf610_gpio_set,
+	gc->request = vf610_gpio_request;
+	gc->free = vf610_gpio_free;
+	gc->direction_input = vf610_gpio_direction_input;
+	gc->get = vf610_gpio_get;
+	gc->direction_output = vf610_gpio_direction_output;
+	gc->set = vf610_gpio_set;
 
 	ret = gpiochip_add(gc);
 	if (ret < 0)
-- 
1.9.1



