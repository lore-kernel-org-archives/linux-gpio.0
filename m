From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/5] gpio: pca953x: remove an unused variable
Date: Wed,  7 Sep 2016 11:24:56 +0200
Message-ID: <1473240297-19881-5-git-send-email-bgolaszewski@baylibre.com>
References: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

The chip_type variable in struct pca953x_chip is no longer required.

Remove it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 6b62898..00bb2ea 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -129,7 +129,6 @@ struct pca953x_chip {
 	struct i2c_client *client;
 	struct gpio_chip gpio_chip;
 	const char *const *names;
-	int	chip_type;
 	unsigned long driver_data;
 
 	const struct pca953x_offset *offset;
@@ -760,8 +759,6 @@ static int pca953x_probe(struct i2c_client *client,
 		}
 	}
 
-	chip->chip_type = PCA_CHIP_TYPE(chip->driver_data);
-
 	mutex_init(&chip->i2c_lock);
 
 	/* initialize cached registers from their original values.
@@ -774,7 +771,7 @@ static int pca953x_probe(struct i2c_client *client,
 	else if (chip->gpio_chip.ngpio >= 24)
 		chip->write_regs = pca953x_write_regs_24;
 
-	if (chip->chip_type == PCA953X_TYPE)
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
 		ret = device_pca953x_init(chip, invert);
 	else
 		ret = device_pca957x_init(chip, invert);
-- 
2.7.4
