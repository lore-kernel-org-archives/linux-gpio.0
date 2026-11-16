Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.10.4.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815747;
	b=dE6KdK8wrsQaGb3u5KURBtmMXixF6SFjYATmy8h5hgOBlPElectiEBM0ZxEbLckTTITy
	 AM96wTOIfNv8YyuyMBn7J49mmxqqupUtS45wMsYiuJ98eSIVIJHdR7fMO8FSD4tdA3ZwD
	 b//PoQ1+JBTqNc8/BQoGWVTtbwMGDL5tIX2wThYLfPvD2FCWcAjgLHQGIs/iH5ZQYhAti
	 lZ9Vu0q2mKHC+G0Nzt/NJCW8yVjoVHxagwuIhBdORsMIpmtb42XyWGYNjVU+gB4ZHi/sz
	 Hsun0pf0l8MmEWJKQtt00YWJNb9rQnmlDIM/rjwf+8a1pEX9oP/V+oWQBpoxXZkZ8dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815747;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-TM-AS-Product-Ver:X-TM-AS-Result:
	 X-TMASE-MatchedRID:X-TM-AS-User-Approved-Sender:
	 X-TM-AS-User-Blocked-Sender:X-TMASE-Result:X-TMASE-Version:
	 X-TM-SNTS-SMTP;
	bh=RakCbxOqAGzATvq0KP92dmH80GhwpdUL9JS9vHuHr2o=;
	b=Hpsl0qi2gQ/QfvZBmnQJ9awzenptc7gLnvFB+gCw22k1EtoNyZNYFL1TWbp4HzPcoTUp
	 ABXzGSCPexEE9JvNmByXLh4z002pf43fun2LQtS1uFRUyhYxWta5ppruHh6snYBXdQ5u4
	 Ba8kA3RtFR44AgNr2DAmtTHOkF31CZ9f8jVK+61QbLEaoxGzgWpGPGYP+jiNOV1muJEN+
	 vEzvTEOupkAC6ahOFhyV7S8zUuiSNFv7DCCchq8DLIihGYBXO2H4nJ5fXrIt0s3On20OB
	 Izjdm6FBQN2pU02fw7uDcm6GufLln3h2J+vWt/MmWibQaPSW7HRw6/xblDsC/Awuj3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmedia.com.tw;
	spf=pass smtp.mailfrom=asmedia.com.tw;
	dkim=pass header.d=asmedia.com.tw header.i=@asmedia.com.tw header.a=rsa-sha256 header.s=asmediacomtw header.b=QT5lewDS;
	arc=none smtp.remote-ip=103.10.4.13
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE56C606A31C;
	Mon, 16 Nov 2026 07:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE56C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=asmedia.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmedia.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=asmedia.com.tw header.i=@asmedia.com.tw header.a=rsa-sha256 header.s=asmediacomtw header.b=QT5lewDS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1794815746; x=1826351746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fC6lJLf6T4qRxV1peHv4L3F61CzutIPq4kyaA99JrKY=;
  b=QT5lewDSI7Bq1QAT1Gs8LrCdGIbes0SIdY9l41rpz53McbSs4VH96+K7
   1i5dmIOgoVtEd3LOgYqfxHAVgSuVpQ7bfvGp1UDKPuAVcUYvR5ZY5o4Hc
   2LxpRoJLl/HrFPxogssVn9tTaeufmtv75wgjzdahEHEN5sT2WerOeLGMY
   k=;
X-CSE-ConnectionGUID: iyq1UHHhTf+kQp7FoZcE2Q==
X-CSE-MsgGUID: L8JCZ6KqSyGGZ4atU+6kQw==
Received: from unknown (HELO APZA006TMD.corpnet.asus) ([172.22.47.66])
  by ms.asus.com with ESMTP; 16 Nov 2026 15:55:37 +0800
