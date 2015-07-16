From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 3/4] gpio: mpc8xxx: add support for MPC5125
Date: Thu, 16 Jul 2015 21:08:23 +0200
Message-ID: <1437073704-13881-3-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:54533 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751637AbbGPTKB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 15:10:01 -0400
In-Reply-To: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel@pengutronix.de

The gpio controller on MPC5125 is identical to the MPC5121 register
wise, the only difference is that the lines 0..3 are input only instead
of 28..31 on MPC5121.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-mpc8xxx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 836494420a56..4c5137793431 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -174,6 +174,15 @@ static int mpc5121_gpio_dir_out(struct gpio_chip *=
gc, unsigned int gpio, int val
 	return mpc8xxx_gpio_dir_out(gc, gpio, val);
 }
=20
+static int mpc5125_gpio_dir_out(struct gpio_chip *gc, unsigned int gpi=
o, int val)
+{
+	/* GPIO 0..3 are input only on MPC5125 */
+	if (gpio <=3D 3)
+		return -EINVAL;
+
+	return mpc8xxx_gpio_dir_out(gc, gpio, val);
+}
+
 static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct of_mm_gpio_chip *mm =3D to_of_mm_gpio_chip(gc);
@@ -341,6 +350,11 @@ static const struct mpc8xxx_gpio_devtype mpc512x_g=
pio_devtype =3D {
 	.irq_set_type =3D mpc512x_irq_set_type,
 };
=20
+static const struct mpc8xxx_gpio_devtype mpc5125_gpio_devtype =3D {
+	.gpio_dir_out =3D mpc5125_gpio_dir_out,
+	.irq_set_type =3D mpc512x_irq_set_type,
+};
+
 static const struct mpc8xxx_gpio_devtype mpc8572_gpio_devtype =3D {
 	.gpio_get =3D mpc8572_gpio_get,
 };
@@ -356,6 +370,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[]=
 =3D {
 	{ .compatible =3D "fsl,mpc8572-gpio", .data =3D &mpc8572_gpio_devtype=
, },
 	{ .compatible =3D "fsl,mpc8610-gpio", },
 	{ .compatible =3D "fsl,mpc5121-gpio", .data =3D &mpc512x_gpio_devtype=
, },
+	{ .compatible =3D "fsl,mpc5125-gpio", .data =3D &mpc5125_gpio_devtype=
, },
 	{ .compatible =3D "fsl,pq3-gpio",     },
 	{ .compatible =3D "fsl,qoriq-gpio",   },
 	{}
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
