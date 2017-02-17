From: Daniel Gonzalez Cabanelas <dgcbueu@gmail.com>
Subject: [PATCH 1/2] gpio: ath79: Drop lock field from struct ath79_gpio_ctrl
Date: Fri, 17 Feb 2017 16:07:34 +0100
Message-ID: <5065304.0NhvqMbk9v@tool>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36258 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934206AbdBQPHn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Feb 2017 10:07:43 -0500
Received: by mail-wm0-f65.google.com with SMTP id r18so3044010wmd.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Feb 2017 07:07:42 -0800 (PST)
Received: from tool.localnet ([188.86.75.31])
        by smtp.googlemail.com with ESMTPSA id q4sm13311528wrc.35.2017.02.17.07.07.35
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2017 07:07:35 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

bgpio_init() already initialized a spin lock, use it and drop the 
lock field defined in ath79_gpio_ctrl

Signed-off-by: Daniel Gonzalez Cabanelas <dgcbueu@gmail.com>
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index dc37dbe..5a189b4 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -32,7 +32,6 @@
 struct ath79_gpio_ctrl {
 	struct gpio_chip gc;
 	void __iomem *base;
-	spinlock_t lock;
 	unsigned long both_edges;
 };
 
@@ -74,9 +73,9 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	spin_lock_irqsave(&ctrl->gc.bgpio_lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	spin_unlock_irqrestore(&ctrl->gc.bgpio_lock, flags);
 }
 
 static void ath79_gpio_irq_mask(struct irq_data *data)
@@ -85,9 +84,9 @@ static void ath79_gpio_irq_mask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	spin_lock_irqsave(&ctrl->gc.bgpio_lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	spin_unlock_irqrestore(&ctrl->gc.bgpio_lock, flags);
 }
 
 static void ath79_gpio_irq_enable(struct irq_data *data)
@@ -96,10 +95,10 @@ static void ath79_gpio_irq_enable(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	spin_lock_irqsave(&ctrl->gc.bgpio_lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	spin_unlock_irqrestore(&ctrl->gc.bgpio_lock, flags);
 }
 
 static void ath79_gpio_irq_disable(struct irq_data *data)
@@ -108,10 +107,10 @@ static void ath79_gpio_irq_disable(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	spin_lock_irqsave(&ctrl->gc.bgpio_lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, 0);
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	spin_unlock_irqrestore(&ctrl->gc.bgpio_lock, flags);
 }
 
 static int ath79_gpio_irq_set_type(struct irq_data *data,
@@ -140,7 +139,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	spin_lock_irqsave(&ctrl->gc.bgpio_lock, flags);
 
 	if (flow_type == IRQ_TYPE_EDGE_BOTH) {
 		ctrl->both_edges |= mask;
@@ -165,7 +164,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		ath79_gpio_update_bits(
 			ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	spin_unlock_irqrestore(&ctrl->gc.bgpio_lock, flags);
 
 	return 0;
 }
@@ -191,7 +190,7 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(irqchip, desc);
 
-	spin_lock_irqsave(&ctrl->lock, flags);
+	spin_lock_irqsave(&ctrl->gc.bgpio_lock, flags);
 
 	pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
 
@@ -203,7 +202,7 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 				both_edges, ~state);
 	}
 
-	spin_unlock_irqrestore(&ctrl->lock, flags);
+	spin_unlock_irqrestore(&ctrl->gc.bgpio_lock, flags);
 
 	if (pending) {
 		for_each_set_bit(irq, &pending, gc->ngpio)
@@ -262,7 +261,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	if (!ctrl->base)
 		return -ENOMEM;
 
-	spin_lock_init(&ctrl->lock);
 	err = bgpio_init(&ctrl->gc, &pdev->dev, 4,
 			ctrl->base + AR71XX_GPIO_REG_IN,
 			ctrl->base + AR71XX_GPIO_REG_SET,