Received: from mymail.asus.com (42.70.154.76) by APZA006TMD.corpnet.asus
 (172.22.47.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 15:55:35 +0800
From: Szuying Chen <Chloe_Chen@asmedia.com.tw>
To: <linusw@kernel.org>, <Markus.Elfring@web.de>,
	<linux-gpio@vger.kernel.org>, <brgl@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <Yd_Tseng@asmedia.com.tw>, <Jesse1_Chang@asmedia.com.tw>,
	<Richard_Hsu@asmedia.com.tw>, Szuying Chen <Chloe_Chen@asmedia.com.tw>
Subject: [PATCH v4] gpio: amdptpci: add support for AMD PT PCI controller
Date: Mon, 16 Nov 2026 15:55:10 +0800
Message-ID: <20261116075510.5722-1-Chloe_Chen@asmedia.com.tw>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: APZA001EXB.corpnet.asus (172.22.6.13) To
 APZA006TMD.corpnet.asus (172.22.47.66)
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-30322.005
X-TM-AS-Result: No-10--18.398000-8.000000
X-TMASE-MatchedRID: DZy/h5Q5bnaDE1gnwKWGushQ2ZMNvRp3yeAmy1uygLnlbwjdfEVENL+I
	ScJnXnqYcuWpm6G6Xunma/wXZpfjXgUTW+/SpSPA8RcXD+rQ7sGVmuhG06IIbR2IiA+FjjsSfw5
	/fdoSsJAsee3t7Xiv0ZmPFncaNP40zbGNfvmor4uxkiMlzRAr9tUusl/JVaRNLzJeA+juOa97Fv
	XZkVFxTXN522A3sEqcsen66SRX/zDT2djP7DKoDlJTtM6CHKVOgdXztqOEBnDUT3WVd+NuWY4Y1
	WPFQTbuW3Mg6JEjAQvlIUH50w0kkFY5TNRuqCD9ftn7iRH3dJbn0oaU6WM++xe4W0jxFAx5EJqz
	YPg/Da1n626sce8NRCVOh4fIkrxLtROtYKpzzi+fvSRjnTlyXQeATH6uEs3iAPyBWRTHJF8pLDU
	L8+uTozkpaYe499FmzbzzaXKaJ0hhJE+esG8VForuruLIWfnx10/soz7yB7FUfXNliEJyIzYz/e
	cf2e8Pw+n9MA1496TjdzjfEBbCgh1QZA7Oi95Fn44P8x8zBokGAyO8UPwf/V810k8HvA7WY3PfS
	mNBHfKjg0lrtKMWyiT/9g75F2ivWjsaYI4lh3VVdLcIC34PGIs3wSS0wttw6QLge8Tcpn0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.398000-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-30322.005
X-TM-SNTS-SMTP:
	B271256219553582DCAC9BFAE28803788670DFD0170F582BA91CD214B2A15DE32000:8

The GPIO controller on AMD PT PCI platforms currently has no in-tree
driver, so its pins cannot be used from Linux.

The existing gpio-amdpt driver cannot be reused. Setting aside ACPI
vs. PCI probing, the hardware differs significantly:

 - Register semantics conflict: offset 0x0C controls the clock rate
   in gpio-amdpt but enables interrupts in this controller.
 - Interrupt controller: gpio-amdpt has no interrupt support, while
   this controller has its own INT_LVL, INT_STAT and INT_MASK
   registers that require a full irq_chip implementation.
 - Wakeup: this controller can wake the system from GPIO interrupts,
   which gpio-amdpt does not support.

Only the basic data registers are common, and they are handled
through gpio-generic, so little code is left to share.

Add the gpio-amdptpci driver to support the GPIO functionality on
AMD PT PCI platforms.

Co-developed-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
---
V3->V4:
	-Kconfig: select GPIO_GENERIC & GPIO_GPIOLIB_IRQCHIP.
	-Use Chip->gen.lock for all register accesses.
	-Keep the controller in D0 while a GPIO IRQ is requested.
	-prode: reorder devres for a safe unbind sequence.
	-Fix build error.
V2->V3:
	- Rework the driver to use gpio-generic.
	- Move runtime PM handling to gpio_chip request() and
	free() callbacks.
	- Simplify locking with guard() and scoped_guard().
	- Use devm_add_action_or_reset() for resource cleanup.
	- Add rationale for a separate driver to the commit message.
	- Regmap was evaluated but not used: the registers are mix of
	8/16/32 bit and it would need more callbacks to define, which
	complicates the code.
v1->v2:
	- Add .irq_request/release_resources to set irq_pm_held flag.
	- switch to devres in probe/remove.
	- Add synchronize_irq().
---
 drivers/gpio/Kconfig         |   8 +
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-amdptpci.c | 634 +++++++++++++++++++++++++++++++++++
 3 files changed, 643 insertions(+)
 create mode 100644 drivers/gpio/gpio-amdptpci.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..a10e96b5295f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1833,6 +1833,14 @@ endmenu
 menu "PCI GPIO expanders"
 	depends on PCI

+config GPIO_AMDPTPCI
+	tristate "AMD Promontory PCI GPIO support"
+	depends on X86
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Driver for Promontory IOHub PCI GPIO functionality.
+
 config GPIO_AMD8111
 	tristate "AMD 8111 GPIO driver"
 	depends on X86 || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5b..ca26e98fc8e8 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_GPIO_ALTERA)  		+= gpio-altera.o
 obj-$(CONFIG_GPIO_AMD8111)		+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_AMD_FCH)		+= gpio-amd-fch.o
 obj-$(CONFIG_GPIO_AMDPT)		+= gpio-amdpt.o
