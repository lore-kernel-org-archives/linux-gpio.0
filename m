From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] pinctrl: ingenic: add CONFIG_OF dependency
Date: Mon, 29 May 2017 14:57:49 +0200
Message-ID: <20170529125802.163127-2-arnd@arndb.de>
References: <20170529125802.163127-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170529125802.163127-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The driver failts to build when CONFIG_OF is disabled:

drivers/pinctrl/pinctrl-ingenic.c:467:20: error: 'pinconf_generic_dt_node_to_map_all' undeclared here (not in a function); did you mean 'pinconf_generic_dump_config'?
drivers/pinctrl/pinctrl-ingenic.c:468:17: error: 'pinconf_generic_dt_free_map' undeclared here (not in a function); did you mean 'pinconf_generic_params'?

Fixes: b5c23aa46537 ("pinctrl: add a pinctrl driver for the Ingenic jz47xx SoCs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index abc1cef7ad96..332bd303da36 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -313,6 +313,7 @@ config PINCTRL_INGENIC
 	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
 	default y
 	depends on MACH_INGENIC || COMPILE_TEST
+	depends on OF
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-- 
2.9.0
