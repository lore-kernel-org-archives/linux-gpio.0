From: Ken Xue <Ken.Xue@amd.com>
Subject: [PATCH V2] pinctrl: add AMD GPIO driver support.
Date: Wed, 4 Mar 2015 14:53:25 +0800
Message-ID: <1425452005.24903.4.camel@kxue-X58A-UD3R>
References: <1422949788.18208.4.camel@kxue-X58A-UD3R>
	 <1423111885.18208.41.camel@kxue-X58A-UD3R>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bon0110.outbound.protection.outlook.com ([157.56.111.110]:33568
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1758593AbbCDHUV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 4 Mar 2015 02:20:21 -0500
In-Reply-To: <1423111885.18208.41.camel@kxue-X58A-UD3R>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org

>From c2258b4b550d8f61a5eb64fee25d4c0fdd3a1e91 Mon Sep 17 00:00:00 2001
From: Ken Xue <Ken.Xue@amd.com>
Date: Wed, 4 Mar 2015 14:48:36 +0800
Subject: [PATCH] pinctrl: add AMD GPIO driver support.

KERNCZ GPIO is a new IP from AMD. it can be implemented in both x86 and ARM.
Current driver patch only support GPIO in x86.

Signed-off-by: Ken Xue <Ken.Xue@amd.com>
---
 drivers/pinctrl/Kconfig       |  15 +
 drivers/pinctrl/Makefile      |   1 +
 drivers/pinctrl/pinctrl-amd.c | 852 ++++++++++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.h | 261 +++++++++++++
 4 files changed, 1129 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-amd.c
 create mode 100644 drivers/pinctrl/pinctrl-amd.h

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index ee9f44a..25a624a 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -67,6 +67,21 @@ config PINCTRL_AT91
 	help
 	  Say Y here to enable the at91 pinctrl driver
 
+config PINCTRL_AMD
+	bool "AMD GPIO pin control"
+	depends on GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select PINCONF
+	select GENERIC_PINCONF
+	help
+	  driver for memory mapped GPIO functionality on AMD platforms
+	  (x86 or arm).Most pins are usually muxed to some other
+	  functionality by firmware,so only a small amount is available
+	  for gpio use.
+
+	  Requires ACPI/FDT device enumeration code to set up a platform
+	  device.
+
 config PINCTRL_BCM2835
 	bool
 	select PINMUX
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 0475206..64bfac6 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_PINCTRL_AS3722)	+= pinctrl-as3722.o
 obj-$(CONFIG_PINCTRL_BF54x)	+= pinctrl-adi2-bf54x.o
 obj-$(CONFIG_PINCTRL_BF60x)	+= pinctrl-adi2-bf60x.o
 obj-$(CONFIG_PINCTRL_AT91)	+= pinctrl-at91.o
+obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
 obj-$(CONFIG_PINCTRL_BCM2835)	+= pinctrl-bcm2835.o
 obj-$(CONFIG_PINCTRL_BCM281XX)	+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
