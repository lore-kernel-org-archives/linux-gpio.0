From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: qcom: fix up errorpath
Date: Tue,  5 Jan 2016 10:26:09 +0100
Message-ID: <1451985969-17717-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34500 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752129AbcAEJ0P (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 04:26:15 -0500
Received: by mail-lf0-f45.google.com with SMTP id y184so290381575lfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 01:26:14 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn@kryo.se>

This fixes up:
commit 464231fb1fb1360399a2eb11479c47e39facb030
"pinctrl: ssbi-gpio: Be sure to clamp return value"
commit b9164f049339006fafe8a52396e0f1997552214a
"gpio: ssbi-mpp: Be sure to clamp return value"
as I managed to screw up some of the logic when clamping
the return values.

Cc: Bj=C3=B6rn Andersson <bjorn@kryo.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl=
/qcom/pinctrl-ssbi-gpio.c
index 394ca34bec4a..7bea0df06fb1 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -487,10 +487,10 @@ static int pm8xxx_gpio_get(struct gpio_chip *chip=
, unsigned offset)
 	} else {
 		ret =3D irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &s=
tate);
 		if (!ret)
-			ret =3D state;
+			ret =3D !!state;
 	}
=20
-	return !!ret;
+	return ret;
 }
=20
 static void pm8xxx_gpio_set(struct gpio_chip *chip, unsigned offset, i=
nt value)
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/=
qcom/pinctrl-ssbi-mpp.c
index 23089d541230..629642b73489 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -506,9 +506,9 @@ static int pm8xxx_mpp_get(struct gpio_chip *chip, u=
nsigned offset)
=20
 	ret =3D irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &st=
ate);
 	if (!ret)
-		ret =3D state;
+		ret =3D !!state;
=20
-	return !!ret;
+	return ret;
 }
=20
 static void pm8xxx_mpp_set(struct gpio_chip *chip, unsigned offset, in=
t value)
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
