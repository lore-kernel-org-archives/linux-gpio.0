From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH gpio-for-next 06/10] NFC: nxp-nci_i2c: use flags argument of devm_gpiod_get_index
Date: Mon,  6 Jul 2015 11:09:46 +0200
Message-ID: <1436173790-29963-6-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150706090759.GS11824@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:55309 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751837AbbGFJKA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2015 05:10:00 -0400
In-Reply-To: <20150706090759.GS11824@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Charles Gorand <charles.gorand@effinnov.com>, linux-nfc@ml01.01.org

Since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*() functions)
which appeared in v3.17-rc1, the gpiod_get* functions take an additiona=
l
parameter that allows to specify direction and initial value for output=
=2E

Simplify driver accordingly which even makes error checking more correc=
t
because gpiod_direction_{in,out}put might fail. Furthermore this is one
caller less that stops us making the flags argument to gpiod_get*()
mandatory.

Acked-by: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/nfc/nxp-nci/i2c.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index 2f77f1d03638..fac80c691914 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -318,19 +318,15 @@ static int nxp_nci_i2c_acpi_config(struct nxp_nci=
_i2c_phy *phy)
 	struct i2c_client *client =3D phy->i2c_dev;
 	struct gpio_desc *gpiod_en, *gpiod_fw, *gpiod_irq;
=20
-	gpiod_en =3D devm_gpiod_get_index(&client->dev, NULL, 2);
-	gpiod_fw =3D devm_gpiod_get_index(&client->dev, NULL, 1);
-	gpiod_irq =3D devm_gpiod_get_index(&client->dev, NULL, 0);
+	gpiod_en =3D devm_gpiod_get_index(&client->dev, NULL, 2, GPIOD_OUT_LO=
W);
+	gpiod_fw =3D devm_gpiod_get_index(&client->dev, NULL, 1, GPIOD_OUT_LO=
W);
+	gpiod_irq =3D devm_gpiod_get_index(&client->dev, NULL, 0, GPIOD_IN);
=20
 	if (IS_ERR(gpiod_en) || IS_ERR(gpiod_fw) || IS_ERR(gpiod_irq)) {
 		nfc_err(&client->dev, "No GPIOs\n");
 		return -EINVAL;
 	}
=20
-	gpiod_direction_output(gpiod_en, 0);
-	gpiod_direction_output(gpiod_fw, 0);
-	gpiod_direction_input(gpiod_irq);
-
 	client->irq =3D gpiod_to_irq(gpiod_irq);
 	if (client->irq < 0) {
 		nfc_err(&client->dev, "No IRQ\n");
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
