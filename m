From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/5] pinctrl: nomadik: break out state container allocator
Date: Thu, 23 Jul 2015 09:09:17 +0200
Message-ID: <1437635357-23323-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:35508 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbbGWHJ0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2015 03:09:26 -0400
Received: by lblf12 with SMTP id f12so151299151lbl.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2015 00:09:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Break out the function that allocates the nomadik GPIO chip state
container to its own function.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 106 ++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 809d88445db5..c5b8c89dbe1a 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -203,6 +203,7 @@ typedef unsigned long pin_cfg_t;
 
 #define GPIO_BLOCK_SHIFT 5
 #define NMK_GPIO_PER_CHIP (1 << GPIO_BLOCK_SHIFT)
+#define NMK_MAX_BANKS DIV_ROUND_UP(ARCH_NR_GPIOS, NMK_GPIO_PER_CHIP)
 
 /* Register in the logic block */
 #define NMK_GPIO_DAT	0x00
@@ -282,8 +283,7 @@ struct nmk_pinctrl {
 	void __iomem *prcm_base;
 };
 
-static struct nmk_gpio_chip *
-nmk_gpio_chips[DIV_ROUND_UP(ARCH_NR_GPIOS, NMK_GPIO_PER_CHIP)];
+static struct nmk_gpio_chip *nmk_gpio_chips[NMK_MAX_BANKS];
 
 static DEFINE_SPINLOCK(nmk_gpio_slpm_lock);
 
@@ -1162,29 +1162,90 @@ void nmk_gpio_read_pull(int gpio_bank, u32 *pull_up)
 	}
 }
 
+/*
+ * We will allocate memory for the state container using devm* allocators
+ * binding to the first device reaching this point, it doesn't matter if
+ * it is the pin controller or GPIO driver. However we need to use the right
+ * platform device when looking up resources so pay attention to pdev.
+ */
+static struct nmk_gpio_chip *nmk_gpio_populate_chip(struct device_node *np,
+						struct platform_device *pdev)
+{
+	struct nmk_gpio_chip *nmk_chip;
+	struct platform_device *gpio_pdev;
+	struct gpio_chip *chip;
+	struct resource *res;
+	struct clk *clk;
+	void __iomem *base;
+	u32 id;
+
+	gpio_pdev = of_find_device_by_node(np);
+	if (!gpio_pdev) {
+		pr_err("populate \"%s\": device not found\n", np->name);
+		return ERR_PTR(-ENODEV);
+	}
+	if (of_property_read_u32(np, "gpio-bank", &id)) {
+		dev_err(&pdev->dev, "populate: gpio-bank property not found\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	/* Already populated? */
+	nmk_chip = nmk_gpio_chips[id];
+	if (nmk_chip)
+		return nmk_chip;
+
+	nmk_chip = devm_kzalloc(&pdev->dev, sizeof(*nmk_chip), GFP_KERNEL);
+	if (!nmk_chip)
+		return ERR_PTR(-ENOMEM);
+
+	nmk_chip->bank = id;
+	chip = &nmk_chip->chip;
+	chip->base = id * NMK_GPIO_PER_CHIP;
+	chip->ngpio = NMK_GPIO_PER_CHIP;
+	chip->label = dev_name(&gpio_pdev->dev);
+	chip->dev = &gpio_pdev->dev;
+
+	res = platform_get_resource(gpio_pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return base;
+	nmk_chip->addr = base;
+
+	clk = clk_get(&gpio_pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return (void *) clk;
+	clk_prepare(clk);
+	nmk_chip->clk = clk;
+
+	BUG_ON(nmk_chip->bank >= ARRAY_SIZE(nmk_gpio_chips));
+	nmk_gpio_chips[id] = nmk_chip;
+	return nmk_chip;
+}
+
 static int nmk_gpio_probe(struct platform_device *dev)
 {
 	struct device_node *np = dev->dev.of_node;
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_chip *chip;
 	struct irq_chip *irqchip;
-	struct resource *res;
-	struct clk *clk;
 	int latent_irq;
 	bool supports_sleepmode;
-	void __iomem *base;
 	int irq;
 	int ret;
 
+	nmk_chip = nmk_gpio_populate_chip(np, dev);
+	if (IS_ERR(nmk_chip)) {
+		dev_err(&dev->dev, "could not populate nmk chip struct\n");
+		return PTR_ERR(nmk_chip);
+	}
+
 	if (of_get_property(np, "st,supports-sleepmode", NULL))
 		supports_sleepmode = true;
 	else
 		supports_sleepmode = false;
 
-	if (of_property_read_u32(np, "gpio-bank", &dev->id)) {
-		dev_err(&dev->dev, "gpio-bank property not found\n");
-		return -EINVAL;
-	}
+	/* Correct platform device ID */
+	dev->id = nmk_chip->bank;
 
 	irq = platform_get_irq(dev, 0);
 	if (irq < 0)
@@ -1193,27 +1254,10 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	/* It's OK for this IRQ not to be present */
 	latent_irq = platform_get_irq(dev, 1);
 
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&dev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk = devm_clk_get(&dev->dev, NULL);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-	clk_prepare(clk);
-
-	nmk_chip = devm_kzalloc(&dev->dev, sizeof(*nmk_chip), GFP_KERNEL);
-	if (!nmk_chip)
-		return -ENOMEM;
-
 	/*
 	 * The virt address in nmk_chip->addr is in the nomadik register space,
 	 * so we can simply convert the resource address, without remapping
 	 */
-	nmk_chip->bank = dev->id;
-	nmk_chip->clk = clk;
-	nmk_chip->addr = base;
 	nmk_chip->parent_irq = irq;
 	nmk_chip->latent_parent_irq = latent_irq;
 	nmk_chip->sleepmode = supports_sleepmode;
@@ -1228,10 +1272,6 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	chip->set = nmk_gpio_set_output;
 	chip->dbg_show = nmk_gpio_dbg_show;
 	chip->can_sleep = false;
-	chip->base = dev->id * NMK_GPIO_PER_CHIP;
-	chip->ngpio = NMK_GPIO_PER_CHIP;
-	chip->label = dev_name(&dev->dev);
-	chip->dev = &dev->dev;
 	chip->owner = THIS_MODULE;
 
 	irqchip = &nmk_chip->irqchip;
@@ -1253,14 +1293,10 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	clk_disable(nmk_chip->clk);
 	chip->of_node = np;
 
-	ret = gpiochip_add(&nmk_chip->chip);
+	ret = gpiochip_add(chip);
 	if (ret)
 		return ret;
 
-	BUG_ON(nmk_chip->bank >= ARRAY_SIZE(nmk_gpio_chips));
-
-	nmk_gpio_chips[nmk_chip->bank] = nmk_chip;
-
 	platform_set_drvdata(dev, nmk_chip);
 
 	/*
-- 
2.4.3

