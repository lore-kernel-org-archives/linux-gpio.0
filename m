From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH] gpio-pca953x: Support NXP PCAL9555A with Agile I/O
Date: Thu,  2 Jul 2015 19:33:46 +0200
Message-ID: <1435858426-19623-2-git-send-email-clemens.gruber@pqgruber.com>
References: <1435858426-19623-1-git-send-email-clemens.gruber@pqgruber.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:40691 "EHLO
	mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753158AbbGBRmR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2015 13:42:17 -0400
In-Reply-To: <1435858426-19623-1-git-send-email-clemens.gruber@pqgruber.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Clemens Gruber <clemens.gruber@pqgruber.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

This patch adds support for the NXP PCAL9555A GPIO expander's extra
features, called Agile I/O:
Input latching, interrupt masks and open-drain output stages can be
configured via 3 optional device tree properties.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 .../devicetree/bindings/gpio/gpio-pca953x.txt      | 24 +++++++-
 drivers/gpio/gpio-pca953x.c                        | 68 ++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index b9a42f2..5c58687 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -11,6 +11,7 @@ Required properties:
 	nxp,pca9539
 	nxp,pca9554
 	nxp,pca9555
+	nxp,pcal9555a
 	nxp,pca9556
 	nxp,pca9557
 	nxp,pca9574
@@ -26,8 +27,15 @@ Required properties:
 	ti,tca6424
 	exar,xra1202
 
-Example:
+Supported chips with Agile I/O features:
+- nxp,pcal9555a
 
+Optional properties for chips with Agile I/O:
+- nxp,input-latch: Latch input states by setting the pin's corresponding bits
+- nxp,intr-mask: Enable interrupts by clearing the pin's corresponding mask bits
+- nxp,open-drain: Enable the open-drain output stage, one bit per port (bank)
+
+Examples:
 
 	gpio@20 {
 		compatible = "nxp,pca9505";
@@ -37,3 +45,17 @@ Example:
 		interrupt-parent = <&gpio3>;
 		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	gpio@22 {
+		compatible = "nxp,pcal9555a";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		nxp,input-latch = <0x8000>; /* Latch the input of pin I0.0 */
+		nxp,intr-mask = <0xf000>; /* Mask interrupts I0.0-I0.3 */
+		nxp,open-drain = <0x2>; /* Output port 1 (O1.0-O1.7) as open-drain */
+	};
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d233eb3..95698c9 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -3,6 +3,7 @@
  *
  *  Copyright (C) 2005 Ben Gardner <bgardner@wabtec.com>
  *  Copyright (C) 2007 Marvell International Ltd.
+ *  Copyright (C) 2015 Clemens Gruber <clemens.gruber@pqgruber.com>
  *
  *  Derived from drivers/i2c/chips/pca9539.c
  *
@@ -26,6 +27,9 @@
 #define PCA953X_OUTPUT		1
 #define PCA953X_INVERT		2
 #define PCA953X_DIRECTION	3
+#define PCAL95XXA_INPUT_LATCH	0x44
+#define PCAL95XXA_INTR_MASK	0x4A
+#define PCAL95XXA_OUTPUT_CONFIG	0x4F
 
 #define REG_ADDR_AI		0x80
 
@@ -40,6 +44,7 @@
 
 #define PCA_GPIO_MASK		0x00FF
 #define PCA_INT			0x0100
+#define PCA_AGILEIO		0x0200
 #define PCA953X_TYPE		0x1000
 #define PCA957X_TYPE		0x2000
 
@@ -53,6 +58,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pca9539", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "pca9554", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "pca9555", 16 | PCA953X_TYPE | PCA_INT, },
+	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_INT | PCA_AGILEIO, },
 	{ "pca9556", 8  | PCA953X_TYPE, },
 	{ "pca9557", 8  | PCA953X_TYPE, },
 	{ "pca9574", 8  | PCA957X_TYPE | PCA_INT, },
@@ -614,6 +620,53 @@ out:
 	return ret;
 }
 
+static int device_pcal95xxa_agileio_setup(struct pca953x_chip *chip,
+					  struct device_node *node)
+{
+	int ret;
+	u32 input_latch = 0;
+	u32 intr_mask = 0;
+	u32 open_drain = 0;
+
+	/* Input latch */
+	if (of_property_read_u32(node, "nxp,input-latch", &input_latch) == 0) {
+		if (input_latch > 0xFFFF)
+			return -EINVAL;
+
+		ret = i2c_smbus_write_word_data(chip->client,
+						PCAL95XXA_INPUT_LATCH,
+						rol16(input_latch, 8));
+		if (ret)
+			return -EIO;
+	}
+
+	/* Interrupt mask */
+	if (of_property_read_u32(node, "nxp,intr-mask", &intr_mask) == 0) {
+		if (intr_mask > 0xFFFF)
+			return -EINVAL;
+
+		ret = i2c_smbus_write_word_data(chip->client,
+						PCAL95XXA_INTR_MASK,
+						rol16(intr_mask, 8));
+		if (ret)
+			return -EIO;
+	}
+
+	/* Open-drain output stage per port (bank) */
+	if (of_property_read_u32(node, "nxp,open-drain", &open_drain) == 0) {
+		if (open_drain > 0x3)
+			return -EINVAL;
+
+		ret = i2c_smbus_write_byte_data(chip->client,
+						PCAL95XXA_OUTPUT_CONFIG,
+						(u8)open_drain);
+		if (ret)
+			return -EIO;
+	}
+
+	return 0;
+}
+
 static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 {
 	int ret;
@@ -645,6 +698,7 @@ out:
 static int pca953x_probe(struct i2c_client *client,
 				   const struct i2c_device_id *id)
 {
+	struct device_node *node = client->dev.of_node;
 	struct pca953x_platform_data *pdata;
 	struct pca953x_chip *chip;
 	int irq_base = 0;
@@ -700,6 +754,19 @@ static int pca953x_probe(struct i2c_client *client,
 			dev_warn(&client->dev, "setup failed, %d\n", ret);
 	}
 
+	/* Configure Agile I/O features, if supported by the chip */
+	if ((id->driver_data & PCA_AGILEIO) && IS_ENABLED(CONFIG_OF) && node) {
+		/* Only expanders with 16-bit supported */
+		if (NBANK(chip) == 2) {
+			ret = device_pcal95xxa_agileio_setup(chip, node);
+			if (ret < 0)
+				dev_warn(&client->dev,
+					 "Agile I/O setup failed, %d\n", ret);
+		} else
+			dev_warn(&client->dev,
+				 "Agile I/O not supported on this chip\n");
+	}
+
 	i2c_set_clientdata(client, chip);
 	return 0;
 }
@@ -735,6 +802,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca9539", },
 	{ .compatible = "nxp,pca9554", },
 	{ .compatible = "nxp,pca9555", },
+	{ .compatible = "nxp,pcal9555a", },
 	{ .compatible = "nxp,pca9556", },
 	{ .compatible = "nxp,pca9557", },
 	{ .compatible = "nxp,pca9574", },
-- 
2.4.5

