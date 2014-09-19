From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] GPIO: gpiolib: trivial: Add missing carriage return
Date: Fri, 19 Sep 2014 11:39:25 +0400
Message-ID: <1411112365-15967-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback3.mail.ru ([94.100.181.189]:39428 "EHLO
	fallback3.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750705AbaISHoc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Sep 2014 03:44:32 -0400
Received: from smtp51.i.mail.ru (smtp51.i.mail.ru [94.100.177.111])
	by fallback3.mail.ru (mPOP.Fallback_MX) with ESMTP id 17CE4126D802A
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2014 11:39:48 +0400 (MSK)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexander Shiyan <shc_work@mail.ru>

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a5831d6..c8c47d0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1662,7 +1662,7 @@ struct gpio_desc *__must_check __gpiod_get_index(struct device *dev,
 	 * a result. In that case, use platform lookup as a fallback.
 	 */
 	if (!desc || desc == ERR_PTR(-ENOENT)) {
-		dev_dbg(dev, "using lookup tables for GPIO lookup");
+		dev_dbg(dev, "using lookup tables for GPIO lookup\n");
 		desc = gpiod_find(dev, con_id, idx, &lookupflags);
 	}
 
-- 
1.8.5.5

