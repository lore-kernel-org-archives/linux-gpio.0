From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH v2 1/1] pinctrl: baytrail: Add missing spinlock usage in byt_gpio_irq_handler
Date: Mon, 30 Jan 2017 12:35:28 +0100
Message-ID: <20170130113528.17838-1-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:40422 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753247AbdA3L7D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Jan 2017 06:59:03 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

According to VLI64 Intel Atom E3800 Specification Update (#329901)
concurrent read accesses may result in returning 0xffffffff and write
accesses may be dropped silently.
To workaround all accesses must be protected by locks.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
I actually had the case where the read access in byt_irq_unmask returned
0xffffffff. After OR'ing the trigger bits and writing 0xffffffff back to
BYT_CONF0_REG things started to act strange.

Changes in v2:
* Adjusted commit message
* Remove locks in initializiation and suspend/resume functions
  namely: byt_gpio_irq_init_hw, byt_gpio_suspend and byt_gpio_resume
* Simply use raw_spin_lock instead of raw_spin_lock_irqsave inside IRQ handler

 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 9a1bbc1..6c7eed8 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1612,7 +1612,9 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 			continue;
 		}
 
+		raw_spin_lock(&vg->lock);
 		pending = readl(reg);
+		raw_spin_unlock(&vg->lock);
 		for_each_set_bit(pin, &pending, 32) {
 			virq = irq_find_mapping(vg->chip.irqdomain, base + pin);
 			generic_handle_irq(virq);
-- 
2.10.2

