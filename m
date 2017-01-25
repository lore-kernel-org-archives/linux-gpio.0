From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] pinctrl: mediatek: Use real dependencies
Date: Wed, 25 Jan 2017 10:32:09 +0100
Message-ID: <20170125103209.1d97b0bd@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45498 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751565AbdAYJcP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Jan 2017 04:32:15 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>

Do not hide pinctrl drivers for Mediatek platforms using
conditionals. Doing so actually leaves the symbols present (but
always disabled) on all other platforms, which is confusing and
inefficient. Better use real dependencies so that the symbols do not
exist at all on platforms where they are not relevant.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reported-by: Andreas Färber <afaerber@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/pinctrl/mediatek/Kconfig |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

--- linux-4.10-rc4.orig/drivers/pinctrl/mediatek/Kconfig	2017-01-01 23:31:53.000000000 +0100
+++ linux-4.10-rc4/drivers/pinctrl/mediatek/Kconfig	2017-01-25 10:29:00.465436987 +0100
@@ -10,25 +10,29 @@ config PINCTRL_MTK
 
 # For ARMv7 SoCs
 config PINCTRL_MT2701
-	bool "Mediatek MT2701 pin control" if COMPILE_TEST && !MACH_MT2701
+	bool "Mediatek MT2701 pin control"
+	depends on MACH_MT2701 || COMPILE_TEST
 	depends on OF
 	default MACH_MT2701
 	select PINCTRL_MTK
 
 config PINCTRL_MT7623
-	bool "Mediatek MT7623 pin control" if COMPILE_TEST && !MACH_MT7623
+	bool "Mediatek MT7623 pin control"
+	depends on MACH_MT7623 || COMPILE_TEST
 	depends on OF
 	default MACH_MT7623
 	select PINCTRL_MTK_COMMON
 
 config PINCTRL_MT8135
-	bool "Mediatek MT8135 pin control" if COMPILE_TEST && !MACH_MT8135
+	bool "Mediatek MT8135 pin control"
+	depends on MACH_MT8135 || COMPILE_TEST
 	depends on OF
 	default MACH_MT8135
 	select PINCTRL_MTK
 
 config PINCTRL_MT8127
-	bool "Mediatek MT8127 pin control" if COMPILE_TEST && !MACH_MT8127
+	bool "Mediatek MT8127 pin control"
+	depends on MACH_MT8127 || COMPILE_TEST
 	depends on OF
 	default MACH_MT8127
 	select PINCTRL_MTK
@@ -43,7 +47,8 @@ config PINCTRL_MT8173
 
 # For PMIC
 config PINCTRL_MT6397
-	bool "Mediatek MT6397 pin control" if COMPILE_TEST && !MFD_MT6397
+	bool "Mediatek MT6397 pin control"
+	depends on MFD_MT6397 || COMPILE_TEST
 	depends on OF
 	default MFD_MT6397
 	select PINCTRL_MTK


-- 
Jean Delvare
SUSE L3 Support
