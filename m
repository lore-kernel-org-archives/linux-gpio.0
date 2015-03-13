From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] pinctrl: mediatek: mt8135/mt8173: Constify of_device_id
 table
Date: Fri, 13 Mar 2015 14:44:43 +0800
Message-ID: <1426229083.15007.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:35243 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963AbbCMGou (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2015 02:44:50 -0400
Received: by pdbfp1 with SMTP id fp1so26531785pdb.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2015 23:44:49 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Also make the table a bit compact.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8135.c | 8 +++-----
 drivers/pinctrl/mediatek/pinctrl-mt8173.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index 1296d6d..b7e91c1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -347,11 +347,9 @@ static int mt8135_pinctrl_probe(struct platform_device *pdev)
 	return mtk_pctrl_init(pdev, &mt8135_pinctrl_data);
 }
 
-static struct of_device_id mt8135_pctrl_match[] = {
-	{
-		.compatible = "mediatek,mt8135-pinctrl",
-	}, {
-	}
+static const struct of_device_id mt8135_pctrl_match[] = {
+	{ .compatible = "mediatek,mt8135-pinctrl", },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mt8135_pctrl_match);
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
index f07cafb..46e4f6e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
@@ -427,11 +427,9 @@ static int mt8173_pinctrl_probe(struct platform_device *pdev)
 	return mtk_pctrl_init(pdev, &mt8173_pinctrl_data);
 }
 
-static struct of_device_id mt8173_pctrl_match[] = {
-	{
-		.compatible = "mediatek,mt8173-pinctrl",
-	}, {
-	}
+static const struct of_device_id mt8173_pctrl_match[] = {
+	{ .compatible = "mediatek,mt8173-pinctrl", },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mt8173_pctrl_match);
 
-- 
1.9.1



