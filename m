From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] gpio: samsung: Remove double variable assignment
Date: Sat, 15 Feb 2014 17:29:36 +0400
Message-ID: <1392470976-16901-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp15.mail.ru ([94.100.176.133]:33441 "EHLO smtp15.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753153AbaBON3k (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 15 Feb 2014 08:29:40 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-samsung.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index a85e00b..929f31e 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -377,7 +377,6 @@ static int s5p64x0_gpio_setcfg_rbank(struct samsung_gpio_chip *chip,
 		reg -= 4;
 		break;
 	case 6:
-		shift = ((off + 1) & 7) * 4;
 		reg -= 4;
 	default:
 		shift = ((off + 1) & 7) * 4;
-- 
1.8.3.2

