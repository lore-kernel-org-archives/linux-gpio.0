From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] pinctrl: uniphier: make drivers non-modular
Date: Thu, 16 Mar 2017 02:38:15 +0900
Message-ID: <1489599495-14004-2-git-send-email-yamada.masahiro@socionext.com>
References: <1489599495-14004-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from condef-03.nifty.com ([202.248.20.68]:19960 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751388AbdCORmb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 13:42:31 -0400
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-03.nifty.com with ESMTP id v2FHdZ7c030767
        for <linux-gpio@vger.kernel.org>; Thu, 16 Mar 2017 02:39:35 +0900
In-Reply-To: <1489599495-14004-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

At first these drivers were written as tristate, but the module
usecases are actually not tested.  Make all of them boolean.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/Kconfig                 | 16 ++++++++--------
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c | 11 +++--------
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 11 +++--------
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c  | 12 ++++--------
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c | 12 ++++--------
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c | 12 ++++--------
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c | 12 ++++--------
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c | 12 ++++--------
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c | 12 ++++--------
 9 files changed, 38 insertions(+), 72 deletions(-)

diff --git a/drivers/pinctrl/uniphier/Kconfig b/drivers/pinctrl/uniphier/Kconfig
index e077a9e..e5826ea 100644
--- a/drivers/pinctrl/uniphier/Kconfig
+++ b/drivers/pinctrl/uniphier/Kconfig
@@ -9,35 +9,35 @@ menuconfig PINCTRL_UNIPHIER
 if PINCTRL_UNIPHIER
 
 config PINCTRL_UNIPHIER_LD4
-	tristate "UniPhier PH1-LD4 SoC pinctrl driver"
+	bool "UniPhier LD4 SoC pinctrl driver"
 	default ARM
 
 config PINCTRL_UNIPHIER_PRO4
-	tristate "UniPhier PH1-Pro4 SoC pinctrl driver"
+	bool "UniPhier Pro4 SoC pinctrl driver"
 	default ARM
 
 config PINCTRL_UNIPHIER_SLD8
-	tristate "UniPhier PH1-sLD8 SoC pinctrl driver"
+	bool "UniPhier sLD8 SoC pinctrl driver"
 	default ARM
 
 config PINCTRL_UNIPHIER_PRO5
-	tristate "UniPhier PH1-Pro5 SoC pinctrl driver"
+	bool "UniPhier Pro5 SoC pinctrl driver"
 	default ARM
 
 config PINCTRL_UNIPHIER_PXS2
-	tristate "UniPhier ProXstream2 SoC pinctrl driver"
+	bool "UniPhier PXs2 SoC pinctrl driver"
 	default ARM
 
 config PINCTRL_UNIPHIER_LD6B
-	tristate "UniPhier PH1-LD6b SoC pinctrl driver"
+	bool "UniPhier LD6b SoC pinctrl driver"
 	default ARM
 
 config PINCTRL_UNIPHIER_LD11
-	tristate "UniPhier PH1-LD11 SoC pinctrl driver"
+	bool "UniPhier LD11 SoC pinctrl driver"
 	default ARM64
 
 config PINCTRL_UNIPHIER_LD20
-	tristate "UniPhier PH1-LD20 SoC pinctrl driver"
+	bool "UniPhier LD20 SoC pinctrl driver"
 	default ARM64
 
 endif
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
index 83f8864..706effe 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2016 Socionext Inc.
+ * Copyright (C) 2016-2017 Socionext Inc.
  *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
@@ -14,7 +14,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 
@@ -936,7 +936,6 @@ static const struct of_device_id uniphier_ld11_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-ld11-pinctrl" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, uniphier_ld11_pinctrl_match);
 
 static struct platform_driver uniphier_ld11_pinctrl_driver = {
 	.probe = uniphier_ld11_pinctrl_probe,
@@ -945,8 +944,4 @@ static struct platform_driver uniphier_ld11_pinctrl_driver = {
 		.of_match_table = uniphier_ld11_pinctrl_match,
 	},
 };
-module_platform_driver(uniphier_ld11_pinctrl_driver);
-
-MODULE_AUTHOR("Masahiro Yamada <yamada.masahiro@socionext.com>");
-MODULE_DESCRIPTION("UniPhier PH1-LD11 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(uniphier_ld11_pinctrl_driver);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
index 9668633..c8d18a2 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2016 Socionext Inc.
+ * Copyright (C) 2016-2017 Socionext Inc.
  *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
@@ -14,7 +14,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 
@@ -1034,7 +1034,6 @@ static const struct of_device_id uniphier_ld20_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-ld20-pinctrl" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, uniphier_ld20_pinctrl_match);
 
 static struct platform_driver uniphier_ld20_pinctrl_driver = {
 	.probe = uniphier_ld20_pinctrl_probe,
@@ -1043,8 +1042,4 @@ static struct platform_driver uniphier_ld20_pinctrl_driver = {
 		.of_match_table = uniphier_ld20_pinctrl_match,
 	},
 };
-module_platform_driver(uniphier_ld20_pinctrl_driver);
-
-MODULE_AUTHOR("Masahiro Yamada <yamada.masahiro@socionext.com>");
-MODULE_DESCRIPTION("UniPhier PH1-LD20 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(uniphier_ld20_pinctrl_driver);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c
index ce2a705..8f2ad1c 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
+ * Copyright (C) 2015-2017 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -13,7 +14,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 
@@ -931,7 +932,6 @@ static const struct of_device_id uniphier_ld4_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-ld4-pinctrl" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, uniphier_ld4_pinctrl_match);
 
 static struct platform_driver uniphier_ld4_pinctrl_driver = {
 	.probe = uniphier_ld4_pinctrl_probe,
@@ -940,8 +940,4 @@ static struct platform_driver uniphier_ld4_pinctrl_driver = {
 		.of_match_table = uniphier_ld4_pinctrl_match,
 	},
 };
-module_platform_driver(uniphier_ld4_pinctrl_driver);
-
-MODULE_AUTHOR("Masahiro Yamada <yamada.masahiro@socionext.com>");
-MODULE_DESCRIPTION("UniPhier PH1-LD4 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(uniphier_ld4_pinctrl_driver);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
index 73e044b..8a0da93 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
+ * Copyright (C) 2015-2017 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -13,7 +14,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 
@@ -1292,7 +1293,6 @@ static const struct of_device_id uniphier_ld6b_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-ld6b-pinctrl" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, uniphier_ld6b_pinctrl_match);
 
 static struct platform_driver uniphier_ld6b_pinctrl_driver = {
 	.probe = uniphier_ld6b_pinctrl_probe,
@@ -1301,8 +1301,4 @@ static struct platform_driver uniphier_ld6b_pinctrl_driver = {
 		.of_match_table = uniphier_ld6b_pinctrl_match,
 	},
 };
-module_platform_driver(uniphier_ld6b_pinctrl_driver);
-
-MODULE_AUTHOR("Masahiro Yamada <yamada.masahiro@socionext.com>");
-MODULE_DESCRIPTION("UniPhier PH1-LD6b pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(uniphier_ld6b_pinctrl_driver);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
index 6fe402c..a433a30 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
+ * Copyright (C) 2015-2017 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -13,7 +14,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 
@@ -1602,7 +1603,6 @@ static const struct of_device_id uniphier_pro4_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-pro4-pinctrl" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, uniphier_pro4_pinctrl_match);
 
 static struct platform_driver uniphier_pro4_pinctrl_driver = {
 	.probe = uniphier_pro4_pinctrl_probe,
@@ -1611,8 +1611,4 @@ static struct platform_driver uniphier_pro4_pinctrl_driver = {
 		.of_match_table = uniphier_pro4_pinctrl_match,
 	},
 };
-module_platform_driver(uniphier_pro4_pinctrl_driver);
-
-MODULE_AUTHOR("Masahiro Yamada <yamada.masahiro@socionext.com>");
-MODULE_DESCRIPTION("UniPhier PH1-Pro4 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(uniphier_pro4_pinctrl_driver);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
index f55457f..04d00c3 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
+ * Copyright (C) 2015-2017 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -13,7 +14,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 
@@ -1367,7 +1368,6 @@ static const struct of_device_id uniphier_pro5_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-pro5-pinctrl" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, uniphier_pro5_pinctrl_match);
 
 static struct platform_driver uniphier_pro5_pinctrl_driver = {
 	.probe = uniphier_pro5_pinctrl_probe,
@@ -1376,8 +1376,4 @@ static struct platform_driver uniphier_pro5_pinctrl_driver = {
 		.of_match_table = uniphier_pro5_pinctrl_match,
 	},
 };
-module_platform_driver(uniphier_pro5_pinctrl_driver);
-
-MODULE_AUTHOR("Masahiro Yamada <yamada.masahiro@socionext.com>");
-MODULE_DESCRIPTION("UniPhier PH1-Pro5 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(uniphier_pro5_pinctrl_driver);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c
index 93db82f..53b6b77 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
+ * Copyright (C) 2015-2017 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -13,7 +14,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 
@@ -1279,7 +1280,6 @@ static const struct of_device_id uniphier_pxs2_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-pxs2-pinctrl" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, uniphier_pxs2_pinctrl_match);
 
 static struct platform_driver uniphier_pxs2_pinctrl_driver = {
 	.probe = uniphier_pxs2_pinctrl_probe,
@@ -1288,8 +1288,4 @@ static struct platform_driver uniphier_pxs2_pinctrl_driver = {
 		.of_match_table = uniphier_pxs2_pinctrl_match,
 	},
 };
-module_platform_driver(uniphier_pxs2_pinctrl_driver);
-
-MODULE_AUTHOR("Masahiro Yamada <yamada.masahiro@socionext.com>");
-MODULE_DESCRIPTION("UniPhier ProXstream2 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(uniphier_pxs2_pinctrl_driver);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
index 3c673c2..37deaf6 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
+ * Copyright (C) 2015-2017 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -13,7 +14,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 
@@ -858,7 +859,6 @@ static const struct of_device_id uniphier_sld8_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-sld8-pinctrl" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, uniphier_sld8_pinctrl_match);
 
 static struct platform_driver uniphier_sld8_pinctrl_driver = {
 	.probe = uniphier_sld8_pinctrl_probe,
@@ -867,8 +867,4 @@ static struct platform_driver uniphier_sld8_pinctrl_driver = {
 		.of_match_table = uniphier_sld8_pinctrl_match,
 	},
 };
-module_platform_driver(uniphier_sld8_pinctrl_driver);
-
-MODULE_AUTHOR("Masahiro Yamada <yamada.masahiro@socionext.com>");
-MODULE_DESCRIPTION("UniPhier PH1-sLD8 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(uniphier_sld8_pinctrl_driver);
-- 
2.7.4

