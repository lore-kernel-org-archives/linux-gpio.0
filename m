Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A564446EC;
	Tue,  4 Aug 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837634; cv=none; b=ViLlp5l06Bu++QpKYdNQg7reTIBBERIWu2A7/X0Dhmx72D02cELK04RnZM8F7vWafwvCklOOklLEToI2eFP1VOeKXFLkdnYR95abapF70L/JS3cIaX9kd964Li5Ad5oz4oVlN8mwwlinanX2ovWMSAMThjmw96pdF1JHE952iYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837634; c=relaxed/simple;
	bh=OSI0p4IYsahj3xpwmQxjzteg9wplXjq/9qYMa+3h4CU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GEd2058PBHJPrx930UnwBjZ8BFkS94rGZQFktFs4BcHpsQ/YGXcD4BV7qPo0P0Y0+pj97fN/iZ5bFHnnm5gfey5SYOQSEhyY7vl9FlvPLlVQi6zwxE15DR7Qx5tP8IiZyQzOnG6udiKm7gBBju3uA5rJFg0ZuVzB9644uhSxRho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3DUazlq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3DUazlq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785837632; x=1817373632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OSI0p4IYsahj3xpwmQxjzteg9wplXjq/9qYMa+3h4CU=;
  b=A3DUazlqW6VvaE1ZS+g2oh1A0mPadgB3mOoFpnV2L3OrptA7p/ZNr6xq
   3cq1dx0RE7voS21IqSOwH1dLAMJtmnp0YSNH2wNXCt/stDI2ZlmUxcg8w
   qTnbpzMKVFsm+I4OAQchBywjjxs+C4VWq2PDC5ROr14ERoUlNlpu9u+z+
   az8YTK0j5N7VcAVPway/RGZEaQmXGqj56RFjzCdxKCLiYFI6CzmRU0gHA
   zX++XKlCbrhNqEEGkl1RDp6eGWJ6tWYKhtalNXDk6vgwVPIxTO463+9jY
   L1l/Xz8JipsJdwlj0ypONnOhwvaZIUNjy225xOfTJziPOxffCadf86xLW
   Q==;
X-CSE-ConnectionGUID: 5pctjktSTci161k8vZXJow==
X-CSE-MsgGUID: 42HRVBD+QayORnfXHekPsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85515311"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="85515311"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 03:00:31 -0700
X-CSE-ConnectionGUID: 8b8iVbRcQLGsr3MkG4bsRw==
X-CSE-MsgGUID: I03EpEgmThSKr0cJ9bsiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="265717849"
Received: from junjie-desk-dev.bj.intel.com (HELO junjie-desk-dev.tail2c02c1.ts.net) ([10.238.152.71])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 03:00:29 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
	Grant Likely <grant.likely@secretlab.ca>,
	sashiko-reviews@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH] gpio: ml-ioh: share the register lock across channels
Date: Tue,  4 Aug 2026 17:59:35 +0800
Message-ID: <20260804095935.2132215-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLkAjQG7hFsdX+dy8wZUoKKDCaOzMD0EJ0nn3gYmaEOJDw@mail.gmail.com>
References: <CAD++jLkAjQG7hFsdX+dy8wZUoKKDCaOzMD0EJ0nn3gYmaEOJDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suspend and resume hold channel 0's lock while saving and restoring
registers for all eight channels. Code paths using the other seven locks
can therefore run concurrently with PM.

Use one controller-wide lock shared by all channels.

