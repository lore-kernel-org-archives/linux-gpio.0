From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 1/4] gpio: mpc8xxx: constify of_device_id
Date: Thu, 16 Jul 2015 21:08:21 +0200
Message-ID: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:57676 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755768AbbGPTIa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 15:08:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel@pengutronix.de

This variable is not modified in the driver and all functions it it
passed to don't change it either. So it can and should be marked const.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-mpc8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index da8e89205f37..0e2dbbb1645b 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -334,7 +334,7 @@ static const struct irq_domain_ops mpc8xxx_gpio_irq=
_ops =3D {
 	.xlate	=3D irq_domain_xlate_twocell,
 };
=20
-static struct of_device_id mpc8xxx_gpio_ids[] =3D {
+static const struct of_device_id mpc8xxx_gpio_ids[] =3D {
 	{ .compatible =3D "fsl,mpc8349-gpio", },
 	{ .compatible =3D "fsl,mpc8572-gpio", },
 	{ .compatible =3D "fsl,mpc8610-gpio", },
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
