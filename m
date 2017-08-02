From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 3/6] gpio: pch: use devres for irq generic chip
Date: Wed,  2 Aug 2017 09:51:23 +0200
Message-ID: <20170802075126.17637-4-brgl@bgdev.pl>
References: <20170802075126.17637-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170802075126.17637-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Use resource managed variants of irq_alloc_generic_chip() and
irq_setup_generic_chip().

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-pch.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index f6600f8ada52..68c6d0c5a6d1 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -337,9 +337,10 @@ static int pch_gpio_alloc_generic_chip(struct pch_gpio *chip,
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
+	int rv;
 
-	gc = irq_alloc_generic_chip("pch_gpio", 1, irq_start, chip->base,
-				    handle_simple_irq);
+	gc = devm_irq_alloc_generic_chip(chip->dev, "pch_gpio", 1, irq_start,
+					 chip->base, handle_simple_irq);
 	if (!gc)
 		return -ENOMEM;
 
@@ -351,10 +352,11 @@ static int pch_gpio_alloc_generic_chip(struct pch_gpio *chip,
 	ct->chip.irq_unmask = pch_irq_unmask;
 	ct->chip.irq_set_type = pch_irq_type;
 
-	irq_setup_generic_chip(gc, IRQ_MSK(num), IRQ_GC_INIT_MASK_CACHE,
-			       IRQ_NOREQUEST | IRQ_NOPROBE, 0);
+	rv = devm_irq_setup_generic_chip(chip->dev, gc, IRQ_MSK(num),
+					 IRQ_GC_INIT_MASK_CACHE,
+					 IRQ_NOREQUEST | IRQ_NOPROBE, 0);
 
-	return 0;
+	return rv;
 }
 
 static int pch_gpio_probe(struct pci_dev *pdev,
-- 
2.13.2
