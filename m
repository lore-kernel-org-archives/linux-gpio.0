From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: [3/4] gpio: gpio-f7188x: "get" should retrieve sensed level when available.
Date: Thu, 20 Aug 2015 20:03:28 +0200
Message-ID: <572de04a2dd3bd65e86c144c6b4458e95d459583.1440093298.git.plr.vincent@gmail.com>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:34077 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239AbbHTSDr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2015 14:03:47 -0400
Received: by wicne3 with SMTP id ne3so103927wic.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2015 11:03:46 -0700 (PDT)
In-Reply-To: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
In-Reply-To: <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
References: <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Simon Guinot <simon.guinot@sequanux.org>

As of struct gpio_chip "get" member documentation:
 * @get: returns value for signal "offset"; for output signals this
 *      returns either the value actually sensed, or zero
As in this chip, read and driven values are controlled by distinct
registers, unconditionally expose sensed values.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
---
 drivers/gpio/gpio-f7188x.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 9a56afe..d59cccd 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -236,15 +236,10 @@ static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct f7188x_gpio_bank *bank =
 		container_of(chip, struct f7188x_gpio_bank, chip);
 	struct f7188x_sio *sio = bank->data->sio;
-	u8 dir, data;
+	u8 data;
 
 	mutex_lock(&sio->lock);
-	dir = f7188x_read8(sio, gpio_dir(bank->regbase));
-	dir = !!(dir & (1 << offset));
-	if (dir)
-		data = f7188x_read8(sio, gpio_data_out(bank->regbase));
-	else
-		data = f7188x_read8(sio, gpio_data_in(bank->regbase));
+	data = f7188x_read8(sio, gpio_data_in(bank->regbase));
 	mutex_unlock(&sio->lock);
 
 	return !!(data & 1 << offset);
-- 
2.5.0

