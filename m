From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] pinctrl: sprd: add missing Kconfig dependency
Date: Tue,  5 Sep 2017 09:58:01 +0200
Message-ID: <20170905075826.893066-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:56706 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750704AbdIEH6j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2017 03:58:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Baolin Wang <baolin.wang@spreadtrum.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The chip-specific driver fails to build when the common
part is not enabled first:

drivers/pinctrl/sprd/pinctrl-sprd-sc9860.o:(.data+0x8): undefined reference to `sprd_pinctrl_remove'
drivers/pinctrl/sprd/pinctrl-sprd-sc9860.o:(.data+0x10): undefined reference to `sprd_pinctrl_shutdown'

This adds a Kconfig dependency to ensure this is always
the case.

Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/sprd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sprd/Kconfig b/drivers/pinctrl/sprd/Kconfig
index 6f4a7f9ac6fd..ec21b8bae487 100644
--- a/drivers/pinctrl/sprd/Kconfig
+++ b/drivers/pinctrl/sprd/Kconfig
@@ -13,5 +13,6 @@ config PINCTRL_SPRD
 
 config PINCTRL_SPRD_SC9860
 	bool "Spreadtrum SC9860 pinctrl driver"
+	depends on PINCTRL_SPRD
 	help
 	  Say Y here to enable Spreadtrum SC9860 pinctrl driver
-- 
2.9.0

