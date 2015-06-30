From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/7] pinctrl: sh-pfc: Stop calling gpiochip_add_pin_range() on DT platforms
Date: Tue, 30 Jun 2015 09:45:24 +0200
Message-ID: <1435650327-2542-5-git-send-email-geert+renesas@glider.be>
References: <1435650327-2542-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1435650327-2542-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On platforms where the PFC/GPIO controller is instantiated from DT, the
mapping between GPIOs and pins is set up using the "gpio-ranges"
property in DT.

Hence stop setting up the mapping from C code on DT platforms.
This code is still used for SH or ARM-legacy platforms.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/gpio.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index ba353735ecf2be9a..1be118e4865fd3f8 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -379,22 +379,26 @@ int sh_pfc_register_gpiochip(struct sh_pfc *pfc)
 
 	pfc->gpio = chip;
 
-	/* Register the GPIO to pin mappings. As pins with GPIO ports must come
-	 * first in the ranges, skip the pins without GPIO ports by stopping at
-	 * the first range that contains such a pin.
-	 */
-	for (i = 0; i < pfc->nr_ranges; ++i) {
-		const struct sh_pfc_pin_range *range = &pfc->ranges[i];
-
-		if (range->start >= pfc->nr_gpio_pins)
-			break;
-
-		ret = gpiochip_add_pin_range(&chip->gpio_chip,
-					     dev_name(pfc->dev),
-					     range->start, range->start,
-					     range->end - range->start + 1);
-		if (ret < 0)
-			return ret;
+	if (IS_ENABLED(CONFIG_SUPERH) ||
+	    IS_ENABLED(CONFIG_ARCH_SHMOBILE_LEGACY)) {
+		/*
+		 * Register the GPIO to pin mappings. As pins with GPIO ports
+		 * must come first in the ranges, skip the pins without GPIO
+		 * ports by stopping at the first range that contains such a
+		 * pin.
+		 */
+		for (i = 0; i < pfc->nr_ranges; ++i) {
+			const struct sh_pfc_pin_range *range = &pfc->ranges[i];
+
+			if (range->start >= pfc->nr_gpio_pins)
+				break;
+
+			ret = gpiochip_add_pin_range(&chip->gpio_chip,
+				dev_name(pfc->dev), range->start, range->start,
+				range->end - range->start + 1);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	/* Register the function GPIOs chip. */
-- 
1.9.1

