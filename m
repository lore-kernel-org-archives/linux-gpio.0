From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 28/54] pinctrl: spmi-mpp: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:30:52 +0100
Message-ID: <1450794652-23900-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34715 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932139AbbLVOa4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:30:56 -0500
Received: by mail-lf0-f45.google.com with SMTP id y184so130159373lfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:30:55 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret =3D !!(val) design pattern.

Cc: Bj=C3=B6rn Andersson <bjorn.andersson@sonymobile.com>
Cc: Ivan T. Ivanov <ivan.ivanov@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/=
qcom/pinctrl-spmi-mpp.c
index 69c14ba177d0..ea1d2b2f6fd1 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -591,7 +591,7 @@ static int pmic_mpp_get(struct gpio_chip *chip, uns=
igned pin)
 		pad->out_value =3D ret & PMIC_MPP_REG_RT_STS_VAL_MASK;
 	}
=20
-	return pad->out_value;
+	return !!pad->out_value;
 }
=20
 static void pmic_mpp_set(struct gpio_chip *chip, unsigned pin, int val=
ue)
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
