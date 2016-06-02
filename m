From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH 2/5] pinctrl: cherryview: add option to set open-drain pin config
Date: Thu,  2 Jun 2016 22:55:40 +0100
Message-ID: <1464904543-4094-3-git-send-email-dan@emutex.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:60783 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932963AbcFBVyT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Jun 2016 17:54:19 -0400
In-Reply-To: <1464904543-4094-1-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, linus.walleij@linaro.org
Cc: heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Dan O'Donovan <dan@emutex.com>

On some CHV platforms, we need an option to configure the
open-drain setting for these pins.  This adds support for the
PIN_CONFIG_DRIVE_PUSH_PULL and PIN_CONFIG_DRIVE_OPEN_DRAIN to
disable/enable open-drain mode for a specific pin.

Signed-off-by: Dan O'Donovan <dan@emutex.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index c79f4cc..7e5545f 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1101,6 +1101,27 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned int pin,
 	return 0;
 }
 
+static int chv_config_set_oden(struct chv_pinctrl *pctrl, unsigned int pin,
+			       bool enable)
+{
+	void __iomem *reg = chv_padreg(pctrl, pin, CHV_PADCTRL1);
+	unsigned long flags;
+	u32 ctrl1;
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	ctrl1 = readl(reg);
+
+	if (enable)
+		ctrl1 |= CHV_PADCTRL1_ODEN;
+	else
+		ctrl1 &= ~CHV_PADCTRL1_ODEN;
+
+	chv_writel(ctrl1, reg);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
 static int chv_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			  unsigned long *configs, unsigned int nconfigs)
 {
@@ -1125,6 +1146,18 @@ static int chv_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return ret;
 			break;
 
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			ret = chv_config_set_oden(pctrl, pin, false);
+			if (ret)
+				return ret;
+			break;
+
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			ret = chv_config_set_oden(pctrl, pin, true);
+			if (ret)
+				return ret;
+			break;
+
 		default:
 			return -ENOTSUPP;
 		}
-- 
2.1.4

