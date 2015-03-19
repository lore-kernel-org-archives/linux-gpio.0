From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH 2/2] pinctrl: pinconf-generic: add dt node names to error messages
Date: Thu, 19 Mar 2015 22:17:42 +0200
Message-ID: <4e6157290f7236e0bd5c3cc29a677aed5255f497.1426796262.git.baruch@tkos.co.il>
References: <a7b25eb6f4fd888e9ac600959cf4216ffa11921e.1426796262.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:56569 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750830AbbCSUR7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 19 Mar 2015 16:17:59 -0400
In-Reply-To: <a7b25eb6f4fd888e9ac600959cf4216ffa11921e.1426796262.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

This makes the error message much more useful.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/pinctrl/pinconf-generic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index b5fbfb3584d9..e63ad9fbd388 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -307,14 +307,16 @@ int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0) {
 		/* EINVAL=missing, which is fine since it's optional */
 		if (ret != -EINVAL)
-			dev_err(dev, "could not parse property function\n");
+			dev_err(dev, "%s: could not parse property function\n",
+				of_node_full_name(np));
 		function = NULL;
 	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
 					      &num_configs);
 	if (ret < 0) {
-		dev_err(dev, "could not parse node property\n");
+		dev_err(dev, "%s: could not parse node property\n",
+			of_node_full_name(np));
 		return ret;
 	}
 
-- 
2.1.4

