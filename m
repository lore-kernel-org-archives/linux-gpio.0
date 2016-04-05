From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tc3589x: implement open drain/source callback
Date: Tue,  5 Apr 2016 15:16:47 +0200
Message-ID: <1459862207-3560-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:36266 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751976AbcDENQx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2016 09:16:53 -0400
Received: by mail-lb0-f172.google.com with SMTP id qe11so9057764lbc.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2016 06:16:52 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Hennerich <michael.hennerich@analog.com>

This makes use of the new .set_single_ended() callback to
set the GPIO line as open drain/open source using hardware.
The TC3589x can do this by either disabling the N-MOS
transistor (open drain) or the P-MOS transistor (open source)
of the output driver stage, in the first case making the signal
drive actively low and high impedance as "high" and in the second
case actively high and high impedance, which is as close to native
open drain support as we come.

Cc: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 67332943e09a..03086e5c81cb 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -85,6 +85,46 @@ static int tc3589x_gpio_direction_input(struct gpio_chip *chip,
 	return tc3589x_set_bits(tc3589x, reg, BIT(pos), 0);
 }
 
+static int tc3589x_gpio_single_ended(struct gpio_chip *chip,
+				     unsigned offset,
+				     enum single_ended_mode mode)
+{
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
+	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
+	/*
+	 * These registers are alterated at each second address
+	 * ODM bit 0 = drive to GND or Hi-Z (open drain)
+	 * ODM bit 1 = drive to VDD or Hi-Z (open source)
+	 */
+	u8 odmreg = TC3589x_GPIOODM0 + (offset / 8) * 2;
+	u8 odereg = TC3589x_GPIOODE0 + (offset / 8) * 2;
+	unsigned pos = offset % 8;
+	int ret;
+
+	switch(mode) {
+	case LINE_MODE_OPEN_DRAIN:
+		/* Set open drain mode */
+		ret = tc3589x_set_bits(tc3589x, odmreg, BIT(pos), 0);
+		if (ret)
+			return ret;
+		/* Enable open drain/source mode */
+		return tc3589x_set_bits(tc3589x, odereg, BIT(pos), BIT(pos));
+	case LINE_MODE_OPEN_SOURCE:
+		/* Set open source mode */
+		ret = tc3589x_set_bits(tc3589x, odmreg, BIT(pos), BIT(pos));
+		if (ret)
+			return ret;
+		/* Enable open drain/source mode */
+		return tc3589x_set_bits(tc3589x, odereg, BIT(pos), BIT(pos));
+	case LINE_MODE_PUSH_PULL:
+		/* Disable open drain/source mode */
+		return tc3589x_set_bits(tc3589x, odereg, BIT(pos), 0);
+	default:
+		break;
+	}
+	return -ENOTSUPP;
+}
+
 static struct gpio_chip template_chip = {
 	.label			= "tc3589x",
 	.owner			= THIS_MODULE,
@@ -92,6 +132,7 @@ static struct gpio_chip template_chip = {
 	.get			= tc3589x_gpio_get,
 	.direction_output	= tc3589x_gpio_direction_output,
 	.set			= tc3589x_gpio_set,
+	.set_single_ended	= tc3589x_gpio_single_ended,
 	.can_sleep		= true,
 };
 
-- 
2.4.3

