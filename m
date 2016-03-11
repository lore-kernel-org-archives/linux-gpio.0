From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH 3/3] pinctrl:Intel: make the high level interrupt working
Date: Sat, 12 Mar 2016 01:06:02 +0800
Message-ID: <1457715962-108484-3-git-send-email-qipeng.zha@intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:63297 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964786AbcCKJAx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Mar 2016 04:00:53 -0500
In-Reply-To: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, Qi Zheng <qi.zheng@intel.com>

High level trigger mode of GPIO interrupt is not set correctly
in intel_gpio_irq_type(), and will make this kind of interrupt
not respond.

Signed-off-by: Qi Zheng <qi.zheng@intel.com>
Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index d6fe659..706a21f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -790,6 +790,8 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 		value |= PADCFG0_RXEVCFG_EDGE << PADCFG0_RXEVCFG_SHIFT;
 	} else if (type & IRQ_TYPE_LEVEL_LOW) {
 		value |= PADCFG0_RXINV;
+	} else if (type & IRQ_TYPE_LEVEL_HIGH) {
+		;
 	} else {
 		value |= PADCFG0_RXEVCFG_DISABLED << PADCFG0_RXEVCFG_SHIFT;
 	}
-- 
1.8.3.2

