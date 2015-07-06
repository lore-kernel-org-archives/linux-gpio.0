From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH gpio-for-next 02/10] drm/tilcdc: panel: make better use of gpiod API
Date: Mon,  6 Jul 2015 11:09:42 +0200
Message-ID: <1436173790-29963-2-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150706090759.GS11824@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:60970 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751714AbbGFJKA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2015 05:10:00 -0400
In-Reply-To: <20150706090759.GS11824@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*() functions)
which appeared in v3.17-rc1, the gpiod_get* functions take an additiona=
l
parameter that allows to specify direction and initial value for output=
=2E

=46urthermore there is devm_gpiod_get_optional which is designed to get
optional gpios.

Simplify driver accordingly.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_panel.c
index 7a0315855e90..0af8bed7ce1e 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -375,25 +375,17 @@ static int panel_probe(struct platform_device *pd=
ev)
 		dev_info(&pdev->dev, "found backlight\n");
 	}
=20
-	panel_mod->enable_gpio =3D devm_gpiod_get(&pdev->dev, "enable");
+	panel_mod->enable_gpio =3D devm_gpiod_get_optional(&pdev->dev, "enabl=
e",
+							 GPIOD_OUT_LOW);
 	if (IS_ERR(panel_mod->enable_gpio)) {
 		ret =3D PTR_ERR(panel_mod->enable_gpio);
-		if (ret !=3D -ENOENT) {
-			dev_err(&pdev->dev, "failed to request enable GPIO\n");
-			goto fail_backlight;
-		}
-
-		/* Optional GPIO is not here, continue silently. */
-		panel_mod->enable_gpio =3D NULL;
-	} else {
-		ret =3D gpiod_direction_output(panel_mod->enable_gpio, 0);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to setup GPIO\n");
-			goto fail_backlight;
-		}
-		dev_info(&pdev->dev, "found enable GPIO\n");
+		dev_err(&pdev->dev, "failed to request enable GPIO\n");
+		goto fail_backlight;
 	}
=20
+	if (panel_mod->enable_gpio)
+		dev_info(&pdev->dev, "found enable GPIO\n");
+
 	mod =3D &panel_mod->base;
 	pdev->dev.platform_data =3D mod;
=20
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
