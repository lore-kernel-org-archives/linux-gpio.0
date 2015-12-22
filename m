From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 29/54] pinctrl: ssbi-gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:31:14 +0100
Message-ID: <1450794674-23958-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:33912 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbbLVObU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:31:20 -0500
Received: by mail-lf0-f44.google.com with SMTP id y184so130166921lfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:31:19 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret =3D !!(val) design pattern.

Also, this code was double-inverting a bool. That makes no
sense whatsoever, so I removed the double-invert.

Cc: Bj=C3=B6rn Andersson <bjorn.andersson@sonymobile.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl=
/qcom/pinctrl-ssbi-gpio.c
index 7bea0df06fb1..394ca34bec4a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -487,10 +487,10 @@ static int pm8xxx_gpio_get(struct gpio_chip *chip=
, unsigned offset)
 	} else {
 		ret =3D irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &s=
tate);
 		if (!ret)
-			ret =3D !!state;
+			ret =3D state;
 	}
=20
-	return ret;
+	return !!ret;
 }
=20
 static void pm8xxx_gpio_set(struct gpio_chip *chip, unsigned offset, i=
nt value)
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
