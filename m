From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RESEND] gpio: Add support for GPIOF_ACTIVE_LOW to gpio_request_one functions
Date: Mon, 21 Jul 2014 11:12:16 -0700
Message-ID: <1405966336-6605-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:43373 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932320AbaGUSMb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jul 2014 14:12:31 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Guenter Roeck <linux@roeck-us.net>

The gpio include file and the gpio documentation declare and document
GPIOF_ACTIVE_LOW as one of the flags to be passed to gpio_request_one
and related functions. However, the flag is not evaluated or used.

This can cause problems in at least two areas: First, the same API can
be used to auto-export pins to user space. The missing support for
GPIOF_ACTIVE_LOW results in unexpected behavior for such auto-exported
pins. Second, the requested gpio pin can be convered for use by
gpiod functions with gpio_to_desc(). While gpio API functions do not
support GPIOF_ACTIVE_LOW, gpiod functions do, which again results in
unexpected behavior.

Check the flag in gpio_request_one and set the gpio internal flag
FLAG_ACTIVE_LOW if it is set to address those problems.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
Resent with added rationale.

 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2ebc907..43d9e34 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1842,6 +1842,9 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 	if (flags & GPIOF_OPEN_SOURCE)
 		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
 
+	if (flags & GPIOF_ACTIVE_LOW)
+		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+
 	if (flags & GPIOF_DIR_IN)
 		err = gpiod_direction_input(desc);
 	else
-- 
1.9.1

