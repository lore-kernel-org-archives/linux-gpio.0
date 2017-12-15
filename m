From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: axp209: add CONFIG_OF dependency
Date: Fri, 15 Dec 2017 13:48:41 +0100
Message-ID: <20171215124910.2887096-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:55427 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755427AbdLOMtO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Dec 2017 07:49:14 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Quentin Schulz <quentin.schulz@free-electrons.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The pinconf_generic_dt_free_map and pinconf_generic_dt_node_to_map_group
functions are only defined when CONFIG_OF is set:

drivers/pinctrl/pinctrl-axp209.c:312:21: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function); did you mean 'pinconf_generic_params'?
drivers/pinctrl/pinctrl-axp209.c:313:18: error: 'pinconf_generic_dt_free_map' undeclared here (not in a function); did you mean 'pinconf_generic_params'?

This adds a Kconfig depdency for the driver to prevent randconfig
build failures.

Fixes: 23f75d7dfa92 ("pinctrl: axp209: add pinctrl features")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index ce126955212c..648be90ac1cb 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -65,7 +65,7 @@ config PINCTRL_AS3722
 
 config PINCTRL_AXP209
 	tristate "X-Powers AXP209 PMIC pinctrl and GPIO Support"
-	depends on MFD_AXP20X
+	depends on MFD_AXP20X && OF
 	help
 	  AXP PMICs provides multiple GPIOs that can be muxed for different
 	  functions. This driver bundles a pinctrl driver to select the function
-- 
2.9.0

