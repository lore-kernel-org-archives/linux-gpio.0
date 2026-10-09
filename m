Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606254BF94B;
	Fri,  9 Oct 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543580; cv=none; b=k8w+YEMnMQHeMvB15AKU1B3RIgTuoaLRewKvcdFpjyGCup43m6HqV1HsWK88fkB5Lt53tPBlAKxjQSaG//cAcaJtT98NYMlFSxHr9VH0jwU1JUph3mInLbuMwykWCrIuCFGArUDeBihuJmRNf+hxJJeNNfw//c2409o7NdizXLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543580; c=relaxed/simple;
	bh=qiC8yz3VdJvfh9q2ordZREvCdfEfNSZ3b8DH8vjpEEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyalvjqzH5TbI+RBtay7fQEvWEL7rM1uShAcmiSL41XRsb+ZCiVSTIN7xDeGCjBcEdjhGRpSDPgpm6p5NNWql5LhTNhRXSE/nFUK9G228GzuEe9j16q2OGtUg5XIKRxJms1+zrMuVG6G0PNKEIVBGsMGOrhMFm5f4f2FdkuAuWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeFFhUo+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeFFhUo+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD993C4AF09;
	Fri,  9 Oct 2026 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543580;
	bh=qiC8yz3VdJvfh9q2ordZREvCdfEfNSZ3b8DH8vjpEEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AeFFhUo+r0Y5Jy3bBEtzVBjo1gHiyaw3pKxmDM11LXq8Ki2g1dE2fUUKzpdcfDrUf
	 Jp2pAXy2o/r3lnt6zSenOl071BoZmgecO9CnSELGhnyVPKhWmKiTl868cHTruZ4KGF
	 exMIesyfGCYplQDkak45PlEfPff9NOpauoDJIiX0RdNML1M6E292XoecS7ped1ceH8
	 kz5PkCo5Jw+GzkVX9i+4lGj0htLktTY4cBiC0yOTULvQynZOS5jbcKa0d7J69Febo+
	 laTCYQ0tASKx/6+DfGtnyKNsxcGgVc+Nfl2TNrq8JN4Q+w64rb8A5oEgEAdmDtRbx1
	 rumAXzY69raqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F70CA6012;
	Fri,  9 Oct 2026 10:59:39 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 09 Oct 2026 18:57:56 +0800
Subject: [PATCH 3/7] gpio: pl061: convert register access to regmap
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-cv75-gpio-v1-3-5836bd438423@ambarella.com>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
In-Reply-To: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Chanho Min <chanho.min@lge.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543577; l=11243;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=XMFTVtJUNA96nDs0rfg3yvJhBxsSqFJUZFFztu3rL6E=;
 b=4qJXPryLLctjWHrYxH/6IlLFt0/Y3vIJAYpIbPLaaC5zcIRiwgqRcr54gXlX+5U2cqgq/EXVO
 PeZPYLDWqhMCs1hSjWPHDFNFmpEBc7G5oV3/UAmEtR91/P5y5rgjBl3
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Replace readb()/writeb() with a MMIO regmap while keeping the existing
gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
under the irq descriptor lock.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Tested-by: Chanho Min <chanho.min@lge.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/Kconfig      |   1 +
 drivers/gpio/gpio-pl061.c | 135 ++++++++++++++++++++++++++++++----------------
 2 files changed, 90 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f03c05288376..2a1487bd1a94 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -583,6 +583,7 @@ config GPIO_PL061
 	depends on ARM_AMBA || COMPILE_TEST
 	select IRQ_DOMAIN
 	select GPIOLIB_IRQCHIP
+	select REGMAP_MMIO
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device.
 
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590..2b1e23fdb7d7 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -19,9 +19,11 @@
 #include <linux/ioport.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
+#include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -36,6 +38,7 @@
 #define GPIOIC  0x41C
 
 #define PL061_GPIO_NR	8
+#define PL061_DATA_OFFSET	2
 
 struct pl061_context_save_regs {
 	u8 gpio_data;
@@ -49,18 +52,51 @@ struct pl061_context_save_regs {
 struct pl061 {
 	raw_spinlock_t		lock;
 
-	void __iomem		*base;
+	struct regmap		*regmap;
 	struct gpio_chip	gc;
 	int			parent_irq;
 
 	struct pl061_context_save_regs csave_regs;
 };
 
+static bool pl061_is_data_reg(unsigned int reg)
+{
+	return is_power_of_2(reg) &&
+	       reg >= BIT(PL061_DATA_OFFSET) &&
+	       reg <= BIT(PL061_DATA_OFFSET + PL061_GPIO_NR - 1);
+}
+
+static bool pl061_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case GPIOMIS:
+	case GPIOIC:
+		return true;
+	default:
+		return pl061_is_data_reg(reg);
+	}
+}
+
+static const struct regmap_config pl061_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.reg_stride = 4,
+	.max_register = GPIOIC,
+	.volatile_reg = pl061_volatile_reg,
+	.fast_io = true,
+	.use_raw_spinlock = true,
+};
+
 static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
