From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 3/3] gpio: ml-ioh: check the return value of irq_alloc_generic_chip()
Date: Thu, 25 May 2017 10:37:38 +0200
Message-ID: <1495701458-12444-4-git-send-email-brgl@bgdev.pl>
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
 drivers/gpio/gpio-ml-ioh.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 78896a8..74fdce0 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -385,14 +385,18 @@ static irqreturn_t ioh_gpio_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static void ioh_gpio_alloc_generic_chip(struct ioh_gpio *chip,
-				unsigned int irq_start, unsigned int num)
+static int ioh_gpio_alloc_generic_chip(struct ioh_gpio *chip,
+				       unsigned int irq_start,
+				       unsigned int num)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
 
 	gc = irq_alloc_generic_chip("ioh_gpio", 1, irq_start, chip->base,
 				    handle_simple_irq);
+	if (!gc)
+		return -ENOMEM;
+
 	gc->private = chip;
 	ct = gc->chip_types;
 
@@ -404,6 +408,8 @@ static void ioh_gpio_alloc_generic_chip(struct ioh_gpio *chip,
 
 	irq_setup_generic_chip(gc, IRQ_MSK(num), IRQ_GC_INIT_MASK_CACHE,
 			       IRQ_NOREQUEST | IRQ_NOPROBE, 0);
+
+	return 0;
 }
 
 static int ioh_gpio_probe(struct pci_dev *pdev,
@@ -468,7 +474,11 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 			goto err_gpiochip_add;
 		}
 		chip->irq_base = irq_base;
-		ioh_gpio_alloc_generic_chip(chip, irq_base, num_ports[j]);
+
+		ret = ioh_gpio_alloc_generic_chip(chip,
+						  irq_base, num_ports[j]);
+		if (ret)
+			goto err_gpiochip_add;
 	}
 
 	chip = chip_save;
-- 
2.9.3
