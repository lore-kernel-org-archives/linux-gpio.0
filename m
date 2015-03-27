From: Ken Xue <Ken.Xue@amd.com>
Subject: [Patch] pinctrl: fix warning from static analysis tools for AMD
 GPIO driver
Date: Fri, 27 Mar 2015 17:44:26 +0800
Message-ID: <1427449466.2874.2.camel@kxue-X58A-UD3R>
References: <1422949788.18208.4.camel@kxue-X58A-UD3R>
	 <CACRpkda2CQf6ucrLUdzbbFHjmRsRscBZspCf3taGD8t7armwQw@mail.gmail.com>
	 <1425087698.14876.28.camel@kxue-X58A-UD3R>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0136.outbound.protection.outlook.com ([65.55.169.136]:61344
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751334AbbC0KLq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 27 Mar 2015 06:11:46 -0400
In-Reply-To: <1425087698.14876.28.camel@kxue-X58A-UD3R>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


Fix inconsistent spinlock of AMD GPIO driver which can be
recognized by static analysis tool smatch. Declare constant
Variables with Sparse's suggestion.

Signed-off-by: Ken Xue <Ken.Xue@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 19 +++++++++----------
 drivers/pinctrl/pinctrl-amd.h | 12 ++++++------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 3fe9ec4..7de3b64 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -29,7 +29,6 @@
 #include <linux/interrupt.h>
 #include <linux/list.h>
 #include <linux/bitops.h>
-#include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
@@ -119,8 +118,9 @@ static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
 static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 		unsigned debounce)
 {
-	u32 pin_reg;
 	u32 time;
+	u32 pin_reg;
+	int ret = 0;
 	unsigned long flags;
 	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
 
@@ -166,7 +166,7 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 			pin_reg |= BIT(DB_TMR_LARGE_OFF);
 		} else {
 			pin_reg &= ~DB_CNTRl_MASK;
-			return -EINVAL;
+			ret = -EINVAL;
 		}
 	} else {
 		pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
@@ -177,7 +177,7 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 	writel(pin_reg, gpio_dev->base + offset * 4);
 	spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -463,14 +463,12 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	default:
 		dev_err(&gpio_dev->pdev->dev, "Invalid type value\n");
 		ret = -EINVAL;
-		goto exit;
 	}
 
 	pin_reg |= CLR_INTR_STAT << INTERRUPT_STS_OFF;
 	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
 	spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
-exit:
 	return ret;
 }
 
@@ -635,8 +633,9 @@ static int amd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				unsigned long *configs, unsigned num_configs)
 {
 	int i;
-	u32 pin_reg;
 	u32 arg;
+	int ret = 0;
+	u32 pin_reg;
 	unsigned long flags;
 	enum pin_config_param param;
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
@@ -675,14 +674,14 @@ static int amd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		default:
 			dev_err(&gpio_dev->pdev->dev,
 				"Invalid config param %04x\n", param);
-			return -ENOTSUPP;
+			ret = -ENOTSUPP;
 		}
 
 		writel(pin_reg, gpio_dev->base + pin*4);
 	}
 	spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static int amd_pinconf_group_get(struct pinctrl_dev *pctldev,
@@ -739,7 +738,7 @@ static struct pinctrl_desc amd_pinctrl_desc = {
 static int amd_gpio_probe(struct platform_device *pdev)
 {
 	int ret = 0;
-	u32 irq_base;
+	int irq_base;
 	struct resource *res;
 	struct amd_gpio *gpio_dev;
 
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 37e72aa..7bfea47 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -217,13 +217,13 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(177, "GPIO_177"),
 };
 
-const unsigned i2c0_pins[] = {145, 146};
-const unsigned i2c1_pins[] = {147, 148};
-const unsigned i2c2_pins[] = {113, 114};
-const unsigned i2c3_pins[] = {19, 20};
+static const unsigned i2c0_pins[] = {145, 146};
+static const unsigned i2c1_pins[] = {147, 148};
+static const unsigned i2c2_pins[] = {113, 114};
+static const unsigned i2c3_pins[] = {19, 20};
 
-const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
-const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
+static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
+static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
 
 static const struct amd_pingroup kerncz_groups[] = {
 	{
-- 
1.9.1




