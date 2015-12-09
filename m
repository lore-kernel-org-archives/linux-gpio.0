From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 175/182] video: fbdev: via: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:50:49 +0100
Message-ID: <1449669049-7022-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35922 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754769AbbLINux (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:50:53 -0500
Received: by lbblt2 with SMTP id lt2so30466780lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:50:52 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Tomi: please ACK this so I can take it through the GPIO tree.
---
 drivers/video/fbdev/via/via-gpio.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/via/via-gpio.c b/drivers/video/fbdev/via/via-gpio.c
index 6f433b8cee12..ab3a00df9773 100644
--- a/drivers/video/fbdev/via/via-gpio.c
+++ b/drivers/video/fbdev/via/via-gpio.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/spinlock.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/via-core.h>
 #include <linux/via-gpio.h>
@@ -83,9 +83,7 @@ struct viafb_gpio_cfg {
 static void via_gpio_set(struct gpio_chip *chip, unsigned int nr,
 			 int value)
 {
-	struct viafb_gpio_cfg *cfg = container_of(chip,
-						  struct viafb_gpio_cfg,
-						  gpio_chip);
+	struct viafb_gpio_cfg *cfg = gpiochip_get_data(chip);
 	u8 reg;
 	struct viafb_gpio *gpio;
 	unsigned long flags;
@@ -115,9 +113,7 @@ static int via_gpio_dir_out(struct gpio_chip *chip, unsigned int nr,
  */
 static int via_gpio_dir_input(struct gpio_chip *chip, unsigned int nr)
 {
-	struct viafb_gpio_cfg *cfg = container_of(chip,
-						  struct viafb_gpio_cfg,
-						  gpio_chip);
+	struct viafb_gpio_cfg *cfg = gpiochip_get_data(chip);
 	struct viafb_gpio *gpio;
 	unsigned long flags;
 
@@ -131,9 +127,7 @@ static int via_gpio_dir_input(struct gpio_chip *chip, unsigned int nr)
 
 static int via_gpio_get(struct gpio_chip *chip, unsigned int nr)
 {
-	struct viafb_gpio_cfg *cfg = container_of(chip,
-						  struct viafb_gpio_cfg,
-						  gpio_chip);
+	struct viafb_gpio_cfg *cfg = gpiochip_get_data(chip);
 	u8 reg;
 	struct viafb_gpio *gpio;
 	unsigned long flags;
@@ -255,7 +249,8 @@ static int viafb_gpio_probe(struct platform_device *platdev)
 	 * Get registered.
 	 */
 	viafb_gpio_config.gpio_chip.base = -1;  /* Dynamic */
-	ret = gpiochip_add(&viafb_gpio_config.gpio_chip);
+	ret = gpiochip_add_data(&viafb_gpio_config.gpio_chip,
+				&viafb_gpio_config);
 	if (ret) {
 		printk(KERN_ERR "viafb: failed to add gpios (%d)\n", ret);
 		viafb_gpio_config.gpio_chip.ngpio = 0;
-- 
2.4.3

