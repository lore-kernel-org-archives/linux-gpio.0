From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V2 1/1] pinctrl: imx8qxp: break the dependency on SOC_IMX8QXP
Date: Mon, 17 Dec 2018 15:38:15 +0000
Message-ID: <1545060770-19191-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "dongas86@gmail.com" <dongas86@gmail.com>, Fabio Estevam <festevam@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

ARM64 SoC does not encourage people to add more finegrained SoC
config options rather than a single ARCH_<family> in arch Kconfig.
So this patch aims to break the dependency on SOC_IMX8QXP.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Acked-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v1->v2:
 * do not mention the deletion of SOC_IMX8QXP as it's still not
   hit mainline
---
 drivers/pinctrl/freescale/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 2d6db43..f7d3579 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -130,7 +130,7 @@ config PINCTRL_IMX8MQ
 
 config PINCTRL_IMX8QXP
 	bool "IMX8QXP pinctrl driver"
-	depends on SOC_IMX8QXP
+	depends on ARCH_MXC && ARM64
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qxp pinctrl driver
-- 
2.7.4
