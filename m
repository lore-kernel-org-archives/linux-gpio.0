From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: intel: merrifield: Add pin config group handlers
Date: Thu, 27 Oct 2016 19:10:15 +0300
Message-ID: <20161027161015.138390-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:17046 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755706AbcJ0QKT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Oct 2016 12:10:19 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Pin config get() and set() handlers for pin groups were previously not
implemented by this driver. The pin_config_group_set() is particularly useful
for applying a common config setting to all pins in a specified group with a
single call, without the caller needing to reference each individual pin by
name.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-merrifield.c | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 7826c7f..b218961 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -814,10 +814,51 @@ static int mrfld_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	return 0;
 }
 
+static int mrfld_config_group_get(struct pinctrl_dev *pctldev,
+				  unsigned int group, unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int ret;
+
+	ret = mrfld_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	ret = mrfld_config_get(pctldev, pins[0], config);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mrfld_config_group_set(struct pinctrl_dev *pctldev,
+				  unsigned int group, unsigned long *configs,
+				  unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int i, ret;
+
+	ret = mrfld_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		ret = mrfld_config_set(pctldev, pins[i], configs, num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct pinconf_ops mrfld_pinconf_ops = {
 	.is_generic = true,
 	.pin_config_get = mrfld_config_get,
 	.pin_config_set = mrfld_config_set,
+	.pin_config_group_get = mrfld_config_group_get,
+	.pin_config_group_set = mrfld_config_group_set,
 };
 
 static const struct pinctrl_desc mrfld_pinctrl_desc = {
-- 
2.9.3

