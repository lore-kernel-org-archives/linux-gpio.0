From: Vincent Pelletier <plr.vincent@gmail.com> (by way of Vincent
	Pelletier <plr.vincent@gmail.com>)
Subject: gpio: gpio-f7188x: Implement get_direction.
Date: Mon,  6 Jun 2016 00:56:08 +0000
Message-ID: <b45b37f797e1bfaa2de5e38b8119be55f9a784ce.1465174568.git.plr.vincent@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36388 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbcFFA5f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jun 2016 20:57:35 -0400
Received: by mail-pf0-f193.google.com with SMTP id 62so16639439pfd.3
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jun 2016 17:57:34 -0700 (PDT)
Received: from localhost (p11140-ipngn5801hodogaya.kanagawa.ocn.ne.jp. [222.148.106.140])
        by smtp.gmail.com with ESMTPSA id l67sm22851633pfi.10.2016.06.05.17.57.33
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jun 2016 17:57:34 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPSA id 01B27900808
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jun 2016 00:57:32 +0000 (GMT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Vincent Donnefort <vdonnefort@gmail.com>, Vincent Pelletier <plr.vincent@gmail.com>

Avoids gpiolib assumptions on initial pin direction, allowing user to observe
power-on settings.
---
 drivers/gpio/gpio-f7188x.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 62f8ac3..ef3a980 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -124,6 +124,7 @@ static inline void superio_exit(int base)
  * GPIO chip.
  */
 
+static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_direction_out(struct gpio_chip *chip,
@@ -135,6 +136,7 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
 		.chip = {						\
 			.label            = DRVNAME,			\
 			.owner            = THIS_MODULE,		\
+			.get_direction    = f7188x_gpio_get_direction,	\
 			.direction_input  = f7188x_gpio_direction_in,	\
 			.get              = f7188x_gpio_get,		\
 			.direction_output = f7188x_gpio_direction_out,	\
@@ -204,6 +206,26 @@ static struct f7188x_gpio_bank f81866_gpio_bank[] = {
 	F7188X_GPIO_BANK(80, 8, 0x88),
 };
 
+static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	int err;
+	struct f7188x_gpio_bank *bank =
+		container_of(chip, struct f7188x_gpio_bank, chip);
+	struct f7188x_sio *sio = bank->data->sio;
+	u8 dir;
+
+	err = superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
+
+	superio_exit(sio->addr);
+
+	return !(dir & 1 << offset);
+}
+
 static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
 	int err;
-- 
2.8.1

