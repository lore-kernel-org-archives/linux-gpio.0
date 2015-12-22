From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 30/54] gpio: ssbi-mpp: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:31:32 +0100
Message-ID: <1450794693-24019-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:35439 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932834AbbLVObl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:31:41 -0500
Received: by mail-lb0-f178.google.com with SMTP id bc4so32090909lbc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:31:40 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret =3D !!(val) design pattern.

This code was also double-inverting a bool which makes no sense
so I removed that code and moved clamping toward the end.

Cc: Bj=C3=B6rn Andersson <bjorn.andersson@sonymobile.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/=
qcom/pinctrl-ssbi-mpp.c
index 8f5c96cbf94e..23089d541230 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -502,13 +502,13 @@ static int pm8xxx_mpp_get(struct gpio_chip *chip,=
 unsigned offset)
 	int ret;
=20
 	if (!pin->input)
-		return pin->output_value;
+		return !!pin->output_value;
=20
 	ret =3D irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &st=
ate);
 	if (!ret)
-		ret =3D !!state;
+		ret =3D state;
=20
-	return ret;
+	return !!ret;
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
