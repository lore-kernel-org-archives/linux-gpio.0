From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 05/21] regulator: arizona-ldo1: Look up a descriptor and pass to the core
Date: Mon, 12 Feb 2018 14:17:01 +0100
Message-ID: <20180212131717.27193-6-linus.walleij@linaro.org>
References: <20180212131717.27193-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:39065 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935231AbeBLNRm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Feb 2018 08:17:42 -0500
Received: by mail-lf0-f67.google.com with SMTP id h78so13192279lfg.6
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2018 05:17:42 -0800 (PST)
In-Reply-To: <20180212131717.27193-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>

Instead of passing a global GPIO number, pass a descriptor looked
up with the standard devm_gpiod_get_optional() call.

We have augmented the GPIO core to look up the regulator special
GPIO "wlf,ldoena" in a separate patch.

Cc: patches@opensource.cirrus.com
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/arizona-ldo1.c       | 19 ++++++-------------
 include/linux/regulator/arizona-ldo1.h |  3 ---
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/arizona-ldo1.c b/drivers/regulator/arizona-ldo1.c
index 96fddfff5dc4..f6d6a4ad9e8a 100644
--- a/drivers/regulator/arizona-ldo1.c
+++ b/drivers/regulator/arizona-ldo1.c
@@ -17,12 +17,11 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
-#include <linux/gpio.h>
 #include <linux/slab.h>
 
 #include <linux/regulator/arizona-ldo1.h>
@@ -198,16 +197,6 @@ static int arizona_ldo1_of_get_pdata(struct arizona_ldo1_pdata *pdata,
 	struct device_node *init_node, *dcvdd_node;
 	struct regulator_init_data *init_data;
 
-	pdata->ldoena = of_get_named_gpio(np, "wlf,ldoena", 0);
-	if (pdata->ldoena < 0) {
-		dev_warn(config->dev,
-			 "LDOENA GPIO property missing/malformed: %d\n",
-			 pdata->ldoena);
-		pdata->ldoena = 0;
-	} else {
-		config->ena_gpio_initialized = true;
-	}
-
 	init_node = of_get_child_by_name(np, "ldo1");
 	dcvdd_node = of_parse_phandle(np, "DCVDD-supply", 0);
 
@@ -264,7 +253,11 @@ static int arizona_ldo1_common_init(struct platform_device *pdev,
 		}
 	}
 
-	config.ena_gpio = pdata->ldoena;
+	/* We assume that high output = regulator off */
+	config.ena_gpiod = devm_gpiod_get_optional(&pdev->dev, "wlf,ldoena",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(config.ena_gpiod))
+		return PTR_ERR(config.ena_gpiod);
 
 	if (pdata->init_data)
 		config.init_data = pdata->init_data;
diff --git a/include/linux/regulator/arizona-ldo1.h b/include/linux/regulator/arizona-ldo1.h
index c685f1277c63..fe74ab9990e6 100644
--- a/include/linux/regulator/arizona-ldo1.h
+++ b/include/linux/regulator/arizona-ldo1.h
@@ -14,9 +14,6 @@
 struct regulator_init_data;
 
 struct arizona_ldo1_pdata {
-	/** GPIO controlling LDOENA, if any */
-	int ldoena;
-
 	/** Regulator configuration for LDO1 */
 	const struct regulator_init_data *init_data;
 };
-- 
2.14.3

