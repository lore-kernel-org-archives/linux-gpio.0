From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v3] pinctrl: imx8mq: Add suspend/resume ops
Date: Mon, 8 Apr 2019 18:38:31 +0000
Message-ID: <1554748702-2368-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Robin Gong <yibin.gong@nxp.com>
List-Id: linux-gpio@vger.kernel.org

To support pinctl hog restore after LPSR resume back,
add the generic suspend/resume in pinctrl-imx along with the
generic pm ops to be used by platform specific drivers. Then
make use of the newly added ops in i.MX8MQ platform specific
driver.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---

Changes since v2:
 * removed the pinctrl-imx8mq with imx8mq in the subject
 * added static and __maybe_unused to both suspend and resume
 * removed the useless null checks

 drivers/pinctrl/freescale/pinctrl-imx.c    | 19 +++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.h    |  1 +
 drivers/pinctrl/freescale/pinctrl-imx8mq.c |  1 +
 3 files changed, 21 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/free=
scale/pinctrl-imx.c
index 188001b..93a86d2 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -887,3 +887,22 @@ int imx_pinctrl_probe(struct platform_device *pdev,
=20
 	return ret;
 }
+
+static int __maybe_unused imx_pinctrl_suspend(struct device *dev)
+{
+	struct imx_pinctrl *ipctl =3D dev_get_drvdata(dev);
+
+	return pinctrl_force_sleep(ipctl->pctl);
+}
+
+static int __maybe_unused imx_pinctrl_resume(struct device *dev)
+{
+	struct imx_pinctrl *ipctl =3D dev_get_drvdata(dev);
+
+	return pinctrl_force_default(ipctl->pctl);
+}
+
+const struct dev_pm_ops imx_pinctrl_pm_ops =3D {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
+					imx_pinctrl_resume)
+};
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/free=
scale/pinctrl-imx.h
index 98a4889..333d32b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -17,6 +17,7 @@
 struct platform_device;
=20
 extern struct pinmux_ops imx_pmx_ops;
+extern const struct dev_pm_ops imx_pinctrl_pm_ops;
=20
 /**
  * struct imx_pin_mmio - MMIO pin configurations
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c b/drivers/pinctrl/f=
reescale/pinctrl-imx8mq.c
index 8d39af5..50aa1c0 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
@@ -339,6 +339,7 @@ static struct platform_driver imx8mq_pinctrl_driver =3D=
 {
 	.driver =3D {
 		.name =3D "imx8mq-pinctrl",
 		.of_match_table =3D of_match_ptr(imx8mq_pinctrl_of_match),
+		.pm =3D &imx_pinctrl_pm_ops,
 		.suppress_bind_attrs =3D true,
 	},
 	.probe =3D imx8mq_pinctrl_probe,
--=20
2.7.4