new file mode 100644
index 0000000..ec79a08
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -0,0 +1,852 @@
+/*
+ * GPIO driver for AMD
+ *
+ * Copyright (c) 2014,2015 AMD Corporation.
+ * Authors: Ken Xue <Ken.Xue@amd.com>
+ *      Wu, Jeff <Jeff.Wu@amd.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ */
+
+#include <linux/err.h>
+#include <linux/bug.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/log2.h>
+#include <linux/io.h>
+#include <linux/gpio.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/mutex.h>
+#include <linux/acpi.h>
+#include <linux/seq_file.h>
+#include <linux/interrupt.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/list.h>
+
+#include "pinctrl-utils.h"
+#include "pinctrl-amd.h"
+
+static inline struct amd_gpio *to_amd_gpio(struct gpio_chip *gc)
+{
+	return container_of(gc, struct amd_gpio, gc);
+}
+
+static int amd_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	unsigned long flags;
+	u32 pin_reg;
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + offset * 4);
+	/*
+	 * Suppose BIOS or Bootloader sets specific debounce for the
+	 * GPIO. if not, set debounce to be  2.75ms and remove glitch.
+	*/
+	if ((pin_reg & DB_TMR_OUT_MASK) == 0) {
+		pin_reg |= 0xf;
+		pin_reg |= 1UL << DB_TMR_OUT_UNIT_OFF;
+		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
+		pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);
+	}
+
+	pin_reg &= ~(1UL << OUTPUT_ENABLE_OFF);
+	writel(pin_reg, gpio_dev->base + offset * 4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	return 0;
+}
+
+static int amd_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
+		int value)
+{
+	u32 pin_reg;
+	unsigned long flags;
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg |= 1UL << OUTPUT_ENABLE_OFF;
+	pin_reg |= (!!value) << OUTPUT_VALUE_OFF;
+	writel(pin_reg, gpio_dev->base + offset * 4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	return 0;
+}
+
+static int amd_gpio_get_value(struct gpio_chip *gc, unsigned offset)
+{
+	u32 pin_reg;
+	unsigned long flags;
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + offset * 4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	return pin_reg & (1UL << PIN_STS_OFF);
+}
+
+static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
+{
+	u32 pin_reg;
+	unsigned long flags;
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg |= (!!value) << OUTPUT_VALUE_OFF;
+	writel(pin_reg, gpio_dev->base + offset * 4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+}
+
+static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
+		unsigned debounce)
+{
+	u32 pin_reg;
+	u32 time;
+	unsigned long flags;
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + offset * 4);
+
+	if (debounce) {
+		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
+		pin_reg &= ~DB_TMR_OUT_MASK;
+		/*
+		Debounce	Debounce	Timer	Max
+		TmrLarge	TmrOutUnit	Unit	Debounce
+							Time
+		0	0	61 usec (2 RtcClk)	976 usec
+		0	1	244 usec (8 RtcClk)	3.9 msec
+		1	0	15.6 msec (512 RtcClk)	250 msec
+		1	1	62.5 msec (2048 RtcClk)	1 sec
+		*/
+
+		if (debounce < 61) {
+			pin_reg |= 1;
+			pin_reg &= ~(1UL << DB_TMR_OUT_UNIT_OFF);
+			pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);
+		} else if (debounce < 976) {
+			time = debounce / 61;
+			pin_reg |= time & DB_TMR_OUT_MASK;
+			pin_reg &= ~(1UL << DB_TMR_OUT_UNIT_OFF);
+			pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);
+		} else if (debounce < 3900) {
+			time = debounce / 244;
+			pin_reg |= time & DB_TMR_OUT_MASK;
+			pin_reg |= 1UL << DB_TMR_OUT_UNIT_OFF;
+			pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);
+		} else if (debounce < 250000) {
+			time = debounce / 15600;
+			pin_reg |= time & DB_TMR_OUT_MASK;
+			pin_reg &= ~(1UL << DB_TMR_OUT_UNIT_OFF);
+			pin_reg |= 1UL << DB_TMR_LARGE_OFF;
+		} else if (debounce < 1000000) {
+			time = debounce / 62500;
+			pin_reg |= time & DB_TMR_OUT_MASK;
+			pin_reg |= 1UL << DB_TMR_OUT_UNIT_OFF;
+			pin_reg |= 1UL << DB_TMR_LARGE_OFF;
+		} else {
+			pin_reg &= ~DB_CNTRl_MASK;
+			return -EINVAL;
+		}
+	} else {
+		pin_reg &= ~(1UL << DB_TMR_OUT_UNIT_OFF);
+		pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);
+		pin_reg &= ~DB_TMR_OUT_MASK;
+		pin_reg &= ~DB_CNTRl_MASK;
+	}
+	writel(pin_reg, gpio_dev->base + offset * 4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
+{
+	u32 pin_reg;
+	unsigned long flags;
+	unsigned int bank, i, pin_num;
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	char *level_trig;
+	char *active_level;
+	char *interrupt_enable;
+	char *interrupt_mask;
+	char *wake_cntrl0;
+	char *wake_cntrl1;
+	char *wake_cntrl2;
+	char *pin_sts;
+	char *pull_up_sel;
+	char *pull_up_enable;
+	char *pull_down_enable;
+	char *output_value;
+	char *output_enable;
+
+	for (bank = 0; bank < AMD_GPIO_TOTAL_BANKS; bank++) {
+		seq_printf(s, "GPIO bank%d\t", bank);
+
+		switch (bank) {
+		case 0:
+			i = 0;
+			pin_num = AMD_GPIO_PINS_BANK0;
+			break;
+		case 1:
+			i = 64;
+			pin_num = AMD_GPIO_PINS_BANK1 + i;
+			break;
+		case 2:
+			i = 128;
+			pin_num = AMD_GPIO_PINS_BANK2 + i;
+			break;
+		}
+
+		for (; i < pin_num; i++) {
+			seq_printf(s, "pin%d\t", i);
+			spin_lock_irqsave(&gpio_dev->lock, flags);
+			pin_reg = readl(gpio_dev->base + i * 4);
+			spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+			if (pin_reg & (1UL << LEVEL_TRIG_OFF))
+				level_trig = "Level trigger|";
+			else
+				level_trig = "Edge trigger|";
+
+			if ((pin_reg >> ACTIVE_LEVEL_OFF) & BIT(0))
+				active_level = "Active low|";
+			else if ((pin_reg >> ACTIVE_LEVEL_OFF) & BIT(1))
+				active_level = "Active on both|";
+			else
+				active_level = "Active high|";
+
+			if (pin_reg & (1UL << INTERRUPT_ENABLE_OFF))
+				interrupt_enable =
+					"interrupt is enabled|";
+			else
+				interrupt_enable =
+					"interrupt is disabled|";
+
+			if (pin_reg & (1UL << INTERRUPT_MASK_OFF))
+				interrupt_mask =
+					"interrupt is unmasked|";
+			else
+				interrupt_mask =
+					"interrupt is masked|";
+
+			if ((pin_reg >> WAKE_CNTRL_OFF) & BIT(0))
+				wake_cntrl0 = "enable wakeup in S0i3 state|";
+			else
+				wake_cntrl0 = "disable wakeup in S0i3 state|";
+
+			if ((pin_reg >> WAKE_CNTRL_OFF) & BIT(1))
+				wake_cntrl1 = "enable wakeup in S3 state|";
+			else
+				wake_cntrl1 = "disable wakeup in S3 state|";
+
+			if ((pin_reg >> WAKE_CNTRL_OFF) & BIT(2))
+				wake_cntrl2 = "enable wakeup in S4/S5 state|";
+			else
+				wake_cntrl2 = "disable wakeup in S4/S5 state|";
+
+			if ((pin_reg >> PIN_STS_OFF) & BIT(0))
+				pin_sts = "input is high|";
+			else
+				pin_sts = "input is low|";
+
+			if ((pin_reg >> PULL_UP_ENABLE_OFF) & BIT(0)) {
+				pull_up_enable = "pull-up is enabled|";
+				if ((pin_reg >> PULL_UP_SEL_OFF) & BIT(0))
+					pull_up_sel = "8k pull-up|";
+				else
+					pull_up_sel = "4k pull-up|";
+			} else {
+				pull_up_enable = "pull-up is disabled|";
+				pull_up_sel = " ";
+			}
+
+			if ((pin_reg >> PULL_DOWN_ENABLE_OFF) & BIT(0))
+				pull_down_enable = "pull-down is enabled|";
+			else
+				pull_down_enable = "Pull-down is disabled|";
+
+			if ((pin_reg >> OUTPUT_ENABLE_OFF) & BIT(0)) {
+				output_enable = "output is enabled|";
+				if ((pin_reg >> OUTPUT_VALUE_OFF) & BIT(0))
+					output_value = "output is high|";
+				else
+					output_value = "output is low|";
+			} else {
+				output_enable = "output is disabled|";
+				output_value = " ";
+			}
+
+			seq_printf(s, "%s %s %s %s %s %s\n"
+				" %s %s %s %s %s %s %s 0x%x\n",
+				level_trig, active_level, interrupt_enable,
+				interrupt_mask, wake_cntrl0, wake_cntrl1,
+				wake_cntrl2, pin_sts, pull_up_sel,
+				pull_up_enable, pull_down_enable,
+				output_value, output_enable, pin_reg);
+		}
+	}
+}
+#else
+#define amd_gpio_dbg_show NULL
+#endif
+
+static void amd_gpio_irq_enable(struct irq_data *d)
+{
+	u32 pin_reg;
+	unsigned long flags;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	/*
+		Suppose BIOS or Bootloader sets specific debounce for the
+		GPIO. if not, set debounce to be  2.75ms.
+	*/
+	if ((pin_reg & DB_TMR_OUT_MASK) == 0) {
+		pin_reg |= 0xf;
+		pin_reg |= 1UL << DB_TMR_OUT_UNIT_OFF;
+		pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);
+	}
+	pin_reg |= 1UL << INTERRUPT_ENABLE_OFF;
+	pin_reg |= 1UL << INTERRUPT_MASK_OFF;
+	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+}
+
+static void amd_gpio_irq_disable(struct irq_data *d)
+{
+	u32 pin_reg;
+	unsigned long flags;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg &= ~(1UL << INTERRUPT_ENABLE_OFF);
+	pin_reg &= ~(1UL << INTERRUPT_MASK_OFF);
+	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+}
+
+static void amd_gpio_irq_mask(struct irq_data *d)
+{
+	u32 pin_reg;
+	unsigned long flags;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg &= ~(1UL << INTERRUPT_MASK_OFF);
+	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+}
+
+static void amd_gpio_irq_unmask(struct irq_data *d)
+{
+	u32 pin_reg;
+	unsigned long flags;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+	pin_reg |= 1UL << INTERRUPT_MASK_OFF;
+	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+}
+
+static void amd_gpio_irq_eoi(struct irq_data *d)
+{
+	u32 reg;
+	unsigned long flags;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	reg = readl(gpio_dev->base + WAKE_INT_MASTER_REG);
+	reg |= EOI_MASK;
+	writel(reg, gpio_dev->base + WAKE_INT_MASTER_REG);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+}
+
+static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	int ret = 0;
+	u32 pin_reg;
+	unsigned long flags;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		pin_reg &= ~(1UL << LEVEL_TRIG_OFF);
+		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
+		pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
+		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
+		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		pin_reg &= ~(1UL << LEVEL_TRIG_OFF);
+		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
+		pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
+		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
+		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		pin_reg &= ~(1UL << LEVEL_TRIG_OFF);
+		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
+		pin_reg |= BOTH_EADGE << ACTIVE_LEVEL_OFF;
+		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
+		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
+		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
+		pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
+		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
+		pin_reg |= DB_TYPE_PRESERVE_LOW_GLITCH << DB_CNTRL_OFF;
+		__irq_set_handler_locked(d->irq, handle_level_irq);
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
+		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
+		pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
+		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
+		pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
+		__irq_set_handler_locked(d->irq, handle_level_irq);
+		break;
+
+	case IRQ_TYPE_NONE:
+		break;
+
+	default:
+		dev_err(&gpio_dev->pdev->dev, "Invalid type value\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	pin_reg |= CLR_INTR_STAT << INTERRUPT_STS_OFF;
+	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+exit:
+	return ret;
+}
+
+static void amd_irq_ack(struct irq_data *d)
+{
+	/*
+	 * based on HW design,there is no need to ack HW
+	 * before handle current irq. But this routine is
+	 * necessary for handle_edge_irq
+	*/
+}
+
+static struct irq_chip amd_gpio_irqchip = {
+	.name         = "amd_gpio",
+	.irq_ack      = amd_irq_ack,
+	.irq_enable   = amd_gpio_irq_enable,
+	.irq_disable  = amd_gpio_irq_disable,
+	.irq_mask     = amd_gpio_irq_mask,
+	.irq_unmask   = amd_gpio_irq_unmask,
+	.irq_eoi      = amd_gpio_irq_eoi,
+	.irq_set_type = amd_gpio_irq_set_type,
+};
+
+static void amd_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
+{
+	u32 i;
+	u32 off;
+	u32 reg;
+	u32 pin_reg;
+	u64 reg64;
+	int handled = 0;
+	unsigned long flags;
+	struct irq_chip *chip = irq_get_chip(irq);
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct amd_gpio *gpio_dev = to_amd_gpio(gc);
+
+	chained_irq_enter(chip, desc);
+	/*enable GPIO interrupt again*/
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	reg = readl(gpio_dev->base + WAKE_INT_STATUS_REG1);
+	reg64 = reg;
+	reg64 = reg64 << 32;
+
+	reg = readl(gpio_dev->base + WAKE_INT_STATUS_REG0);
+	reg64 |= reg;
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	/*
+	 * first 46 bits indicates interrupt status.
+	 * one bit represents four interrupt sources.
+	*/
+	for (off = 0; off < 46 ; off++) {
+		if (reg64 & (1ULL << off)) {
+			for (i = 0; i < 4; i++) {
+				pin_reg = readl(gpio_dev->base +
+						(off * 4 + i) * 4);
+				if ((pin_reg & (1UL << INTERRUPT_STS_OFF)) ||
+					(pin_reg & (1UL << WAKE_STS_OFF))) {
+					irq = irq_find_mapping(gc->irqdomain,
+								off * 4 + i);
+					generic_handle_irq(irq);
+					writel(pin_reg,
+						gpio_dev->base
+						+ (off * 4 + i) * 4);
+					handled++;
+				}
+			}
+		}
+	}
+
+	if (handled == 0)
+		handle_bad_irq(irq, desc);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	reg = readl(gpio_dev->base + WAKE_INT_MASTER_REG);
+	reg |= EOI_MASK;
+	writel(reg, gpio_dev->base + WAKE_INT_MASTER_REG);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int amd_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
+
+	return gpio_dev->ngroups;
+}
+
+static const char *amd_get_group_name(struct pinctrl_dev *pctldev,
+				      unsigned group)
+{
+	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
+
+	return gpio_dev->groups[group].name;
+}
+
+static int amd_get_group_pins(struct pinctrl_dev *pctldev,
+			      unsigned group,
+			      const unsigned **pins,
+			      unsigned *num_pins)
+{
+	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = gpio_dev->groups[group].pins;
+	*num_pins = gpio_dev->groups[group].npins;
+	return 0;
+}
+
+static const struct pinctrl_ops amd_pinctrl_ops = {
+	.get_groups_count	= amd_get_groups_count,
+	.get_group_name		= amd_get_group_name,
+	.get_group_pins		= amd_get_group_pins,
+#ifdef CONFIG_OF
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
+	.dt_free_map		= pinctrl_utils_dt_free_map,
+#endif
+};
+
+static int amd_pinconf_get(struct pinctrl_dev *pctldev,
+			  unsigned int pin,
+			  unsigned long *config)
+{
+	u32 pin_reg;
+	unsigned arg;
+	unsigned long flags;
+	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + pin*4);
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+	switch (param) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		arg = pin_reg & DB_TMR_OUT_MASK;
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = (pin_reg >> PULL_DOWN_ENABLE_OFF) & BIT(0);
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = (pin_reg >> PULL_UP_SEL_OFF) & (BIT(0) | BIT(1));
+		break;
+
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		arg = (pin_reg >> DRV_STRENGTH_SEL_OFF) & DRV_STRENGTH_SEL_MASK;
+		break;
+
+	default:
+		dev_err(&gpio_dev->pdev->dev, "Invalid config param %04x\n",
+			param);
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int amd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+				unsigned long *configs, unsigned num_configs)
+{
+	int i;
+	u32 pin_reg;
+	u32 arg;
+	unsigned long flags;
+	enum pin_config_param param;
+	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
+
+	spin_lock_irqsave(&gpio_dev->lock, flags);
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+		pin_reg = readl(gpio_dev->base + pin*4);
+
+		switch (param) {
+		case PIN_CONFIG_INPUT_DEBOUNCE:
+			pin_reg &= ~DB_TMR_OUT_MASK;
+			pin_reg |= arg & DB_TMR_OUT_MASK;
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			pin_reg &= ~(1UL << PULL_DOWN_ENABLE_OFF);
+			pin_reg |= (arg & BIT(0)) << PULL_DOWN_ENABLE_OFF;
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_UP:
+			pin_reg &= ~(1UL << PULL_UP_SEL_OFF);
+			pin_reg |= (arg & BIT(0)) << PULL_UP_SEL_OFF;
+			pin_reg &= ~(1UL << PULL_UP_ENABLE_OFF);
+			pin_reg |= ((arg>>1) & BIT(0)) << PULL_UP_ENABLE_OFF;
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			pin_reg &= ~(DRV_STRENGTH_SEL_MASK
+					<< DRV_STRENGTH_SEL_OFF);
+			pin_reg |= (arg & DRV_STRENGTH_SEL_MASK)
+					<< DRV_STRENGTH_SEL_OFF;
+			break;
+
+		default:
+			dev_err(&gpio_dev->pdev->dev,
+				"Invalid config param %04x\n", param);
+			return -ENOTSUPP;
+		}
+
+		writel(pin_reg, gpio_dev->base + pin*4);
+	}
+	spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	return 0;
+}
+
+static int amd_pinconf_group_get(struct pinctrl_dev *pctldev,
+				unsigned int group,
+				unsigned long *config)
+{
+	const unsigned *pins;
+	unsigned npins;
+	int ret;
+
+	ret = amd_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	if (amd_pinconf_get(pctldev, pins[0], config))
+			return -ENOTSUPP;
+
+	return 0;
+}
+
+static int amd_pinconf_group_set(struct pinctrl_dev *pctldev,
+				unsigned group, unsigned long *configs,
+				unsigned num_configs)
+{
+	const unsigned *pins;
+	unsigned npins;
+	int i, ret;
+
+	ret = amd_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+	for (i = 0; i < npins; i++) {
+		if (amd_pinconf_set(pctldev, pins[i], configs, num_configs))
+			return -ENOTSUPP;
+	}
+	return 0;
+}
+
+static const struct pinconf_ops amd_pinconf_ops = {
+	.pin_config_get		= amd_pinconf_get,
+	.pin_config_set		= amd_pinconf_set,
+	.pin_config_group_get = amd_pinconf_group_get,
+	.pin_config_group_set = amd_pinconf_group_set,
+};
+
+static struct pinctrl_desc amd_pinctrl_desc = {
+	.pins	= kerncz_pins,
+	.npins = ARRAY_SIZE(kerncz_pins),
+	.pctlops = &amd_pinctrl_ops,
+	.confops = &amd_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static int amd_gpio_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+	u32 irq_base;
+	struct resource *res;
+	struct amd_gpio *gpio_dev;
+
+	gpio_dev = devm_kzalloc(&pdev->dev,
+				sizeof(struct amd_gpio), GFP_KERNEL);
+	if (!gpio_dev)
+		return -ENOMEM;
+
+	spin_lock_init(&gpio_dev->lock);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get gpio io resource.\n");
+		return -EINVAL;
+	}
+
+	gpio_dev->base = devm_ioremap_nocache(&pdev->dev, res->start,
+						resource_size(res));
+	if (IS_ERR(gpio_dev->base))
+		return PTR_ERR(gpio_dev->base);
+
+	irq_base = platform_get_irq(pdev, 0);
+	if (irq_base < 0) {
+		dev_err(&pdev->dev, "Failed to get gpio IRQ.\n");
+		return -EINVAL;
+	}
+
+	gpio_dev->pdev = pdev;
+	gpio_dev->gc.direction_input	= amd_gpio_direction_input;
+	gpio_dev->gc.direction_output	= amd_gpio_direction_output;
+	gpio_dev->gc.get			= amd_gpio_get_value;
+	gpio_dev->gc.set			= amd_gpio_set_value;
+	gpio_dev->gc.set_debounce	= amd_gpio_set_debounce;
+	gpio_dev->gc.dbg_show		= amd_gpio_dbg_show;
+
+	gpio_dev->gc.base			= 0;
+	gpio_dev->gc.label			= pdev->name;
+	gpio_dev->gc.owner			= THIS_MODULE;
+	gpio_dev->gc.dev			= &pdev->dev;
+	gpio_dev->gc.ngpio			= TOTAL_NUMBER_OF_PINS;
+#if defined(CONFIG_OF_GPIO)
+	gpio_dev->gc.of_node			= pdev->dev.of_node;
+#endif
+
+	gpio_dev->groups = kerncz_groups;
+	gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
+
+	amd_pinctrl_desc.name = dev_name(&pdev->dev);
+	gpio_dev->pctrl = pinctrl_register(&amd_pinctrl_desc,
+					&pdev->dev, gpio_dev);
+	if (!gpio_dev->pctrl) {
+		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
+		return -ENODEV;
+	}
+
+	ret = gpiochip_add(&gpio_dev->gc);
+	if (ret)
+		goto out1;
+
+	ret = gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
+				0, 0, TOTAL_NUMBER_OF_PINS);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to add pin range\n");
+		goto out2;
+	}
+
+	ret = gpiochip_irqchip_add(&gpio_dev->gc,
+				&amd_gpio_irqchip,
+				0,
+				handle_simple_irq,
+				IRQ_TYPE_NONE);
+	if (ret) {
+		dev_err(&pdev->dev, "could not add irqchip\n");
+		ret = -ENODEV;
+		goto out2;
+	}
+	gpiochip_set_chained_irqchip(&gpio_dev->gc,
+				 &amd_gpio_irqchip,
+				 irq_base,
+				 amd_gpio_irq_handler);
+
+	platform_set_drvdata(pdev, gpio_dev);
+
+	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
+	return ret;
+
+out2:
+	gpiochip_remove(&gpio_dev->gc);
+
+out1:
+	pinctrl_unregister(gpio_dev->pctrl);
+	return ret;
+}
+
+static int amd_gpio_remove(struct platform_device *pdev)
+{
+	struct amd_gpio *gpio_dev;
+
+	gpio_dev = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&gpio_dev->gc);
+	pinctrl_unregister(gpio_dev->pctrl);
+
+	return 0;
+}
+
+static const struct acpi_device_id amd_gpio_acpi_match[] = {
+	{ "AMD0030", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, amd_gpio_acpi_match);
+
+static struct platform_driver amd_gpio_driver = {
+	.driver		= {
+		.name	= "amd_gpio",
+		.owner	= THIS_MODULE,
+		.acpi_match_table = ACPI_PTR(amd_gpio_acpi_match),
+	},
+	.probe		= amd_gpio_probe,
+	.remove		= amd_gpio_remove,
+};
+
+module_platform_driver(amd_gpio_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Ken Xue <Ken.Xue@amd.com>, Jeff Wu <Jeff.Wu@amd.com>");
+MODULE_DESCRIPTION("AMD GPIO pinctrl driver");
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
new file mode 100644
index 0000000..37e72aa
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -0,0 +1,261 @@
+/*
+ * GPIO driver for AMD
+ *
+ * Copyright (c) 2014,2015 Ken Xue <Ken.Xue@amd.com>
+ *		Jeff Wu <Jeff.Wu@amd.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ */
+
+#ifndef _PINCTRL_AMD_H
+#define _PINCTRL_AMD_H
+
+#define TOTAL_NUMBER_OF_PINS	192
+#define AMD_GPIO_PINS_PER_BANK  64
+#define AMD_GPIO_TOTAL_BANKS    3
+
+#define AMD_GPIO_PINS_BANK0     63
+#define AMD_GPIO_PINS_BANK1     64
+#define AMD_GPIO_PINS_BANK2     56
+
+#define WAKE_INT_MASTER_REG 0xfc
+#define EOI_MASK (1 << 29)
+
+#define WAKE_INT_STATUS_REG0 0x2f8
+#define WAKE_INT_STATUS_REG1 0x2fc
+
+#define DB_TMR_OUT_OFF			0
+#define DB_TMR_OUT_UNIT_OFF		4
+#define DB_CNTRL_OFF			5
+#define DB_TMR_LARGE_OFF		7
+#define LEVEL_TRIG_OFF			8
+#define ACTIVE_LEVEL_OFF		9
+#define INTERRUPT_ENABLE_OFF		11
+#define INTERRUPT_MASK_OFF		12
+#define WAKE_CNTRL_OFF			13
+#define PIN_STS_OFF			16
+#define DRV_STRENGTH_SEL_OFF		17
+#define PULL_UP_SEL_OFF			19
+#define PULL_UP_ENABLE_OFF		20
+#define PULL_DOWN_ENABLE_OFF		21
+#define OUTPUT_VALUE_OFF		22
+#define OUTPUT_ENABLE_OFF		23
+#define SW_CNTRL_IN_OFF			24
+#define SW_CNTRL_EN_OFF			25
+#define INTERRUPT_STS_OFF		28
+#define WAKE_STS_OFF			29
+
+#define DB_TMR_OUT_MASK	0xFUL
+#define DB_CNTRl_MASK	0x3UL
+#define ACTIVE_LEVEL_MASK	0x3UL
+#define DRV_STRENGTH_SEL_MASK	0x3UL
+
+#define DB_TYPE_NO_DEBOUNCE               0x0UL
+#define DB_TYPE_PRESERVE_LOW_GLITCH       0x1UL
+#define DB_TYPE_PRESERVE_HIGH_GLITCH      0x2UL
+#define DB_TYPE_REMOVE_GLITCH             0x3UL
+
+#define EDGE_TRAGGER	0x0UL
+#define LEVEL_TRIGGER	0x1UL
+
+#define ACTIVE_HIGH	0x0UL
+#define ACTIVE_LOW	0x1UL
+#define BOTH_EADGE	0x2UL
+
+#define ENABLE_INTERRUPT	0x1UL
+#define DISABLE_INTERRUPT	0x0UL
+
+#define ENABLE_INTERRUPT_MASK	0x0UL
+#define DISABLE_INTERRUPT_MASK	0x1UL
+
+#define CLR_INTR_STAT	0x1UL
+
+struct amd_pingroup {
+	const char *name;
+	const unsigned *pins;
+	unsigned npins;
+};
+
+struct amd_function {
+	const char *name;
+	const char * const *groups;
+	unsigned ngroups;
+};
+
+struct amd_gpio {
+	spinlock_t              lock;
+	void __iomem            *base;
+
+	const struct amd_pingroup *groups;
+	u32 ngroups;
+	struct pinctrl_dev *pctrl;
+	struct gpio_chip        gc;
+	struct resource         *res;
+	struct platform_device  *pdev;
+};
+
+/*  KERNCZ configuration*/
+static const struct pinctrl_pin_desc kerncz_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"),
+	PINCTRL_PIN(1, "GPIO_1"),
+	PINCTRL_PIN(2, "GPIO_2"),
+	PINCTRL_PIN(3, "GPIO_3"),
+	PINCTRL_PIN(4, "GPIO_4"),
+	PINCTRL_PIN(5, "GPIO_5"),
+	PINCTRL_PIN(6, "GPIO_6"),
+	PINCTRL_PIN(7, "GPIO_7"),
+	PINCTRL_PIN(8, "GPIO_8"),
+	PINCTRL_PIN(9, "GPIO_9"),
+	PINCTRL_PIN(10, "GPIO_10"),
+	PINCTRL_PIN(11, "GPIO_11"),
+	PINCTRL_PIN(12, "GPIO_12"),
+	PINCTRL_PIN(13, "GPIO_13"),
+	PINCTRL_PIN(14, "GPIO_14"),
+	PINCTRL_PIN(15, "GPIO_15"),
+	PINCTRL_PIN(16, "GPIO_16"),
+	PINCTRL_PIN(17, "GPIO_17"),
+	PINCTRL_PIN(18, "GPIO_18"),
+	PINCTRL_PIN(19, "GPIO_19"),
+	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(23, "GPIO_23"),
+	PINCTRL_PIN(24, "GPIO_24"),
+	PINCTRL_PIN(25, "GPIO_25"),
+	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(39, "GPIO_39"),
+	PINCTRL_PIN(40, "GPIO_40"),
+	PINCTRL_PIN(43, "GPIO_42"),
+	PINCTRL_PIN(46, "GPIO_46"),
+	PINCTRL_PIN(47, "GPIO_47"),
+	PINCTRL_PIN(48, "GPIO_48"),
+	PINCTRL_PIN(49, "GPIO_49"),
+	PINCTRL_PIN(50, "GPIO_50"),
+	PINCTRL_PIN(51, "GPIO_51"),
+	PINCTRL_PIN(52, "GPIO_52"),
+	PINCTRL_PIN(53, "GPIO_53"),
+	PINCTRL_PIN(54, "GPIO_54"),
+	PINCTRL_PIN(55, "GPIO_55"),
+	PINCTRL_PIN(56, "GPIO_56"),
+	PINCTRL_PIN(57, "GPIO_57"),
+	PINCTRL_PIN(58, "GPIO_58"),
+	PINCTRL_PIN(59, "GPIO_59"),
+	PINCTRL_PIN(60, "GPIO_60"),
+	PINCTRL_PIN(61, "GPIO_61"),
+	PINCTRL_PIN(62, "GPIO_62"),
+	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(68, "GPIO_68"),
+	PINCTRL_PIN(69, "GPIO_69"),
+	PINCTRL_PIN(70, "GPIO_70"),
+	PINCTRL_PIN(71, "GPIO_71"),
+	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(74, "GPIO_74"),
+	PINCTRL_PIN(75, "GPIO_75"),
+	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(84, "GPIO_84"),
+	PINCTRL_PIN(85, "GPIO_85"),
+	PINCTRL_PIN(86, "GPIO_86"),
+	PINCTRL_PIN(87, "GPIO_87"),
+	PINCTRL_PIN(88, "GPIO_88"),
+	PINCTRL_PIN(89, "GPIO_89"),
+	PINCTRL_PIN(90, "GPIO_90"),
+	PINCTRL_PIN(91, "GPIO_91"),
+	PINCTRL_PIN(92, "GPIO_92"),
+	PINCTRL_PIN(93, "GPIO_93"),
+	PINCTRL_PIN(95, "GPIO_95"),
+	PINCTRL_PIN(96, "GPIO_96"),
+	PINCTRL_PIN(97, "GPIO_97"),
+	PINCTRL_PIN(98, "GPIO_98"),
+	PINCTRL_PIN(99, "GPIO_99"),
+	PINCTRL_PIN(100, "GPIO_100"),
+	PINCTRL_PIN(101, "GPIO_101"),
+	PINCTRL_PIN(102, "GPIO_102"),
+	PINCTRL_PIN(113, "GPIO_113"),
+	PINCTRL_PIN(114, "GPIO_114"),
+	PINCTRL_PIN(115, "GPIO_115"),
+	PINCTRL_PIN(116, "GPIO_116"),
+	PINCTRL_PIN(117, "GPIO_117"),
+	PINCTRL_PIN(118, "GPIO_118"),
+	PINCTRL_PIN(119, "GPIO_119"),
+	PINCTRL_PIN(120, "GPIO_120"),
+	PINCTRL_PIN(121, "GPIO_121"),
+	PINCTRL_PIN(122, "GPIO_122"),
+	PINCTRL_PIN(126, "GPIO_126"),
+	PINCTRL_PIN(129, "GPIO_129"),
+	PINCTRL_PIN(130, "GPIO_130"),
+	PINCTRL_PIN(131, "GPIO_131"),
+	PINCTRL_PIN(132, "GPIO_132"),
+	PINCTRL_PIN(133, "GPIO_133"),
+	PINCTRL_PIN(135, "GPIO_135"),
+	PINCTRL_PIN(136, "GPIO_136"),
+	PINCTRL_PIN(137, "GPIO_137"),
+	PINCTRL_PIN(138, "GPIO_138"),
+	PINCTRL_PIN(139, "GPIO_139"),
+	PINCTRL_PIN(140, "GPIO_140"),
+	PINCTRL_PIN(141, "GPIO_141"),
+	PINCTRL_PIN(142, "GPIO_142"),
+	PINCTRL_PIN(143, "GPIO_143"),
+	PINCTRL_PIN(144, "GPIO_144"),
+	PINCTRL_PIN(145, "GPIO_145"),
+	PINCTRL_PIN(146, "GPIO_146"),
+	PINCTRL_PIN(147, "GPIO_147"),
+	PINCTRL_PIN(148, "GPIO_148"),
+	PINCTRL_PIN(166, "GPIO_166"),
+	PINCTRL_PIN(167, "GPIO_167"),
+	PINCTRL_PIN(168, "GPIO_168"),
+	PINCTRL_PIN(169, "GPIO_169"),
+	PINCTRL_PIN(170, "GPIO_170"),
+	PINCTRL_PIN(171, "GPIO_171"),
+	PINCTRL_PIN(172, "GPIO_172"),
+	PINCTRL_PIN(173, "GPIO_173"),
+	PINCTRL_PIN(174, "GPIO_174"),
+	PINCTRL_PIN(175, "GPIO_175"),
+	PINCTRL_PIN(176, "GPIO_176"),
+	PINCTRL_PIN(177, "GPIO_177"),
+};
+
+const unsigned i2c0_pins[] = {145, 146};
+const unsigned i2c1_pins[] = {147, 148};
+const unsigned i2c2_pins[] = {113, 114};
+const unsigned i2c3_pins[] = {19, 20};
+
+const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
+const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
+
+static const struct amd_pingroup kerncz_groups[] = {
+	{
+		.name = "i2c0",
+		.pins = i2c0_pins,
+		.npins = 2,
+	},
+	{
+		.name = "i2c1",
+		.pins = i2c1_pins,
+		.npins = 2,
+	},
+	{
+		.name = "i2c2",
+		.pins = i2c2_pins,
+		.npins = 2,
+	},
+	{
+		.name = "i2c3",
+		.pins = i2c3_pins,
+		.npins = 2,
+	},
+	{
+		.name = "uart0",
+		.pins = uart0_pins,
+		.npins = 9,
+	},
+	{
+		.name = "uart1",
+		.pins = uart1_pins,
+		.npins = 5,
+	},
+};
+
+#endif
-- 
1.9.1



