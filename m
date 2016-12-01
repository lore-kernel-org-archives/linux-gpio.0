From: "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Subject: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Thu, 1 Dec 2016 13:43:50 +0530
Message-ID: <4e82b02a-6f9c-1130-1020-32a6f86a5f01@amd.com>
References: <MWHPR12MB1357C965EBE3F1161823C223A0B90@MWHPR12MB1357.namprd12.prod.outlook.com>
 <CACRpkdbab3iEwLOucpAz38AJZaEgpO6mrZrLev+YSYuO7Ox_JA@mail.gmail.com>
 <469f529e-818b-392f-9ddb-b02e87e50ca9@amd.com>
 <CACRpkdbY-2iB9oxHfFOJBmJQq-zmOR1YEg0dy5zdx++tg-acGw@mail.gmail.com>
 <2c12372c-fd6a-8320-2607-5e58ed54d069@amd.com>
 <CACRpkdZrP3BUXZJXunCbWdPuo5qamejFWoz3eA0cEm_kXFPnwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0082.outbound.protection.outlook.com ([104.47.38.82]:1171
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754414AbcLAIuW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Dec 2016 03:50:22 -0500
In-Reply-To: <CACRpkdZrP3BUXZJXunCbWdPuo5qamejFWoz3eA0cEm_kXFPnwg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>


This patch adds support for new Bank and add IRQCHIP_SKIP_SET_WAKE flag.

Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 30 ++++++++++++++++++++----------
 drivers/pinctrl/pinctrl-amd.h |  8 +++++---
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index aea310a..93cc1ca 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -186,7 +186,7 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 	char *output_value;
 	char *output_enable;
 
-	for (bank = 0; bank < AMD_GPIO_TOTAL_BANKS; bank++) {
+	for (bank = 0; bank < gpio_dev->hwbank_num; bank++) {
 		seq_printf(s, "GPIO bank%d\t", bank);
 
 		switch (bank) {
@@ -202,8 +202,11 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 			i = 128;
 			pin_num = AMD_GPIO_PINS_BANK2 + i;
 			break;
+		case 3:
+			i = 192;
+			pin_num = AMD_GPIO_PINS_BANK3 + i;
+			break;
 		}
-
 		for (; i < pin_num; i++) {
 			seq_printf(s, "pin%d\t", i);
 			spin_lock_irqsave(&gpio_dev->lock, flags);
@@ -213,7 +216,7 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 			if (pin_reg & BIT(INTERRUPT_ENABLE_OFF)) {
 				interrupt_enable = "interrupt is enabled|";
 
-				if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF))
+		if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF))
 				&& !(pin_reg & BIT(ACTIVE_LEVEL_OFF+1)))
 					active_level = "Active low|";
 				else if (pin_reg & BIT(ACTIVE_LEVEL_OFF)
@@ -244,17 +247,17 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 				interrupt_mask =
 					"interrupt is masked|";
 
-			if (pin_reg & BIT(WAKE_CNTRL_OFF))
+			if (pin_reg & BIT(WAKE_CNTRL_OFF_S0I3))
 				wake_cntrl0 = "enable wakeup in S0i3 state|";
 			else
 				wake_cntrl0 = "disable wakeup in S0i3 state|";
 
-			if (pin_reg & BIT(WAKE_CNTRL_OFF))
+			if (pin_reg & BIT(WAKE_CNTRL_OFF_S3))
 				wake_cntrl1 = "enable wakeup in S3 state|";
 			else
 				wake_cntrl1 = "disable wakeup in S3 state|";
 
-			if (pin_reg & BIT(WAKE_CNTRL_OFF))
+			if (pin_reg & BIT(WAKE_CNTRL_OFF_S4))
 				wake_cntrl2 = "enable wakeup in S4/S5 state|";
 			else
 				wake_cntrl2 = "disable wakeup in S4/S5 state|";
@@ -479,6 +482,7 @@ static void amd_irq_ack(struct irq_data *d)
 	.irq_unmask   = amd_gpio_irq_unmask,
 	.irq_eoi      = amd_gpio_irq_eoi,
 	.irq_set_type = amd_gpio_irq_set_type,
+	.flags        = IRQCHIP_SKIP_SET_WAKE,
 };
 
 static void amd_gpio_irq_handler(struct irq_desc *desc)
