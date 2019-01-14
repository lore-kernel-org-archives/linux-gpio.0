From: Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 2/3] pinctrl: freescale: fix link errors
Date: Mon, 14 Jan 2019 10:56:59 +0100
Message-ID: <20190114095659.23082-1-anders.roxell@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Fix link errors when PINCTRL_IMX_SCU or PINCTRL_IMXBQXP is enabled as a
module and the dependent module is built-in.

ld: drivers/pinctrl/freescale/pinctrl-scu.o: in function `imx_pinctrl_sc_ipc_init':
pinctrl-scu.c:(.text+0x10): undefined reference to `imx_scu_get_handle'
ld: pinctrl-scu.c:(.text+0x10): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `imx_scu_get_handle'
ld: drivers/pinctrl/freescale/pinctrl-scu.o: in function `imx_pinconf_get_scu':
pinctrl-scu.c:(.text+0xa0): undefined reference to `imx_scu_call_rpc'
ld: pinctrl-scu.c:(.text+0xa0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `imx_scu_call_rpc'
ld: drivers/pinctrl/freescale/pinctrl-scu.o: in function `imx_pinconf_set_scu':
pinctrl-scu.c:(.text+0x1b4): undefined reference to `imx_scu_call_rpc'
ld: pinctrl-scu.c:(.text+0x1b4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `imx_scu_call_rpc'
ld: drivers/pinctrl/freescale/pinctrl-imx8qxp.o: in function `imx8qxp_pinctrl_probe':
pinctrl-imx8qxp.c:(.text+0x28): undefined reference to `imx_pinctrl_probe'
ld: pinctrl-imx8qxp.c:(.text+0x28): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `imx_pinctrl_probe'

Rework so both depends on IMX_SCU=y.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/pinctrl/freescale/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index b318c24b61be..ac158309cfe9 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -7,7 +7,7 @@ config PINCTRL_IMX
 
 config PINCTRL_IMX_SCU
 	bool
-	depends on IMX_SCU
+	depends on IMX_SCU=y
 	select PINCTRL_IMX
 
 config PINCTRL_IMX1_CORE
@@ -138,7 +138,7 @@ config PINCTRL_IMX8QM
 
 config PINCTRL_IMX8QXP
 	bool "IMX8QXP pinctrl driver"
-	depends on ARCH_MXC && ARM64
+	depends on IMX_SCU=y && ARCH_MXC && ARM64
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qxp pinctrl driver
-- 
2.19.2