+	int ret;
+
+	ret = regmap_test_bits(pl061->regmap, GPIODIR, BIT(offset));
+	if (ret < 0)
+		return ret;
 
-	if (readb(pl061->base + GPIODIR) & BIT(offset))
+	if (ret)
 		return GPIO_LINE_DIRECTION_OUT;
 
 	return GPIO_LINE_DIRECTION_IN;
@@ -70,12 +106,9 @@ static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	unsigned long flags;
-	unsigned char gpiodir;
 
 	raw_spin_lock_irqsave(&pl061->lock, flags);
-	gpiodir = readb(pl061->base + GPIODIR);
-	gpiodir &= ~(BIT(offset));
-	writeb(gpiodir, pl061->base + GPIODIR);
+	regmap_clear_bits(pl061->regmap, GPIODIR, BIT(offset));
 	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
 	return 0;
@@ -86,19 +119,19 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	unsigned long flags;
-	unsigned char gpiodir;
+	unsigned int mask = BIT(offset);
 
 	raw_spin_lock_irqsave(&pl061->lock, flags);
-	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
-	gpiodir = readb(pl061->base + GPIODIR);
-	gpiodir |= BIT(offset);
-	writeb(gpiodir, pl061->base + GPIODIR);
+	regmap_write(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
+		     !!value << offset);
+	regmap_set_bits(pl061->regmap, GPIODIR, mask);
 
 	/*
 	 * gpio value is set again, because pl061 doesn't allow to set value of
 	 * a gpio pin before configuring it in OUT mode.
 	 */
-	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
+	regmap_write(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
+		     !!value << offset);
 	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
 	return 0;
@@ -108,14 +141,17 @@ static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
-	return !!readb(pl061->base + (BIT(offset + 2)));
+	return regmap_test_bits(pl061->regmap,
+				BIT(offset + PL061_DATA_OFFSET),
+				BIT(offset));
 }
 
 static int pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
-	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
+	regmap_write(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
+		     !!value << offset);
 
 	return 0;
 }
@@ -126,8 +162,8 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(d);
 	unsigned long flags;
-	u8 gpiois, gpioibe, gpioiev;
-	u8 bit = BIT(offset);
+	unsigned int gpiois = 0, gpioibe = 0, gpioiev = 0;
+	unsigned int bit = BIT(offset);
 
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
@@ -145,9 +181,9 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 
 	raw_spin_lock_irqsave(&pl061->lock, flags);
 
-	gpioiev = readb(pl061->base + GPIOIEV);
-	gpiois = readb(pl061->base + GPIOIS);
-	gpioibe = readb(pl061->base + GPIOIBE);
+	regmap_read(pl061->regmap, GPIOIEV, &gpioiev);
+	regmap_read(pl061->regmap, GPIOIS, &gpiois);
+	regmap_read(pl061->regmap, GPIOIBE, &gpioibe);
 
 	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
@@ -199,9 +235,9 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			 offset);
 	}
 
-	writeb(gpiois, pl061->base + GPIOIS);
-	writeb(gpioibe, pl061->base + GPIOIBE);
-	writeb(gpioiev, pl061->base + GPIOIEV);
+	regmap_write(pl061->regmap, GPIOIS, gpiois);
+	regmap_write(pl061->regmap, GPIOIBE, gpioibe);
+	regmap_write(pl061->regmap, GPIOIEV, gpioiev);
 
 	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
