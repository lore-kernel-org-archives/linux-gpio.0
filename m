From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH RESEND 3/4] Pinctrl: Ingenic: Unify the function name prefix to "ingenic_gpio_".
Date: Fri, 25 Jan 2019 17:59:52 +0800
Message-ID: <1548410393-6981-4-git-send-email-zhouyanjie@zoho.com>
References: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, paul.burton@mips.com, paul@crapouillou.net, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: linux-gpio@vger.kernel.org

In the original code, some function names begin with "ingenic_gpio_",
and some with "gpio_ingenic_". For the sake of uniform style,
all of them are changed to the beginning of "ingenic_gpio_".

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 46 +++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6501f35..2b3f7e4 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -715,7 +715,7 @@ static const struct ingenic_chip_info jz4780_chip_info = {
 	.pull_downs = jz4770_pull_downs,
 };
 
-static u32 gpio_ingenic_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
+static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
 {
 	unsigned int val;
 
@@ -724,7 +724,7 @@ static u32 gpio_ingenic_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
 	return (u32) val;
 }
 
-static void gpio_ingenic_set_bit(struct ingenic_gpio_chip *jzgc,
+static void ingenic_gpio_set_bit(struct ingenic_gpio_chip *jzgc,
 		u8 reg, u8 offset, bool set)
 {
 	if (set)
@@ -738,7 +738,7 @@ static void gpio_ingenic_set_bit(struct ingenic_gpio_chip *jzgc,
 static inline bool ingenic_gpio_get_value(struct ingenic_gpio_chip *jzgc,
 					  u8 offset)
 {
-	unsigned int val = gpio_ingenic_read_reg(jzgc, GPIO_PIN);
+	unsigned int val = ingenic_gpio_read_reg(jzgc, GPIO_PIN);
 
 	return !!(val & BIT(offset));
 }
@@ -747,9 +747,9 @@ static void ingenic_gpio_set_value(struct ingenic_gpio_chip *jzgc,
 				   u8 offset, int value)
 {
 	if (jzgc->jzpc->version >= ID_JZ4770)
-		gpio_ingenic_set_bit(jzgc, JZ4770_GPIO_PAT0, offset, !!value);
+		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_PAT0, offset, !!value);
 	else
-		gpio_ingenic_set_bit(jzgc, JZ4740_GPIO_DATA, offset, !!value);
+		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, offset, !!value);
 }
 
 static void irq_set_type(struct ingenic_gpio_chip *jzgc,
@@ -767,21 +767,21 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		gpio_ingenic_set_bit(jzgc, reg2, offset, true);
-		gpio_ingenic_set_bit(jzgc, reg1, offset, true);
+		ingenic_gpio_set_bit(jzgc, reg2, offset, true);
+		ingenic_gpio_set_bit(jzgc, reg1, offset, true);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		gpio_ingenic_set_bit(jzgc, reg2, offset, false);
-		gpio_ingenic_set_bit(jzgc, reg1, offset, true);
+		ingenic_gpio_set_bit(jzgc, reg2, offset, false);
+		ingenic_gpio_set_bit(jzgc, reg1, offset, true);
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		gpio_ingenic_set_bit(jzgc, reg2, offset, true);
-		gpio_ingenic_set_bit(jzgc, reg1, offset, false);
+		ingenic_gpio_set_bit(jzgc, reg2, offset, true);
+		ingenic_gpio_set_bit(jzgc, reg1, offset, false);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 	default:
-		gpio_ingenic_set_bit(jzgc, reg2, offset, false);
-		gpio_ingenic_set_bit(jzgc, reg1, offset, false);
+		ingenic_gpio_set_bit(jzgc, reg2, offset, false);
+		ingenic_gpio_set_bit(jzgc, reg1, offset, false);
 		break;
 	}
 }
@@ -791,7 +791,7 @@ static void ingenic_gpio_irq_mask(struct irq_data *irqd)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
 
-	gpio_ingenic_set_bit(jzgc, GPIO_MSK, irqd->hwirq, true);
+	ingenic_gpio_set_bit(jzgc, GPIO_MSK, irqd->hwirq, true);
 }
 
 static void ingenic_gpio_irq_unmask(struct irq_data *irqd)
@@ -799,7 +799,7 @@ static void ingenic_gpio_irq_unmask(struct irq_data *irqd)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
 
-	gpio_ingenic_set_bit(jzgc, GPIO_MSK, irqd->hwirq, false);
+	ingenic_gpio_set_bit(jzgc, GPIO_MSK, irqd->hwirq, false);
 }
 
 static void ingenic_gpio_irq_enable(struct irq_data *irqd)
@@ -809,9 +809,9 @@ static void ingenic_gpio_irq_enable(struct irq_data *irqd)
 	int irq = irqd->hwirq;
 
 	if (jzgc->jzpc->version >= ID_JZ4770)
-		gpio_ingenic_set_bit(jzgc, JZ4770_GPIO_INT, irq, true);
+		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, true);
 	else
-		gpio_ingenic_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, true);
+		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, true);
 
 	ingenic_gpio_irq_unmask(irqd);
 }
@@ -825,9 +825,9 @@ static void ingenic_gpio_irq_disable(struct irq_data *irqd)
 	ingenic_gpio_irq_mask(irqd);
 
 	if (jzgc->jzpc->version >= ID_JZ4770)
-		gpio_ingenic_set_bit(jzgc, JZ4770_GPIO_INT, irq, false);
+		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, false);
 	else
-		gpio_ingenic_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, false);
+		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, false);
 }
 
 static void ingenic_gpio_irq_ack(struct irq_data *irqd)
@@ -850,9 +850,9 @@ static void ingenic_gpio_irq_ack(struct irq_data *irqd)
 	}
 
 	if (jzgc->jzpc->version >= ID_JZ4770)
-		gpio_ingenic_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
+		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
 	else
-		gpio_ingenic_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
+		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
 }
 
 static int ingenic_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
@@ -907,9 +907,9 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(irq_chip, desc);
 
 	if (jzgc->jzpc->version >= ID_JZ4770)
-		flag = gpio_ingenic_read_reg(jzgc, JZ4770_GPIO_FLAG);
+		flag = ingenic_gpio_read_reg(jzgc, JZ4770_GPIO_FLAG);
 	else
-		flag = gpio_ingenic_read_reg(jzgc, JZ4740_GPIO_FLAG);
+		flag = ingenic_gpio_read_reg(jzgc, JZ4740_GPIO_FLAG);
 
 	for_each_set_bit(i, &flag, 32)
 		generic_handle_irq(irq_linear_revmap(gc->irq.domain, i));
-- 
2.7.4
