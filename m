From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: imx21: include linux/module.h
Date: Wed,  6 Jul 2016 14:52:40 +0200
Message-ID: <20160706125254.1663066-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:58292 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753932AbcGFMtz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 08:49:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The pinctrl driver includes a device table, but the macro used for
declaring it is declared in a header that is not visible here:

drivers/pinctrl/freescale/pinctrl-imx21.c:328:1: error: data definition has no type or storage class [-Werror]
 MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);

This adds the missing include.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: e2756baa4217 ("pinctrl: imx21: make it explicitly non-modular")
---
 drivers/pinctrl/freescale/pinctrl-imx21.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx21.c b/drivers/pinctrl/freescale/pinctrl-imx21.c
index b9f9b3b8eeb1..8cf33d608164 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx21.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx21.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/module.h>
 
 #include "pinctrl-imx1.h"
 
-- 
2.9.0

