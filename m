From: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Subject: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Fri, 4 Nov 2016 03:46:11 +0000
Message-ID: <MWHPR12MB1357A3E7488C15C8E6E6BE45A0A20@MWHPR12MB1357.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0062.outbound.protection.outlook.com ([104.47.38.62]:24600
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752650AbcKDECE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Nov 2016 00:02:04 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "gnurou@gmail.com" <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>

This patch provides support for additional GPIO devices and also provides I=
RQ sharing for AMD's GPIO devices and set
IRQCHIP_SKIP_SET_WAKE flag.

Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 28 ++++++++++++++++++++--------
 drivers/pinctrl/pinctrl-amd.h |  7 ++++---
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index aea310a..e3189ef4 100644
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
@@ -244,17 +244,17 @@ static void amd_gpio_dbg_show(struct seq_file *s, str=
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
@@ -479,6 +479,7 @@ static void amd_irq_ack(struct irq_data *d)
 	.irq_unmask   =3D amd_gpio_irq_unmask,
 	.irq_eoi      =3D amd_gpio_irq_eoi,
 	.irq_set_type =3D amd_gpio_irq_set_type,
+	.flags        =3D IRQCHIP_SKIP_SET_WAKE,
 };
=20
 static void amd_gpio_irq_handler(struct irq_desc *desc)
@@ -727,10 +728,14 @@ static int amd_pinconf_group_set(struct pinctrl_dev *=
pctldev,
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
@@ -763,16 +768,17 @@ static int amd_gpio_probe(struct platform_device *pde=
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
@@ -789,7 +795,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return ret;
=20
 	ret =3D gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
-				0, 0, TOTAL_NUMBER_OF_PINS);
+				0, 0, gpio_dev->gc.ngpio);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add pin range\n");
 		goto out2;
@@ -809,7 +815,12 @@ static int amd_gpio_probe(struct platform_device *pdev=
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
@@ -829,6 +840,7 @@ static int amd_gpio_remove(struct platform_device *pdev=
)
 	gpio_dev =3D platform_get_drvdata(pdev);
=20
 	gpiochip_remove(&gpio_dev->gc);
+	pinctrl_unregister(gpio_dev->pctrl);
=20
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 7bfea47..0ed47c6 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -13,9 +13,7 @@
 #ifndef _PINCTRL_AMD_H
 #define _PINCTRL_AMD_H
=20
-#define TOTAL_NUMBER_OF_PINS	192
 #define AMD_GPIO_PINS_PER_BANK  64
-#define AMD_GPIO_TOTAL_BANKS    3
=20
 #define AMD_GPIO_PINS_BANK0     63
 #define AMD_GPIO_PINS_BANK1     64
@@ -35,7 +33,9 @@
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
@@ -93,6 +93,7 @@ struct amd_gpio {
 	u32 ngroups;
 	struct pinctrl_dev *pctrl;
 	struct gpio_chip        gc;
+	unsigned int            hwbank_num;
 	struct resource         *res;
 	struct platform_device  *pdev;
 };
--=20
1.9.1
