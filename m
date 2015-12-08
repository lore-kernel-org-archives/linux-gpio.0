From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 2/2] gpio: pca935x: fix of-only probed devices
Date: Tue,  8 Dec 2015 10:19:26 +0000
Message-ID: <1449569966-16816-3-git-send-email-ben.dooks@codethink.co.uk>
References: <1449569966-16816-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([185.25.241.215]:59183 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933078AbbLHKTh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2015 05:19:37 -0500
In-Reply-To: <1449569966-16816-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: ben.dooks@codethink.co.uk, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org

If the pca953x device is probed from OF using the proper OF probing then
the i2c-client will be NULL and the device probe will fail as id is NULL
and it isn't an ACPI device (previous drivers would simply OOPS out).

Add support for the of_device_id table having the same data as the others
so that the correct paths will be taken when registering a device.

An example of current valid of node which did not work:

	gpio@38 {
		compatible = "onsemi,pca9654", "nxp,pca9534";
		reg = <0x38>;
		interrupt-parent = <&gpio5>;
		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
	};

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpio/gpio-pca953x.c | 76 ++++++++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 9847931..4881774 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -660,6 +660,8 @@ out:
 	return ret;
 }
 
+static const struct of_device_id pca953x_dt_ids[];
+
 static int pca953x_probe(struct i2c_client *client,
 				   const struct i2c_device_id *id)
 {
@@ -691,12 +693,18 @@ static int pca953x_probe(struct i2c_client *client,
 		chip->driver_data = id->driver_data;
 	} else {
 		const struct acpi_device_id *id;
+		const struct of_device_id *match;
 
-		id = acpi_match_device(pca953x_acpi_ids, &client->dev);
-		if (!id)
-			return -ENODEV;
+		match = of_match_device(pca953x_dt_ids, &client->dev);
+		if (match) {
+			chip->driver_data = (int)(uintptr_t)match->data;
+		} else {
+			id = acpi_match_device(pca953x_acpi_ids, &client->dev);
+			if (!id)
+				return -ENODEV;
 
-		chip->driver_data = id->driver_data;
+			chip->driver_data = id->driver_data;
+		}
 	}
 
 	chip->chip_type = PCA_CHIP_TYPE(chip->driver_data);
@@ -755,35 +763,39 @@ static int pca953x_remove(struct i2c_client *client)
 	return 0;
 }
 
+/* convenience to stop overlong match-table lines */
+#define OF_953X(__nrgpio, __int) (void *)(__nrgpio | PCA953X_TYPE | __int)
+#define OF_957X(__nrgpio, __int) (void *)(__nrgpio | PCA957X_TYPE | __int)
+
 static const struct of_device_id pca953x_dt_ids[] = {
-	{ .compatible = "nxp,pca9505", },
-	{ .compatible = "nxp,pca9534", },
-	{ .compatible = "nxp,pca9535", },
-	{ .compatible = "nxp,pca9536", },
-	{ .compatible = "nxp,pca9537", },
-	{ .compatible = "nxp,pca9538", },
-	{ .compatible = "nxp,pca9539", },
-	{ .compatible = "nxp,pca9554", },
-	{ .compatible = "nxp,pca9555", },
-	{ .compatible = "nxp,pca9556", },
-	{ .compatible = "nxp,pca9557", },
-	{ .compatible = "nxp,pca9574", },
-	{ .compatible = "nxp,pca9575", },
-	{ .compatible = "nxp,pca9698", },
-
-	{ .compatible = "maxim,max7310", },
-	{ .compatible = "maxim,max7312", },
-	{ .compatible = "maxim,max7313", },
-	{ .compatible = "maxim,max7315", },
-
-	{ .compatible = "ti,pca6107", },
-	{ .compatible = "ti,tca6408", },
-	{ .compatible = "ti,tca6416", },
-	{ .compatible = "ti,tca6424", },
-
-	{ .compatible = "onsemi,pca9654" },
-
-	{ .compatible = "exar,xra1202", },
+	{ .compatible = "nxp,pca9505", .data = OF_953X(40, PCA_INT), },
+	{ .compatible = "nxp,pca9534", .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "nxp,pca9535", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "nxp,pca9536", .data = OF_953X( 4, 0), },
+	{ .compatible = "nxp,pca9537", .data = OF_953X( 4, PCA_INT), },
+	{ .compatible = "nxp,pca9538", .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "nxp,pca9539", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "nxp,pca9554", .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "nxp,pca9555", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "nxp,pca9556", .data = OF_953X( 8, 0), },
+	{ .compatible = "nxp,pca9557", .data = OF_953X( 8, 0), },
+	{ .compatible = "nxp,pca9574", .data = OF_957X( 8, PCA_INT), },
+	{ .compatible = "nxp,pca9575", .data = OF_957X(16, PCA_INT), },
+	{ .compatible = "nxp,pca9698", .data = OF_953X(40, 0), },
+
+	{ .compatible = "maxim,max7310", .data = OF_953X( 8, 0), },
+	{ .compatible = "maxim,max7312", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "maxim,max7313", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "maxim,max7315", .data = OF_953X( 8, PCA_INT), },
+
+	{ .compatible = "ti,pca6107", .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "ti,tca6408", .data = OF_953X( 8, PCA_INT), },
+	{ .compatible = "ti,tca6416", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "ti,tca6424", .data = OF_953X(24, PCA_INT), },
+
+	{ .compatible = "onsemi,pca9654", .data = OF_953X( 8, PCA_INT), },
+
+	{ .compatible = "exar,xra1202", .data = OF_953X( 8, 0), },
 	{ }
 };
 
-- 
2.6.2

