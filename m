From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] pinctrl: intel: merrifield: Add missed check in mrfld_config_set()
Date: Tue, 24 Jan 2017 17:28:22 +0200
Message-ID: <20170124152822.17170-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:24324 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750975AbdAXP3b (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Jan 2017 10:29:31 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Not every pin can be configured. Add missed check to prevent access
violation.

Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- drop second patch for now
- add Mika's ACK
 drivers/pinctrl/intel/pinctrl-merrifield.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index b21896126f76..4d4ef42a39b5 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -794,6 +794,9 @@ static int mrfld_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned int i;
 	int ret;
 
+	if (!mrfld_buf_available(mp, pin))
+		return -ENOTSUPP;
+
 	for (i = 0; i < nconfigs; i++) {
 		switch (pinconf_to_config_param(configs[i])) {
 		case PIN_CONFIG_BIAS_DISABLE:
-- 
2.11.0

