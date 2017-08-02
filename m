From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/6] gpio: sta2x11: use devres for irq generic chip
Date: Wed,  2 Aug 2017 09:51:21 +0200
Message-ID: <20170802075126.17637-2-brgl@bgdev.pl>
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
 drivers/gpio/gpio-sta2x11.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
index 9e705162da8d..a16c1c4f92a7 100644
--- a/drivers/gpio/gpio-sta2x11.c
+++ b/drivers/gpio/gpio-sta2x11.c
@@ -324,9 +324,11 @@ static int gsta_alloc_irq_chip(struct gsta_gpio *chip)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
+	int rv;
 
-	gc = irq_alloc_generic_chip(KBUILD_MODNAME, 1, chip->irq_base,
-				     chip->reg_base, handle_simple_irq);
+	gc = devm_irq_alloc_generic_chip(chip->dev, KBUILD_MODNAME, 1,
+					 chip->irq_base,
+					 chip->reg_base, handle_simple_irq);
 	if (!gc)
 		return -ENOMEM;
 
@@ -338,8 +340,11 @@ static int gsta_alloc_irq_chip(struct gsta_gpio *chip)
 	ct->chip.irq_enable = gsta_irq_enable;
 
 	/* FIXME: this makes at most 32 interrupts. Request 0 by now */
-	irq_setup_generic_chip(gc, 0 /* IRQ_MSK(GSTA_GPIO_PER_BLOCK) */, 0,
-			       IRQ_NOREQUEST | IRQ_NOPROBE, 0);
+	rv = devm_irq_setup_generic_chip(chip->dev, gc,
+					 0 /* IRQ_MSK(GSTA_GPIO_PER_BLOCK) */,
+					 0, IRQ_NOREQUEST | IRQ_NOPROBE, 0);
+	if (rv)
+		return rv;
 
 	/* Set up all all 128 interrupts: code from setup_generic_chip */
 	{
-- 
2.13.2
