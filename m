From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/3] gpio: pch: check the return value of irq_alloc_generic_chip()
Date: Thu, 25 May 2017 10:37:36 +0200
Message-ID: <1495701458-12444-2-git-send-email-brgl@bgdev.pl>
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
 drivers/gpio/gpio-pch.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 71bc6da..f6600f8 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -331,14 +331,18 @@ static irqreturn_t pch_gpio_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static void pch_gpio_alloc_generic_chip(struct pch_gpio *chip,
-				unsigned int irq_start, unsigned int num)
+static int pch_gpio_alloc_generic_chip(struct pch_gpio *chip,
+				       unsigned int irq_start,
+				       unsigned int num)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
 
 	gc = irq_alloc_generic_chip("pch_gpio", 1, irq_start, chip->base,
 				    handle_simple_irq);
+	if (!gc)
+		return -ENOMEM;
+
 	gc->private = chip;
 	ct = gc->chip_types;
 
@@ -349,6 +353,8 @@ static void pch_gpio_alloc_generic_chip(struct pch_gpio *chip,
 
 	irq_setup_generic_chip(gc, IRQ_MSK(num), IRQ_GC_INIT_MASK_CACHE,
 			       IRQ_NOREQUEST | IRQ_NOPROBE, 0);
+
+	return 0;
 }
 
 static int pch_gpio_probe(struct pci_dev *pdev,
@@ -425,7 +431,10 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 		goto err_request_irq;
 	}
 
-	pch_gpio_alloc_generic_chip(chip, irq_base, gpio_pins[chip->ioh]);
+	ret = pch_gpio_alloc_generic_chip(chip, irq_base,
+					  gpio_pins[chip->ioh]);
+	if (ret)
+		goto err_request_irq;
 
 end:
 	return 0;
-- 
2.9.3
