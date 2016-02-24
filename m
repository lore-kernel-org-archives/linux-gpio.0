From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: pisosr: Use gpiod_set_value_cansleep in
 pisosr_gpio_refresh()
Date: Wed, 24 Feb 2016 21:31:14 +0800
Message-ID: <1456320674.8959.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:34550 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932528AbcBXNbT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2016 08:31:19 -0500
Received: by mail-pa0-f41.google.com with SMTP id fy10so12829881pac.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Feb 2016 05:31:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

This driver has .can_sleep flag set.
So the pisosr_gpio_get() can be called from contexts that can sleep.
Thus use the cansleep() variant in pisosr_gpio_refresh().

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-pisosr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index f9f1074..597cec6 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -46,9 +46,9 @@ static int pisosr_gpio_refresh(struct pisosr_gpio *gpio)
 	mutex_lock(&gpio->lock);
 
 	if (gpio->load_gpio) {
-		gpiod_set_value(gpio->load_gpio, 1);
+		gpiod_set_value_cansleep(gpio->load_gpio, 1);
 		udelay(1); /* registers load time (~10ns) */
-		gpiod_set_value(gpio->load_gpio, 0);
+		gpiod_set_value_cansleep(gpio->load_gpio, 0);
 		udelay(1); /* registers recovery time (~5ns) */
 	}
 
-- 
2.1.4



