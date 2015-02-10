From: Hans Holmberg <hans.holmberg@intel.com>
Subject: [PATCH] gpiolib: of: allow of_gpiochip_find_and_xlate to find more than one chip per node
Date: Tue, 10 Feb 2015 09:48:27 +0100
Message-ID: <1423558107-23264-1-git-send-email-hans.holmberg@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, robert.jarzmik@free.fr, cochran@lexmark.com, Daniel Mack <zonque@gmail.com>, tylerwhall@gmail.com, Hans Holmberg <hans.holmberg@intel.com>
List-Id: linux-gpio@vger.kernel.org

The change:

7b8792bbdffdff3abda704f89c6a45ea97afdc62
gpiolib: of: Correct error handling in of_get_named_gpiod_flags

assumed that only one gpio-chip is registred per of-node.
Some drivers register more than one chip per of-node, so
adjust the matching function of_gpiochip_find_and_xlate to
not stop looking for chips if a node-match is found and
the translation fails.

Signed-off-by: Hans Holmberg <hans.holmberg@intel.com>
---
 drivers/gpio/gpiolib-of.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 08261f2..26645a8 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -46,12 +46,13 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
 
 	ret = gc->of_xlate(gc, &gg_data->gpiospec, gg_data->flags);
 	if (ret < 0) {
-		/* We've found the gpio chip, but the translation failed.
-		 * Return true to stop looking and return the translation
-		 * error via out_gpio
+		/* We've found a gpio chip, but the translation failed.
+		 * Store translation error in out_gpio.
+		 * Return false to keep looking, as more than one gpio chip
+		 * could be registered per of-node.
 		 */
 		gg_data->out_gpio = ERR_PTR(ret);
-		return true;
+		return false;
 	 }
 
 	gg_data->out_gpio = gpiochip_get_desc(gc, ret);
-- 
1.9.1
