From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] gpio: f7188x: use the new open drain callback
Date: Sat,  9 Apr 2016 16:13:32 +0200
Message-ID: <1460211212-2808-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35739 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751797AbcDIONi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Apr 2016 10:13:38 -0400
Received: by mail-lf0-f44.google.com with SMTP id c126so108008225lfb.2
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2016 07:13:37 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Peter Hung <hpeter@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>

The F7188x chips supports setting the pins in open drain mode.
Activate the new .set_single_ended() callback.

Cc: Peter Hung <hpeter@gmail.com>
Cc: Andreas Bofjall <andreas@gazonk.org>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-f7188x.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 8b10fbf787f8..75667afce387 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -130,6 +130,9 @@ static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value);
 static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
+static int f7188x_gpio_set_single_ended(struct gpio_chip *gc,
+					unsigned offset,
+					enum single_ended_mode mode);
 
 #define F7188X_GPIO_BANK(_base, _ngpio, _regbase)			\
 	{								\
@@ -140,6 +143,7 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
 			.get              = f7188x_gpio_get,		\
 			.direction_output = f7188x_gpio_direction_out,	\
 			.set              = f7188x_gpio_set,		\
+			.set_single_ended = f7188x_gpio_set_single_ended, \
 			.base             = _base,			\
 			.ngpio            = _ngpio,			\
 			.can_sleep        = true,			\
@@ -301,6 +305,35 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	superio_exit(sio->addr);
 }
 
+static int f7188x_gpio_set_single_ended(struct gpio_chip *gc,
+					unsigned offset,
+					enum single_ended_mode mode)
+{
+	int err;
+	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
+	struct f7188x_sio *sio = bank->data->sio;
+	u8 data;
+
+	if (mode != LINE_MODE_OPEN_DRAIN &&
+	    mode != LINE_MODE_PUSH_PULL)
+		return -ENOTSUPP;
+
+	err = superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	data = superio_inb(sio->addr, gpio_out_mode(bank->regbase));
+	if (mode == LINE_MODE_OPEN_DRAIN)
+		data &= ~BIT(offset);
+	else
+		data |= BIT(offset);
+	superio_outb(sio->addr, gpio_data_mode(bank->regbase), data);
+
+	superio_exit(sio->addr);
+	return 0;
+}
+
 /*
  * Platform device and driver.
  */
-- 
2.4.3