@@ -727,10 +731,14 @@ static int amd_pinconf_group_set(struct pinctrl_dev *pctldev,
 
 static int amd_gpio_probe(struct platform_device *pdev)
 {
+	int hwnum;
 	int ret = 0;
 	int irq_base;
 	struct resource *res;
 	struct amd_gpio *gpio_dev;
+	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
+
+	ret = kstrtoint(acpi_device_uid(adev), 2, &hwnum);
 
 	gpio_dev = devm_kzalloc(&pdev->dev,
 				sizeof(struct amd_gpio), GFP_KERNEL);
@@ -763,16 +771,17 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->gc.set			= amd_gpio_set_value;
 	gpio_dev->gc.set_debounce	= amd_gpio_set_debounce;
 	gpio_dev->gc.dbg_show		= amd_gpio_dbg_show;
+	gpio_dev->gc.base               = -1;
 
-	gpio_dev->gc.base			= 0;
 	gpio_dev->gc.label			= pdev->name;
 	gpio_dev->gc.owner			= THIS_MODULE;
 	gpio_dev->gc.parent			= &pdev->dev;
-	gpio_dev->gc.ngpio			= TOTAL_NUMBER_OF_PINS;
+	gpio_dev->gc.ngpio			= resource_size(res) / 4;
 #if defined(CONFIG_OF_GPIO)
 	gpio_dev->gc.of_node			= pdev->dev.of_node;
 #endif
 
+	gpio_dev->hwbank_num = gpio_dev->gc.ngpio / 64;
 	gpio_dev->groups = kerncz_groups;
 	gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
 
@@ -789,7 +798,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
-				0, 0, TOTAL_NUMBER_OF_PINS);
+				0, 0, gpio_dev->gc.ngpio);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add pin range\n");
 		goto out2;
@@ -810,7 +819,6 @@ static int amd_gpio_probe(struct platform_device *pdev)
 				 &amd_gpio_irqchip,
 				 irq_base,
 				 amd_gpio_irq_handler);
-
 	platform_set_drvdata(pdev, gpio_dev);
 
 	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
@@ -829,6 +837,7 @@ static int amd_gpio_remove(struct platform_device *pdev)
 	gpio_dev = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&gpio_dev->gc);
+	pinctrl_unregister(gpio_dev->pctrl);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 7bfea47..c03f778 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -13,13 +13,12 @@
 #ifndef _PINCTRL_AMD_H
 #define _PINCTRL_AMD_H
 
-#define TOTAL_NUMBER_OF_PINS	192
 #define AMD_GPIO_PINS_PER_BANK  64
-#define AMD_GPIO_TOTAL_BANKS    3
 
 #define AMD_GPIO_PINS_BANK0     63
 #define AMD_GPIO_PINS_BANK1     64
 #define AMD_GPIO_PINS_BANK2     56
+#define AMD_GPIO_PINS_BANK3     32
 
 #define WAKE_INT_MASTER_REG 0xfc
 #define EOI_MASK (1 << 29)
@@ -35,7 +34,9 @@
 #define ACTIVE_LEVEL_OFF		9
 #define INTERRUPT_ENABLE_OFF		11
 #define INTERRUPT_MASK_OFF		12
-#define WAKE_CNTRL_OFF			13
+#define WAKE_CNTRL_OFF_S0I3             13
+#define WAKE_CNTRL_OFF_S3               14
+#define WAKE_CNTRL_OFF_S4               15
 #define PIN_STS_OFF			16
 #define DRV_STRENGTH_SEL_OFF		17
 #define PULL_UP_SEL_OFF			19
@@ -93,6 +94,7 @@ struct amd_gpio {
 	u32 ngroups;
 	struct pinctrl_dev *pctrl;
 	struct gpio_chip        gc;
+	unsigned int            hwbank_num;
 	struct resource         *res;
 	struct platform_device  *pdev;
 };
-- 
1.9.1


