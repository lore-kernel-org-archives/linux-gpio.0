From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] pinctrl: uniphier: remove obsoleted compatibles
Date: Thu, 16 Mar 2017 02:38:14 +0900
Message-ID: <1489599495-14004-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from condef-02.nifty.com ([202.248.20.67]:55426 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbdCORmy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 13:42:54 -0400
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-02.nifty.com with ESMTP id v2FHdZft018972
        for <linux-gpio@vger.kernel.org>; Thu, 16 Mar 2017 02:39:35 +0900
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Since commit 3e030b0b4e46 ("pinctrl: uniphier: allow to have pinctrl
node under syscon node"), this driver has kept compatibility for the
old DT files.  Several releases have passed since then, so remove
the obsoleted compatibles and clean up the code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c | 48 +++++++++++-------------
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c  |  1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c |  1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c |  1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c |  1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c |  1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c |  1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier.h      | 11 +-----
 8 files changed, 23 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
index 546f23c..30dec0e 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
+ * Copyright (C) 2015-2017 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -26,11 +27,18 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-uniphier.h"
 
+#define UNIPHIER_PINCTRL_PINMUX_BASE	0x1000
+#define UNIPHIER_PINCTRL_LOAD_PINMUX	0x1700
+#define UNIPHIER_PINCTRL_DRVCTRL_BASE	0x1800
+#define UNIPHIER_PINCTRL_DRV2CTRL_BASE	0x1900
+#define UNIPHIER_PINCTRL_DRV3CTRL_BASE	0x1980
+#define UNIPHIER_PINCTRL_PUPDCTRL_BASE	0x1a00
+#define UNIPHIER_PINCTRL_IECTRL		0x1d00
+
 struct uniphier_pinctrl_priv {
 	struct pinctrl_desc pctldesc;
 	struct pinctrl_dev *pctldev;
 	struct regmap *regmap;
-	unsigned int regbase;
 	struct uniphier_pinctrl_socdata *socdata;
 };
 
@@ -171,7 +179,7 @@ static int uniphier_conf_pin_bias_get(struct pinctrl_dev *pctldev,
 	reg = UNIPHIER_PINCTRL_PUPDCTRL_BASE + pupdctrl / 32 * 4;
 	shift = pupdctrl % 32;
 
-	ret = regmap_read(priv->regmap, priv->regbase + reg, &val);
+	ret = regmap_read(priv->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -231,7 +239,7 @@ static int uniphier_conf_pin_drive_get(struct pinctrl_dev *pctldev,
 	shift = drvctrl % 32;
 	mask = (1U << width) - 1;
 
-	ret = regmap_read(priv->regmap, priv->regbase + reg, &val);
+	ret = regmap_read(priv->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -252,8 +260,7 @@ static int uniphier_conf_pin_input_enable_get(struct pinctrl_dev *pctldev,
 		/* This pin is always input-enabled. */
 		return 0;
 
-	ret = regmap_read(priv->regmap,
-			  priv->regbase + UNIPHIER_PINCTRL_IECTRL, &val);
+	ret = regmap_read(priv->regmap, UNIPHIER_PINCTRL_IECTRL, &val);
 	if (ret)
 		return ret;
 
@@ -366,8 +373,7 @@ static int uniphier_conf_pin_bias_set(struct pinctrl_dev *pctldev,
 	reg = UNIPHIER_PINCTRL_PUPDCTRL_BASE + pupdctrl / 32 * 4;
 	shift = pupdctrl % 32;
 
-	return regmap_update_bits(priv->regmap, priv->regbase + reg,
-				  1 << shift, val << shift);
+	return regmap_update_bits(priv->regmap, reg, 1 << shift, val << shift);
 }
 
 static int uniphier_conf_pin_drive_set(struct pinctrl_dev *pctldev,
@@ -427,7 +433,7 @@ static int uniphier_conf_pin_drive_set(struct pinctrl_dev *pctldev,
 	shift = drvctrl % 32;
 	mask = (1U << width) - 1;
 
-	return regmap_update_bits(priv->regmap, priv->regbase + reg,
+	return regmap_update_bits(priv->regmap, reg,
 				  mask << shift, val << shift);
 }
 
@@ -451,7 +457,7 @@ static int uniphier_conf_pin_input_enable(struct pinctrl_dev *pctldev,
 	if (iectrl == UNIPHIER_PIN_IECTRL_NONE)
 		return enable ? 0 : -EINVAL;
 
-	reg = priv->regbase + UNIPHIER_PINCTRL_IECTRL + iectrl / 32 * 4;
+	reg = UNIPHIER_PINCTRL_IECTRL + iectrl / 32 * 4;
 	mask = BIT(iectrl % 32);
 
 	return regmap_update_bits(priv->regmap, reg, mask, enable ? mask : 0);
@@ -601,7 +607,7 @@ static int uniphier_pmx_set_one_mux(struct pinctrl_dev *pctldev, unsigned pin,
 	 * stored in the offset+4.
 	 */
 	for (; reg < reg_end; reg += 4) {
-		ret = regmap_update_bits(priv->regmap, priv->regbase + reg,
+		ret = regmap_update_bits(priv->regmap, reg,
 					 mask << shift, muxval << shift);
 		if (ret)
 			return ret;
@@ -610,8 +616,7 @@ static int uniphier_pmx_set_one_mux(struct pinctrl_dev *pctldev, unsigned pin,
 
 	if (load_pinctrl) {
 		ret = regmap_write(priv->regmap,
-				   priv->regbase + UNIPHIER_PINCTRL_LOAD_PINMUX,
-				   1);
+				   UNIPHIER_PINCTRL_LOAD_PINMUX, 1);
 		if (ret)
 			return ret;
 	}
@@ -698,20 +703,9 @@ int uniphier_pinctrl_probe(struct platform_device *pdev,
 	if (!priv)
 		return -ENOMEM;
 
-	if (of_device_is_compatible(dev->of_node, "socionext,ph1-ld4-pinctrl") ||
-	    of_device_is_compatible(dev->of_node, "socionext,ph1-pro4-pinctrl") ||
-	    of_device_is_compatible(dev->of_node, "socionext,ph1-sld8-pinctrl") ||
-	    of_device_is_compatible(dev->of_node, "socionext,ph1-pro5-pinctrl") ||
-	    of_device_is_compatible(dev->of_node, "socionext,proxstream2-pinctrl") ||
-	    of_device_is_compatible(dev->of_node, "socionext,ph1-ld6b-pinctrl")) {
-		/* old binding */
-		priv->regmap = syscon_node_to_regmap(dev->of_node);
-	} else {
-		priv->regbase = 0x1000;
-		parent = of_get_parent(dev->of_node);
-		priv->regmap = syscon_node_to_regmap(parent);
-		of_node_put(parent);
-	}
+	parent = of_get_parent(dev->of_node);
+	priv->regmap = syscon_node_to_regmap(parent);
+	of_node_put(parent);
 
 	if (IS_ERR(priv->regmap)) {
 		dev_err(dev, "failed to get regmap\n");
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c
index 3edfb6f..ce2a705 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c
@@ -929,7 +929,6 @@ static int uniphier_ld4_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id uniphier_ld4_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-ld4-pinctrl" },
-	{ .compatible = "socionext,ph1-ld4-pinctrl" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, uniphier_ld4_pinctrl_match);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
index 708e510..73e044b 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
@@ -1290,7 +1290,6 @@ static int uniphier_ld6b_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id uniphier_ld6b_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-ld6b-pinctrl" },
-	{ .compatible = "socionext,ph1-ld6b-pinctrl" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, uniphier_ld6b_pinctrl_match);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
index c306e84..6fe402c 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
@@ -1600,7 +1600,6 @@ static int uniphier_pro4_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id uniphier_pro4_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-pro4-pinctrl" },
-	{ .compatible = "socionext,ph1-pro4-pinctrl" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, uniphier_pro4_pinctrl_match);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
index 55d4a12..f55457f 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
@@ -1365,7 +1365,6 @@ static int uniphier_pro5_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id uniphier_pro5_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-pro5-pinctrl" },
-	{ .compatible = "socionext,ph1-pro5-pinctrl" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, uniphier_pro5_pinctrl_match);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c
index 85ca5e2..93db82f 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c
@@ -1277,7 +1277,6 @@ static int uniphier_pxs2_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id uniphier_pxs2_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-pxs2-pinctrl" },
-	{ .compatible = "socionext,proxstream2-pinctrl" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, uniphier_pxs2_pinctrl_match);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
index da689d8..3c673c2 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
@@ -856,7 +856,6 @@ static int uniphier_sld8_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id uniphier_sld8_pinctrl_match[] = {
 	{ .compatible = "socionext,uniphier-sld8-pinctrl" },
-	{ .compatible = "socionext,ph1-sld8-pinctrl" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, uniphier_sld8_pinctrl_match);
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier.h b/drivers/pinctrl/uniphier/pinctrl-uniphier.h
index 923f36c..6f2f33b 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier.h
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier.h
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
+ * Copyright (C) 2015-2017 Socionext Inc.
+ *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -22,14 +23,6 @@
 
 struct platform_device;
 
-#define UNIPHIER_PINCTRL_PINMUX_BASE	0x0
-#define UNIPHIER_PINCTRL_LOAD_PINMUX	0x700
-#define UNIPHIER_PINCTRL_DRVCTRL_BASE	0x800
-#define UNIPHIER_PINCTRL_DRV2CTRL_BASE	0x900
-#define UNIPHIER_PINCTRL_DRV3CTRL_BASE	0x980
-#define UNIPHIER_PINCTRL_PUPDCTRL_BASE	0xa00
-#define UNIPHIER_PINCTRL_IECTRL		0xd00
-
 /* input enable control register bit */
 #define UNIPHIER_PIN_IECTRL_SHIFT	0
 #define UNIPHIER_PIN_IECTRL_BITS	8
-- 
2.7.4

