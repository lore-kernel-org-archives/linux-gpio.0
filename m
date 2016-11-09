From: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Subject: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Wed, 9 Nov 2016 10:28:02 +0000
Message-ID: <MWHPR12MB1357C965EBE3F1161823C223A0B90@MWHPR12MB1357.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0048.outbound.protection.outlook.com ([104.47.38.48]:60177
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751537AbcKIMCy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Nov 2016 07:02:54 -0500
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "gnurou@gmail.com" <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>

This Provide IRQ sharing for AMD's GPIO devices.And set IRQCHIP_SKIP_SET_WA=
KE flag.

Also, fix the build issue for devm_request_irq()

Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 50 ++++++++++++++++++++++++++-------------=
----
 drivers/pinctrl/pinctrl-amd.h |  8 ++++---
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index aea310a..29ad8e1 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -186,7 +186,7 @@ static void amd_gpio_dbg_show(struct seq_file *s, struc=
t gpio_chip *gc)
 	char *output_value;
 	char *output_enable;
=20
-	for (bank =3D 0; bank < AMD_GPIO_TOTAL_BANKS; bank++) {
+	for (bank =3D 0; bank < gpio_dev->hwbank_num; bank++) {
 		seq_printf(s, "GPIO bank%d\t", bank);
=20
 		switch (bank) {
@@ -202,6 +202,10 @@ static void amd_gpio_dbg_show(struct seq_file *s, stru=
ct gpio_chip *gc)
 			i =3D 128;
 			pin_num =3D AMD_GPIO_PINS_BANK2 + i;
 			break;
+		case 3:
+			i =3D 192;
+			pin_num =3D AMD_GPIO_PINS_BANK3 + i;
+			break;
 		}
=20
 		for (; i < pin_num; i++) {
@@ -244,17 +248,17 @@ static void amd_gpio_dbg_show(struct seq_file *s, str=
uct gpio_chip *gc)
 				interrupt_mask =3D
 					"interrupt is masked|";
=20
-			if (pin_reg & BIT(WAKE_CNTRL_OFF))
+			if (pin_reg & BIT(WAKE_CNTRL_OFF_S0I3))
 				wake_cntrl0 =3D "enable wakeup in S0i3 state|";
 			else
 				wake_cntrl0 =3D "disable wakeup in S0i3 state|";
=20
-			if (pin_reg & BIT(WAKE_CNTRL_OFF))
+			if (pin_reg & BIT(WAKE_CNTRL_OFF_S3))
 				wake_cntrl1 =3D "enable wakeup in S3 state|";
 			else
 				wake_cntrl1 =3D "disable wakeup in S3 state|";
=20
-			if (pin_reg & BIT(WAKE_CNTRL_OFF))
+			if (pin_reg & BIT(WAKE_CNTRL_OFF_S4))
 				wake_cntrl2 =3D "enable wakeup in S4/S5 state|";
 			else
 				wake_cntrl2 =3D "disable wakeup in S4/S5 state|";
@@ -479,9 +483,10 @@ static struct irq_chip amd_gpio_irqchip =3D {
 	.irq_unmask   =3D amd_gpio_irq_unmask,
 	.irq_eoi      =3D amd_gpio_irq_eoi,
 	.irq_set_type =3D amd_gpio_irq_set_type,
+	.flags        =3D IRQCHIP_SKIP_SET_WAKE,
 };
=20
-static void amd_gpio_irq_handler(struct irq_desc *desc)
+static irqreturn_t amd_gpio_irq_handler(int irq, void *data)
 {
 	u32 i;
 	u32 off;
@@ -489,13 +494,9 @@ static void amd_gpio_irq_handler(struct irq_desc *desc=
)
 	u32 pin_reg;
 	u64 reg64;
 	int handled =3D 0;
-	unsigned int irq;
 	unsigned long flags;
-	struct irq_chip *chip =3D irq_desc_get_chip(desc);
-	struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
-	struct amd_gpio *gpio_dev =3D gpiochip_get_data(gc);
+	struct amd_gpio *gpio_dev =3D data;
=20
-	chained_irq_enter(chip, desc);
 	/*enable GPIO interrupt again*/
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	reg =3D readl(gpio_dev->base + WAKE_INT_STATUS_REG1);
@@ -517,8 +518,9 @@ static void amd_gpio_irq_handler(struct irq_desc *desc)
 						(off * 4 + i) * 4);
 				if ((pin_reg & BIT(INTERRUPT_STS_OFF)) ||
 					(pin_reg & BIT(WAKE_STS_OFF))) {
-					irq =3D irq_find_mapping(gc->irqdomain,
-								off * 4 + i);
+					irq =3D irq_find_mapping(
+						gpio_dev->gc.irqdomain,
+						off * 4 + i);
 					generic_handle_irq(irq);
 					writel(pin_reg,
 						gpio_dev->base
@@ -529,16 +531,13 @@ static void amd_gpio_irq_handler(struct irq_desc *des=
c)
 		}
 	}
=20
-	if (handled =3D=3D 0)
-		handle_bad_irq(desc);
-
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	reg =3D readl(gpio_dev->base + WAKE_INT_MASTER_REG);
 	reg |=3D EOI_MASK;
 	writel(reg, gpio_dev->base + WAKE_INT_MASTER_REG);
 	spin_unlock_irqrestore(&gpio_dev->lock, flags);
=20
-	chained_irq_exit(chip, desc);
+	return 0;
 }
=20
 static int amd_get_groups_count(struct pinctrl_dev *pctldev)
@@ -727,10 +726,14 @@ static struct pinctrl_desc amd_pinctrl_desc =3D {
=20
 static int amd_gpio_probe(struct platform_device *pdev)
 {
+	int hwnum;
 	int ret =3D 0;
 	int irq_base;
 	struct resource *res;
 	struct amd_gpio *gpio_dev;
+	struct acpi_device *adev =3D ACPI_COMPANION(&pdev->dev);
+
+	ret =3D kstrtoint(acpi_device_uid(adev), 2, &hwnum);
=20
 	gpio_dev =3D devm_kzalloc(&pdev->dev,
 				sizeof(struct amd_gpio), GFP_KERNEL);
@@ -763,16 +766,17 @@ static int amd_gpio_probe(struct platform_device *pde=
v)
 	gpio_dev->gc.set			=3D amd_gpio_set_value;
 	gpio_dev->gc.set_debounce	=3D amd_gpio_set_debounce;
 	gpio_dev->gc.dbg_show		=3D amd_gpio_dbg_show;
+	gpio_dev->gc.base               =3D gpio_dev->gc.ngpio * hwnum;
=20
-	gpio_dev->gc.base			=3D 0;
 	gpio_dev->gc.label			=3D pdev->name;
 	gpio_dev->gc.owner			=3D THIS_MODULE;
 	gpio_dev->gc.parent			=3D &pdev->dev;
-	gpio_dev->gc.ngpio			=3D TOTAL_NUMBER_OF_PINS;
+	gpio_dev->gc.ngpio			=3D resource_size(res) / 4;
 #if defined(CONFIG_OF_GPIO)
 	gpio_dev->gc.of_node			=3D pdev->dev.of_node;
 #endif
=20
+	gpio_dev->hwbank_num =3D gpio_dev->gc.ngpio / 64;
 	gpio_dev->groups =3D kerncz_groups;
 	gpio_dev->ngroups =3D ARRAY_SIZE(kerncz_groups);
=20
@@ -789,7 +793,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return ret;
=20
 	ret =3D gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
-				0, 0, TOTAL_NUMBER_OF_PINS);
+				0, 0, gpio_dev->gc.ngpio);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add pin range\n");
 		goto out2;
@@ -809,7 +813,12 @@ static int amd_gpio_probe(struct platform_device *pdev=
)
 	gpiochip_set_chained_irqchip(&gpio_dev->gc,
 				 &amd_gpio_irqchip,
 				 irq_base,
-				 amd_gpio_irq_handler);
+				 NULL);
+
+	ret =3D devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler,
+			       IRQF_SHARED, dev_name(&pdev->dev), gpio_dev);
+	if (ret)
+		goto out2;
=20
 	platform_set_drvdata(pdev, gpio_dev);
=20
@@ -829,6 +838,7 @@ static int amd_gpio_remove(struct platform_device *pdev=
)
 	gpio_dev =3D platform_get_drvdata(pdev);
=20
 	gpiochip_remove(&gpio_dev->gc);
+	pinctrl_unregister(gpio_dev->pctrl);
=20
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 7bfea47..c03f778 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -13,13 +13,12 @@
 #ifndef _PINCTRL_AMD_H
 #define _PINCTRL_AMD_H
=20
-#define TOTAL_NUMBER_OF_PINS	192
 #define AMD_GPIO_PINS_PER_BANK  64
-#define AMD_GPIO_TOTAL_BANKS    3
=20
 #define AMD_GPIO_PINS_BANK0     63
 #define AMD_GPIO_PINS_BANK1     64
 #define AMD_GPIO_PINS_BANK2     56
+#define AMD_GPIO_PINS_BANK3     32
=20
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
--=20
2.7.4

