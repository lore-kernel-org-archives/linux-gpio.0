From: Qipeng Zha <qipeng.zha@intel.com>
Subject: [PATCH 1/3] pinctrl: Intel: add RX invertion config
Date: Sat, 12 Mar 2016 01:06:00 +0800
Message-ID: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:63297 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935254AbcCKJAv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Mar 2016 04:00:51 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, Qi Zheng <qi.zheng@intel.com>

Some module need to enable RX invertion config on BXT platform.

Signed-off-by: Qi Zheng <qi.zheng@intel.com>
Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 45 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.h |  8 +++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 85536b4..ded5378 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -472,6 +472,14 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned pin,
 
 		break;
 
+	case PIN_CONF_INTEL_INV_RX:
+		value = intel_get_padcfg(pctrl, pin, PADCFG0);
+		if (value & PADCFG0_RXINV)
+			arg = 1;
+		else
+			arg = 0;
+		break;
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -549,6 +557,38 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned pin,
 	return ret;
 }
 
+
+static int intel_config_set_misc(struct intel_pinctrl *pctrl, unsigned pin,
+				 unsigned long config)
+{
+	unsigned param = pinconf_to_config_param(config);
+	unsigned arg = pinconf_to_config_argument(config);
+	void __iomem *padcfg0;
+	unsigned long flags;
+	int ret = 0;
+	u32 value;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+
+	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
+	value = readl(padcfg0);
+
+	if (param == PIN_CONF_INTEL_INV_RX) {
+		if (arg)
+			value |= PADCFG0_RXINV;
+		else
+			value &= ~PADCFG0_RXINV;
+	} else
+		ret = -EINVAL;
+
+	if (!ret)
+		writel(value, padcfg0);
+
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return ret;
+}
+
 static int intel_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 			  unsigned long *configs, unsigned nconfigs)
 {
@@ -567,6 +607,11 @@ static int intel_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 			if (ret)
 				return ret;
 			break;
+		case PIN_CONF_INTEL_INV_RX:
+			ret = intel_config_set_misc(pctrl, pin, configs[i]);
+			if (ret)
+				return ret;
+			break;
 
 		default:
 			return -ENOTSUPP;
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index b602157..51f9076 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -18,6 +18,14 @@ struct platform_device;
 struct device;
 
 /**
+* customized pinconf configurations
+* @PIN_CONF_INTEL_INV_RX: this will invert the RX pad state before it is
+*	sent to the GPIO-to-IOxAPIC, GPE/SCI, SMI, NMI logic or GPI_IS[n]
+*	that is using it.
+*/
+#define	PIN_CONF_INTEL_INV_RX		(PIN_CONFIG_END + 1)
+
+/**
  * struct intel_pingroup - Description about group of pins
  * @name: Name of the groups
  * @pins: All pins in this group
-- 
1.8.3.2

