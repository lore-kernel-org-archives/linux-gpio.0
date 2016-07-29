From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 1/1] gpio: pca954x: Add vcc regulator and enable it
Date: Fri, 29 Jul 2016 11:39:55 +0800
Message-ID: <1469763595-38245-2-git-send-email-preid@electromag.com.au>
References: <1469763595-38245-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:57442 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750900AbcG2DkG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jul 2016 23:40:06 -0400
In-Reply-To: <1469763595-38245-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

Some i2c gpio devices are connected to a switchable power supply
which needs to be enabled prior to probing the device. This patch
allows the drive to enable the devices vcc regulator prior to probing.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpio-pca953x.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 5e3be32..9da8757 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -21,6 +21,7 @@
 #include <asm/unaligned.h>
 #include <linux/of_platform.h>
 #include <linux/acpi.h>
+#include <linux/regulator/consumer.h>
 
 #define PCA953X_INPUT		0
 #define PCA953X_OUTPUT		1
@@ -111,6 +112,7 @@ struct pca953x_chip {
 	const char *const *names;
 	int	chip_type;
 	unsigned long driver_data;
+	struct regulator *regulator;
 };
 
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
@@ -744,6 +746,7 @@ static int pca953x_probe(struct i2c_client *client,
 	int irq_base = 0;
 	int ret;
 	u32 invert = 0;
+	struct regulator *reg;
 
 	chip = devm_kzalloc(&client->dev,
 			sizeof(struct pca953x_chip), GFP_KERNEL);
@@ -763,6 +766,20 @@ static int pca953x_probe(struct i2c_client *client,
 
 	chip->client = client;
 
+	reg = devm_regulator_get(&client->dev, "vcc");
+	if (IS_ERR(reg)) {
+		ret = PTR_ERR(reg);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&client->dev, "reg get err: %d\n", ret);
+		return ret;
+	}
+	ret = regulator_enable(reg);
+	if (ret) {
+		dev_err(&client->dev, "reg en err: %d\n", ret);
+		return ret;
+	}
+	chip->regulator = reg;
+
 	if (id) {
 		chip->driver_data = id->driver_data;
 	} else {
@@ -774,8 +791,10 @@ static int pca953x_probe(struct i2c_client *client,
 			chip->driver_data = (int)(uintptr_t)match->data;
 		} else {
 			id = acpi_match_device(pca953x_acpi_ids, &client->dev);
-			if (!id)
-				return -ENODEV;
+			if (!id) {
+				ret = -ENODEV;
+				goto err_exit;
+			}
 
 			chip->driver_data = id->driver_data;
 		}
@@ -795,15 +814,15 @@ static int pca953x_probe(struct i2c_client *client,
 	else
 		ret = device_pca957x_init(chip, invert);
 	if (ret)
-		return ret;
+		goto err_exit;
 
 	ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
 	if (ret)
-		return ret;
+		goto err_exit;
 
 	ret = pca953x_irq_setup(chip, irq_base);
 	if (ret)
-		return ret;
+		goto err_exit;
 
 	if (pdata && pdata->setup) {
 		ret = pdata->setup(client, chip->gpio_chip.base,
@@ -814,6 +833,10 @@ static int pca953x_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, chip);
 	return 0;
+
+err_exit:
+	regulator_disable(chip->regulator);
+	return ret;
 }
 
 static int pca953x_remove(struct i2c_client *client)
@@ -825,14 +848,14 @@ static int pca953x_remove(struct i2c_client *client)
 	if (pdata && pdata->teardown) {
 		ret = pdata->teardown(client, chip->gpio_chip.base,
 				chip->gpio_chip.ngpio, pdata->context);
-		if (ret < 0) {
+		if (ret < 0)
 			dev_err(&client->dev, "%s failed, %d\n",
 					"teardown", ret);
-			return ret;
-		}
 	}
 
-	return 0;
+	regulator_disable(chip->regulator);
+
+	return ret;
 }
 
 /* convenience to stop overlong match-table lines */
-- 
1.8.3.1

