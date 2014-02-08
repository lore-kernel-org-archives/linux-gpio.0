From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Subject: [PATCH] GPIO: gpiolib: correct description of gpiod_direction_output
Date: Sat, 8 Feb 2014 11:55:25 +0530
Message-ID: <20140208062525.GA3984@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:32945 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748AbaBHGZf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Feb 2014 01:25:35 -0500
Received: by mail-pb0-f46.google.com with SMTP id um1so4120299pbc.5
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2014 22:25:34 -0800 (PST)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org


Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 50c4922..5d6bbbf 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1757,7 +1757,7 @@ fail:
 EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
 /**
- * gpiod_direction_output - set the GPIO direction to input
+ * gpiod_direction_output - set the GPIO direction to output
  * @desc:	GPIO to set to output
  * @value:	initial output value of the GPIO
  *
-- 
1.8.1.2

