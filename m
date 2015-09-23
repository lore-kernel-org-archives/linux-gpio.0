From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] pinctrl: imx25: ensure that a pin with id i is at position i in the info array
Date: Wed, 23 Sep 2015 16:29:44 +0200
Message-ID: <1443018584-12186-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:41860 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754633AbbIWO3s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2015 10:29:48 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@freescale.com>

The code in pinctrl-imx.c only works correctly if in the
imx_pinctrl_soc_info passed to imx_pinctrl_probe we have:

	info->pins[i].number =3D i
	conf_reg(info->pins[i]) =3D 4 * i + 4

(which conf_reg(pin) being the offset of the pin's configuration
register).

When the imx25 specific part was introduced in b4a87c9b966f ("pinctrl:
pinctrl-imx: add imx25 pinctrl driver") we had:

	info->pins[i].number =3D i + 1
	conf_reg(info->pins[i]) =3D 4 * i

=2E Commit 34027ca2bbc6 ("pinctrl: imx25: fix numbering for pins") trie=
d
to fix that but made the situation:

	info->pins[i-1].number =3D i
	conf_reg(info->pins[i-1]) =3D 4 * i

which is hardly better but fixed the error seen back then.

So insert another reserved entry in the array to finally yield:

	info->pins[i].number =3D i
	conf_reg(info->pins[i]) =3D 4 * i

=46ixes: 34027ca2bbc6 ("pinctrl: imx25: fix numbering for pins")
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/pinctrl/freescale/pinctrl-imx25.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx25.c b/drivers/pinctr=
l/freescale/pinctrl-imx25.c
index faf635654312..293ed4381cc0 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx25.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx25.c
@@ -26,7 +26,8 @@
 #include "pinctrl-imx.h"
=20
 enum imx25_pads {
-	MX25_PAD_RESERVE0 =3D 1,
+	MX25_PAD_RESERVE0 =3D 0,
+	MX25_PAD_RESERVE1 =3D 1,
 	MX25_PAD_A10 =3D 2,
 	MX25_PAD_A13 =3D 3,
 	MX25_PAD_A14 =3D 4,
@@ -169,6 +170,7 @@ enum imx25_pads {
 /* Pad names for the pinmux subsystem */
 static const struct pinctrl_pin_desc imx25_pinctrl_pads[] =3D {
 	IMX_PINCTRL_PIN(MX25_PAD_RESERVE0),
+	IMX_PINCTRL_PIN(MX25_PAD_RESERVE1),
 	IMX_PINCTRL_PIN(MX25_PAD_A10),
 	IMX_PINCTRL_PIN(MX25_PAD_A13),
 	IMX_PINCTRL_PIN(MX25_PAD_A14),
--=20
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
