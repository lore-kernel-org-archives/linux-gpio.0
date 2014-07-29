From: Markus Mayer <code@mmayer.net>
Subject: [PATCH] MAINTAINERS: Change maintainer for gpio-bcm-kona.c
Date: Tue, 29 Jul 2014 11:10:07 -0700
Message-ID: <1406657407-40031-1-git-send-email-code@mmayer.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from idcmail-mo2no.shaw.ca ([64.59.134.9]:47690 "EHLO
	idcmail-mo2no.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212AbaG2STk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Jul 2014 14:19:40 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>
Cc: Linux GPIO List <linux-gpio@vger.kernel.org>, Markus Mayer <markus.mayer@linaro.org>

Since I no longer have access to the hardware, Ray Jui will take over
maintaining the Kona GPIO driver.

In addition, my former e-mail addresses mmayer@broadcom.com and
markus.mayer@linaro.org will cease to function shortly. So, I used an
address I can still be reached at as the "author" addess here.

Signed-off-by: Markus Mayer <code@mmayer.net>
Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61a8f48..888549f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1999,7 +1999,7 @@ S:	Supported
 F:	drivers/scsi/bnx2i/
 
 BROADCOM KONA GPIO DRIVER
-M:	Markus Mayer <markus.mayer@linaro.org>
+M:	Ray Jui <rjui@broadcom.com>
 L:	bcm-kernel-feedback-list@broadcom.com
 S:	Supported
 F:	drivers/gpio/gpio-bcm-kona.c
-- 
1.9.3

