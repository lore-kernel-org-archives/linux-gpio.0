From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 1/9] gpiolib: Fix possible use of wrong name
Date: Fri, 17 Jul 2015 11:32:42 +0200
Message-ID: <1437125570-28623-2-git-send-email-mpa@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:58182 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757542AbbGQJdl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 05:33:41 -0400
In-Reply-To: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

The name is set optionally from DT. Therefore we need to reset the name
variable for every loop iteration. Otherwise we could use a wrong or
uninitialized name.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 9a0ec48a4737..60aebe4d7c26 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -209,11 +209,11 @@ static void of_gpiochip_scan_hogs(struct gpio_chip *chip)
 {
 	struct gpio_desc *desc = NULL;
 	struct device_node *np;
-	const char *name;
 	enum gpio_lookup_flags lflags;
 	enum gpiod_flags dflags;
 
 	for_each_child_of_node(chip->of_node, np) {
+		const char *name = NULL;
 		if (!of_property_read_bool(np, "gpio-hog"))
 			continue;
 
-- 
2.1.4

