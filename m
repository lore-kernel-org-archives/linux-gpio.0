From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 1/2] pinctrl: pinctrl-imx: Add suspend/resume for LPSR
Date: Mon, 25 Mar 2019 13:59:29 +0000
Message-ID: <1553522352-20214-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Gong <yibin.gong@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: linux-gpio@vger.kernel.org

From: Robin Gong <yibin.gong@nxp.com>

To support pinctl hog restore after LPSR resume back,
add suspend/resume in pinctrl driver.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---

Changes since v1:
 * fixed Robin's email

 drivers/pinctrl/freescale/pinctrl-imx.c | 20 ++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/free=
scale/pinctrl-imx.c
index 188001b..93c0253 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -887,3 +887,23 @@ int imx_pinctrl_probe(struct platform_device *pdev,
=20
 	return ret;
 }
+
+int imx_pinctrl_suspend(struct device *dev)
+{
+	struct imx_pinctrl *ipctl =3D dev_get_drvdata(dev);
+
+	if (!ipctl)
+		return -EINVAL;
+
+	return pinctrl_force_sleep(ipctl->pctl);
+}
+
+int imx_pinctrl_resume(struct device *dev)
+{
+	struct imx_pinctrl *ipctl =3D dev_get_drvdata(dev);
+
+	if (!ipctl)
+		return -EINVAL;
+
+	return pinctrl_force_default(ipctl->pctl);
+}
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/free=
scale/pinctrl-imx.h
index 98a4889..795669c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -136,6 +136,9 @@ struct imx_pinctrl {
 int imx_pinctrl_probe(struct platform_device *pdev,
 			const struct imx_pinctrl_soc_info *info);
=20
+int imx_pinctrl_suspend(struct device *dev);
+int imx_pinctrl_resume(struct device *dev);
+
 #ifdef CONFIG_PINCTRL_IMX_SCU
 #define BM_PAD_CTL_GP_ENABLE		BIT(30)
 #define BM_PAD_CTL_IFMUX_ENABLE		BIT(31)
--=20
2.7.4
