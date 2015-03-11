From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] pinctrl: mediatek: Fix include directive
Date: Wed, 11 Mar 2015 09:05:20 -0700
Message-ID: <1426089920-24818-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36068 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbbCKQF0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2015 12:05:26 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YVj8Q-002h6k-5j
	for linux-gpio@vger.kernel.org; Wed, 11 Mar 2015 16:05:26 +0000
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Hongzhou Yang <hongzhou.yang@mediatek.com>

Fix the following build failure:

In file included from drivers/pinctrl/mediatek/pinctrl-mt8135.c:24:0:
drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h:19:32: fatal error:
	pinctrl-mtk-common.h: No such file or directory

seen when building arm:multi_v7_defconfig.

Fixes: 94097d89c145 ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h
index 5019cef..e17aedb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h
@@ -16,7 +16,7 @@
 #define __PINCTRL_MTK_MT8135_H
 
 #include <linux/pinctrl/pinctrl.h>
-#include <pinctrl-mtk-common.h>
+#include "pinctrl-mtk-common.h"
 
 static const struct mtk_desc_pin mtk_pins_mt8135[] = {
 	MTK_PIN(
-- 
2.1.0

