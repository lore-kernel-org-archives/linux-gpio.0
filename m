From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: dwapb: Convert to use resource managed APIs
Date: Sun, 28 Dec 2014 15:23:14 +0800
Message-ID: <1419751394.15728.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:54915 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751741AbaL1HXT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Dec 2014 02:23:19 -0500
Received: by mail-pd0-f171.google.com with SMTP id y13so15348100pdi.30
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2014 23:23:19 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Weike Chen <alvin.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Use resource managed APIs to simplify the code a bit.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-dwapb.c | 53 +++++++++++++----------------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index b4eb6a6..58faf04 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -469,15 +469,13 @@ dwapb_gpio_get_pdata_of(struct device *dev)
 	if (nports == 0)
 		return ERR_PTR(-ENODEV);
 
-	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	pdata->properties = kcalloc(nports, sizeof(*pp), GFP_KERNEL);
-	if (!pdata->properties) {
-		kfree(pdata);
+	pdata->properties = devm_kcalloc(dev, nports, sizeof(*pp), GFP_KERNEL);
+	if (!pdata->properties)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	pdata->nports = nports;
 
@@ -490,8 +488,6 @@ dwapb_gpio_get_pdata_of(struct device *dev)
 		    pp->idx >= DWAPB_MAX_PORTS) {
 			dev_err(dev, "missing/invalid port index for %s\n",
 				port_np->full_name);
-			kfree(pdata->properties);
-			kfree(pdata);
 			return ERR_PTR(-EINVAL);
 		}
 
@@ -523,15 +519,6 @@ dwapb_gpio_get_pdata_of(struct device *dev)
 	return pdata;
 }
 
-static inline void dwapb_free_pdata_of(struct dwapb_platform_data *pdata)
-{
-	if (!IS_ENABLED(CONFIG_OF_GPIO) || !pdata)
-		return;
-
-	kfree(pdata->properties);
-	kfree(pdata);
-}
-
 static int dwapb_gpio_probe(struct platform_device *pdev)
 {
 	unsigned int i;
@@ -540,40 +527,32 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	int err;
 	struct device *dev = &pdev->dev;
 	struct dwapb_platform_data *pdata = dev_get_platdata(dev);
-	bool is_pdata_alloc = !pdata;
 
-	if (is_pdata_alloc) {
+	if (!pdata) {
 		pdata = dwapb_gpio_get_pdata_of(dev);
 		if (IS_ERR(pdata))
 			return PTR_ERR(pdata);
 	}
 
-	if (!pdata->nports) {
-		err = -ENODEV;
-		goto out_err;
-	}
+	if (!pdata->nports)
+		return -ENODEV;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
-	if (!gpio) {
-		err = -ENOMEM;
-		goto out_err;
-	}
+	if (!gpio)
+		return -ENOMEM;
+
 	gpio->dev = &pdev->dev;
 	gpio->nr_ports = pdata->nports;
 
 	gpio->ports = devm_kcalloc(&pdev->dev, gpio->nr_ports,
 				   sizeof(*gpio->ports), GFP_KERNEL);
-	if (!gpio->ports) {
-		err = -ENOMEM;
-		goto out_err;
-	}
+	if (!gpio->ports)
+		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	gpio->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(gpio->regs)) {
-		err = PTR_ERR(gpio->regs);
-		goto out_err;
-	}
+	if (IS_ERR(gpio->regs))
+		return PTR_ERR(gpio->regs);
 
 	for (i = 0; i < gpio->nr_ports; i++) {
 		err = dwapb_gpio_add_port(gpio, &pdata->properties[i], i);
@@ -582,16 +561,12 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, gpio);
 
-	goto out_err;
+	return 0;
 
 out_unregister:
 	dwapb_gpio_unregister(gpio);
 	dwapb_irq_teardown(gpio);
 
-out_err:
-	if (is_pdata_alloc)
-		dwapb_free_pdata_of(pdata);
-
 	return err;
 }
 
-- 
1.9.1



