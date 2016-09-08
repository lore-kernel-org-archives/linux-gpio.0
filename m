From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 6/6] gpio: pca953x: make the define names consistent
Date: Thu,  8 Sep 2016 12:48:22 +0200
Message-ID: <1473331702-26711-7-git-send-email-bgolaszewski@baylibre.com>
References: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

The register offset defines for the pca953x and pca957x expander
families should have the same names to better reflect their similar
purposes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 71e1344..78ab25e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -29,12 +29,12 @@
 
 #define REG_ADDR_AI		0x80
 
-#define PCA957X_IN		0
+#define PCA957X_INPUT		0
 #define PCA957X_INVRT		1
 #define PCA957X_BKEN		2
 #define PCA957X_PUPD		3
-#define PCA957X_CFG		4
-#define PCA957X_OUT		5
+#define PCA957X_DIRECTION	4
+#define PCA957X_OUTPUT		5
 #define PCA957X_MSK		6
 #define PCA957X_INTS		7
 
@@ -107,9 +107,9 @@ static const struct pca953x_reg_config pca953x_regs = {
 };
 
 static const struct pca953x_reg_config pca957x_regs = {
-	.direction = PCA957X_CFG,
-	.output = PCA957X_OUT,
-	.input = PCA957X_IN,
+	.direction = PCA957X_DIRECTION,
+	.output = PCA957X_OUTPUT,
+	.input = PCA957X_INPUT,
 };
 
 struct pca953x_chip {
@@ -699,10 +699,10 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 
 	chip->regs = &pca957x_regs;
 
-	ret = pca953x_read_regs(chip, PCA957X_OUT, chip->reg_output);
+	ret = pca953x_read_regs(chip, PCA957X_OUTPUT, chip->reg_output);
 	if (ret)
 		goto out;
-	ret = pca953x_read_regs(chip, PCA957X_CFG, chip->reg_direction);
+	ret = pca953x_read_regs(chip, PCA957X_DIRECTION, chip->reg_direction);
 	if (ret)
 		goto out;
 
-- 
2.7.4
