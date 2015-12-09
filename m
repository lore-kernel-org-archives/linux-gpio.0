From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 049/182] gpio: pcf857x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:19:40 +0100
Message-ID: <1449667180-32071-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:32906 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753962AbbLINTo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:19:44 -0500
Received: by lfaz4 with SMTP id z4so34048883lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:19:43 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, George Cherian <george.cherian@ti.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: George Cherian <george.cherian@ti.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pcf857x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 407ca5e1aafa..ca340ed8a200 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -137,7 +137,7 @@ static int i2c_read_le16(struct i2c_client *client)
 
 static int pcf857x_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct pcf857x	*gpio = container_of(chip, struct pcf857x, chip);
+	struct pcf857x	*gpio = gpiochip_get_data(chip);
 	int		status;
 
 	mutex_lock(&gpio->lock);
@@ -150,7 +150,7 @@ static int pcf857x_input(struct gpio_chip *chip, unsigned offset)
 
 static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct pcf857x	*gpio = container_of(chip, struct pcf857x, chip);
+	struct pcf857x	*gpio = gpiochip_get_data(chip);
 	int		value;
 
 	value = gpio->read(gpio->client);
@@ -159,7 +159,7 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
 
 static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct pcf857x	*gpio = container_of(chip, struct pcf857x, chip);
+	struct pcf857x	*gpio = gpiochip_get_data(chip);
 	unsigned	bit = 1 << offset;
 	int		status;
 
@@ -372,7 +372,7 @@ static int pcf857x_probe(struct i2c_client *client,
 	gpio->out = ~n_latch;
 	gpio->status = gpio->out;
 
-	status = gpiochip_add(&gpio->chip);
+	status = gpiochip_add_data(&gpio->chip, gpio);
 	if (status < 0)
 		goto fail;
 
-- 
2.4.3

