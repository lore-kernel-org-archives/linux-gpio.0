From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: [2/4] gpio: gpio-f7188x: GPIO bank 0 bit 0 is not available on f71869a
Date: Thu, 20 Aug 2015 20:03:27 +0200
Message-ID: <5ee31a07812e4bb3af791300416fec848f175cc7.1440093298.git.plr.vincent@gmail.com>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:34066 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751031AbbHTSDr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2015 14:03:47 -0400
Received: by wicne3 with SMTP id ne3so103623wic.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2015 11:03:45 -0700 (PDT)
In-Reply-To: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
In-Reply-To: <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
References: <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Simon Guinot <simon.guinot@sequanux.org>

In version 0.19P (2011/10) of the datasheet, GPIO00 is marked as available
on the global register map (page 52), but marked as reserved in detailed
register map (page 112).

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
---
 drivers/gpio/gpio-f7188x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 2915f8d..9a56afe 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -186,7 +186,7 @@ static struct f7188x_gpio_bank f71869_gpio_bank[] = {
 };
 
 static struct f7188x_gpio_bank f71869a_gpio_bank[] = {
-	F7188X_GPIO_BANK(0, 6, 0xF0),
+	F7188X_GPIO_BANK(1, 5, 0xF0),
 	F7188X_GPIO_BANK(10, 8, 0xE0),
 	F7188X_GPIO_BANK(20, 8, 0xD0),
 	F7188X_GPIO_BANK(30, 8, 0xC0),
-- 
2.5.0

