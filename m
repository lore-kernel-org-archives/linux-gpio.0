From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] Subject: pinctrl: imx1-core: Fix debug output in .pin_config_set callback
Date: Fri, 17 Jul 2015 09:38:43 +0200
Message-ID: <1437118723-19217-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <55A85B59.5060906@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <55A85B59.5060906@gtsys.com.hk>
Sender: stable-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Chris Ruehl <chris.ruehl@gtsys.com.hk>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

imx1_pinconf_set assumes that the array of pins in struct
imx1_pinctrl_soc_info can be indexed by pin id to get the
pinctrl_pin_desc for a pin. This used to be correct up to commit
607af165c047 which removed some entries from the array and so made it
wrong to access the array by pin id.

The result of this bug is a wrong pin name in the output for small pin
ids and an oops for the bigger ones.

This patch is the result of a discussion that includes patches by Marku=
s
Pargmann and Chris Ruehl.

=46ixes: 607af165c047 ("pinctrl: i.MX27: Remove nonexistent pad definit=
ions")
Cc: stable@vger.kernel.org
Reported-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pi=
nctrl/freescale/pinctrl-imx1-core.c
index 5fd4437cee15..88a7fac11bd4 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -403,14 +403,13 @@ static int imx1_pinconf_set(struct pinctrl_dev *p=
ctldev,
 			     unsigned num_configs)
 {
 	struct imx1_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
-	const struct imx1_pinctrl_soc_info *info =3D ipctl->info;
 	int i;
=20
 	for (i =3D 0; i !=3D num_configs; ++i) {
 		imx1_write_bit(ipctl, pin_id, configs[i] & 0x01, MX1_PUEN);
=20
 		dev_dbg(ipctl->dev, "pinconf set pullup pin %s\n",
-			info->pins[pin_id].name);
+			pin_desc_get(pctldev, pin_id)->name);
 	}
=20
 	return 0;
--=20
2.1.4
