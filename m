From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tps65218: use the new open drain callback
Date: Fri,  8 Apr 2016 14:16:28 +0200
Message-ID: <1460117788-3636-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:33137 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753118AbcDHMQl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Apr 2016 08:16:41 -0400
Received: by mail-lb0-f180.google.com with SMTP id u8so68190042lbk.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Apr 2016 05:16:40 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>

The TPS65218 supports open drain mode on its three pins,
with one of them configurable also as push-pull. Use the
new .set_single_ended() callback to set this up properly
from the core, so the core actually see it can drive the
pin(s) as open drain, and does not attempt to emulate
open drain by switching the pin to an input.

Cc: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tps65218.c | 45 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 313c0e484607..0eaeac8de9de 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -101,16 +101,6 @@ static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
 
 		break;
 	case 1:
-		/* GP02 is push-pull by default, can be set as open drain. */
-		if (gpiochip_line_is_open_drain(gc, offset)) {
-			ret = tps65218_clear_bits(tps65218,
-						  TPS65218_REG_CONFIG1,
-						  TPS65218_CONFIG1_GPO2_BUF,
-						  TPS65218_PROTECT_L1);
-			if (ret)
-				return ret;
-		}
-
 		/* Setup GPO2 */
 		ret = tps65218_clear_bits(tps65218, TPS65218_REG_CONFIG1,
 					  TPS65218_CONFIG1_IO1_SEL,
@@ -148,6 +138,40 @@ static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
+static int tps65218_gpio_set_single_ended(struct gpio_chip *gc,
+					  unsigned offset,
+					  enum single_ended_mode mode)
+{
+	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
+	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
+
+	switch (offset) {
+	case 0:
+	case 2:
+		/* GPO1 is hardwired to be open drain */
+		if (mode == LINE_MODE_OPEN_DRAIN)
+			return 0;
+		return -ENOTSUPP;
+	case 1:
+		/* GPO2 is push-pull by default, can be set as open drain. */
+		if (mode == LINE_MODE_OPEN_DRAIN)
+			return tps65218_clear_bits(tps65218,
+						   TPS65218_REG_CONFIG1,
+						   TPS65218_CONFIG1_GPO2_BUF,
+						   TPS65218_PROTECT_L1);
+		if (mode == LINE_MODE_PUSH_PULL)
+			return tps65218_set_bits(tps65218,
+						 TPS65218_REG_CONFIG1,
+						 TPS65218_CONFIG1_GPO2_BUF,
+						 TPS65218_CONFIG1_GPO2_BUF,
+						 TPS65218_PROTECT_L1);
+		return -ENOTSUPP;
+	default:
+		break;
+	}
+	return -ENOTSUPP;
+}
+
 static struct gpio_chip template_chip = {
 	.label			= "gpio-tps65218",
 	.owner			= THIS_MODULE,
@@ -156,6 +180,7 @@ static struct gpio_chip template_chip = {
 	.direction_input	= tps65218_gpio_input,
 	.get			= tps65218_gpio_get,
 	.set			= tps65218_gpio_set,
+	.set_single_ended	= tps65218_gpio_set_single_ended,
 	.can_sleep		= true,
 	.ngpio			= 3,
 	.base			= -1,
-- 
2.4.3

