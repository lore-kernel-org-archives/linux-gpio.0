From: Sonic Zhang <sonic.adi@gmail.com>
Subject: [PATCH] pinmux: allow exlusive pin allocation among GPIO and peripheral funtions via flag strict in struct pinctrl_desc
Date: Thu, 12 Mar 2015 17:56:43 +0800
Message-ID: <1426154203-11551-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0097.outbound.protection.outlook.com ([207.46.100.97]:48128
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751267AbbCLKbW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 12 Mar 2015 06:31:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Steven Miao <realmz6@gmail.com>, linux-gpio@vger.kernel.org
Cc: adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

From: Sonic Zhang <sonic.zhang@analog.com>

The blackfin pinmux and gpio controller doesn't allow user to set up 1 pin
for both GPIO and peripheral function. So, add flag strict in struct pinctrl
to check both gpio_owner and mux_owner before approving the pin request.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 drivers/pinctrl/pinctrl-adi2.c  |    1 +
 drivers/pinctrl/pinmux.c        |   29 +++++++++++++++--------------
 include/linux/pinctrl/pinctrl.h |    1 +
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
index 8434439..fbd4926 100644
--- a/drivers/pinctrl/pinctrl-adi2.c
+++ b/drivers/pinctrl/pinctrl-adi2.c
@@ -710,6 +710,7 @@ static struct pinctrl_desc adi_pinmux_desc = {
 	.name = DRIVER_NAME,
 	.pctlops = &adi_pctrl_ops,
 	.pmxops = &adi_pinmux_ops,
+	.strict = true,
 	.owner = THIS_MODULE,
 };
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index b874458..dfa2b42 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -99,24 +99,25 @@ static int pin_request(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
+	if ((gpio_range || pctldev->desc->strict) && desc->gpio_owner) {
+		dev_err(pctldev->dev,
+			"pin %s already requested by %s; cannot claim for %s\n",
+			desc->name, desc->gpio_owner, owner);
+		goto out;
+	}
+
+	if ((!gpio_range || pctldev->desc->strict) &&
+	    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
+		dev_err(pctldev->dev,
+			"pin %s already requested by %s; cannot claim for %s\n",
+			desc->name, desc->mux_owner, owner);
+		goto out;
+	}
+
 	if (gpio_range) {
 		/* There's no need to support multiple GPIO requests */
-		if (desc->gpio_owner) {
-			dev_err(pctldev->dev,
-				"pin %s already requested by %s; cannot claim for %s\n",
-				desc->name, desc->gpio_owner, owner);
-			goto out;
-		}
-
 		desc->gpio_owner = owner;
 	} else {
-		if (desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
-			dev_err(pctldev->dev,
-				"pin %s already requested by %s; cannot claim for %s\n",
-				desc->name, desc->mux_owner, owner);
-			goto out;
-		}
-
 		desc->mux_usecount++;
 		if (desc->mux_usecount > 1)
 			return 0;
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 66e4697..ca6c99c0 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -132,6 +132,7 @@ struct pinctrl_desc {
 	const struct pinctrl_ops *pctlops;
 	const struct pinmux_ops *pmxops;
 	const struct pinconf_ops *confops;
+	bool strict;
 	struct module *owner;
 #ifdef CONFIG_GENERIC_PINCONF
 	unsigned int num_custom_params;
-- 
1.7.9.5

