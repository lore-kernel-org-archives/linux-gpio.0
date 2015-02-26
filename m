From: Sonic Zhang <sonic.adi@gmail.com>
Subject: [PATCH] pinmux: 1 pin is not allowed to be configured for both GPIO and peripheral funtion
Date: Thu, 26 Feb 2015 15:41:44 +0800
Message-ID: <1424936504-32662-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0065.outbound.protection.outlook.com ([207.46.100.65]:20352
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932090AbbBZIRc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 26 Feb 2015 03:17:32 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

From: Sonic Zhang <sonic.zhang@analog.com>

The blackfin pinmux and gpio controller doesn't allow user to set up 1 pin
for both GPIO and peripheral function. So, check both gpio_owner and
mux_owner before approving the pin request.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 drivers/pinctrl/pinmux.c |   28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index b874458..b58b97c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -99,24 +99,24 @@ static int pin_request(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
+	if (desc->gpio_owner) {
+		dev_err(pctldev->dev,
+			"pin %s already requested by %s; cannot claim for %s\n",
+			desc->name, desc->gpio_owner, owner);
+		goto out;
+	}
+
+	if (desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
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
-- 
1.7.9.5

