From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 2/3] pinctrl: sunxi: Add support for fetching pinconf settings from hardware
Date: Fri, 11 Nov 2016 10:44:54 +0800
Message-ID: <20161111024455.16883-3-wens@csie.org>
References: <20161111024455.16883-1-wens@csie.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mirror2.csie.ntu.edu.tw ([140.112.30.76]:35182 "EHLO
        wens.csie.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965233AbcKKCo6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Nov 2016 21:44:58 -0500
In-Reply-To: <20161111024455.16883-1-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com

The sunxi pinctrl driver only caches whatever pinconf setting was last
set on a given pingroup. This is not particularly helpful, nor is it
correct.

Fix this by actually reading the hardware registers and returning
the correct results or error codes. Also filter out unsupported
pinconf settings. Since this driver has a peculiar setup of 1 pin
per group, we can support both pin and pingroup pinconf setting
read back with the same code. The sunxi_pconf_reg helper and code
structure is inspired by pinctrl-msm.

With this done we can also claim to support generic pinconf, by
setting .is_generic = true in pinconf_ops.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 84 +++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index e04edda8629d..3e9f7c675d36 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -438,15 +438,91 @@ static const struct pinctrl_ops sunxi_pctrl_ops = {
 	.get_group_pins		= sunxi_pctrl_get_group_pins,
 };
 
+static int sunxi_pconf_reg(unsigned pin, enum pin_config_param param,
+			   u32 *offset, u32 *shift, u32 *mask)
+{
+	switch (param) {
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		*offset = sunxi_dlevel_reg(pin);
+		*shift = sunxi_dlevel_offset(pin);
+		*mask = DLEVEL_PINS_MASK;
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_DISABLE:
+		*offset = sunxi_pull_reg(pin);
+		*shift = sunxi_pull_offset(pin);
+		*mask = PULL_PINS_MASK;
+		break;
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int sunxi_pconf_get(struct pinctrl_dev *pctldev, unsigned pin,
+			   unsigned long *config)
+{
+	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	u32 offset, shift, mask, val;
+	u16 arg;
+	int ret;
+
+	pin -= pctl->desc->pin_base;
+
+	ret = sunxi_pconf_reg(pin, param, &offset, &shift, &mask);
+	if (ret < 0)
+		return ret;
+
+	val = (readl(pctl->membase + offset) >> shift) & mask;
+
+	switch (pinconf_to_config_param(*config)) {
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		arg = (val + 1) * 10;
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (val != SUN4I_PINCTRL_PULL_UP)
+			return -EINVAL;
+		arg = 1; /* hardware is weak pull-up */
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (val != SUN4I_PINCTRL_PULL_DOWN)
+			return -EINVAL;
+		arg = 1; /* hardware is weak pull-down */
+		break;
+
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (val != SUN4I_PINCTRL_NO_PULL)
+			return -EINVAL;
+		arg = 0;
+		break;
+
+	default:
+		/* sunxi_pconf_reg should catch anything unsupported */
+		WARN_ON(1);
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
 static int sunxi_pconf_group_get(struct pinctrl_dev *pctldev,
 				 unsigned group,
 				 unsigned long *config)
 {
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	struct sunxi_pinctrl_group *g = &pctl->groups[group];
 
-	*config = pctl->groups[group].config;
-
-	return 0;
+	/* We only support 1 pin per group. Chain it to the pin callback */
+	return sunxi_pconf_get(pctldev, g->pin, config);
 }
 
 static int sunxi_pconf_group_set(struct pinctrl_dev *pctldev,
@@ -518,6 +594,8 @@ static int sunxi_pconf_group_set(struct pinctrl_dev *pctldev,
 }
 
 static const struct pinconf_ops sunxi_pconf_ops = {
+	.is_generic		= true,
+	.pin_config_get		= sunxi_pconf_get,
 	.pin_config_group_get	= sunxi_pconf_group_get,
 	.pin_config_group_set	= sunxi_pconf_group_set,
 };
-- 
2.10.2

