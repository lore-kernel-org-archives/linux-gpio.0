From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: dln2: Fix gpio output value in
 dln2_gpio_direction_output()
Date: Tue, 16 Dec 2014 22:40:00 +0800
Message-ID: <1418740800.10278.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:37371 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832AbaLPOkF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Dec 2014 09:40:05 -0500
Received: by mail-pa0-f51.google.com with SMTP id ey11so14268997pad.38
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2014 06:40:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Daniel Baluta <daniel.baluta@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

dln2_gpio_direction_output() ignored the state passed into it. Fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
I don't have this hardware handy, so only compile test.
 drivers/gpio/gpio-dln2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 978b51e..1434844 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -267,6 +267,7 @@ static int dln2_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				      int value)
 {
+	dln2_gpio_set(chip, offset, value);
 	return dln2_gpio_set_direction(chip, offset, DLN2_GPIO_DIRECTION_OUT);
 }
 
-- 
1.9.1



