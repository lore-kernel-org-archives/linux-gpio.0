From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 078/182] gpio: vx855: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:27:38 +0100
Message-ID: <1449667658-1109-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36179 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754AbbLIN1m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:27:42 -0500
Received: by lfs39 with SMTP id 39so34357862lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:27:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-vx855.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index 57b470d5b39e..764999cc0794 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -96,7 +96,7 @@ static inline u_int32_t gpio_o_bit(int i)
 static int vx855gpio_direction_input(struct gpio_chip *gpio,
 				     unsigned int nr)
 {
-	struct vx855_gpio *vg = container_of(gpio, struct vx855_gpio, gpio);
+	struct vx855_gpio *vg = gpiochip_get_data(gpio);
 	unsigned long flags;
 	u_int32_t reg_out;
 
@@ -120,7 +120,7 @@ static int vx855gpio_direction_input(struct gpio_chip *gpio,
 
 static int vx855gpio_get(struct gpio_chip *gpio, unsigned int nr)
 {
-	struct vx855_gpio *vg = container_of(gpio, struct vx855_gpio, gpio);
+	struct vx855_gpio *vg = gpiochip_get_data(gpio);
 	u_int32_t reg_in;
 	int ret = 0;
 
@@ -146,7 +146,7 @@ static int vx855gpio_get(struct gpio_chip *gpio, unsigned int nr)
 static void vx855gpio_set(struct gpio_chip *gpio, unsigned int nr,
 			  int val)
 {
-	struct vx855_gpio *vg = container_of(gpio, struct vx855_gpio, gpio);
+	struct vx855_gpio *vg = gpiochip_get_data(gpio);
 	unsigned long flags;
 	u_int32_t reg_out;
 
@@ -259,7 +259,7 @@ static int vx855gpio_probe(struct platform_device *pdev)
 
 	vx855gpio_gpio_setup(vg);
 
-	return gpiochip_add(&vg->gpio);
+	return gpiochip_add_data(&vg->gpio, vg);
 }
 
 static int vx855gpio_remove(struct platform_device *pdev)
-- 
2.4.3

