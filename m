From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: [4/4] gpio: gpio-f7188x: Implement get_direction.
Date: Thu, 20 Aug 2015 20:03:29 +0200
Message-ID: <abfea401c3b82ed6ca939299812337e63aa15847.1440093298.git.plr.vincent@gmail.com>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:37032 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751031AbbHTSDs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2015 14:03:48 -0400
Received: by widdq5 with SMTP id dq5so13036912wid.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2015 11:03:47 -0700 (PDT)
In-Reply-To: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
In-Reply-To: <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
References: <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Simon Guinot <simon.guinot@sequanux.org>

Avoids gpiolib assumptions on initial pin direction, allowing user to observe
power-on settings.
---
 drivers/gpio/gpio-f7188x.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index d59cccd..ec121a3 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -147,6 +147,7 @@ static void f7188x_write8(struct f7188x_sio *data, u8 reg, u8 val)
  * GPIO chip.
  */
 
+static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_direction_out(struct gpio_chip *chip,
@@ -158,6 +159,7 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
 		.chip = {						\
 			.label            = DRVNAME,			\
 			.owner            = THIS_MODULE,		\
+			.get_direction    = f7188x_gpio_get_direction,	\
 			.direction_input  = f7188x_gpio_direction_in,	\
 			.get              = f7188x_gpio_get,		\
 			.direction_output = f7188x_gpio_direction_out,	\
@@ -215,6 +217,20 @@ static struct f7188x_gpio_bank f71889_gpio_bank[] = {
 	F7188X_GPIO_BANK(70, 8, 0x80),
 };
 
+static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	struct f7188x_gpio_bank *bank =
+		container_of(chip, struct f7188x_gpio_bank, chip);
+	struct f7188x_sio *sio = bank->data->sio;
+	u8 dir;
+
+	mutex_lock(&sio->lock);
+	dir = f7188x_read8(sio, gpio_dir(bank->regbase));
+	mutex_unlock(&sio->lock);
+
+	return !(dir & 1 << offset);
+}
+
 static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
 	struct f7188x_gpio_bank *bank =
-- 
2.5.0

