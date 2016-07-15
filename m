From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: bcm: add OF dependencies
Date: Fri, 15 Jul 2016 22:29:54 +0200
Message-ID: <20160715203012.1715182-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Pramod Kumar <pramodku@broadcom.com>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Building without CONFIG_OF gives us these warnings for the broadcom
pinctrl drivers:

drivers/pinctrl/bcm/pinctrl-nsp-mux.c:356:20: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function)
drivers/pinctrl/bcm/pinctrl-cygnus-mux.c:739:20: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function)

The function is only available when CONFIG_OF is set, so we should add
a Kconfig dependency for both drivers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: cc4fa83f66e9 ("pinctrl: nsp: add pinmux driver support for Broadcom NSP SoC")
---
 drivers/pinctrl/bcm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 7967c6723676..63246770bd74 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -60,6 +60,7 @@ config PINCTRL_IPROC_GPIO
 config PINCTRL_CYGNUS_MUX
 	bool "Broadcom Cygnus IOMUX driver"
 	depends on (ARCH_BCM_CYGNUS || COMPILE_TEST)
+	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
 	default ARCH_BCM_CYGNUS
@@ -103,6 +104,7 @@ config PINCTRL_NS2_MUX
 config PINCTRL_NSP_MUX
 	bool "Broadcom NSP IOMUX driver"
 	depends on (ARCH_BCM_NSP || COMPILE_TEST)
+	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
 	default ARCH_BCM_NSP
-- 
2.9.0
