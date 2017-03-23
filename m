From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFT PATCH 5/6] pinctrl: meson: use gpio-ranges from DT
Date: Thu, 23 Mar 2017 17:27:28 +0100
Message-ID: <1490286449-19448-6-git-send-email-narmstrong@baylibre.com>
References: <1490286449-19448-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490286449-19448-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org, linus.walleij@linaro.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

When trying to add a gpio-hog, we enter a weird loop where the gpio-ranges
is needed when gpiochip_add_data() is called but in the current implementation
the ranges are added from the driver afterwards.

A simple solution is to rely on the DR gpio-ranges attribute and remove the
call to gpiochip_add_pin_range().

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index cf1686e..66ed70c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -555,22 +555,10 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	if (ret) {
 		dev_err(pc->dev, "can't add gpio chip %s\n",
 			pc->data->name);
-		goto fail;
-	}
-
-	ret = gpiochip_add_pin_range(&pc->chip, dev_name(pc->dev),
-				     0, pc->data->pin_base,
-				     pc->chip.ngpio);
-	if (ret) {
-		dev_err(pc->dev, "can't add pin range\n");
-		goto fail;
+		return ret;
 	}
 
 	return 0;
-fail:
-	gpiochip_remove(&pc->chip);
-
-	return ret;
 }
 
 static struct regmap_config meson_regmap_config = {
-- 
1.9.1
