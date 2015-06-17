From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] gpio: altera: fix return value of altera_gpio_remove()
Date: Wed, 17 Jun 2015 20:59:43 +0900
Message-ID: <1434542383-21314-2-git-send-email-yamada.masahiro@socionext.com>
References: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:45992 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753605AbbFQMAD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2015 08:00:03 -0400
In-Reply-To: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, Tien Hock Loh <thloh@altera.com>

The remove callback never succeeds, which seems odd.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I wonder why nobody has pointed this out before me.
I am suspecting -EIO might be intentional.
I hope some Altera guys will give me comments.


 drivers/gpio/gpio-altera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index c653c83..5861550 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -339,7 +339,7 @@ static int altera_gpio_remove(struct platform_device *pdev)
 
 	of_mm_gpiochip_remove(&altera_gc->mmchip);
 
-	return -EIO;
+	return 0;
 }
 
 static const struct of_device_id altera_gpio_of_match[] = {
-- 
1.9.1

