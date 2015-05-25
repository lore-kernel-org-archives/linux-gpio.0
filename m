From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] gpio-stp-xway: Use the of_property_read_u32 helper
Date: Mon, 25 May 2015 22:39:51 +0200
Message-ID: <1432586391-27634-2-git-send-email-martin.blumenstingl@googlemail.com>
References: <1432586391-27634-1-git-send-email-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:33180 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751135AbbEYUrR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2015 16:47:17 -0400
Received: by wicmx19 with SMTP id mx19so48295609wic.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2015 13:47:16 -0700 (PDT)
In-Reply-To: <1432586391-27634-1-git-send-email-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, John Crispin <blogic@openwrt.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This removes some redundant code but does have any functional impact.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpio/gpio-stp-xway.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 6d4148f..81bdbe7 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -200,7 +200,7 @@ static int xway_stp_hw_init(struct xway_stp *chip)
 static int xway_stp_probe(struct platform_device *pdev)
 {
 	struct resource *res;
-	const __be32 *shadow, *groups, *dsl, *phy;
+	u32 shadow, groups, dsl, phy;
 	struct xway_stp *chip;
 	struct clk *clk;
 	int ret = 0;
@@ -223,33 +223,28 @@ static int xway_stp_probe(struct platform_device *pdev)
 	chip->gc.owner = THIS_MODULE;
 
 	/* store the shadow value if one was passed by the devicetree */
-	shadow = of_get_property(pdev->dev.of_node, "lantiq,shadow", NULL);
-	if (shadow)
-		chip->shadow = be32_to_cpu(*shadow);
+	if (!of_property_read_u32(pdev->dev.of_node, "lantiq,shadow", &shadow))
+		chip->shadow = shadow;
 
 	/* find out which gpio groups should be enabled */
-	groups = of_get_property(pdev->dev.of_node, "lantiq,groups", NULL);
-	if (groups)
-		chip->groups = be32_to_cpu(*groups) & XWAY_STP_GROUP_MASK;
+	if (!of_property_read_u32(pdev->dev.of_node, "lantiq,groups", &groups))
+		chip->groups = groups & XWAY_STP_GROUP_MASK;
 	else
 		chip->groups = XWAY_STP_GROUP0;
 	chip->gc.ngpio = fls(chip->groups) * 8;
 
 	/* find out which gpios are controlled by the dsl core */
-	dsl = of_get_property(pdev->dev.of_node, "lantiq,dsl", NULL);
-	if (dsl)
-		chip->dsl = be32_to_cpu(*dsl) & XWAY_STP_ADSL_MASK;
+	if (!of_property_read_u32(pdev->dev.of_node, "lantiq,dsl", &dsl))
+		chip->dsl = dsl & XWAY_STP_ADSL_MASK;
 
 	/* find out which gpios are controlled by the phys */
 	if (of_machine_is_compatible("lantiq,ar9") ||
 			of_machine_is_compatible("lantiq,gr9") ||
 			of_machine_is_compatible("lantiq,vr9")) {
-		phy = of_get_property(pdev->dev.of_node, "lantiq,phy1", NULL);
-		if (phy)
-			chip->phy1 = be32_to_cpu(*phy) & XWAY_STP_PHY_MASK;
-		phy = of_get_property(pdev->dev.of_node, "lantiq,phy2", NULL);
-		if (phy)
-			chip->phy2 = be32_to_cpu(*phy) & XWAY_STP_PHY_MASK;
+		if (!of_property_read_u32(pdev->dev.of_node, "lantiq,phy1", &phy))
+			chip->phy1 = phy & XWAY_STP_PHY_MASK;
+		if (!of_property_read_u32(pdev->dev.of_node, "lantiq,phy2", &phy))
+			chip->phy2 = phy & XWAY_STP_PHY_MASK;
 	}
 
 	/* check which edge trigger we should use, default to a falling edge */
-- 
2.4.1