+obj-$(CONFIG_GPIO_AMDPTPCI)		+= gpio-amdptpci.o
 obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
 obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
 obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+= gpio-aspeed-sgpio.o
diff --git a/drivers/gpio/gpio-amdptpci.c b/drivers/gpio/gpio-amdptpci.c
new file mode 100644
index 000000000000..d676fd8c0b1c
--- /dev/null
+++ b/drivers/gpio/gpio-amdptpci.c
@@ -0,0 +1,634 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * gpio-amdptpci.c - AMD Promontory PCI GPIO Controller Driver
+ *
+ * Copyright (C) 2026 ASMedia Technology Inc.
+ * Author:	Chloe Chen <chloe_chen@asmedia.com.tw>
+ *		YD Tseng <yd_tseng@asmedia.com.tw>
+ */
+
+#include <linux/bits.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_wakeup.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define PT27_NUM_GPIOS          24
+#define PT27_WAKE_GPIOS         12
+#define PT27_GPIO_MASK          GENMASK(PT27_NUM_GPIOS - 1, 0)
+#define PT27_WAKE_MASK          GENMASK(PT27_WAKE_GPIOS - 1, 0)
+
+#define PT27_REG_DIR            0x0000
+#define PT27_REG_IN             0x0004
+#define PT27_REG_OUT            0x0008
+#define PT27_REG_INT_EN         0x000C
+#define PT27_REG_INT_LVL        0x0010
+#define PT27_REG_INT_MODE0      0x0014
+#define PT27_REG_INT_MODE1      0x0018
+#define PT27_REG_INT_STAT       0x001C
+#define PT27_REG_INT_MASK       0x0020
+#define PT27_REG_INT_CTL        0x0024
+
+#define PT27_REG_WAKE_EN        0x0034
+#define PT27_REG_WAKE_LVL       0x0036
+#define PT27_REG_WAKE_MODE      0x0038
+#define PT27_REG_WAKE_STAT      0x003A
+
+#define PT27_INT_MODE_MASK      0x3U
+#define PT27_MODE_LEVEL         0x0U
+#define PT27_MODE_RISING        0x1U
+#define PT27_MODE_FALLING       0x2U
+#define PT27_MODE_BOTH          0x3U
+
+#define PT27_INT_CTL_MODE       BIT(0)
+#define PT27_INT_CTL_PAD_EN     BIT(2)
+
+#define PT27_AUTOSUSPEND_DELAY_MS   2000
+
+struct pt27_saved_regs {
+	u32 dir;
+	u32 out;
+	u32 int_en;
+	u32 int_lvl;
+	u32 int_mode0;
+	u16 int_mode1;
+	u32 int_mask;
+	u8  int_ctl;
+	u16 wake_en;
+	u16 wake_lvl;
+	u16 wake_mode;
+};
+
+struct pt27_gpio {
+	struct device				*dev;
+	struct gpio_generic_chip		gen;
+	void __iomem				*base;
+	struct pt27_saved_regs			saved;
+	u16					wake_mask;
+	bool					use_msi;
+	int					irq;
+};
+
+static void pt27_save_regs(struct pt27_gpio *chip)
+{
+	chip->saved.dir       = ioread32(chip->base + PT27_REG_DIR);
+	chip->saved.out       = ioread32(chip->base + PT27_REG_OUT);
+
+	chip->saved.int_en    = ioread32(chip->base + PT27_REG_INT_EN);
+	chip->saved.int_lvl   = ioread32(chip->base + PT27_REG_INT_LVL);
+	chip->saved.int_mode0 = ioread32(chip->base + PT27_REG_INT_MODE0);
+	chip->saved.int_mode1 = ioread16(chip->base + PT27_REG_INT_MODE1);
+	chip->saved.int_mask  = ioread32(chip->base + PT27_REG_INT_MASK);
+	chip->saved.int_ctl   = ioread8(chip->base + PT27_REG_INT_CTL);
+
+	chip->saved.wake_en   = ioread16(chip->base + PT27_REG_WAKE_EN);
+	chip->saved.wake_lvl  = ioread16(chip->base + PT27_REG_WAKE_LVL);
+	chip->saved.wake_mode = ioread16(chip->base + PT27_REG_WAKE_MODE);
+}
+
+static void pt27_restore_regs(struct pt27_gpio *chip)
+{
+	iowrite32(chip->saved.out,       chip->base + PT27_REG_OUT);
+	iowrite32(chip->saved.dir,       chip->base + PT27_REG_DIR);
+
+	iowrite32(chip->saved.int_lvl,   chip->base + PT27_REG_INT_LVL);
+	iowrite32(chip->saved.int_mode0, chip->base + PT27_REG_INT_MODE0);
+	iowrite16(chip->saved.int_mode1, chip->base + PT27_REG_INT_MODE1);
+	iowrite8(chip->saved.int_ctl,    chip->base + PT27_REG_INT_CTL);
+
+	iowrite16(chip->saved.wake_lvl,  chip->base + PT27_REG_WAKE_LVL);
+	iowrite16(chip->saved.wake_mode, chip->base + PT27_REG_WAKE_MODE);
+	iowrite16(chip->saved.wake_en,   chip->base + PT27_REG_WAKE_EN);
+
+	iowrite32(chip->saved.int_en,   chip->base + PT27_REG_INT_EN);
+	iowrite32(chip->saved.int_mask, chip->base + PT27_REG_INT_MASK);
+}
+
+static int pt27_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	int   ret;
+
+	ret = pm_runtime_resume_and_get(gc->parent);
+	if (ret < 0) {
+		dev_err(gc->parent, "%s: cannot resume for GPIO%u: %d\n",  __func__, offset, ret);
+		return ret;
+	}
+	return 0;
+}
+
+static void pt27_gpio_free(struct gpio_chip *gc, unsigned int offset)
+{
+	pm_runtime_put_autosuspend(gc->parent);
+
+}
+
+static int pt27_irq_reqres(struct irq_data *d)
+{
+	struct gpio_chip *gc   = irq_data_get_irq_chip_data(d);
+	int   ret;
+
+	ret = pm_runtime_resume_and_get(gc->parent);
+	if (ret < 0) {
+		dev_err(gc->parent, "%s: Fail to resume controller for IRQ: %d\n",  __func__, ret);
+		return ret;
+	}
+
+	ret = gpiochip_reqres_irq(gc, irqd_to_hwirq(d));
+	if (ret) {
+		pm_runtime_put_autosuspend(gc->parent);
+		return ret;
+	}
+	return 0;
+}
+
+static void pt27_irq_relres(struct irq_data *d)
+{
+	struct gpio_chip *gc   = irq_data_get_irq_chip_data(d);
+
+	gpiochip_relres_irq(gc, irqd_to_hwirq(d));
+	pm_runtime_put_autosuspend(gc->parent);
+}
+
+static void pt27_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc   = irq_data_get_irq_chip_data(d);
+	struct pt27_gpio *chip = gpiochip_get_data(gc);
+	irq_hw_number_t   hwirq = irqd_to_hwirq(d);
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&chip->gen.lock);
+
+	val  = ioread32(chip->base + PT27_REG_INT_MASK);
+	val |= BIT(hwirq);
+	iowrite32(val, chip->base + PT27_REG_INT_MASK);
+
+	val  = ioread32(chip->base + PT27_REG_INT_EN);
+	val &= ~BIT(hwirq);
+	iowrite32(val, chip->base + PT27_REG_INT_EN);
+
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void pt27_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc   = irq_data_get_irq_chip_data(d);
+	struct pt27_gpio *chip = gpiochip_get_data(gc);
+	irq_hw_number_t   hwirq = irqd_to_hwirq(d);
+	u32 val;
+
+	gpiochip_enable_irq(gc, hwirq);
+
+	guard(raw_spinlock_irqsave)(&chip->gen.lock);
+
+	val  = ioread32(chip->base + PT27_REG_INT_EN);
+	val |= BIT(hwirq);
+	iowrite32(val, chip->base + PT27_REG_INT_EN);
+
+	val  = ioread32(chip->base + PT27_REG_INT_MASK);
+	val &= ~BIT(hwirq);
+	iowrite32(val, chip->base + PT27_REG_INT_MASK);
+}
+
+static void pt27_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc   = irq_data_get_irq_chip_data(d);
+	struct pt27_gpio *chip = gpiochip_get_data(gc);
+
+	iowrite32(BIT(irqd_to_hwirq(d)), chip->base + PT27_REG_INT_STAT);
+}
+
+static int pt27_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc   = irq_data_get_irq_chip_data(d);
+	struct pt27_gpio *chip = gpiochip_get_data(gc);
+	irq_hw_number_t   hwirq = irqd_to_hwirq(d);
+	u32 lvl_reg;
+	u8  lvl_bit, mode_val;
+	unsigned int shift;
+
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		lvl_bit = 1;
+		mode_val = PT27_MODE_LEVEL;
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		lvl_bit = 0;
+		mode_val = PT27_MODE_LEVEL;
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		lvl_bit = 1;
+		mode_val = PT27_MODE_RISING;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		lvl_bit = 0;
+		mode_val = PT27_MODE_FALLING;
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		lvl_bit = 0;
+		mode_val = PT27_MODE_BOTH;
+		break;
+
+	default:
+		return -EINVAL;
+
+	}
+
+	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
+		lvl_reg = ioread32(chip->base + PT27_REG_INT_LVL);
+		if (lvl_bit)
+			lvl_reg |= BIT(hwirq);
+		else
+			lvl_reg &= ~BIT(hwirq);
+
+		iowrite32(lvl_reg, chip->base + PT27_REG_INT_LVL);
+
+		if (hwirq < 16) {
+			u32 reg = ioread32(chip->base + PT27_REG_INT_MODE0);
+
+			shift  = hwirq * 2;
+			reg   &= ~(PT27_INT_MODE_MASK << shift);
+			reg   |= ((u32)mode_val << shift);
+			iowrite32(reg, chip->base + PT27_REG_INT_MODE0);
+		} else {
+			u16 reg = ioread16(chip->base + PT27_REG_INT_MODE1);
+
+			shift  = (hwirq - 16) * 2;
+			reg   &= ~((u16)(PT27_INT_MODE_MASK << shift));
+			reg   |= (u16)((u16)mode_val << shift);
+			iowrite16(reg, chip->base + PT27_REG_INT_MODE1);
+		}
+
+		iowrite32(BIT(hwirq), chip->base + PT27_REG_INT_STAT);
+
+	}
+
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(d, handle_level_irq);
+	else
+		irq_set_handler_locked(d, handle_edge_irq);
+
+	return 0;
+}
+
+static int pt27_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct gpio_chip *gc   = irq_data_get_irq_chip_data(d);
+	struct pt27_gpio *chip = gpiochip_get_data(gc);
+	irq_hw_number_t   hwirq = irqd_to_hwirq(d);
+	unsigned int trig = irqd_get_trigger_type(d);
+	u16     wake_en, wake_lvl, wake_mode;
+
+	if (hwirq >= PT27_WAKE_GPIOS) {
+		dev_dbg(chip->dev, "%s: GPIO%lu does not support wake (max GPIO%u)\n", __func__, hwirq, PT27_WAKE_GPIOS - 1);
+		return -EINVAL;
+	}
+
+	if (on && trig == IRQ_TYPE_NONE)
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&chip->gen.lock);
+
+	wake_en   = ioread16(chip->base + PT27_REG_WAKE_EN);
+	wake_lvl  = ioread16(chip->base + PT27_REG_WAKE_LVL);
+	wake_mode = ioread16(chip->base + PT27_REG_WAKE_MODE);
+
+	if (on) {
+		wake_en |= BIT(hwirq);
+		chip->wake_mask |= (u16)BIT(hwirq);
+
+		if (trig & IRQ_TYPE_LEVEL_MASK) {
+			wake_mode |= BIT(hwirq);
+			if (trig == IRQ_TYPE_LEVEL_HIGH)
+				wake_lvl |= BIT(hwirq);
+			else
+				wake_lvl &= ~BIT(hwirq);
+		} else {
+			wake_mode &= ~BIT(hwirq);
+			if (trig == IRQ_TYPE_EDGE_RISING ||
+			    trig == IRQ_TYPE_EDGE_BOTH)
+				wake_lvl |= BIT(hwirq);
+			else
+				wake_lvl &= ~BIT(hwirq);
+		}
+	} else {
+		wake_en &= ~BIT(hwirq);
+		chip->wake_mask &= ~(u16)BIT(hwirq);
+	}
+
+	iowrite16(wake_lvl,  chip->base + PT27_REG_WAKE_LVL);
+	iowrite16(wake_mode, chip->base + PT27_REG_WAKE_MODE);
+	iowrite16(wake_en,   chip->base + PT27_REG_WAKE_EN);
+
+	return 0;
+}
+
+static const struct irq_chip pt27_gpio_irq_chip = {
+	.name					= "pt27_gpio",
+	.irq_ack				= pt27_irq_ack,
+	.irq_mask				= pt27_irq_mask,
+	.irq_unmask				= pt27_irq_unmask,
+	.irq_set_type				= pt27_irq_set_type,
+	.irq_set_wake				= pt27_irq_set_wake,
+	.irq_request_resources			= pt27_irq_reqres,
+	.irq_release_resources			= pt27_irq_relres,
+	.flags					= IRQCHIP_IMMUTABLE,
+};
+
+static irqreturn_t pt27_gpio_isr(int irq, void *data)
+{
+	struct pt27_gpio *chip = data;
+	irqreturn_t ret = IRQ_NONE;
+	unsigned long pending;
+
+	if (pm_runtime_get_if_in_use(chip->dev) <= 0)
+		return IRQ_NONE;
+
+	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
+	    pending =  ioread32(chip->base + PT27_REG_INT_STAT) &
+			~ioread32(chip->base + PT27_REG_INT_MASK) &
+			ioread32(chip->base + PT27_REG_INT_EN);
+	}
+
+	while (pending) {
+		unsigned int hwirq = __ffs(pending);
+
+		pending &= ~BIT(hwirq);
+		ret = IRQ_HANDLED;
+
+		if (generic_handle_domain_irq(chip->gen.gc.irq.domain, hwirq)) {
+
+			dev_warn_ratelimited(chip->dev, "unhandled GPIO%u IRQ, masking\n", hwirq);
+
+			guard(raw_spinlock_irqsave)(&chip->gen.lock);
+			iowrite32(ioread32(chip->base + PT27_REG_INT_MASK) | BIT(hwirq), chip->base + PT27_REG_INT_MASK);
+			iowrite32(ioread32(chip->base + PT27_REG_INT_EN) & ~BIT(hwirq), chip->base + PT27_REG_INT_EN);
+			iowrite32(BIT(hwirq), chip->base + PT27_REG_INT_STAT);
+		}
+	}
+
+	pm_runtime_put(chip->dev);
+	return ret;
+}
+
+static void pt27_hw_clear(void *data)
+{
+	struct pt27_gpio *chip = data;
+
+	iowrite32(0, chip->base + PT27_REG_INT_EN);
+	iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_MASK);
+	iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_STAT);
+	iowrite16(0, chip->base + PT27_REG_WAKE_EN);
+	iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
+}
+
+static void pt27_hw_init(struct pt27_gpio *chip)
+{
+	u8 int_ctl;
+
+	int_ctl  = ioread8(chip->base + PT27_REG_INT_CTL);
+	int_ctl |=  PT27_INT_CTL_MODE;
+	int_ctl &= ~PT27_INT_CTL_PAD_EN;
+	iowrite8(int_ctl, chip->base + PT27_REG_INT_CTL);
+
+	pt27_hw_clear(chip);
+}
+
+static int pt27_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_generic_chip_config config = { };
+	struct pt27_gpio *chip;
+	struct gpio_chip *gc;
+	struct gpio_irq_chip *girq;
+	unsigned long irq_flags;
+	int ret;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = dev;
+	pci_set_drvdata(pdev, chip);
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PCI device\n");
+
+	chip->base = pcim_iomap_region(pdev, 0, "pt27_gpio");
+	if (IS_ERR(chip->base))
+		return dev_err_probe(dev, PTR_ERR(chip->base), "failed to claim and map BAR0\n");
+
+	pci_set_master(pdev);
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to allocate IRQ vector\n");
+
+	chip->use_msi = pdev->msi_enabled || pdev->msix_enabled;
+	irq_flags     = chip->use_msi ? 0 : IRQF_SHARED;
+	chip->irq     = pci_irq_vector(pdev, 0);
+
+	pt27_hw_init(chip);
+
+	config.dev	= dev;
+	config.sz	= 4;
+	config.dat	= chip->base + PT27_REG_IN;
+	config.set	= chip->base + PT27_REG_OUT;
+	config.dirout	= chip->base + PT27_REG_DIR;
+	config.flags	= GPIO_GENERIC_READ_OUTPUT_REG_SET;
+
+	ret = gpio_generic_chip_init(&chip->gen, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "generic chip init failed\n");
+
+	gc = &chip->gen.gc;
+	gc->label     = dev_name(dev);
+	gc->parent    = dev;
+	gc->owner     = THIS_MODULE;
+	gc->base      = -1;
+	gc->ngpio     = PT27_NUM_GPIOS;
+	gc->request   = pt27_gpio_request;
+	gc->free      = pt27_gpio_free;
+
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &pt27_gpio_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents    = 0;
+	girq->parents        = NULL;
+	girq->default_type   = IRQ_TYPE_NONE;
+	girq->handler        = handle_bad_irq;
+
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable wake capability\n");
+
+	dev_pm_set_driver_flags(dev, DPM_FLAG_SMART_SUSPEND);
+
+	pm_runtime_set_autosuspend_delay(dev, PT27_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+
+	ret = devm_request_irq(dev, chip->irq, pt27_gpio_isr,
+			       irq_flags | IRQF_NO_THREAD, dev_name(dev), chip);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to request IRQ %d\n", chip->irq);
+		goto err_pm_disable;
+	}
+
+	ret = devm_add_action_or_reset(dev, pt27_hw_clear, chip);
+	if (ret)
+		goto err_pm_disable;
+
+	ret = devm_gpiochip_add_data(dev, gc, chip);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register GPIO chip\n");
+		goto err_pm_disable;
+	}
+
+	dev_info(dev,
+		 "PT27 GPIO controller: %u GPIOs (%u wake-capable), IRQ=%d (%s)\n",
+		 PT27_NUM_GPIOS, PT27_WAKE_GPIOS, chip->irq,
+		 chip->use_msi ? (pdev->msix_enabled ? "MSI-X" : "MSI") : "INTx");
+
+	pm_runtime_put_noidle(dev);
+	pm_runtime_allow(dev);
+	return 0;
+
+err_pm_disable:
+	pm_runtime_dont_use_autosuspend(dev);
+	return ret;
+}
+
+static void pt27_gpio_remove(struct pci_dev *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_forbid(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+
+}
+
+static int __maybe_unused pt27_gpio_suspend(struct device *dev)
+{
+	struct pt27_gpio *chip = dev_get_drvdata(dev);
+
+	if (pm_runtime_status_suspended(dev)) {
+		dev_dbg(dev, "%s: already runtime-suspended, skipping save\n", __func__);
+		return 0;
+	}
+
+	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
+		pt27_save_regs(chip);
+		iowrite32(0, chip->base + PT27_REG_INT_EN);
+		iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_MASK);
+		iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_STAT);
+
+	if (!device_may_wakeup(dev))
+		iowrite16(0, chip->base + PT27_REG_WAKE_EN);
+
+		iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
+	}
+
+	synchronize_irq(chip->irq);
+	return 0;
+}
+
+static int __maybe_unused pt27_gpio_resume(struct device *dev)
+{
+	struct pt27_gpio *chip = dev_get_drvdata(dev);
+	unsigned long replay;
+	unsigned int hwirq;
+	u16 wake_status;
+
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
+		wake_status = ioread16(chip->base + PT27_REG_WAKE_STAT) & PT27_WAKE_MASK;
+		iowrite16(wake_status, chip->base + PT27_REG_WAKE_STAT);
+		pt27_restore_regs(chip);
+
+		replay = wake_status &
+			 ioread32(chip->base + PT27_REG_INT_EN) &
+			 ~ioread32(chip->base + PT27_REG_INT_MASK);
+	}
+
+	if (!wake_status)
+		return 0;
+
+	pm_wakeup_event(dev, 0);
+
+	for_each_set_bit(hwirq, &replay, PT27_WAKE_GPIOS)
+		generic_handle_domain_irq_safe(chip->gen.gc.irq.domain, hwirq);
+
+	return 0;
+}
+
+static int __maybe_unused pt27_gpio_runtime_suspend(struct device *dev)
+{
+	struct pt27_gpio *chip = dev_get_drvdata(dev);
+	int ret = 0;
+
+	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
+
+		if (chip->wake_mask && !device_may_wakeup(dev)) {
+			ret = -EBUSY;
+		} else {
+			pt27_save_regs(chip);
+			iowrite32(0, chip->base + PT27_REG_INT_EN);
+			iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_MASK);
+			iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_STAT);
+			iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
+		}
+	}
+
+	if (ret)
+		return ret;
+
+	synchronize_irq(chip->irq);
+	return 0;
+}
+
+static int __maybe_unused pt27_gpio_runtime_resume(struct device *dev)
+{
+	return pt27_gpio_resume(dev);
+}
+
+static const struct dev_pm_ops pt27_gpio_pm_ops __maybe_unused = {
+	SYSTEM_SLEEP_PM_OPS(pt27_gpio_suspend, pt27_gpio_resume)
+	RUNTIME_PM_OPS(pt27_gpio_runtime_suspend, pt27_gpio_runtime_resume, NULL)
+};
+
+#define PCI_DEVICE_ID_PT27	0x444b
+
+static const struct pci_device_id pt27_gpio_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_PT27) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, pt27_gpio_pci_ids);
+
+static struct pci_driver pt27_gpio_pci_driver = {
+	.name     = "ptpci-gpio",
+	.id_table = pt27_gpio_pci_ids,
+	.probe    = pt27_gpio_probe,
+	.remove   = pt27_gpio_remove,
+	.driver   = {
+		.pm = pm_ptr(&pt27_gpio_pm_ops),
+	},
+};
+
+module_pci_driver(pt27_gpio_pci_driver);
+
+MODULE_DESCRIPTION("AMD Promontory PCI GPIO Driver");
+MODULE_LICENSE("GPL");
--
2.48.1

