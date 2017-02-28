From: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>
Subject: [PATCH] fix pinctrl setup for i.IMX6
Date: Tue, 28 Feb 2017 08:00:16 +0200
Message-ID: <d217e26e-9b5c-7b01-67e2-017293ca1407@nextfour.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db5eur01on0084.outbound.protection.outlook.com ([104.47.2.84]:4192
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751037AbdB1GQw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Feb 2017 01:16:52 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linus.walleij@linaro.org, linux-gpio@vger.kernel.org

Hi!

Recent pulls for mainline pre 4.11 introduced pinctrl setup changes and moved pinctrl-imx to
use generic helpers. 

Net effect was that hog group could not be resolved. I made it work for myself
with a two stage setup with create and start separated, and dt probe in between them.


Signed-off-by: Mika Penttilä <mika.penttila@nextfour.com>
---

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d690465..33659c5a 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2237,6 +2237,47 @@ int devm_pinctrl_register_and_init(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_register_and_init);
 
+int devm_pinctrl_register_and_init_nostart(struct device *dev,
+					struct pinctrl_desc *pctldesc,
+					void *driver_data,
+					struct pinctrl_dev **pctldev)
+{
+	struct pinctrl_dev **ptr;
+	struct pinctrl_dev *p;
+
+	ptr = devres_alloc(devm_pinctrl_dev_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	p = pinctrl_init_controller(pctldesc, dev, driver_data);
+	if (IS_ERR(p)) {
+		devres_free(ptr);
+		return PTR_ERR(p);
+	}
+
+	*ptr = p;
+	devres_add(dev, ptr);
+	*pctldev = p;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_pinctrl_register_and_init_nostart);
+
+int devm_pinctrl_start(struct device *dev,
+		struct pinctrl_dev *pctldev)
+{
+	int error = 0;
+
+	error = pinctrl_create_and_start(pctldev);
+	if (error) {
+		mutex_destroy(&pctldev->mutex);
+		return error;
+	}
+
+	return error;
+}
+EXPORT_SYMBOL_GPL(devm_pinctrl_start);
+
 /**
  * devm_pinctrl_unregister() - Resource managed version of pinctrl_unregister().
  * @dev: device for which which resource was allocated
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index a7ace9e..3644aed 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -686,16 +686,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 	return 0;
 }
 
-/*
- * imx_free_resources() - free memory used by this driver
- * @info: info driver instance
- */
-static void imx_free_resources(struct imx_pinctrl *ipctl)
-{
-	if (ipctl->pctl)
-		pinctrl_unregister(ipctl->pctl);
-}
-
 int imx_pinctrl_probe(struct platform_device *pdev,
 		      struct imx_pinctrl_soc_info *info)
 {
@@ -774,26 +764,30 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	ipctl->info = info;
 	ipctl->dev = info->dev;
 	platform_set_drvdata(pdev, ipctl);
-	ret = devm_pinctrl_register_and_init(&pdev->dev,
-					     imx_pinctrl_desc, ipctl,
-					     &ipctl->pctl);
+
+	ret = devm_pinctrl_register_and_init_nostart(&pdev->dev,
+						imx_pinctrl_desc, ipctl,
+						&ipctl->pctl);
+
 	if (ret) {
 		dev_err(&pdev->dev, "could not register IMX pinctrl driver\n");
-		goto free;
+		return ret;
 	}
 
 	ret = imx_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {
 		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		goto free;
+		return ret;
+	}
+
+	ret = devm_pinctrl_start(&pdev->dev, ipctl->pctl);
+	if (ret) {
+		dev_err(&pdev->dev, "could not start IMX pinctrl driver\n");
+		return ret;
 	}
 
 	dev_info(&pdev->dev, "initialized IMX pinctrl driver\n");
 
 	return 0;
 
-free:
-	imx_free_resources(ipctl);
-
-	return ret;
 }
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 8ce2d87..e7020f0 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -153,9 +153,17 @@ extern struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 extern void pinctrl_unregister(struct pinctrl_dev *pctldev);
 
 extern int devm_pinctrl_register_and_init(struct device *dev,
-				struct pinctrl_desc *pctldesc,
-				void *driver_data,
-				struct pinctrl_dev **pctldev);
+					struct pinctrl_desc *pctldesc,
+					void *driver_data,
+					struct pinctrl_dev **pctldev);
+
+extern int devm_pinctrl_register_and_init_nostart(struct device *dev,
+						struct pinctrl_desc *pctldesc,
+						void *driver_data,
+						struct pinctrl_dev **pctldev);
+
+extern int devm_pinctrl_start(struct device *dev,
+			struct pinctrl_dev *pctldev);
 
 /* Please use devm_pinctrl_register_and_init() instead */
 extern struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
