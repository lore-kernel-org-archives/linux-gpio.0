From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: label descriptors using the device name
Date: Thu,  4 Jan 2018 22:40:23 +0100
Message-ID: <20180104214023.17400-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34234 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751829AbeADVm3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jan 2018 16:42:29 -0500
Received: by mail-lf0-f68.google.com with SMTP id h140so3213165lfg.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jan 2018 13:42:29 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, "Reported-by : Jason Kridner" <jkridner@beagleboard.org>

Some GPIO lines appear named "?" in the lsgpio dump due to their
requesting drivers not passing a reasonable label.

Most typically this happens if a device tree node just defines
gpios = <...> and not foo-gpios = <...>, the former gets named
"foo" and the latter gets named "?".

However the struct device passed in is always valid so let's
just label the GPIO with dev_name() on the device if no proper
label was passed.

Cc: Reported-by: Jason Kridner <jkridner@beagleboard.org>
Reported-by: Jason Kridner <jkridner@beagleboard.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Jason: would be great if you can test this and check if it gives
you reasonable consumer names.
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7dde703b6da2..986293143068 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3650,7 +3650,8 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 		return desc;
 	}
 
-	status = gpiod_request(desc, con_id);
+	/* If a connection label was passed use that, else use the device name as label */
+	status = gpiod_request(desc, con_id ? con_id : dev_name(dev));
 	if (status < 0)
 		return ERR_PTR(status);
 
-- 
2.14.3

