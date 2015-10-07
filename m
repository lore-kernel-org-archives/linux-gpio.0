From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/3] usb: renesas_usbhs: Remove unneeded #include <linux/platform_data/gpio-rcar.h>
Date: Wed,  7 Oct 2015 10:23:43 +0200
Message-ID: <1444206225-25664-2-git-send-email-geert+renesas@glider.be>
References: <1444206225-25664-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444206225-25664-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

This header file will be removed soon.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Please schedule for v4.3, or provide an Ack, so it can go in through the
GPIO tree. Thanks!
---
 drivers/usb/renesas_usbhs/rcar2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/rcar2.c b/drivers/usb/renesas_usbhs/rcar2.c
index 8fc15c0ba339..277160bc6f25 100644
--- a/drivers/usb/renesas_usbhs/rcar2.c
+++ b/drivers/usb/renesas_usbhs/rcar2.c
@@ -13,7 +13,6 @@
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
-#include <linux/platform_data/gpio-rcar.h>
 #include <linux/usb/phy.h>
 #include "common.h"
 #include "rcar2.h"
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
