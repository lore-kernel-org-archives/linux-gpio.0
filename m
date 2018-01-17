From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 1/3] pinctrl: sx150x: unregister the pinctrl on release
Date: Wed, 17 Jan 2018 14:34:21 +0100
Message-ID: <20180117133423.4482-2-peda@axentia.se>
References: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
 <20180117133423.4482-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr30129.outbound.protection.outlook.com ([40.107.3.129]:45475
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753129AbeAQNeh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jan 2018 08:34:37 -0500
In-Reply-To: <20180117133423.4482-1-peda@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-gpio@vger.kernel.org

There is no matching call to pinctrl_unregister, so switch to the
managed devm_pinctrl_register to clean up properly when done.

Fixes: 9e80f9064e73 ("pinctrl: Add SX150X GPIO Extender Pinctrl Driver")
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/pinctrl/pinctrl-sx150x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index fb242c542dc9..f926ba044577 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1225,7 +1225,7 @@ static int sx150x_probe(struct i2c_client *client,
 	pctl->pinctrl_desc.npins = pctl->data->npins;
 	pctl->pinctrl_desc.owner = THIS_MODULE;
 
-	pctl->pctldev = pinctrl_register(&pctl->pinctrl_desc, dev, pctl);
+	pctl->pctldev = devm_pinctrl_register(dev, &pctl->pinctrl_desc, pctl);
 	if (IS_ERR(pctl->pctldev)) {
 		dev_err(dev, "Failed to register pinctrl device\n");
 		return PTR_ERR(pctl->pctldev);
-- 
2.11.0

