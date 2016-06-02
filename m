From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH 5/5] pinctrl: cherryview: restore padctrl1 reg when gpio is disabled
Date: Thu,  2 Jun 2016 22:55:43 +0100
Message-ID: <1464904543-4094-6-git-send-email-dan@emutex.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:60786 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932855AbcFBVyT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Jun 2016 17:54:19 -0400
In-Reply-To: <1464904543-4094-1-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, linus.walleij@linaro.org
Cc: heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Dan O'Donovan <dan@emutex.com>

chv_gpio_request_enable() clears some bits in the padctrl1 register
when GPIO mode is selected, but these bits are not restored by
chv_gpio_disable_free() when GPIO mode is unselected and this can
prevent other pin modes (e.g. I2C) from functioning correctly
thereafter on that pin.  This patch adds saving/restoring of those
bits.

Signed-off-by: Dan O'Donovan <dan@emutex.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 5064f93..a75cc8c 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -177,6 +177,7 @@ struct chv_pinctrl {
 	const struct chv_community *community;
 	u32 saved_intmask;
 	struct chv_pin_context *saved_pin_context;
+	u32 saved_mux_padctrl1;
 };
 
 #define ALTERNATE_FUNCTION(p, m, i)		\
@@ -885,6 +886,7 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 		/* Disable interrupt generation */
 		reg = chv_padreg(pctrl, offset, CHV_PADCTRL1);
 		value = readl(reg);
+		pctrl->saved_mux_padctrl1 = value;
 		value &= ~CHV_PADCTRL1_INTWAKECFG_MASK;
 		value &= ~CHV_PADCTRL1_INVRXTX_MASK;
 		chv_writel(value, reg);
@@ -928,6 +930,15 @@ static void chv_gpio_disable_free(struct pinctrl_dev *pctldev,
 	value = readl(reg) & ~CHV_PADCTRL0_GPIOEN;
 	chv_writel(value, reg);
 
+	/* Restore previous pad configuration */
+	reg = chv_padreg(pctrl, offset, CHV_PADCTRL1);
+	value = readl(reg);
+	value &= ~CHV_PADCTRL1_INTWAKECFG_MASK;
+	value |= pctrl->saved_mux_padctrl1 & CHV_PADCTRL1_INTWAKECFG_MASK;
+	value &= ~CHV_PADCTRL1_INVRXTX_MASK;
+	value |= pctrl->saved_mux_padctrl1 & CHV_PADCTRL1_INVRXTX_MASK;
+	chv_writel(value, reg);
+
 	raw_spin_unlock_irqrestore(&chv_reg_lock, flags);
 }
 
-- 
2.1.4

