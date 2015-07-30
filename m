From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: join dev_dbg strings into a single line
Date: Thu, 30 Jul 2015 17:27:44 +0900
Message-ID: <1438244864-30737-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:54558 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751177AbbG3I2X (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2015 04:28:23 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

These are user-visible strings, so can exceed 80 columns.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinconf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 1fc09dc..c4ba738 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -61,8 +61,8 @@ int pin_config_get_for_pin(struct pinctrl_dev *pctldev, unsigned pin,
 	const struct pinconf_ops *ops = pctldev->desc->confops;
 
 	if (!ops || !ops->pin_config_get) {
-		dev_dbg(pctldev->dev, "cannot get pin configuration, missing "
-			"pin_config_get() function in driver\n");
+		dev_dbg(pctldev->dev,
+			"cannot get pin configuration, .pin_config_get missing in driver\n");
 		return -ENOTSUPP;
 	}
 
-- 
1.9.1

