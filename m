From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/3] gpio: sta2x11: check the return value of irq_alloc_generic_chip()
Date: Thu, 25 May 2017 10:37:37 +0200
Message-ID: <1495701458-12444-3-git-send-email-brgl@bgdev.pl>
References: <1495701458-12444-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495701458-12444-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

This function can fail, so check the return value before dereferencing
the returned pointer.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-sta2x11.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
index 39df062..9e70516 100644
--- a/drivers/gpio/gpio-sta2x11.c
+++ b/drivers/gpio/gpio-sta2x11.c
@@ -320,13 +320,16 @@ static irqreturn_t gsta_gpio_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static void gsta_alloc_irq_chip(struct gsta_gpio *chip)
+static int gsta_alloc_irq_chip(struct gsta_gpio *chip)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
 
 	gc = irq_alloc_generic_chip(KBUILD_MODNAME, 1, chip->irq_base,
 				     chip->reg_base, handle_simple_irq);
+	if (!gc)
+		return -ENOMEM;
+
 	gc->private = chip;
 	ct = gc->chip_types;
 
@@ -350,6 +353,8 @@ static void gsta_alloc_irq_chip(struct gsta_gpio *chip)
 		}
 		gc->irq_cnt = i - gc->irq_base;
 	}
+
+	return 0;
 }
 
 /* The platform device used here is instantiated by the MFD device */
@@ -400,7 +405,10 @@ static int gsta_probe(struct platform_device *dev)
 		return err;
 	}
 	chip->irq_base = err;
-	gsta_alloc_irq_chip(chip);
+
+	err = gsta_alloc_irq_chip(chip);
+	if (err)
+		return err;
 
 	err = devm_request_irq(&dev->dev, pdev->irq, gsta_gpio_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, chip);
-- 
2.9.3
