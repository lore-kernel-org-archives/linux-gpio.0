From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] gpio: of: add missing of_node_put() in of_gpiochip_scan_gpios()
Date: Sat, 29 Oct 2016 16:13:52 +0000
Message-ID: <1477757632-26746-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34896 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932602AbcJ2QOV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Oct 2016 12:14:21 -0400
Received: by mail-pf0-f195.google.com with SMTP id s8so4242108pfj.2
        for <linux-gpio@vger.kernel.org>; Sat, 29 Oct 2016 09:14:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

When terminating for_each_available_child_of_node() iteration
with break or return, of_node_put() should be used to prevent
stale device node references from being left behind.

This is detected by Coccinelle semantic patch.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpiolib-of.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index b46be18..92b185f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -251,8 +251,10 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 			continue;
 
 		ret = gpiod_hog(desc, name, lflags, dflags);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(np);
 			return ret;
+		}
 	}
 
 	return 0;

