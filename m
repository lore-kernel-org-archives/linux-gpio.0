From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Tue, 22 Dec 2015 21:46:37 +0800
Message-ID: <1450792017-7120-1-git-send-email-djkurtz@chromium.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:33506 "EHLO
	mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751703AbbLVNrc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 08:47:32 -0500
Received: by mail-pf0-f181.google.com with SMTP id q63so880078pfb.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 05:47:32 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: Daniel Kurtz <djkurtz@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabio Estevam <fabio.estevam@freescale.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
	support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
	support" <linux-mediatek@lists.infradead.org>

Move pinctrl initialization earlier in boot so that real devices can find
their pctldev without probe deferring.

Note: We don't change mt6397 probe order in this patch, since MT6397 is mfd
PMIC, which depends on pwrap on main AP to work. Since pmic-wrap itself
is module_platform_driver, we keep it as module_init.  A later patch
will convert both pmic-wrap, and all functions of the MT6397 mfd to
arch_initcall.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt8127.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8135.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8173.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
index b317b0b..98e0beb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
@@ -351,7 +351,7 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 
-module_init(mtk_pinctrl_init);
+arch_initcall(mtk_pinctrl_init);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("MediaTek MT8127 Pinctrl Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index 404f117..1c153b8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -366,7 +366,7 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 
-module_init(mtk_pinctrl_init);
+arch_initcall(mtk_pinctrl_init);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MediaTek Pinctrl Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
index ad27184..a62514e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
@@ -394,7 +394,7 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 
-module_init(mtk_pinctrl_init);
+arch_initcall(mtk_pinctrl_init);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("MediaTek Pinctrl Driver");
-- 
2.6.0.rc2.230.g3dd15c0

