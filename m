From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2] gpio/pca953x: Add TI TCA9539 support
Date: Tue, 29 Sep 2015 12:55:44 +0200
Message-ID: <1443524144-14847-1-git-send-email-thierry.reding@gmail.com>
References: <1441812202-1915-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:35677 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934243AbbI2Kzs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2015 06:55:48 -0400
In-Reply-To: <1441812202-1915-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The TCA9539 is almost identical to the PCA9555 and software-compatible
with this driver. It exposes 16 general purpose I/O pins in two 8-bit
configurations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- update device tree binding documentation

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 drivers/gpio/gpio-pca953x.c                             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index b9a42f294dd0..13df9933f4cd 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -24,6 +24,7 @@ Required properties:
 	ti,tca6408
 	ti,tca6416
 	ti,tca6424
+	ti,tca9539
 	exar,xra1202
 
 Example:
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 50caeb1ee350..b28791279173 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -67,6 +67,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "tca6408", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "tca6416", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "tca6424", 24 | PCA953X_TYPE | PCA_INT, },
+	{ "tca9539", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "xra1202", 8  | PCA953X_TYPE },
 	{ }
 };
@@ -754,6 +755,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,tca6408", },
 	{ .compatible = "ti,tca6416", },
 	{ .compatible = "ti,tca6424", },
+	{ .compatible = "ti,tca9539", },
 
 	{ .compatible = "exar,xra1202", },
 	{ }
-- 
2.5.0

