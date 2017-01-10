From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 5/6] pinctrl: intel: Add support for 1k additional pull-down
Date: Tue, 10 Jan 2017 17:32:00 +0300
Message-ID: <20170110143201.53539-6-mika.westerberg@linux.intel.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:54738 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933519AbdAJOcn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Jan 2017 09:32:43 -0500
In-Reply-To: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

The next generation Intel GPIO hardware supports additional 1k pull-down
per-pad. Add support for this to the Intel core pinctrl driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 18 +++++++++++++++++-
 drivers/pinctrl/intel/pinctrl-intel.h |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 2d8722fa701d..f6fcfd061b74 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -450,12 +450,14 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned pin,
 {
 	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param = pinconf_to_config_param(*config);
+	const struct intel_community *community;
 	u32 value, term;
 	u16 arg = 0;
 
 	if (!intel_pad_owned_by_host(pctrl, pin))
 		return -ENOTSUPP;
 
+	community = intel_get_community(pctrl, pin);
 	value = readl(intel_get_padcfg(pctrl, pin, PADCFG1));
 	term = (value & PADCFG1_TERM_MASK) >> PADCFG1_TERM_SHIFT;
 
@@ -491,6 +493,11 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned pin,
 			return -EINVAL;
 
 		switch (term) {
+		case PADCFG1_TERM_1K:
+			if (!(community->features & PINCTRL_FEATURE_1K_PD))
+				return -EINVAL;
+			arg = 1000;
+			break;
 		case PADCFG1_TERM_5K:
 			arg = 5000;
 			break;
@@ -532,6 +539,7 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned pin,
 {
 	unsigned param = pinconf_to_config_param(config);
 	unsigned arg = pinconf_to_config_argument(config);
+	const struct intel_community *community;
 	void __iomem *padcfg1;
 	unsigned long flags;
 	int ret = 0;
@@ -539,6 +547,7 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned pin,
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
+	community = intel_get_community(pctrl, pin);
 	padcfg1 = intel_get_padcfg(pctrl, pin, PADCFG1);
 	value = readl(padcfg1);
 
@@ -581,6 +590,11 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned pin,
 		case 5000:
 			value |= PADCFG1_TERM_5K << PADCFG1_TERM_SHIFT;
 			break;
+		case 1000:
+			if (!(community->features & PINCTRL_FEATURE_1K_PD))
+				return -EINVAL;
+			value |= PADCFG1_TERM_1K << PADCFG1_TERM_SHIFT;
+			break;
 		default:
 			ret = -EINVAL;
 		}
@@ -1118,8 +1132,10 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 			u32 rev;
 
 			rev = (readl(regs + REVID) & REVID_MASK) >> REVID_SHIFT;
-			if (rev >= 0x94)
+			if (rev >= 0x94) {
 				community->features |= PINCTRL_FEATURE_DEBOUNCE;
+				community->features |= PINCTRL_FEATURE_1K_PD;
+			}
 		}
 
 		/* Read offset of the pad configuration registers */
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 1ff5abf309e3..fe9521f345b5 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -81,6 +81,7 @@ struct intel_community {
 
 /* Additional features supported by the hardware */
 #define PINCTRL_FEATURE_DEBOUNCE	BIT(0)
+#define PINCTRL_FEATURE_1K_PD		BIT(1)
 
 #define PIN_GROUP(n, p, m)			\
 	{					\
-- 
2.11.0

