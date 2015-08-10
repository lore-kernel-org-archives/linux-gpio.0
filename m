From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio/ABI: document what is already the case
Date: Mon, 10 Aug 2015 12:00:17 +0200
Message-ID: <1439200817-7268-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:34502 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754836AbbHJKA0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2015 06:00:26 -0400
Received: by lbbtg9 with SMTP id tg9so54230053lbb.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2015 03:00:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Daniel Silverstone <dsilvers@digital-scurf.org>, Markus Pargmann <mpa@pengutronix.de>, Johan Hovold <johan@kernel.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

commit 926b663ce8215ba448960e1ff6e58b67a2c3b99b
"gpiolib: allow GPIOs to be named" added the ability to
name GPIO lines by an array of names stored in the GPIO
chip. This was in 2009 and has been an ABI since. Let's
document it properly.

Cc: Daniel Silverstone <dsilvers@digital-scurf.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Cc: Johan Hovold <johan@kernel.org>
Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This flat namespace does not allow two GPIO lines to have
the same name, sadly. Now I can not do anything about it,
it is just so.
---
 Documentation/ABI/testing/sysfs-gpio | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-gpio b/Documentation/ABI/t=
esting/sysfs-gpio
index 80f4c94c7bef..55ffa2df1c10 100644
--- a/Documentation/ABI/testing/sysfs-gpio
+++ b/Documentation/ABI/testing/sysfs-gpio
@@ -16,7 +16,8 @@ Description:
     /sys/class/gpio
 	/export ... asks the kernel to export a GPIO to userspace
 	/unexport ... to return a GPIO to the kernel
-	/gpioN ... for each exported GPIO #N
+	/gpioN ... for each exported GPIO #N OR
+	/<LINE-NAME> ... for a properly named GPIO line
 	    /value ... always readable, writes fail for input GPIOs
 	    /direction ... r/w as: in, out (default low); write: high, low
 	    /edge ... r/w as: none, falling, rising, both
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
