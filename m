From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 06/54] gpio: janz-ttl: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:12:36 +0100
Message-ID: <1450793556-22116-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36670 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752914AbbLVOMl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:12:41 -0500
Received: by mail-lf0-f52.google.com with SMTP id z124so125196180lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:12:40 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, "Ira W. Snyder" <iws@ovro.caltech.edu>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Ira W. Snyder <iws@ovro.caltech.edu>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-janz-ttl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.c
index e5f85cab0100..236d322a0b5e 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -76,7 +76,7 @@ static int ttl_get_value(struct gpio_chip *gpio, unsigned offset)
 	spin_lock(&mod->lock);
 	ret = *shadow & (1 << offset);
 	spin_unlock(&mod->lock);
-	return ret;
+	return !!ret;
 }
 
 static void ttl_set_value(struct gpio_chip *gpio, unsigned offset, int value)
-- 
2.4.3

