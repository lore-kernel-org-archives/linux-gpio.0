From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] pinctrl: sprd: add CONFIG_OF dependency
Date: Tue,  5 Sep 2017 09:58:02 +0200
Message-ID: <20170905075826.893066-2-arnd@arndb.de>
References: <20170905075826.893066-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:52084 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750704AbdIEH6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2017 03:58:54 -0400
In-Reply-To: <20170905075826.893066-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Baolin Wang <baolin.wang@spreadtrum.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Without CONFIG_OF, we run into a build error:

drivers/pinctrl/sprd/pinctrl-sprd.c: In function 'sprd_dt_node_to_map':
drivers/pinctrl/sprd/pinctrl-sprd.c:290:8: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]

This adds a Kconfig dependency for it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/sprd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sprd/Kconfig b/drivers/pinctrl/sprd/Kconfig
index ec21b8bae487..e75cde2e1b46 100644
--- a/drivers/pinctrl/sprd/Kconfig
+++ b/drivers/pinctrl/sprd/Kconfig
@@ -4,6 +4,7 @@
 
 config PINCTRL_SPRD
 	bool "Spreadtrum pinctrl driver"
+	depends on OF
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-- 
2.9.0

