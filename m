From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: cherryview: Serialize all register access
Date: Mon,  3 Aug 2015 12:46:38 +0300
Message-ID: <1438595198-44230-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:57843 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752089AbbHCJql (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 3 Aug 2015 05:46:41 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org

There is a hardware issue in Intel Braswell/Cherryview where concurrent
GPIO register access might results reads of 0xffffffff and writes might get
dropped.

Prevent this from happening by taking the serializing lock for all places
where it is possible that more than one thread might be accessing the
hardware concurrently.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 3f737daa3fd2..65cfd4c0024f 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1169,9 +1169,12 @@ static int chv_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(chip);
 	int pin = chv_gpio_offset_to_pin(pctrl, offset);
+	unsigned long flags;
 	u32 ctrl0, cfg;
 
+	spin_lock_irqsave(&pctrl->lock, flags);
 	ctrl0 = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
+	spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	cfg = ctrl0 & CHV_PADCTRL0_GPIOCFG_MASK;
 	cfg >>= CHV_PADCTRL0_GPIOCFG_SHIFT;
@@ -1209,8 +1212,11 @@ static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(chip);
 	unsigned pin = chv_gpio_offset_to_pin(pctrl, offset);
 	u32 ctrl0, direction;
+	unsigned long flags;
 
+	spin_lock_irqsave(&pctrl->lock, flags);
 	ctrl0 = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
+	spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	direction = ctrl0 & CHV_PADCTRL0_GPIOCFG_MASK;
 	direction >>= CHV_PADCTRL0_GPIOCFG_SHIFT;
@@ -1313,6 +1319,7 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 		unsigned long flags;
 		u32 intsel, value;
 
+		spin_lock_irqsave(&pctrl->lock, flags);
 		intsel = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
 		intsel &= CHV_PADCTRL0_INTSEL_MASK;
 		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
@@ -1323,7 +1330,6 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 		else
 			handler = handle_edge_irq;
 
-		spin_lock_irqsave(&pctrl->lock, flags);
 		if (!pctrl->intr_lines[intsel]) {
 			__irq_set_handler_locked(d->irq, handler);
 			pctrl->intr_lines[intsel] = offset;
-- 
2.4.6

