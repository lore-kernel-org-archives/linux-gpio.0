From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH v2 3/3] pinctrl: cherryview: add handlers for pin_config_group_get/set
Date: Fri, 10 Jun 2016 13:23:36 +0100
Message-ID: <1465561416-29732-4-git-send-email-dan@emutex.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1465561416-29732-1-git-send-email-dan@emutex.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:32862 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932949AbcFJMWa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 10 Jun 2016 08:22:30 -0400
In-Reply-To: <1465561416-29732-1-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, linus.walleij@linaro.org
Cc: heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Dan O'Donovan <dan@emutex.com>

Pin config get/set handlers for pin groups were previously not
implemented by this driver.  The pin_config_group_set is
particularly useful for applying a common config setting to all
pins in a specified group with a single call, without the caller
needing to reference each individual pin by name.

Signed-off-by: Dan O'Donovan <dan@emutex.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 7b3f147..5749a4ee 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1176,10 +1176,52 @@ static int chv_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 	return 0;
 }
 
+static int chv_config_group_get(struct pinctrl_dev *pctldev,
+				unsigned int group,
+				unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int ret;
+
+	ret = chv_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	ret = chv_config_get(pctldev, pins[0], config);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int chv_config_group_set(struct pinctrl_dev *pctldev,
+				unsigned int group, unsigned long *configs,
+				unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int i, ret;
+
+	ret = chv_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		ret = chv_config_set(pctldev, pins[i], configs, num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct pinconf_ops chv_pinconf_ops = {
 	.is_generic = true,
 	.pin_config_set = chv_config_set,
 	.pin_config_get = chv_config_get,
+	.pin_config_group_get = chv_config_group_get,
+	.pin_config_group_set = chv_config_group_set,
 };
 
 static struct pinctrl_desc chv_pinctrl_desc = {
-- 
2.1.4

