From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: freescale: fix link errors
Date: Mon,  4 Mar 2019 21:26:25 +0100
Message-ID: <20190304202640.1765847-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Bai Ping <ping.bai@nxp.com>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Submitted by Anders Roxell already

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/freescale/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index e6dff3167a67..e447b996e79f 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -138,14 +138,14 @@ config PINCTRL_IMX8MQ
 
 config PINCTRL_IMX8QM
 	bool "IMX8QM pinctrl driver"
-	depends on ARCH_MXC && ARM64
+	depends on ARCH_MXC && ARM64 && IMX_SCU
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qm pinctrl driver
 
 config PINCTRL_IMX8QXP
 	bool "IMX8QXP pinctrl driver"
-	depends on ARCH_MXC && ARM64
+	depends on ARCH_MXC && ARM64 && IMX_SCU
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qxp pinctrl driver
-- 
2.20.0
