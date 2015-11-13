From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] MAINTAINERS: Update OMAP GPIO driver entry
Date: Fri, 13 Nov 2015 10:35:29 -0300
Message-ID: <1447421729-5294-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54458 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932277AbbKMNfm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 13 Nov 2015 08:35:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Kevin Hilman <khilman@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>

I'm not as involved in OMAP as I used to be and Grygorii is the most
active developer working on this driver and has also been reviewing
patches so let's add him as a driver maintainer instead of me.

While being there, add the driver's DT binding doc to the file list.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fca7daff3a79..50142445203c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7788,11 +7788,12 @@ F:	drivers/usb/*/*omap*
 F:	arch/arm/*omap*/usb*
 
 OMAP GPIO DRIVER
-M:	Javier Martinez Canillas <javier@dowhile0.org>
+M:	Grygorii Strashko <grygorii.strashko@ti.com>
 M:	Santosh Shilimkar <ssantosh@kernel.org>
 M:	Kevin Hilman <khilman@deeprootsystems.com>
 L:	linux-omap@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/gpio-omap.txt
 F:	drivers/gpio/gpio-omap.c
 
 OMAP/NEWFLOW NANOBONE MACHINE SUPPORT
-- 
2.4.3

