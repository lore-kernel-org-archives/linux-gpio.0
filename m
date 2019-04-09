From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] gpio: pca953x: add support for pca6416
Date: Tue,  9 Apr 2019 14:35:46 +0200
Message-ID: <20190409123546.13960-2-alexandre.belloni@bootlin.com>
References: <20190409123546.13960-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409123546.13960-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

The NXP PCA6416, documented at [1], is a variant of the PCA GPIO
expander with 16 GPIOs, and supporting an interrupt.

[1] https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 7e76830b3368..7fb4d51277e4 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -73,6 +73,7 @@
 #define PCA_CHIP_TYPE(x)	((x) & PCA_TYPE_MASK)
 
 static const struct i2c_device_id pca953x_id[] = {
+	{ "pca6416", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "pca9505", 40 | PCA953X_TYPE | PCA_INT, },
 	{ "pca9534", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "pca9535", 16 | PCA953X_TYPE | PCA_INT, },
@@ -1137,6 +1138,7 @@ static int pca953x_resume(struct device *dev)
 #define OF_957X(__nrgpio, __int) (void *)(__nrgpio | PCA957X_TYPE | __int)
 
 static const struct of_device_id pca953x_dt_ids[] = {
+	{ .compatible = "nxp,pca6416", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "nxp,pca9505", .data = OF_953X(40, PCA_INT), },
 	{ .compatible = "nxp,pca9534", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "nxp,pca9535", .data = OF_953X(16, PCA_INT), },
-- 
2.20.1
