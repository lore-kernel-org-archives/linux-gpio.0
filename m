From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 5/8] gpio: ml-ioh: use devres for irq generic chip
Date: Wed,  9 Aug 2017 14:25:04 +0200
Message-ID: <20170809122507.11149-6-brgl@bgdev.pl>
References: <20170809122507.11149-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170809122507.11149-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Use resource managed variants of irq_alloc_generic_chip() and
irq_setup_generic_chip().

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-ml-ioh.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 74fdce096c26..4b80e996d976 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -391,9 +391,10 @@ static int ioh_gpio_alloc_generic_chip(struct ioh_gpio *chip,
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
+	int rv;
 
-	gc = irq_alloc_generic_chip("ioh_gpio", 1, irq_start, chip->base,
-				    handle_simple_irq);
+	gc = devm_irq_alloc_generic_chip(chip->dev, "ioh_gpio", 1, irq_start,
+					 chip->base, handle_simple_irq);
 	if (!gc)
 		return -ENOMEM;
 
@@ -406,10 +407,11 @@ static int ioh_gpio_alloc_generic_chip(struct ioh_gpio *chip,
 	ct->chip.irq_disable = ioh_irq_disable;
 	ct->chip.irq_enable = ioh_irq_enable;
 
-	irq_setup_generic_chip(gc, IRQ_MSK(num), IRQ_GC_INIT_MASK_CACHE,
-			       IRQ_NOREQUEST | IRQ_NOPROBE, 0);
+	rv = devm_irq_setup_generic_chip(chip->dev, gc, IRQ_MSK(num),
+					 IRQ_GC_INIT_MASK_CACHE,
+					 IRQ_NOREQUEST | IRQ_NOPROBE, 0);
 
-	return 0;
+	return rv;
 }
 
 static int ioh_gpio_probe(struct pci_dev *pdev,
-- 
2.13.2
