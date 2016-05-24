From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/3] gpio: max77620: Configure interrupt trigger level
Date: Tue, 24 May 2016 18:43:44 +0530
Message-ID: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nat-hk.nvidia.com ([203.18.50.4]:65476 "EHLO
	hkmmgate101.nvidia.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752043AbcEXN0F (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 09:26:05 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>

The GPIO sub modules of MAX77620 offers to configure the GPIO
interrupt trigger level as RISING and FALLING edge.

Pass this information to regmap-irg when registering for GPIO
interrupts.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 67 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index d927562..35f365c 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -27,14 +27,62 @@ struct max77620_gpio {
 };
 
 static const struct regmap_irq max77620_gpio_irqs[] = {
-	REGMAP_IRQ_REG(0, 0, MAX77620_IRQ_LVL2_GPIO_EDGE0),
-	REGMAP_IRQ_REG(1, 0, MAX77620_IRQ_LVL2_GPIO_EDGE1),
-	REGMAP_IRQ_REG(2, 0, MAX77620_IRQ_LVL2_GPIO_EDGE2),
-	REGMAP_IRQ_REG(3, 0, MAX77620_IRQ_LVL2_GPIO_EDGE3),
-	REGMAP_IRQ_REG(4, 0, MAX77620_IRQ_LVL2_GPIO_EDGE4),
-	REGMAP_IRQ_REG(5, 0, MAX77620_IRQ_LVL2_GPIO_EDGE5),
-	REGMAP_IRQ_REG(6, 0, MAX77620_IRQ_LVL2_GPIO_EDGE6),
-	REGMAP_IRQ_REG(7, 0, MAX77620_IRQ_LVL2_GPIO_EDGE7),
+	[0] = {
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE0,
+		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
+		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
+		.reg_offset = 0,
+		.type_reg_offset = 0,
+	},
+	[1] = {
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE1,
+		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
+		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
+		.reg_offset = 0,
+		.type_reg_offset = 1,
+	},
+	[2] = {
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE2,
+		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
+		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
+		.reg_offset = 0,
+		.type_reg_offset = 2,
+	},
+	[3] = {
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE3,
+		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
+		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
+		.reg_offset = 0,
+		.type_reg_offset = 3,
+	},
+	[4] = {
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE4,
+		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
+		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
+		.reg_offset = 0,
+		.type_reg_offset = 4,
+	},
+	[5] = {
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE5,
+		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
+		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
+		.reg_offset = 0,
+		.type_reg_offset = 5,
+	},
+	[6] = {
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE6,
+		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
+		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
+		.reg_offset = 0,
+		.type_reg_offset = 6,
+	},
+	[7] = {
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE7,
+		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
+		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
+		.reg_offset = 0,
+		.type_reg_offset = 7,
+	},
 };
 
 static struct regmap_irq_chip max77620_gpio_irq_chip = {
@@ -42,8 +90,11 @@ static struct regmap_irq_chip max77620_gpio_irq_chip = {
 	.irqs = max77620_gpio_irqs,
 	.num_irqs = ARRAY_SIZE(max77620_gpio_irqs),
 	.num_regs = 1,
+	.num_type_reg = 8,
 	.irq_reg_stride = 1,
+	.type_reg_stride = 1,
 	.status_base = MAX77620_REG_IRQ_LVL2_GPIO,
+	.type_base = MAX77620_REG_GPIO0,
 };
 
 static int max77620_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
-- 
2.1.4

