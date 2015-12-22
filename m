From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 24/54] pinctrl: baytrail: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:28:48 +0100
Message-ID: <1450794528-23650-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33623 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932797AbbLVO2x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:28:53 -0500
Received: by mail-lf0-f42.google.com with SMTP id p203so131714305lfa.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:28:53 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index bb92f8ae6b33..1fe9c1989353 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -281,7 +281,7 @@ static int byt_gpio_get(struct gpio_chip *chip, unsigned offset)
 	val = readl(reg);
 	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
-	return val & BYT_LEVEL;
+	return !!(val & BYT_LEVEL);
 }
 
 static void byt_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.4.3

