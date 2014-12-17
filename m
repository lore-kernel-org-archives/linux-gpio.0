From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v2] gpio: dln2: Fix gpio output value in
 dln2_gpio_direction_output()
Date: Wed, 17 Dec 2014 17:47:14 +0800
Message-ID: <1418809634.15005.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:61109 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbaLQJrU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Dec 2014 04:47:20 -0500
Received: by mail-pa0-f41.google.com with SMTP id rd3so16125039pab.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2014 01:47:19 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Daniel Baluta <daniel.baluta@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Octavian Purdila <octavian.purdila@intel.com>

dln2_gpio_direction_output() ignored the state passed into it. Fix it.
Also make dln2_gpio_pin_set_out_val return int, so we can check the error value.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Tested-by: Daniel Baluta <daniel.baluta@intel.com>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Octavian Purdila <octavian.purdila@intel.com>
---
v2: Address Octavian's comment.
 drivers/gpio/gpio-dln2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 978b51e..2481e8d 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -141,16 +141,16 @@ static int dln2_gpio_pin_get_out_val(struct dln2_gpio *dln2, unsigned int pin)
 	return !!ret;
 }
 
-static void dln2_gpio_pin_set_out_val(struct dln2_gpio *dln2,
-				      unsigned int pin, int value)
+static int dln2_gpio_pin_set_out_val(struct dln2_gpio *dln2,
+				     unsigned int pin, int value)
 {
 	struct dln2_gpio_pin_val req = {
 		.pin = cpu_to_le16(pin),
 		.value = value,
 	};
 
-	dln2_transfer_tx(dln2->pdev, DLN2_GPIO_PIN_SET_OUT_VAL, &req,
-			 sizeof(req));
+	return dln2_transfer_tx(dln2->pdev, DLN2_GPIO_PIN_SET_OUT_VAL, &req,
+				sizeof(req));
 }
 
 #define DLN2_GPIO_DIRECTION_IN		0
@@ -267,6 +267,13 @@ static int dln2_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				      int value)
 {
+	struct dln2_gpio *dln2 = container_of(chip, struct dln2_gpio, gpio);
+	int ret;
+
+	ret = dln2_gpio_pin_set_out_val(dln2, offset, value);
+	if (ret < 0)
+		return ret;
+
 	return dln2_gpio_set_direction(chip, offset, DLN2_GPIO_DIRECTION_OUT);
 }
 
-- 
1.9.1