Fixes: b490fa0bf86e ("gpio-ml-ioh: Fix suspend/resume issue")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260731033956.EE6F61F000E9@smtp.kernel.org
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 drivers/gpio/gpio-ml-ioh.c | 69 ++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 0a9d34b7636e..391188c0f2c2 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -73,7 +73,7 @@ struct ioh_gpio_reg_data {
  * @gpio_use_sel:		Save GPIO_USE_SEL1~4 register for PM
  * @ch:				Indicate GPIO channel
  * @irq_base:		Save base of IRQ number for interrupt
- * @spinlock:		Used for register access protection
+ * @spinlock:		Shared register access lock
  */
 struct ioh_gpio {
 	void __iomem *base;
@@ -84,7 +84,12 @@ struct ioh_gpio {
 	u32 gpio_use_sel;
 	int ch;
 	int irq_base;
+	raw_spinlock_t *spinlock;
+};
+
+struct ioh_gpio_device {
 	raw_spinlock_t spinlock;
+	struct ioh_gpio chip[8];
 };
 
 static const int num_ports[] = {6, 12, 16, 16, 15, 16, 16, 12};
@@ -95,7 +100,7 @@ static int ioh_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->spinlock, flags);
+	raw_spin_lock_irqsave(chip->spinlock, flags);
 	reg_val = ioread32(&chip->reg->regs[chip->ch].po);
 	if (val)
 		reg_val |= BIT(nr);
@@ -103,7 +108,7 @@ static int ioh_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 		reg_val &= ~BIT(nr);
 
 	iowrite32(reg_val, &chip->reg->regs[chip->ch].po);
-	raw_spin_unlock_irqrestore(&chip->spinlock, flags);
+	raw_spin_unlock_irqrestore(chip->spinlock, flags);
 
 	return 0;
 }
@@ -123,7 +128,7 @@ static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	u32 reg_val;
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->spinlock, flags);
+	raw_spin_lock_irqsave(chip->spinlock, flags);
 	pm = ioread32(&chip->reg->regs[chip->ch].pm);
 	pm &= BIT(num_ports[chip->ch]) - 1;
 	pm |= BIT(nr);
@@ -136,7 +141,7 @@ static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 		reg_val &= ~BIT(nr);
 	iowrite32(reg_val, &chip->reg->regs[chip->ch].po);
 
-	raw_spin_unlock_irqrestore(&chip->spinlock, flags);
+	raw_spin_unlock_irqrestore(chip->spinlock, flags);
 
 	return 0;
 }
@@ -147,12 +152,12 @@ static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	u32 pm;
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->spinlock, flags);
+	raw_spin_lock_irqsave(chip->spinlock, flags);
 	pm = ioread32(&chip->reg->regs[chip->ch].pm);
 	pm &= BIT(num_ports[chip->ch]) - 1;
 	pm &= ~BIT(nr);
 	iowrite32(pm, &chip->reg->regs[chip->ch].pm);
-	raw_spin_unlock_irqrestore(&chip->spinlock, flags);
+	raw_spin_unlock_irqrestore(chip->spinlock, flags);
 
 	return 0;
 }
@@ -256,7 +261,7 @@ static int ioh_irq_type(struct irq_data *d, unsigned int type)
 	dev_dbg(chip->dev, "%s:irq=%d type=%d ch=%d pos=%d type=%d\n",
 		__func__, irq, type, ch, im_pos, type);
 
-	raw_spin_lock_irqsave(&chip->spinlock, flags);
+	raw_spin_lock_irqsave(chip->spinlock, flags);
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -296,7 +301,7 @@ static int ioh_irq_type(struct irq_data *d, unsigned int type)
 	ien = ioread32(&chip->reg->regs[chip->ch].ien);
 	iowrite32(ien | BIT(ch), &chip->reg->regs[chip->ch].ien);
 end:
-	raw_spin_unlock_irqrestore(&chip->spinlock, flags);
+	raw_spin_unlock_irqrestore(chip->spinlock, flags);
 
 	return 0;
 }
@@ -326,11 +331,11 @@ static void ioh_irq_disable(struct irq_data *d)
 	unsigned long flags;
 	u32 ien;
 
-	raw_spin_lock_irqsave(&chip->spinlock, flags);
+	raw_spin_lock_irqsave(chip->spinlock, flags);
 	ien = ioread32(&chip->reg->regs[chip->ch].ien);
 	ien &= ~BIT(d->irq - chip->irq_base);
 	iowrite32(ien, &chip->reg->regs[chip->ch].ien);
-	raw_spin_unlock_irqrestore(&chip->spinlock, flags);
+	raw_spin_unlock_irqrestore(chip->spinlock, flags);
 }
 
 static void ioh_irq_enable(struct irq_data *d)
@@ -340,11 +345,11 @@ static void ioh_irq_enable(struct irq_data *d)
 	unsigned long flags;
 	u32 ien;
 
