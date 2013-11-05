From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] gpio: gpio-mxs: Remove unneeded dt checks
Date: Tue,  5 Nov 2013 17:21:22 -0200
Message-ID: <1383679282-4599-1-git-send-email-festevam@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:60236 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925Ab3KETVa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2013 14:21:30 -0500
Received: by mail-qc0-f170.google.com with SMTP id n9so5138913qcw.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2013 11:21:29 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: shawn.guo@linaro.org, linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

From: Fabio Estevam <fabio.estevam@freescale.com>

mxs is a devicetree only platform, so there is no need to check whether we
are in dt or platform data case.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/gpio/gpio-mxs.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index f8e6af2..532bcb3 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -254,7 +254,6 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	struct device_node *parent;
 	static void __iomem *base;
 	struct mxs_gpio_port *port;
-	struct resource *iores = NULL;
 	int irq_base;
 	int err;
 
@@ -262,16 +261,10 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENOMEM;
 
-	if (np) {
-		port->id = of_alias_get_id(np, "gpio");
-		if (port->id < 0)
-			return port->id;
-		port->devid = (enum mxs_gpio_id) of_id->data;
-	} else {
-		port->id = pdev->id;
-		port->devid = pdev->id_entry->driver_data;
-	}
-
+	port->id = of_alias_get_id(np, "gpio");
+	if (port->id < 0)
+		return port->id;
+	port->devid = (enum mxs_gpio_id) of_id->data;
 	port->irq = platform_get_irq(pdev, 0);
 	if (port->irq < 0)
 		return port->irq;
@@ -281,18 +274,11 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	 * share the same one
 	 */
 	if (!base) {
-		if (np) {
-			parent = of_get_parent(np);
-			base = of_iomap(parent, 0);
-			of_node_put(parent);
-			if (!base)
-				return -EADDRNOTAVAIL;
-		} else {
-			iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-			base = devm_ioremap_resource(&pdev->dev, iores);
-			if (IS_ERR(base))
-				return PTR_ERR(base);
-		}
+		parent = of_get_parent(np);
+		base = of_iomap(parent, 0);
+		of_node_put(parent);
+		if (!base)
+			return -EADDRNOTAVAIL;
 	}
 	port->base = base;
 
-- 
1.8.1.2

