From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 27/54] pinctrl: spmi-gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:30:38 +0100
Message-ID: <1450794638-23834-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36445 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932139AbbLVOao (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:30:44 -0500
Received: by mail-lf0-f41.google.com with SMTP id z124so125511713lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:30:43 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret =3D !!(val) design pattern.

Cc: Ivan T. Ivanov <ivan.ivanov@linaro.org>
Cc: Bj=C3=B6rn Andersson <bjorn.andersson@sonymobile.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl=
/qcom/pinctrl-spmi-gpio.c
index 3e5ccc76d59c..4460b2c9c8bd 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -533,7 +533,7 @@ static int pmic_gpio_get(struct gpio_chip *chip, un=
signed pin)
 		pad->out_value =3D ret & PMIC_MPP_REG_RT_STS_VAL_MASK;
 	}
=20
-	return pad->out_value;
+	return !!pad->out_value;
 }
=20
 static void pmic_gpio_set(struct gpio_chip *chip, unsigned pin, int va=
lue)
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
