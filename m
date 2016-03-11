From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH 2/3] pinctrl:Intel: clear interrupt status for every IRQ setup
Date: Sat, 12 Mar 2016 01:06:01 +0800
Message-ID: <1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:63297 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964786AbcCKJAw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Mar 2016 04:00:52 -0500
In-Reply-To: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, Qi Zheng <qi.zheng@intel.com>

There is one unexpected GPIO interrupt coming in below scenario.
1. GPIO X is going to be used as falling edge interrupt.
2. Before request_irq call, this GPIO X interrupt was masked.
3. But the IRQ mode may be set for some mode in default (by BIOS).
4. Toggle GPIO X from high to low.
5. The GPIO X interrupt status will be set even if it was masked.
6. Register the interrupt for GPIO X, the interrupt will be unmasked.
7. Even if no change on GPIO X afterwards, but one GPIO X interrupt
will be triggered because the interrupt status was set.

To avoid above issue, the interrupt status need clear before request_irq.

Signed-off-by: Qi Zheng <qi.zheng@intel.com>
Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index ded5378..d6fe659 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -773,6 +773,8 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 		return -EPERM;
 	}
 
+	intel_gpio_irq_ack(d);
+
 	spin_lock_irqsave(&pctrl->lock, flags);
 
 	value = readl(reg);
-- 
1.8.3.2

