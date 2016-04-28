From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: stmpe: implement .get_direction()
Date: Thu, 28 Apr 2016 15:04:15 +0200
Message-ID: <1461848655-12230-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:35818 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845AbcD1NEW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2016 09:04:22 -0400
Received: by mail-lf0-f45.google.com with SMTP id c126so94438132lfb.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2016 06:04:21 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice Chotard <patrice.chotard@st.com>

This implements the .get_direction() callback for the STMPE
expander GPIO.

Cc: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 5197edf1acfd..5f77ea6b294d 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -69,6 +69,22 @@ static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 		stmpe_reg_write(stmpe, reg, mask);
 }
 
+static int stmpe_gpio_get_direction(struct gpio_chip *chip,
+				    unsigned offset)
+{
+	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
+	struct stmpe *stmpe = stmpe_gpio->stmpe;
+	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB] - (offset / 8);
+	u8 mask = 1 << (offset % 8);
+	int ret;
+
+	ret = stmpe_reg_read(stmpe, reg);
+	if (ret < 0)
+		return ret;
+
+	return !(ret & mask);
+}
+
 static int stmpe_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned offset, int val)
 {
@@ -107,6 +123,7 @@ static int stmpe_gpio_request(struct gpio_chip *chip, unsigned offset)
 static struct gpio_chip template_chip = {
 	.label			= "stmpe",
 	.owner			= THIS_MODULE,
+	.get_direction		= stmpe_gpio_get_direction,
 	.direction_input	= stmpe_gpio_direction_input,
 	.get			= stmpe_gpio_get,
 	.direction_output	= stmpe_gpio_direction_output,
-- 
2.4.11

