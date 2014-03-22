From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] gpio: samsung: Add missing "break" statement
Date: Sat, 22 Mar 2014 12:35:22 +0400
Message-ID: <1395477322-19951-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp11.mail.ru ([94.100.176.85]:49093 "EHLO smtp11.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750738AbaCVIfZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 22 Mar 2014 04:35:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-samsung.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index a85e00b..07105ee 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -379,6 +379,7 @@ static int s5p64x0_gpio_setcfg_rbank(struct samsung_gpio_chip *chip,
 	case 6:
 		shift = ((off + 1) & 7) * 4;
 		reg -= 4;
+		break;
 	default:
 		shift = ((off + 1) & 7) * 4;
 		break;
-- 
1.8.3.2

