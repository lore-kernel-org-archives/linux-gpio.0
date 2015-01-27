From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH RESENT#2] pinctrl: pinctrl-imx: don't use invalid value of conf_reg
Date: Wed, 28 Jan 2015 00:13:00 +0100
Message-ID: <1422400380-10956-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:39136 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751882AbbA0XNN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jan 2015 18:13:13 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

The right check for conf_reg to be invalid it testing against -1 not 0
as is done in the rest of the driver.

This fixes an oops that can be triggered by:

	cat /sys/kernel/debug/pinctrl/43fac000.iomuxc/*

=46ixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core driv=
er")
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---

Notes:
    Resent to fix email address of Dong Aisheng

 drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/=
freescale/pinctrl-imx.c
index 52f2b9404fe0..448f10986c28 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -437,7 +437,7 @@ static void imx_pinconf_dbg_show(struct pinctrl_dev=
 *pctldev,
 	const struct imx_pin_reg *pin_reg =3D &info->pin_regs[pin_id];
 	unsigned long config;
=20
-	if (!pin_reg || !pin_reg->conf_reg) {
+	if (!pin_reg || pin_reg->conf_reg =3D=3D -1) {
 		seq_printf(s, "N/A");
 		return;
 	}
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
