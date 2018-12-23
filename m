From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] pinctrl: freescale: Break dependency on SOC_IMX8MQ for
 i.MX8MQ
Date: Sun, 23 Dec 2018 07:08:31 +0000
Message-ID: <1545548891-24671-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan.agner@toradex.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: linux-gpio@vger.kernel.org

The CONFIG_SOC_IMX8MQ will go away, so the dependency can be based on
ARCH_MXC && ARM64.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/pinctrl/freescale/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/=
Kconfig
index 2d6db43..624902e 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -123,7 +123,7 @@ config PINCTRL_IMX7ULP
=20
 config PINCTRL_IMX8MQ
 	bool "IMX8MQ pinctrl driver"
-	depends on SOC_IMX8MQ
+	depends on ARCH_MXC && ARM64
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mq pinctrl driver
--=20
2.7.4
