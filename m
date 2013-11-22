From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: pl061: proper error messages
Date: Fri, 22 Nov 2013 10:11:49 +0100
Message-ID: <1385111509-1376-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:49443 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750808Ab3KVJL4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2013 04:11:56 -0500
Received: by mail-wg0-f45.google.com with SMTP id a1so857369wgh.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2013 01:11:55 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This makes the PL061 driver print proper error messages
when probe fails, and also tell us when the chip is finally
registered.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-integrator/Kconfig |  1 +
 drivers/gpio/gpio-pl061.c        | 22 +++++++++++++++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-integrator/Kconfig b/arch/arm/mach-integrator/Kconfig
index 46be99007529..71089d4df8da 100644
--- a/arch/arm/mach-integrator/Kconfig
+++ b/arch/arm/mach-integrator/Kconfig
@@ -31,6 +31,7 @@ config INTEGRATOR_IMPD1
 	tristate "Include support for Integrator/IM-PD1"
 	depends on ARCH_INTEGRATOR_AP
 	select ARM_VIC
+	select ARM_AMBA
 	help
 	  The IM-PD1 is an add-on logic module for the Integrator which
 	  allows ARM(R) Ltd PrimeCells to be developed and evaluated.
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index f22f7f3e2e53..f08e5e2cbe50 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -270,26 +270,34 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	if (pdata) {
 		chip->gc.base = pdata->gpio_base;
 		irq_base = pdata->irq_base;
-		if (irq_base <= 0)
+		if (irq_base <= 0) {
+			dev_err(&adev->dev, "invalid IRQ base in pdata\n");
 			return -ENODEV;
+		}
 	} else {
 		chip->gc.base = -1;
 		irq_base = 0;
 	}
 
 	if (!devm_request_mem_region(dev, adev->res.start,
-				     resource_size(&adev->res), "pl061"))
+				     resource_size(&adev->res), "pl061")) {
+		dev_err(&adev->dev, "no memory region\n");
 		return -EBUSY;
+	}
 
 	chip->base = devm_ioremap(dev, adev->res.start,
 				  resource_size(&adev->res));
-	if (!chip->base)
+	if (!chip->base) {
+		dev_err(&adev->dev, "could not remap memory\n");
 		return -ENOMEM;
+	}
 
 	chip->domain = irq_domain_add_simple(adev->dev.of_node, PL061_GPIO_NR,
 					     irq_base, &pl061_domain_ops, chip);
-	if (!chip->domain)
+	if (!chip->domain) {
+		dev_err(&adev->dev, "no irq domain\n");
 		return -ENODEV;
+	}
 
 	spin_lock_init(&chip->lock);
 
@@ -314,8 +322,10 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	 */
 	writeb(0, chip->base + GPIOIE); /* disable irqs */
 	irq = adev->irq[0];
-	if (irq < 0)
+	if (irq < 0) {
+		dev_err(&adev->dev, "invalid IRQ\n");
 		return -ENODEV;
+	}
 
 	irq_set_chained_handler(irq, pl061_irq_handler);
 	irq_set_handler_data(irq, chip);
@@ -331,6 +341,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 
 	amba_set_drvdata(adev, chip);
+	dev_err(&adev->dev, "PL061 GPIO chip @%08x registered\n",
+		adev->res.start);
 
 	return 0;
 }
-- 
1.8.3.1

