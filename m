From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH v2 1/2] pinctrl:Intel: make the high level interrupt working
Date: Thu, 17 Mar 2016 02:15:25 +0800
Message-ID: <1458152126-2333-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:19657 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964778AbcCPKKM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 16 Mar 2016 06:10:12 -0400
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
 drivers/pinctrl/intel/pinctrl-intel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 85536b4..c216cb3 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -741,8 +741,9 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 		value |= PADCFG0_RXINV;
 	} else if (type & IRQ_TYPE_EDGE_RISING) {
 		value |= PADCFG0_RXEVCFG_EDGE << PADCFG0_RXEVCFG_SHIFT;
-	} else if (type & IRQ_TYPE_LEVEL_LOW) {
-		value |= PADCFG0_RXINV;
+	} else if (type & IRQ_TYPE_LEVEL_MASK) {
+		if (type & IRQ_TYPE_LEVEL_LOW)
+			value |= PADCFG0_RXINV;
 	} else {
 		value |= PADCFG0_RXEVCFG_DISABLED << PADCFG0_RXEVCFG_SHIFT;
 	}
-- 
1.8.3.2

