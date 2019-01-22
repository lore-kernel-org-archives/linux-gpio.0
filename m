From: Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v3] pinctrl: freescale: fix link errors
Date: Tue, 22 Jan 2019 09:37:35 +0100
Message-ID: <20190122083735.13286-1-anders.roxell@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Fix link errors when PINCTRL_IMX_SCU, PINCTRL_IMX8QM or PINCTRL_IMXBQXP
is enabled as a module and the dependent module is built-in.

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

Rework so that PINCTRL_IMX_SCU and the config's that 'select
PINCTRL_IMX_SCU' depends on IMX_SCU=y.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/pinctrl/freescale/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index b318c24b61be..af141dd2331d 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -7,7 +7,7 @@ config PINCTRL_IMX
 
 config PINCTRL_IMX_SCU
 	bool
-	depends on IMX_SCU
+	depends on IMX_SCU=y
 	select PINCTRL_IMX
 
 config PINCTRL_IMX1_CORE
@@ -131,14 +131,14 @@ config PINCTRL_IMX8MQ
 
 config PINCTRL_IMX8QM
 	bool "IMX8QM pinctrl driver"
-	depends on ARCH_MXC && ARM64
+	depends on IMX_SCU && ARCH_MXC && ARM64
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qm pinctrl driver
 
 config PINCTRL_IMX8QXP
 	bool "IMX8QXP pinctrl driver"
-	depends on ARCH_MXC && ARM64
+	depends on IMX_SCU && ARCH_MXC && ARM64
 	select PINCTRL_IMX_SCU
 	help
 	  Say Y here to enable the imx8qxp pinctrl driver
-- 
2.19.2
