From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/6] pinctrl: sh-pfc: Stop calling gpiochip_add_pin_range() on DT platforms
Date: Tue,  4 Aug 2015 15:55:17 +0200
Message-ID: <1438696519-13727-5-git-send-email-geert+renesas@glider.be>
References: <1438696519-13727-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1438696519-13727-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On platforms where the PFC/GPIO controller is instantiated from DT, the
mapping between GPIOs and pins is set up using the "gpio-ranges"
property in DT.

Hence stop setting up the mapping from C code on DT platforms.
This code is still used for SH or ARM-legacy platforms.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
v2:
  - Add Acked-by,
  - Add check for CONFIG_OF and pfc->dev->of_node.
---
 drivers/pinctrl/sh-pfc/gpio.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index ba353735ecf2be9a..b380e3f17b121bbb 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -379,22 +379,29 @@ int sh_pfc_register_gpiochip(struct sh_pfc *pfc)
 
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
+	if (IS_ENABLED(CONFIG_OF) && pfc->dev->of_node)
+		return 0;
 
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

