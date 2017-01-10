From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] pinctrl: baytrail: Convert to use devm_*()
Date: Tue, 10 Jan 2017 22:11:39 +0200
Message-ID: <20170110201139.129737-2-andriy.shevchenko@linux.intel.com>
References: <20170110201139.129737-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:30031 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965932AbdAJUMO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Jan 2017 15:12:14 -0500
In-Reply-To: <20170110201139.129737-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, "Robert R . Howell" <rhowell@uwyo.edu>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This simplifies error handling and allows us to drop error path handlers
completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index c123488266ce..e696a01365cb 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1696,7 +1696,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,
 				       sizeof(*vg->saved_context), GFP_KERNEL);
 #endif
-	ret = gpiochip_add_data(gc, vg);
+	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
 	if (ret) {
 		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
 		return ret;
@@ -1706,7 +1706,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 				     0, 0, vg->soc_data->npins);
 	if (ret) {
 		dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
-		goto fail;
+		return ret;
 	}
 
 	/* set up interrupts  */
@@ -1717,7 +1717,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 					   handle_bad_irq, IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(&vg->pdev->dev, "failed to add irqchip\n");
-			goto fail;
+			return ret;
 		}
 
 		gpiochip_set_chained_irqchip(gc, &byt_irqchip,
@@ -1726,11 +1726,6 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	}
 
 	return ret;
-
-fail:
-	gpiochip_remove(&vg->chip);
-
-	return ret;
 }
 
 static int byt_set_soc_data(struct byt_gpio *vg,
@@ -1813,7 +1808,7 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	vg->pctl_desc.pins	= vg->soc_data->pins;
 	vg->pctl_desc.npins	= vg->soc_data->npins;
 
-	vg->pctl_dev = pinctrl_register(&vg->pctl_desc, &pdev->dev, vg);
+	vg->pctl_dev = devm_pinctrl_register(&pdev->dev, &vg->pctl_desc, vg);
 	if (IS_ERR(vg->pctl_dev)) {
 		dev_err(&pdev->dev, "failed to register pinctrl driver\n");
 		return PTR_ERR(vg->pctl_dev);
@@ -1822,10 +1817,8 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	raw_spin_lock_init(&vg->lock);
 
 	ret = byt_gpio_probe(vg);
-	if (ret) {
-		pinctrl_unregister(vg->pctl_dev);
+	if (ret)
 		return ret;
-	}
 
 	platform_set_drvdata(pdev, vg);
 	pm_runtime_enable(&pdev->dev);
-- 
2.11.0

