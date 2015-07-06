From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH gpio-for-next 07/10] phy: tusb1210: make better use of gpiod API
Date: Mon,  6 Jul 2015 11:09:47 +0200
Message-ID: <1436173790-29963-7-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150706090759.GS11824@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:32875 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751837AbbGFJKE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2015 05:10:04 -0400
In-Reply-To: <20150706090759.GS11824@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-usb@vger.kernel.org

Since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*() functions)
which appeared in v3.17-rc1, the gpiod_get* functions take an additiona=
l
parameter that allows to specify direction and initial value for output=
=2E

=46urthermore there is devm_gpiod_get_optional which is designed to get
optional gpios.

Simplify driver accordingly.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/phy/phy-tusb1210.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/phy-tusb1210.c b/drivers/phy/phy-tusb1210.c
index 07efdd318bdc..93dd45f2f26e 100644
--- a/drivers/phy/phy-tusb1210.c
+++ b/drivers/phy/phy-tusb1210.c
@@ -61,32 +61,26 @@ static struct phy_ops phy_ops =3D {
=20
 static int tusb1210_probe(struct ulpi *ulpi)
 {
-	struct gpio_desc *gpio;
 	struct tusb1210 *tusb;
 	u8 val, reg;
-	int ret;
=20
 	tusb =3D devm_kzalloc(&ulpi->dev, sizeof(*tusb), GFP_KERNEL);
 	if (!tusb)
 		return -ENOMEM;
=20
-	gpio =3D devm_gpiod_get(&ulpi->dev, "reset");
-	if (!IS_ERR(gpio)) {
-		ret =3D gpiod_direction_output(gpio, 0);
-		if (ret)
-			return ret;
-		gpiod_set_value_cansleep(gpio, 1);
-		tusb->gpio_reset =3D gpio;
-	}
+	tusb->gpio_reset =3D devm_gpiod_get_optional(&ulpi->dev, "reset",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(tusb->gpio_reset))
+		return PTR_ERR(tusb->gpio_reset);
=20
-	gpio =3D devm_gpiod_get(&ulpi->dev, "cs");
-	if (!IS_ERR(gpio)) {
-		ret =3D gpiod_direction_output(gpio, 0);
-		if (ret)
-			return ret;
-		gpiod_set_value_cansleep(gpio, 1);
-		tusb->gpio_cs =3D gpio;
-	}
+	gpiod_set_value_cansleep(tusb->gpio_reset, 1);
+
+	tusb->gpio_cs =3D devm_gpiod_get_optional(&ulpi->dev, "cs",
+						GPIOD_OUT_LOW);
+	if (IS_ERR(tusb->gpio_cs))
+		return PTR_ERR(tusb->gpio_cs);
+
+	gpiod_set_value_cansleep(tusb->gpio_cs, 1);
=20
 	/*
 	 * VENDOR_SPECIFIC2 register in TUSB1210 can be used for configuring =
eye
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
