From: Vasyl Gomonovych <gomonovych@gmail.com>
Subject: [PATCH] gpio: fix aspeed_gpio_banks array size check
Date: Thu, 21 Dec 2017 16:55:10 +0100
Message-ID: <1513871710-13765-1-git-send-email-gomonovych@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36651 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751608AbdLUPzU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Dec 2017 10:55:20 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: joel@jms.id.au, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, gomonovych@gmail.com
Cc: linux-kernel@vger.kernel.org

The test should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().

Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 6b3ca6601af2..aac532837b81 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -140,7 +140,7 @@ static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
 {
 	unsigned int bank = GPIO_BANK(offset);
 
-	WARN_ON(bank > ARRAY_SIZE(aspeed_gpio_banks));
+	WARN_ON(bank >= ARRAY_SIZE(aspeed_gpio_banks));
 	return &aspeed_gpio_banks[bank];
 }
 
-- 
1.9.1

