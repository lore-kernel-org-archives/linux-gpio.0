From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH 2/2] pinctrl: pinctrl-imx8mq: Add support PM operations
Date: Mon, 25 Mar 2019 13:48:51 +0000
Message-ID: <1553521721-12061-2-git-send-email-abel.vesa@nxp.com>
References: <1553521721-12061-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553521721-12061-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "b38343@freescale.com" <b38343@freescale.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Add suspend/resume pm ops to the pinctrl i.MX8MQ driver.
Make the suspend late and the resume early since some of the
pins might be needed active very late.
These call the pinctrl-imx generic handlers.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx8mq.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c b/drivers/pinctrl/f=
reescale/pinctrl-imx8mq.c
index 8d39af5..2a212bc 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
@@ -335,10 +335,26 @@ static int imx8mq_pinctrl_probe(struct platform_devic=
e *pdev)
 	return imx_pinctrl_probe(pdev, &imx8mq_pinctrl_info);
 }
=20
+static int imx8mq_pinctrl_suspend(struct device *dev)
+{
+	return imx_pinctrl_suspend(dev);
+}
+
+static int imx8mq_pinctrl_resume(struct device *dev)
+{
+	return imx_pinctrl_resume(dev);
+}
+
+static const struct dev_pm_ops imx8mq_pinctrl_pm_ops =3D {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx8mq_pinctrl_suspend,
+					imx8mq_pinctrl_resume)
+};
+
 static struct platform_driver imx8mq_pinctrl_driver =3D {
 	.driver =3D {
 		.name =3D "imx8mq-pinctrl",
 		.of_match_table =3D of_match_ptr(imx8mq_pinctrl_of_match),
+		.pm =3D &imx8mq_pinctrl_pm_ops,
 		.suppress_bind_attrs =3D true,
 	},
 	.probe =3D imx8mq_pinctrl_probe,
--=20
2.7.4
