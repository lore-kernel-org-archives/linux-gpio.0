From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH gpio-for-next 01/10] drm/msm/dp: use flags argument of devm_gpiod_get to set direction
Date: Mon,  6 Jul 2015 11:09:41 +0200
Message-ID: <1436173790-29963-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150706090759.GS11824@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:41071 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967AbbGFJKA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2015 05:10:00 -0400
In-Reply-To: <20150706090759.GS11824@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org

Since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*() functions)
which appeared in v3.17-rc1, the gpiod_get* functions take an additiona=
l
parameter that allows to specify direction and initial value for output=
=2E

Use this to simplify the driver. Furthermore this is one caller less
that stops us making the flags argument to gpiod_get*() mandatory.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/msm/edp/edp_ctrl.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/e=
dp/edp_ctrl.c
index 7991069dd492..81200e9be382 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -373,7 +373,7 @@ static int edp_gpio_config(struct edp_ctrl *ctrl)
 	struct device *dev =3D &ctrl->pdev->dev;
 	int ret;
=20
-	ctrl->panel_hpd_gpio =3D devm_gpiod_get(dev, "panel-hpd");
+	ctrl->panel_hpd_gpio =3D devm_gpiod_get(dev, "panel-hpd", GPIOD_IN);
 	if (IS_ERR(ctrl->panel_hpd_gpio)) {
 		ret =3D PTR_ERR(ctrl->panel_hpd_gpio);
 		ctrl->panel_hpd_gpio =3D NULL;
@@ -381,13 +381,7 @@ static int edp_gpio_config(struct edp_ctrl *ctrl)
 		return ret;
 	}
=20
-	ret =3D gpiod_direction_input(ctrl->panel_hpd_gpio);
-	if (ret) {
-		pr_err("%s: Set direction for hpd failed, %d\n", __func__, ret);
-		return ret;
-	}
-
-	ctrl->panel_en_gpio =3D devm_gpiod_get(dev, "panel-en");
+	ctrl->panel_en_gpio =3D devm_gpiod_get(dev, "panel-en", GPIOD_OUT_LOW=
);
 	if (IS_ERR(ctrl->panel_en_gpio)) {
 		ret =3D PTR_ERR(ctrl->panel_en_gpio);
 		ctrl->panel_en_gpio =3D NULL;
@@ -395,13 +389,6 @@ static int edp_gpio_config(struct edp_ctrl *ctrl)
 		return ret;
 	}
=20
-	ret =3D gpiod_direction_output(ctrl->panel_en_gpio, 0);
-	if (ret) {
-		pr_err("%s: Set direction for panel_en failed, %d\n",
-				__func__, ret);
-		return ret;
-	}
-
 	DBG("gpio on");
=20
 	return 0;
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
