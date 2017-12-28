From: Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH] pinctrl: mcp23s08: fix irq setup order
Date: Thu, 28 Dec 2017 18:19:24 +0300
Message-ID: <1514474364-32169-1-git-send-email-mastichi@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36483 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753293AbdL1PUM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Dec 2017 10:20:12 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: preid@electromag.com.au, Dmitry Mastykin <mastichi@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When using mcp23s08 module with gpio-keys, often (50% of boots)
it fails to get irq numbers with message:
"gpio-keys keys: Unable to get irq number for GPIO 0, error -6".
Seems that irqs must be setup before devm_gpiochip_add_data().

Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 9c950bbf..447763a 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -891,16 +891,16 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			goto fail;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
-	if (ret < 0)
-		goto fail;
-
 	if (mcp->irq && mcp->irq_controller) {
 		ret = mcp23s08_irq_setup(mcp);
 		if (ret)
 			goto fail;
 	}
 
+	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
+	if (ret < 0)
+		goto fail;
+
 	mcp->pinctrl_desc.name = "mcp23xxx-pinctrl";
 	mcp->pinctrl_desc.pctlops = &mcp_pinctrl_ops;
 	mcp->pinctrl_desc.confops = &mcp_pinconf_ops;
-- 
2.7.4

