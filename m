From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/7] gpio: mockup: code shrink
Date: Mon,  6 Feb 2017 13:10:36 +0100
Message-ID: <1486383041-16758-3-git-send-email-bgolaszewski@baylibre.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Moving a couple of lines around allows us to shrink the code a bit
while keeping the same functionality.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 5f6ed4b..d425601 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -92,7 +92,6 @@ static int gpio_mockup_add(struct device *dev,
 			   const char *name, int base, int ngpio)
 {
 	struct gpio_chip *gc = &chip->gc;
-	int ret;
 
 	gc->base = base;
 	gc->ngpio = ngpio;
@@ -107,21 +106,10 @@ static int gpio_mockup_add(struct device *dev,
 
 	chip->lines = devm_kzalloc(dev, sizeof(*chip->lines) * gc->ngpio,
 				   GFP_KERNEL);
-	if (!chip->lines) {
-		ret = -ENOMEM;
-		goto err;
-	}
-
-	ret = devm_gpiochip_add_data(dev, &chip->gc, chip);
-	if (ret)
-		goto err;
-
-	dev_info(dev, "gpio<%d..%d> add successful!", base, base + ngpio);
-	return 0;
+	if (!chip->lines)
+		return -ENOMEM;
 
-err:
-	dev_err(dev, "gpio<%d..%d> add failed!", base, base + ngpio);
-	return ret;
+	return devm_gpiochip_add_data(dev, &chip->gc, chip);
 }
 
 static int gpio_mockup_probe(struct platform_device *pdev)
@@ -164,15 +152,14 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 		}
 
 		if (ret) {
-			if (base < 0)
-				dev_err(dev, "gpio<%d..%d> add failed\n",
-					base, ngpio);
-			else
-				dev_err(dev, "gpio<%d..%d> add failed\n",
-					base, base + ngpio);
+			dev_err(dev, "gpio<%d..%d> add failed\n",
+				base, base < 0 ? ngpio : base + ngpio);
 
 			return ret;
 		}
+
+		dev_info(dev, "gpio<%d..%d> add successful!",
+			 base, base + ngpio);
 	}
 
 	return 0;
-- 
2.9.3
