From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Fri, 18 Dec 2015 12:21:11 +0800
Message-ID: <1450412497-25872-1-git-send-email-djkurtz@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Daniel Kurtz <djkurtz@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Patrice Chotard <patrice.chotard@st.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
	support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
	support" <linux-mediatek@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Move pinctrl initialization earlier in boot so that real devices can find
their pctldev without probe deferring.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt6397.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8127.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8135.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8173.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index f9751ae..a3780d4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -70,7 +70,7 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 
-module_init(mtk_pinctrl_init);
+arch_initcall(mtk_pinctrl_init);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("MediaTek MT6397 Pinctrl Driver");
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
