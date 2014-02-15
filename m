From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] gpio: rc5t583: Remove redundant check
Date: Sat, 15 Feb 2014 17:24:07 +0400
Message-ID: <1392470647-16842-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback7.mail.ru ([94.100.176.135]:35885 "EHLO
	fallback7.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753188AbaBONYc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Feb 2014 08:24:32 -0500
Received: from smtp12.mail.ru (smtp12.mail.ru [94.100.176.89])
	by fallback7.mail.ru (mPOP.Fallback_MX) with ESMTP id A5ED9F8AF31C
	for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2014 17:24:28 +0400 (MSK)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

Variable "offset" cannot be negative, so no need to check if it
greater than zero or equal.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-rc5t583.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index 122b776..9b42317 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -97,7 +97,7 @@ static int rc5t583_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct rc5t583_gpio *rc5t583_gpio = to_rc5t583_gpio(gc);
 
-	if ((offset >= 0) && (offset < 8))
+	if (offset < RC5T583_MAX_GPIO)
 		return rc5t583_gpio->rc5t583->irq_base +
 				RC5T583_IRQ_GPIO0 + offset;
 	return -EINVAL;
-- 
1.8.3.2

