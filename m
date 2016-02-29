From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: amdpt: Convert to use gpio-generic
Date: Mon, 29 Feb 2016 22:00:01 +0800
Message-ID: <1456754401.25756.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:33501 "EHLO
	mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672AbcB2OAG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Feb 2016 09:00:06 -0500
Received: by mail-pf0-f179.google.com with SMTP id 124so31282671pfg.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Feb 2016 06:00:05 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: YD Tseng <ltyu101@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Use gpio-generic to simplify this driver.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi YD,
I don't have this h/w for test.
I'd appreciate if you can help to review and test this patch.
Thanks.
 drivers/gpio/Kconfig      |   1 +
 drivers/gpio/gpio-amdpt.c | 122 ++++++----------------------------------------
 2 files changed, 15 insertions(+), 108 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1118fef..32188f6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -122,6 +122,7 @@ config GPIO_ALTERA
 config GPIO_AMDPT
 	tristate "AMD Promontory GPIO support"
 	depends on ACPI
+	select GPIO_GENERIC
 	help
 	  driver for GPIO functionality on Promontory IOHub
 	  Require ACPI ASL code to enumerate as a platform device.
diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index c248404..569b424 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -28,7 +28,6 @@
 struct pt_gpio_chip {
 	struct gpio_chip         gc;
 	void __iomem             *reg_base;
-	spinlock_t               lock;
 };
 
 static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
@@ -39,19 +38,19 @@ static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
 
 	dev_dbg(gc->parent, "pt_gpio_request offset=%x\n", offset);
 
-	spin_lock_irqsave(&pt_gpio->lock, flags);
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
 	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
 	if (using_pins & BIT(offset)) {
 		dev_warn(gc->parent, "PT GPIO pin %x reconfigured\n",
 			 offset);
-		spin_unlock_irqrestore(&pt_gpio->lock, flags);
+		spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 		return -EINVAL;
 	}
 
 	writel(using_pins | BIT(offset), pt_gpio->reg_base + PT_SYNC_REG);
 
-	spin_unlock_irqrestore(&pt_gpio->lock, flags);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	return 0;
 }
@@ -62,111 +61,17 @@ static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
 	unsigned long flags;
 	u32 using_pins;
 
-	spin_lock_irqsave(&pt_gpio->lock, flags);
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
 	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
 	using_pins &= ~BIT(offset);
 	writel(using_pins, pt_gpio->reg_base + PT_SYNC_REG);
 
-	spin_unlock_irqrestore(&pt_gpio->lock, flags);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	dev_dbg(gc->parent, "pt_gpio_free offset=%x\n", offset);
 }
 
-static void pt_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
-{
-	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
-	u32 data;
-
-	dev_dbg(gc->parent, "pt_gpio_set_value offset=%x, value=%x\n",
-		offset, value);
-
-	spin_lock_irqsave(&pt_gpio->lock, flags);
-
-	data = readl(pt_gpio->reg_base + PT_OUTPUTDATA_REG);
-	data &= ~BIT(offset);
-	if (value)
-		data |= BIT(offset);
-	writel(data, pt_gpio->reg_base + PT_OUTPUTDATA_REG);
-
-	spin_unlock_irqrestore(&pt_gpio->lock, flags);
-}
-
-static int pt_gpio_get_value(struct gpio_chip *gc, unsigned offset)
-{
-	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
-	u32 data;
-
-	spin_lock_irqsave(&pt_gpio->lock, flags);
-
-	data = readl(pt_gpio->reg_base + PT_DIRECTION_REG);
-
-	/* configure as output */
-	if (data & BIT(offset))
-		data = readl(pt_gpio->reg_base + PT_OUTPUTDATA_REG);
-	else	/* configure as input */
-		data = readl(pt_gpio->reg_base + PT_INPUTDATA_REG);
-
-	spin_unlock_irqrestore(&pt_gpio->lock, flags);
-
-	data >>= offset;
-	data &= 1;
-
-	dev_dbg(gc->parent, "pt_gpio_get_value offset=%x, value=%x\n",
-		offset, data);
-
-	return data;
-}
-
-static int pt_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
-{
-	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
-	u32 data;
-
-	dev_dbg(gc->parent, "pt_gpio_dirction_input offset=%x\n", offset);
-
-	spin_lock_irqsave(&pt_gpio->lock, flags);
-
-	data = readl(pt_gpio->reg_base + PT_DIRECTION_REG);
-	data &= ~BIT(offset);
-	writel(data, pt_gpio->reg_base + PT_DIRECTION_REG);
-
-	spin_unlock_irqrestore(&pt_gpio->lock, flags);
-
-	return 0;
-}
-
-static int pt_gpio_direction_output(struct gpio_chip *gc,
-					unsigned offset, int value)
-{
-	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
-	u32 data;
-
-	dev_dbg(gc->parent, "pt_gpio_direction_output offset=%x, value=%x\n",
-		offset, value);
-
-	spin_lock_irqsave(&pt_gpio->lock, flags);
-
-	data = readl(pt_gpio->reg_base + PT_OUTPUTDATA_REG);
-	if (value)
-		data |= BIT(offset);
-	else
-		data &= ~BIT(offset);
-	writel(data, pt_gpio->reg_base + PT_OUTPUTDATA_REG);
-
-	data = readl(pt_gpio->reg_base + PT_DIRECTION_REG);
-	data |= BIT(offset);
-	writel(data, pt_gpio->reg_base + PT_DIRECTION_REG);
-
-	spin_unlock_irqrestore(&pt_gpio->lock, flags);
-
-	return 0;
-}
-
 static int pt_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -196,18 +101,19 @@ static int pt_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(pt_gpio->reg_base);
 	}
 
-	spin_lock_init(&pt_gpio->lock);
+	ret = bgpio_init(&pt_gpio->gc, dev, 4,
+			 pt_gpio->reg_base + PT_INPUTDATA_REG,
+			 pt_gpio->reg_base + PT_OUTPUTDATA_REG, NULL,
+			 pt_gpio->reg_base + PT_DIRECTION_REG, NULL,
+			 BGPIOF_READ_OUTPUT_REG_SET);
+	if (ret) {
+		dev_err(&pdev->dev, "bgpio_init failed\n");
+		return ret;
+	}
 
-	pt_gpio->gc.label            = pdev->name;
 	pt_gpio->gc.owner            = THIS_MODULE;
-	pt_gpio->gc.parent              = dev;
 	pt_gpio->gc.request          = pt_gpio_request;
 	pt_gpio->gc.free             = pt_gpio_free;
-	pt_gpio->gc.direction_input  = pt_gpio_direction_input;
-	pt_gpio->gc.direction_output = pt_gpio_direction_output;
-	pt_gpio->gc.get              = pt_gpio_get_value;
-	pt_gpio->gc.set              = pt_gpio_set_value;
-	pt_gpio->gc.base             = -1;
 	pt_gpio->gc.ngpio            = PT_TOTAL_GPIO;
 #if defined(CONFIG_OF_GPIO)
 	pt_gpio->gc.of_node          = pdev->dev.of_node;
-- 
2.1.4



