From: kamlakant.patel@broadcom.com
Subject: [PATCH 2/2] gpio: Add ACPI support for XLP GPIO controller
Date: Sun,  5 Jun 2016 14:00:44 +0530
Message-ID: <1465115444-25068-2-git-send-email-kamlakant.patel@broadcom.com>
References: <1465115444-25068-1-git-send-email-kamlakant.patel@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:40295 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751081AbcFEIkw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jun 2016 04:40:52 -0400
In-Reply-To: <1465115444-25068-1-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jayachandran C <jchandra@broadcom.com>

From: Kamlakant Patel <kamlakant.patel@broadcom.com>

Add ACPI support for GPIO controller on Broadcom Vulcan ARM64.
ACPI ID for this device is BRCM9006.

Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
---
 drivers/gpio/gpio-xlp.c |   36 +++++++++++++++++++++++++++++-------
 1 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 6acf8aa..4620d05 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -19,6 +19,7 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/acpi.h>
 
 /*
  * XLP GPIO has multiple 32 bit registers for each feature where each register
@@ -299,7 +300,6 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	struct gpio_chip *gc;
 	struct resource *iores;
 	struct xlp_gpio_priv *priv;
-	const struct of_device_id *of_id;
 	void __iomem *gpio_base;
 	int irq_base, irq, err;
 	int ngpio;
@@ -321,13 +321,26 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	of_id = of_match_device(xlp_gpio_of_ids, &pdev->dev);
-	if (!of_id) {
-		dev_err(&pdev->dev, "Failed to get soc type!\n");
-		return -ENODEV;
-	}
+	if (pdev->dev.of_node) {
+		const struct of_device_id *of_id;
 
-	soc_type = (uintptr_t) of_id->data;
+		of_id = of_match_device(xlp_gpio_of_ids, &pdev->dev);
+		if (!of_id) {
+			dev_err(&pdev->dev, "Unable to match OF ID\n");
+			return -ENODEV;
+		}
+		soc_type = (uintptr_t) of_id->data;
+	} else {
+		const struct acpi_device_id *acpi_id;
+
+		acpi_id = acpi_match_device(pdev->dev.driver->acpi_match_table,
+						&pdev->dev);
+		if (!acpi_id || !acpi_id->driver_data) {
+			dev_err(&pdev->dev, "Unable to match ACPI ID\n");
+			return -ENODEV;
+		}
+		soc_type = (uintptr_t) acpi_id->driver_data;
+	}
 
 	switch (soc_type) {
 	case XLP_GPIO_VARIANT_XLP832:
@@ -425,10 +438,19 @@ out_free_desc:
 	return err;
 }
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id xlp_gpio_acpi_match[] = {
+	{ "BRCM9006", GPIO_VARIANT_VULCAN },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
+#endif
+
 static struct platform_driver xlp_gpio_driver = {
 	.driver		= {
 		.name	= "xlp-gpio",
 		.of_match_table = xlp_gpio_of_ids,
+		.acpi_match_table = ACPI_PTR(xlp_gpio_acpi_match),
 	},
 	.probe		= xlp_gpio_probe,
 };
-- 
1.7.1