-	raw_spin_lock_irqsave(&chip->spinlock, flags);
+	raw_spin_lock_irqsave(chip->spinlock, flags);
 	ien = ioread32(&chip->reg->regs[chip->ch].ien);
 	ien |= BIT(d->irq - chip->irq_base);
 	iowrite32(ien, &chip->reg->regs[chip->ch].ien);
-	raw_spin_unlock_irqrestore(&chip->spinlock, flags);
+	raw_spin_unlock_irqrestore(chip->spinlock, flags);
 }
 
 static irqreturn_t ioh_gpio_handler(int irq, void *dev_id)
@@ -407,8 +412,8 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 	int ret;
 	int i, j;
 	struct ioh_gpio *chip;
+	struct ioh_gpio_device *priv;
 	void __iomem *base;
-	void *chip_save;
 	int irq_base;
 
 	ret = pcim_enable_device(pdev);
@@ -429,18 +434,18 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 	}
 
-	chip_save = devm_kcalloc(dev, 8, sizeof(*chip), GFP_KERNEL);
-	if (chip_save == NULL) {
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
-	}
 
-	chip = chip_save;
+	raw_spin_lock_init(&priv->spinlock);
+	chip = priv->chip;
 	for (i = 0; i < 8; i++, chip++) {
 		chip->dev = dev;
 		chip->base = base;
 		chip->reg = chip->base;
 		chip->ch = i;
-		raw_spin_lock_init(&chip->spinlock);
+		chip->spinlock = &priv->spinlock;
 		ioh_gpio_setup(chip, num_ports[i]);
 		ret = devm_gpiochip_add_data(dev, &chip->gpio, chip);
 		if (ret) {
@@ -449,7 +454,7 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 		}
 	}
 
-	chip = chip_save;
+	chip = priv->chip;
 	for (j = 0; j < 8; j++, chip++) {
 		irq_base = devm_irq_alloc_descs(dev, -1, IOH_IRQ_BASE,
 						num_ports[j], NUMA_NO_NODE);
@@ -466,7 +471,7 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 			return ret;
 	}
 
-	chip = chip_save;
+	chip = priv->chip;
 	ret = devm_request_irq(dev, pdev->irq, ioh_gpio_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, chip);
 	if (ret != 0) {
@@ -474,33 +479,33 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 		return ret;
 	}
 
-	pci_set_drvdata(pdev, chip);
+	pci_set_drvdata(pdev, priv);
 
 	return 0;
 }
 
 static int ioh_gpio_suspend(struct device *dev)
 {
-	struct ioh_gpio *chip = dev_get_drvdata(dev);
+	struct ioh_gpio_device *priv = dev_get_drvdata(dev);
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->spinlock, flags);
-	ioh_gpio_save_reg_conf(chip);
-	raw_spin_unlock_irqrestore(&chip->spinlock, flags);
+	raw_spin_lock_irqsave(&priv->spinlock, flags);
+	ioh_gpio_save_reg_conf(priv->chip);
+	raw_spin_unlock_irqrestore(&priv->spinlock, flags);
 
 	return 0;
 }
 
 static int ioh_gpio_resume(struct device *dev)
 {
-	struct ioh_gpio *chip = dev_get_drvdata(dev);
+	struct ioh_gpio_device *priv = dev_get_drvdata(dev);
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->spinlock, flags);
-	iowrite32(0x01, &chip->reg->srst);
-	iowrite32(0x00, &chip->reg->srst);
-	ioh_gpio_restore_reg_conf(chip);
-	raw_spin_unlock_irqrestore(&chip->spinlock, flags);
+	raw_spin_lock_irqsave(&priv->spinlock, flags);
+	iowrite32(0x01, &priv->chip->reg->srst);
+	iowrite32(0x00, &priv->chip->reg->srst);
+	ioh_gpio_restore_reg_conf(priv->chip);
+	raw_spin_unlock_irqrestore(&priv->spinlock, flags);
 
 	return 0;
 }

base-commit: a02b8950d619123da64f69b70fe1dadef217dfe4
prerequisite-patch-id: cebc220b508b7d9216be1fe01348b9989f0b957e
-- 
2.43.0

