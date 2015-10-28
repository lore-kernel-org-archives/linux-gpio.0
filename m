From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] MAINTAINERS: Add ACCES 104-IDIO-16 DRIVER entry
Date: Wed, 28 Oct 2015 17:24:16 -0400
Message-ID: <20151028212416.GA21860@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:35815 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750731AbbJ1VY0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2015 17:24:26 -0400
Received: by ykek133 with SMTP id k133so22666256yke.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2015 14:24:25 -0700 (PDT)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org

Add William Breathitt Gray as the maintainer of the ACCES 104-IDIO-16
GPIO driver.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 274f854..73aa81b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -240,6 +240,12 @@ L:	lm-sensors@lm-sensors.org
 S:	Maintained
 F:	drivers/hwmon/abituguru3.c
 
+ACCES 104-IDIO-16 DRIVER
+M:	"William Breathitt Gray" <vilhelm.gray@gmail.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-104-idio-16.c
+
 ACENIC DRIVER
 M:	Jes Sorensen <jes@trained-monkey.org>
 L:	linux-acenic@sunsite.dk
-- 
2.4.10

