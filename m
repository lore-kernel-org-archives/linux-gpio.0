From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 6/6] gpio: sodaville: use devres for irq generic chip
Date: Wed,  2 Aug 2017 09:51:26 +0200
Message-ID: <20170802075126.17637-7-brgl@bgdev.pl>
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
 drivers/gpio/gpio-sodaville.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index f60da83349ef..20a39f5ac361 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -155,8 +155,9 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 	 * we unmask & ACK the IRQ before the source of the interrupt is gone
 	 * then the interrupt is active again.
 	 */
-	sd->gc = irq_alloc_generic_chip("sdv-gpio", 1, sd->irq_base,
-			sd->gpio_pub_base, handle_fasteoi_irq);
+	sd->gc = devm_irq_alloc_generic_chip(&pdev->dev, "sdv-gpio", 1,
+					     sd->irq_base, sd->gpio_pub_base,
+					     handle_fasteoi_irq);
 	if (!sd->gc)
 		return -ENOMEM;
 
@@ -170,9 +171,13 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 	ct->chip.irq_eoi = irq_gc_eoi;
 	ct->chip.irq_set_type = sdv_gpio_pub_set_type;
 
-	irq_setup_generic_chip(sd->gc, IRQ_MSK(SDV_NUM_PUB_GPIOS),
-			IRQ_GC_INIT_MASK_CACHE, IRQ_NOREQUEST,
-			IRQ_LEVEL | IRQ_NOPROBE);
+	ret = devm_irq_setup_generic_chip(&pdev->dev, sd->gc,
+					  IRQ_MSK(SDV_NUM_PUB_GPIOS),
+					  IRQ_GC_INIT_MASK_CACHE,
+					  IRQ_NOREQUEST,
+					  IRQ_LEVEL | IRQ_NOPROBE);
+	if (ret)
+		return ret;
 
 	sd->id = irq_domain_add_legacy(pdev->dev.of_node, SDV_NUM_PUB_GPIOS,
 				sd->irq_base, 0, &irq_domain_sdv_ops, sd);
-- 
2.13.2
