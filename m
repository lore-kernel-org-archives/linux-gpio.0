From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpio/pca953x: Add TI TCA9539 support
Date: Wed,  9 Sep 2015 17:23:22 +0200
Message-ID: <1441812202-1915-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The TCA9539 is almost identical to the PCA9555 and software-compatible
with this driver. It exposes 16 general purpose I/O pins in two 8-bit
configurations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

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
