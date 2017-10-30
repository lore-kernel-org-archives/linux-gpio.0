From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: max77620: Use common error handling code in
 max77620_pinconf_set()
Date: Mon, 30 Oct 2017 15:00:07 +0100
Message-ID: <afdb4e5f-15f7-14b5-7a35-f8420dec683c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:51622 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752455AbdJ3OAU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Oct 2017 10:00:20 -0400
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 14:55:52 +0100

* Add a jump target so that a specific error message is stored only once
  at the end of this function implementation.

* Replace two calls of the function "dev_err" by goto statements.

* Adjust two condition checks.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-max77620.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index b8d2180a2bea..a7f37063518e 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -420,11 +420,9 @@ static int max77620_pinconf_set(struct pinctrl_dev *pctldev,
 						 MAX77620_REG_GPIO0 + pin,
 						 MAX77620_CNFG_GPIO_DRV_MASK,
 						 val);
-			if (ret < 0) {
-				dev_err(dev, "Reg 0x%02x update failed %d\n",
-					MAX77620_REG_GPIO0 + pin, ret);
-				return ret;
-			}
+			if (ret)
+				goto report_update_failure;
+
 			mpci->pin_info[pin].drv_type = val ?
 				MAX77620_PIN_PP_DRV : MAX77620_PIN_OD_DRV;
 			break;
@@ -435,11 +433,9 @@ static int max77620_pinconf_set(struct pinctrl_dev *pctldev,
 						 MAX77620_REG_GPIO0 + pin,
 						 MAX77620_CNFG_GPIO_DRV_MASK,
 						 val);
-			if (ret < 0) {
-				dev_err(dev, "Reg 0x%02x update failed %d\n",
-					MAX77620_REG_GPIO0 + pin, ret);
-				return ret;
-			}
+			if (ret)
+				goto report_update_failure;
+
 			mpci->pin_info[pin].drv_type = val ?
 				MAX77620_PIN_PP_DRV : MAX77620_PIN_OD_DRV;
 			break;
@@ -536,6 +532,11 @@ static int max77620_pinconf_set(struct pinctrl_dev *pctldev,
 	}
 
 	return 0;
+
+report_update_failure:
+	dev_err(dev, "Reg 0x%02x update failed %d\n",
+		MAX77620_REG_GPIO0 + pin, ret);
+	return ret;
 }
 
 static const struct pinconf_ops max77620_pinconf_ops = {
-- 
2.14.3

