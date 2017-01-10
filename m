From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 2/6] pinctrl: intel: Convert to use devm_gpiochip_add_data()
Date: Tue, 10 Jan 2017 17:31:57 +0300
Message-ID: <20170110143201.53539-3-mika.westerberg@linux.intel.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This simplifies error handling and allows us to drop intel_pinctrl_remove()
completely.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-broxton.c      |  1 -
 drivers/pinctrl/intel/pinctrl-intel.c        | 23 ++++-------------------
 drivers/pinctrl/intel/pinctrl-intel.h        |  2 --
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |  1 -
 4 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 901b356b09d7..8ec2b6a77745 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -1058,7 +1058,6 @@ static const struct dev_pm_ops bxt_pinctrl_pm_ops = {
 
 static struct platform_driver bxt_pinctrl_driver = {
 	.probe = bxt_pinctrl_probe,
-	.remove = intel_pinctrl_remove,
 	.driver = {
 		.name = "broxton-pinctrl",
 		.acpi_match_table = bxt_pinctrl_acpi_match,
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 1e139672f1af..447405809340 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -884,7 +884,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	pctrl->chip.base = -1;
 	pctrl->irq = irq;
 
-	ret = gpiochip_add_data(&pctrl->chip, pctrl);
+	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to register gpiochip\n");
 		return ret;
@@ -894,7 +894,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 				     0, 0, pctrl->soc->npins);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add GPIO pin range\n");
-		goto fail;
+		return ret;
 	}
 
 	/*
@@ -907,24 +907,19 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 			       dev_name(pctrl->dev), pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to request interrupt\n");
-		goto fail;
+		return ret;
 	}
 
 	ret = gpiochip_irqchip_add(&pctrl->chip, &intel_gpio_irqchip, 0,
 				   handle_bad_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add irqchip\n");
-		goto fail;
+		return ret;
 	}
 
 	gpiochip_set_chained_irqchip(&pctrl->chip, &intel_gpio_irqchip, irq,
 				     NULL);
 	return 0;
-
-fail:
-	gpiochip_remove(&pctrl->chip);
-
-	return ret;
 }
 
 static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
@@ -1046,16 +1041,6 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(intel_pinctrl_probe);
 
-int intel_pinctrl_remove(struct platform_device *pdev)
-{
-	struct intel_pinctrl *pctrl = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&pctrl->chip);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(intel_pinctrl_remove);
-
 #ifdef CONFIG_PM_SLEEP
 static bool intel_pinctrl_should_save(struct intel_pinctrl *pctrl, unsigned pin)
 {
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index b60215793017..c22c44485c5d 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -121,8 +121,6 @@ struct intel_pinctrl_soc_data {
 
 int intel_pinctrl_probe(struct platform_device *pdev,
 			const struct intel_pinctrl_soc_data *soc_data);
-int intel_pinctrl_remove(struct platform_device *pdev);
-
 #ifdef CONFIG_PM_SLEEP
 int intel_pinctrl_suspend(struct device *dev);
 int intel_pinctrl_resume(struct device *dev);
diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index c725a5313b4e..9877526c0807 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -574,7 +574,6 @@ static const struct dev_pm_ops spt_pinctrl_pm_ops = {
 
 static struct platform_driver spt_pinctrl_driver = {
 	.probe = spt_pinctrl_probe,
-	.remove = intel_pinctrl_remove,
 	.driver = {
 		.name = "sunrisepoint-pinctrl",
 		.acpi_match_table = spt_pinctrl_acpi_match,
-- 
2.11.0
