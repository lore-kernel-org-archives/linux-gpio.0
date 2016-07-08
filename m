From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: intel: Protect set wake flow by spin lock
Date: Fri,  8 Jul 2016 14:30:46 +0300
Message-ID: <1467977446-73452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:62700 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754360AbcGHLau (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 8 Jul 2016 07:30:50 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

It seems intel_gpio_irq_wake() misses lock protection against I/O flow.
Use spin lock here as well.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index fe19b1e..257cab1 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -796,12 +796,15 @@ static int intel_gpio_irq_wake(struct irq_data *d, unsigned int on)
 	const struct intel_community *community;
 	unsigned pin = irqd_to_hwirq(d);
 	unsigned padno, gpp, gpp_offset;
+	unsigned long flags;
 	u32 gpe_en;
 
 	community = intel_get_community(pctrl, pin);
 	if (!community)
 		return -EINVAL;
 
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+
 	padno = pin_to_padno(community, pin);
 	gpp = padno / community->gpp_size;
 	gpp_offset = padno % community->gpp_size;
@@ -821,6 +824,8 @@ static int intel_gpio_irq_wake(struct irq_data *d, unsigned int on)
 		gpe_en &= ~BIT(gpp_offset);
 	writel(gpe_en, community->regs + GPI_GPE_EN + gpp * 4);
 
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
 	dev_dbg(pctrl->dev, "%sable wake for pin %u\n", on ? "en" : "dis", pin);
 	return 0;
 }
-- 
2.8.1

