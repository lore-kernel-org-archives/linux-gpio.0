From: Hans Holmberg <hans.holmberg@intel.com>
Subject: [PATCH] gpiolib: of: Correct error handling in of_get_named_gpiod_flags
Date: Fri,  9 Jan 2015 09:40:43 +0100
Message-ID: <1420792844-27781-1-git-send-email-hans.holmberg@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:56174 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753805AbbAIIiZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 9 Jan 2015 03:38:25 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Hans Holmberg <hans.holmberg@intel.com>

of_get_named_gpiod_flags fails with -EPROBE_DEFER in cases
where the gpio chip is available and the GPIO translation fails.

This causes drivers to be re-probed erroneusly, and hides the
real problem(i.e. the GPIO number being out of range).

Signed-off-by: Hans Holmberg <hans.holmberg@intel.com>
---
 drivers/gpio/gpiolib-of.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 604dbe6..08261f2 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -45,8 +45,14 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
 		return false;
 
 	ret = gc->of_xlate(gc, &gg_data->gpiospec, gg_data->flags);
-	if (ret < 0)
-		return false;
+	if (ret < 0) {
+		/* We've found the gpio chip, but the translation failed.
+		 * Return true to stop looking and return the translation
+		 * error via out_gpio
+		 */
+		gg_data->out_gpio = ERR_PTR(ret);
+		return true;
+	 }
 
 	gg_data->out_gpio = gpiochip_get_desc(gc, ret);
 	return true;
-- 
1.7.9.5

