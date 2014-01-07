From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] gpiolib: fix/clarify gpiod_direction_output comment
Date: Tue,  7 Jan 2014 11:07:54 +0100
Message-ID: <1389089274-26861-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:52167 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395AbaAGKH4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2014 05:07:56 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>

This corrects the gpiod_direction_output description comment
and adds clarification about the value parameter being a raw
value, not taking into account ACTIVE_LOW status.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpio/gpiolib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4e10b10..95f11ce 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1730,10 +1730,13 @@ fail:
 EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
 /**
- * gpiod_direction_output - set the GPIO direction to input
+ * gpiod_direction_output - set the GPIO direction to output
  * @desc:	GPIO to set to output
  * @value:	initial output value of the GPIO
  *
+ * Set the raw value of the GPIO, i.e. the value of its physical line without
+ * regard for its ACTIVE_LOW status.
+ *
  * Set the direction of the passed GPIO to output, such as gpiod_set_value() can
  * be called safely on it. The initial value of the output must be specified.
  *
-- 
1.8.5.2

