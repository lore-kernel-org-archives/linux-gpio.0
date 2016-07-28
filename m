From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/1] gpio: pca954x: Add optional regulator enable.
Date: Thu, 28 Jul 2016 16:13:41 +0800
Message-ID: <1469693621-17851-2-git-send-email-preid@electromag.com.au>
References: <1469693621-17851-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:64678 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752022AbcG1INw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jul 2016 04:13:52 -0400
In-Reply-To: <1469693621-17851-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

Some i2c gpio devices are connected to a switchale power supply
which needs to be enabled prior to probing the device. This patch
allows the drive to enable the devices vcc regulator prior to probing.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpio-pca953x.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 5e3be32..12d8e91 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -21,6 +21,7 @@
 #include <asm/unaligned.h>
 #include <linux/of_platform.h>
 #include <linux/acpi.h>
+#include <linux/regulator/consumer.h>
 
 #define PCA953X_INPUT		0
 #define PCA953X_OUTPUT		1
@@ -744,6 +745,7 @@ static int pca953x_probe(struct i2c_client *client,
 	int irq_base = 0;
 	int ret;
 	u32 invert = 0;
+	struct regulator *reg;
 
 	chip = devm_kzalloc(&client->dev,
 			sizeof(struct pca953x_chip), GFP_KERNEL);
@@ -763,6 +765,22 @@ static int pca953x_probe(struct i2c_client *client,
 
 	chip->client = client;
 
+	reg = devm_regulator_get_optional(&client->dev, "vcc");
+	if (IS_ERR(reg)) {
+		ret = PTR_ERR(reg);
+		if (ret != -ENODEV) {
+			if (ret != -EPROBE_DEFER)
+				dev_err(&client->dev, "reg get err: %d\n", ret);
+			return ret;
+		}
+	} else {
+		ret = regulator_enable(reg);
+		if (ret) {
+			dev_err(&client->dev, "reg en err: %d\n", ret);
+			return ret;
+		}
+	}
+
 	if (id) {
 		chip->driver_data = id->driver_data;
 	} else {
-- 
1.8.3.1

