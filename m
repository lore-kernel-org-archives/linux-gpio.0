From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 11/54] gpio: mpc8xxx: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:18:51 +0100
Message-ID: <1450793931-22741-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35110 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753341AbbLVOSz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:18:55 -0500
Received: by mail-lf0-f49.google.com with SMTP id l133so129629407lfd.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:18:55 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret =3D !!(val) design pattern.

Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 48ef368347ab..de4cd22a5014 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -79,7 +79,7 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, uns=
igned int gpio)
 	val =3D in_be32(mm->regs + GPIO_DAT) & ~out_mask;
 	out_shadow =3D mpc8xxx_gc->data & out_mask;
=20
-	return (val | out_shadow) & mpc8xxx_gpio2mask(gpio);
+	return !!((val | out_shadow) & mpc8xxx_gpio2mask(gpio));
 }
=20
 static int mpc8xxx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
