From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH v2 2/3] pinctrl: cherryview: add option to set open-drain pin config
Date: Fri, 10 Jun 2016 13:23:35 +0100
Message-ID: <1465561416-29732-3-git-send-email-dan@emutex.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1465561416-29732-1-git-send-email-dan@emutex.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:32865 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932951AbcFJMWb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 10 Jun 2016 08:22:31 -0400
In-Reply-To: <1465561416-29732-1-git-send-email-dan@emutex.com>
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
index bf65c94..7b3f147 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1108,6 +1108,27 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned pin,
 	return 0;
 }
 
+static int chv_config_set_oden(struct chv_pinctrl *pctrl, unsigned int pin,
+			       bool enable)
+{
+	void __iomem *reg = chv_padreg(pctrl, pin, CHV_PADCTRL1);
+	unsigned long flags;
+	u32 ctrl1;
+
+	raw_spin_lock_irqsave(&chv_lock, flags);
+	ctrl1 = readl(reg);
+
+	if (enable)
+		ctrl1 |= CHV_PADCTRL1_ODEN;
+	else
+		ctrl1 &= ~CHV_PADCTRL1_ODEN;
+
+	chv_writel(ctrl1, reg);
+	raw_spin_unlock_irqrestore(&chv_lock, flags);
+
+	return 0;
+}
+
 static int chv_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 			  unsigned long *configs, unsigned nconfigs)
 {
@@ -1132,6 +1153,18 @@ static int chv_config_set(struct pinctrl_dev *pctldev, unsigned pin,
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

