From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio 2/4] gpio-max7300: remove 'ret' variable
Date: Tue, 31 Mar 2015 09:49:09 +0530
Message-ID: <1427775551-6908-3-git-send-email-varkab@cdac.in>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:35955 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750773AbbCaETr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2015 00:19:47 -0400
Received: by pdcp1 with SMTP id p1so7466657pdc.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2015 21:19:46 -0700 (PDT)
In-Reply-To: <1427775551-6908-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, Varka Bhadram <varkab@cdac.in>

Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-max7300.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max7300.c b/drivers/gpio/gpio-max7300.c
index 40ab6df..0cc2c27 100644
--- a/drivers/gpio/gpio-max7300.c
+++ b/drivers/gpio/gpio-max7300.c
@@ -35,7 +35,6 @@ static int max7300_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct max7301 *ts;
-	int ret;
 
 	if (!i2c_check_functionality(client->adapter,
 			I2C_FUNC_SMBUS_BYTE_DATA))
@@ -49,8 +48,7 @@ static int max7300_probe(struct i2c_client *client,
 	ts->write = max7300_i2c_write;
 	ts->dev = &client->dev;
 
-	ret = __max730x_probe(ts);
-	return ret;
+	return __max730x_probe(ts);
 }
 
 static int max7300_remove(struct i2c_client *client)
-- 
1.7.9.5

