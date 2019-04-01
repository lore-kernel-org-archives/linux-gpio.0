From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] pinctrl: freescale: use devm_platform_ioremap_resource() to
 simplify code
Date: Mon, 1 Apr 2019 05:07:49 +0000
Message-ID: <1554094986-14897-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Use the new helper devm_platform_ioremap_resource() which wraps the
platform_get_resource() and devm_ioremap_resource() together, to
simplify the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/free=
scale/pinctrl-imx.c
index 188001b..cc6f5cc 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -785,7 +785,6 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	struct pinctrl_desc *imx_pinctrl_desc;
 	struct device_node *np;
 	struct imx_pinctrl *ipctl;
-	struct resource *res;
 	struct regmap *gpr;
 	int ret, i;
=20
@@ -817,8 +816,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 			ipctl->pin_regs[i].conf_reg =3D -1;
 		}
=20
-		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		ipctl->base =3D devm_ioremap_resource(&pdev->dev, res);
+		ipctl->base =3D devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(ipctl->base))
 			return PTR_ERR(ipctl->base);
=20
--=20
2.7.4
