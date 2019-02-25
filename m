From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.19 004/152] gpio: MT7621: use a per instance irq_chip structure
Date: Mon, 25 Feb 2019 22:09:56 +0100
Message-ID: <20190225195043.950408230@linuxfoundation.org>
References: <20190225195043.645958524@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225195043.645958524@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Greg Ungerer <gerg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

4.19-stable review patch.  If anyone has any objections, please let me know.

------------------

From: René van Dorst <opensource@vdorst.com>

commit fa84667b98fd1a191b2465d66b440bda6714b3bf upstream.

This fixes the kernel complains:
gpio gpiochip1: (1e000600.gpio-bank1): detected irqchip that is shared
	    with multiple gpiochips: please fix the driver.
gpio gpiochip2: (1e000600.gpio-bank2): detected irqchip that is shared
	    with multiple gpiochips: please fix the driver.

Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
Cc: stable@vger.kernel.org
Signed-off-by: René van Dorst <opensource@vdorst.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Tested-by: Greg Ungerer <gerg@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpio/gpio-mt7621.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -30,6 +30,7 @@
 #define GPIO_REG_EDGE		0xA0
 
 struct mtk_gc {
+	struct irq_chip irq_chip;
 	struct gpio_chip chip;
 	spinlock_t lock;
 	int bank;
@@ -189,13 +190,6 @@ mediatek_gpio_irq_type(struct irq_data *
 	return 0;
 }
 
-static struct irq_chip mediatek_gpio_irq_chip = {
-	.irq_unmask		= mediatek_gpio_irq_unmask,
-	.irq_mask		= mediatek_gpio_irq_mask,
-	.irq_mask_ack		= mediatek_gpio_irq_mask,
-	.irq_set_type		= mediatek_gpio_irq_type,
-};
-
 static int
 mediatek_gpio_xlate(struct gpio_chip *chip,
 		    const struct of_phandle_args *spec, u32 *flags)
@@ -254,6 +248,13 @@ mediatek_gpio_bank_probe(struct device *
 		return ret;
 	}
 
+	rg->irq_chip.name = dev_name(dev);
+	rg->irq_chip.parent_device = dev;
+	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
+	rg->irq_chip.irq_mask = mediatek_gpio_irq_mask;
+	rg->irq_chip.irq_mask_ack = mediatek_gpio_irq_mask;
+	rg->irq_chip.irq_set_type = mediatek_gpio_irq_type;
+
 	if (mtk->gpio_irq) {
 		/*
 		 * Manually request the irq here instead of passing
@@ -270,14 +271,14 @@ mediatek_gpio_bank_probe(struct device *
 			return ret;
 		}
 
-		ret = gpiochip_irqchip_add(&rg->chip, &mediatek_gpio_irq_chip,
+		ret = gpiochip_irqchip_add(&rg->chip, &rg->irq_chip,
 					   0, handle_simple_irq, IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(dev, "failed to add gpiochip_irqchip\n");
 			return ret;
 		}
 
-		gpiochip_set_chained_irqchip(&rg->chip, &mediatek_gpio_irq_chip,
+		gpiochip_set_chained_irqchip(&rg->chip, &rg->irq_chip,
 					     mtk->gpio_irq, NULL);
 	}
 
@@ -310,7 +311,6 @@ mediatek_gpio_probe(struct platform_devi
 	mtk->gpio_irq = irq_of_parse_and_map(np, 0);
 	mtk->dev = dev;
 	platform_set_drvdata(pdev, mtk);
-	mediatek_gpio_irq_chip.name = dev_name(dev);
 
 	for (i = 0; i < MTK_BANK_CNT; i++) {
 		ret = mediatek_gpio_bank_probe(dev, np, i);
