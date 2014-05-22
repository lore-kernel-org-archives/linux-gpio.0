From: Rob Jones <rob.jones@codethink.co.uk>
Subject: [PATCH] regulator: gpio-regulator: use devm_*
Date: Thu, 22 May 2014 15:51:06 +0100
Message-ID: <1400770266-7276-1-git-send-email-rob.jones@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([185.25.241.215]:36071 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752848AbaEVOvW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 22 May 2014 10:51:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: heiko@sntech.de, broonie@opensource.wolfsonmicro.com, ext-roger.quadros@nokia.com, rob.jones@codethink.co.uk

Use devm_regulator_register in probe/remove.

Reviewed-by: Ian Molton <ian.molton@codethink.co.uk>
Signed-off-by: Rob Jones <rob.jones@codethink.co.uk>
---
 drivers/regulator/gpio-regulator.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/regulator/gpio-regulator.c b/drivers/regulator/gpio-regulator.c
index 989b23b..994a050 100644
--- a/drivers/regulator/gpio-regulator.c
+++ b/drivers/regulator/gpio-regulator.c
@@ -337,7 +337,7 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 			cfg.ena_gpio_flags |= GPIOF_OUT_INIT_HIGH;
 	}
 
-	drvdata->dev = regulator_register(&drvdata->desc, &cfg);
+	drvdata->dev = devm_regulator_register(&pdev->dev, &drvdata->desc, &cfg);
 	if (IS_ERR(drvdata->dev)) {
 		ret = PTR_ERR(drvdata->dev);
 		dev_err(&pdev->dev, "Failed to register regulator: %d\n", ret);
@@ -364,8 +364,6 @@ static int gpio_regulator_remove(struct platform_device *pdev)
 {
 	struct gpio_regulator_data *drvdata = platform_get_drvdata(pdev);
 
-	regulator_unregister(drvdata->dev);
-
 	gpio_free_array(drvdata->gpios, drvdata->nr_gpios);
 
 	kfree(drvdata->states);
-- 
1.7.10.4

