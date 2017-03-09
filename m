From: Julia Cartwright <julia@ni.com>
Subject: [PATCH 08/19] gpio: etraxfs: make use of raw_spinlock variants
Date: Thu, 9 Mar 2017 10:21:55 -0600
Message-ID: <c4411b58e928a3c2cf0375342051a31d71190eb5.1489015238.git.julia@ni.com>
References: <cover.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:42261 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754526AbdCISIM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2017 13:08:12 -0500
In-Reply-To: <cover.1489015238.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org

The etraxfs gpio driver currently implements an irq_chip for handling
interrupts; due to how irq_chip handling is done, it's necessary for the
irq_chip methods to be invoked from hardirq context, even on a a
real-time kernel.  Because the spinlock_t type becomes a "sleeping"
spinlock w/ RT kernels, it is not suitable to be used with irq_chips.

A quick audit of the operations under the lock reveal that they do only
minimal, bounded work, and are therefore safe to do under a raw spinlock.

Signed-off-by: Julia Cartwright <julia@ni.com>
---
 drivers/gpio/gpio-etraxfs.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
index a254d5b07b94..14c6aac26780 100644
--- a/drivers/gpio/gpio-etraxfs.c
+++ b/drivers/gpio/gpio-etraxfs.c
@@ -54,7 +54,7 @@
 struct etraxfs_gpio_info;
 
 struct etraxfs_gpio_block {
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	u32 mask;
 	u32 cfg;
 	u32 pins;
@@ -233,10 +233,10 @@ static void etraxfs_gpio_irq_mask(struct irq_data *d)
 	struct etraxfs_gpio_block *block = chip->block;
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 
-	spin_lock(&block->lock);
+	raw_spin_lock(&block->lock);
 	block->mask &= ~BIT(grpirq);
 	writel(block->mask, block->regs + block->info->rw_intr_mask);
-	spin_unlock(&block->lock);
+	raw_spin_unlock(&block->lock);
 }
 
 static void etraxfs_gpio_irq_unmask(struct irq_data *d)
@@ -246,10 +246,10 @@ static void etraxfs_gpio_irq_unmask(struct irq_data *d)
 	struct etraxfs_gpio_block *block = chip->block;
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 
-	spin_lock(&block->lock);
+	raw_spin_lock(&block->lock);
 	block->mask |= BIT(grpirq);
 	writel(block->mask, block->regs + block->info->rw_intr_mask);
-	spin_unlock(&block->lock);
+	raw_spin_unlock(&block->lock);
 }
 
 static int etraxfs_gpio_irq_set_type(struct irq_data *d, u32 type)
@@ -280,11 +280,11 @@ static int etraxfs_gpio_irq_set_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	spin_lock(&block->lock);
+	raw_spin_lock(&block->lock);
 	block->cfg &= ~(0x7 << (grpirq * 3));
 	block->cfg |= (cfg << (grpirq * 3));
 	writel(block->cfg, block->regs + block->info->rw_intr_cfg);
-	spin_unlock(&block->lock);
+	raw_spin_unlock(&block->lock);
 
 	return 0;
 }
@@ -297,7 +297,7 @@ static int etraxfs_gpio_irq_request_resources(struct irq_data *d)
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 	int ret = -EBUSY;
 
-	spin_lock(&block->lock);
+	raw_spin_lock(&block->lock);
 	if (block->group[grpirq])
 		goto out;
 
@@ -316,7 +316,7 @@ static int etraxfs_gpio_irq_request_resources(struct irq_data *d)
 	}
 
 out:
-	spin_unlock(&block->lock);
+	raw_spin_unlock(&block->lock);
 	return ret;
 }
 
@@ -327,10 +327,10 @@ static void etraxfs_gpio_irq_release_resources(struct irq_data *d)
 	struct etraxfs_gpio_block *block = chip->block;
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 
-	spin_lock(&block->lock);
+	raw_spin_lock(&block->lock);
 	block->group[grpirq] = 0;
 	gpiochip_unlock_as_irq(&chip->gc, d->hwirq);
-	spin_unlock(&block->lock);
+	raw_spin_unlock(&block->lock);
 }
 
 static struct irq_chip etraxfs_gpio_irq_chip = {
@@ -391,7 +391,7 @@ static int etraxfs_gpio_probe(struct platform_device *pdev)
 	if (!block)
 		return -ENOMEM;
 
-	spin_lock_init(&block->lock);
+	raw_spin_lock_init(&block->lock);
 
 	block->regs = regs;
 	block->info = info;
-- 
2.11.1