@@ -211,6 +247,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 static void pl061_irq_handler(struct irq_desc *desc)
 {
 	unsigned long pending;
+	unsigned int mis = 0;
 	int offset;
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct pl061 *pl061 = gpiochip_get_data(gc);
@@ -218,8 +255,9 @@ static void pl061_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(irqchip, desc);
 
-	pending = readb(pl061->base + GPIOMIS);
-	if (pending) {
+	regmap_read(pl061->regmap, GPIOMIS, &mis);
+	if (mis) {
+		pending = mis;
 		for_each_set_bit(offset, &pending, PL061_GPIO_NR)
 			generic_handle_domain_irq(gc->irq.domain,
 						  offset);
@@ -233,11 +271,9 @@ static void pl061_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
-	u8 gpioie;
 
 	raw_spin_lock(&pl061->lock);
-	gpioie = readb(pl061->base + GPIOIE) & ~mask;
-	writeb(gpioie, pl061->base + GPIOIE);
+	regmap_clear_bits(pl061->regmap, GPIOIE, mask);
 	raw_spin_unlock(&pl061->lock);
 
 	gpiochip_disable_irq(gc, d->hwirq);
@@ -248,13 +284,11 @@ static void pl061_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
-	u8 gpioie;
 
 	gpiochip_enable_irq(gc, d->hwirq);
 
 	raw_spin_lock(&pl061->lock);
-	gpioie = readb(pl061->base + GPIOIE) | mask;
-	writeb(gpioie, pl061->base + GPIOIE);
+	regmap_set_bits(pl061->regmap, GPIOIE, mask);
 	raw_spin_unlock(&pl061->lock);
 }
 
@@ -272,9 +306,7 @@ static void pl061_irq_ack(struct irq_data *d)
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 
-	raw_spin_lock(&pl061->lock);
-	writeb(mask, pl061->base + GPIOIC);
-	raw_spin_unlock(&pl061->lock);
+	regmap_write(pl061->regmap, GPIOIC, mask);
 }
 
 static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
@@ -308,15 +340,20 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	struct device *dev = &adev->dev;
 	struct pl061 *pl061;
 	struct gpio_irq_chip *girq;
+	void __iomem *base;
 	int ret, irq;
 
 	pl061 = devm_kzalloc(dev, sizeof(*pl061), GFP_KERNEL);
 	if (pl061 == NULL)
 		return -ENOMEM;
 
-	pl061->base = devm_ioremap_resource(dev, &adev->res);
-	if (IS_ERR(pl061->base))
-		return PTR_ERR(pl061->base);
+	base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	pl061->regmap = devm_regmap_init_mmio(dev, base, &pl061_regmap_config);
+	if (IS_ERR(pl061->regmap))
+		return PTR_ERR(pl061->regmap);
 
 	raw_spin_lock_init(&pl061->lock);
 	pl061->gc.request = gpiochip_generic_request;
@@ -335,7 +372,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	/*
 	 * irq_chip support
 	 */
-	writeb(0, pl061->base + GPIOIE); /* disable irqs */
+	regmap_write(pl061->regmap, GPIOIE, 0); /* disable irqs */
 	irq = adev->irq[0];
 	if (!irq)
 		dev_warn(&adev->dev, "IRQ support disabled\n");
@@ -366,14 +403,20 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 static int pl061_suspend(struct device *dev)
 {
 	struct pl061 *pl061 = dev_get_drvdata(dev);
+	unsigned int val = 0;
 	int offset;
 
 	pl061->csave_regs.gpio_data = 0;
-	pl061->csave_regs.gpio_dir = readb(pl061->base + GPIODIR);
-	pl061->csave_regs.gpio_is = readb(pl061->base + GPIOIS);
-	pl061->csave_regs.gpio_ibe = readb(pl061->base + GPIOIBE);
-	pl061->csave_regs.gpio_iev = readb(pl061->base + GPIOIEV);
-	pl061->csave_regs.gpio_ie = readb(pl061->base + GPIOIE);
+	regmap_read(pl061->regmap, GPIODIR, &val);
+	pl061->csave_regs.gpio_dir = val;
+	regmap_read(pl061->regmap, GPIOIS, &val);
+	pl061->csave_regs.gpio_is = val;
+	regmap_read(pl061->regmap, GPIOIBE, &val);
+	pl061->csave_regs.gpio_ibe = val;
+	regmap_read(pl061->regmap, GPIOIEV, &val);
+	pl061->csave_regs.gpio_iev = val;
+	regmap_read(pl061->regmap, GPIOIE, &val);
+	pl061->csave_regs.gpio_ie = val;
 
 	for (offset = 0; offset < PL061_GPIO_NR; offset++) {
 		if (pl061->csave_regs.gpio_dir & (BIT(offset)))
@@ -398,10 +441,10 @@ static int pl061_resume(struct device *dev)
 			pl061_direction_input(&pl061->gc, offset);
 	}
 
-	writeb(pl061->csave_regs.gpio_is, pl061->base + GPIOIS);
-	writeb(pl061->csave_regs.gpio_ibe, pl061->base + GPIOIBE);
-	writeb(pl061->csave_regs.gpio_iev, pl061->base + GPIOIEV);
-	writeb(pl061->csave_regs.gpio_ie, pl061->base + GPIOIE);
+	regmap_write(pl061->regmap, GPIOIS, pl061->csave_regs.gpio_is);
+	regmap_write(pl061->regmap, GPIOIBE, pl061->csave_regs.gpio_ibe);
+	regmap_write(pl061->regmap, GPIOIEV, pl061->csave_regs.gpio_iev);
+	regmap_write(pl061->regmap, GPIOIE, pl061->csave_regs.gpio_ie);
 
 	return 0;
 }

-- 
2.34.1


