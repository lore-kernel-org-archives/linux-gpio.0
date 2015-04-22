From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH] Documentation: gpiolib: sysfs: high can be any nonzero value
Date: Wed, 22 Apr 2015 18:39:46 +0200
Message-ID: <1429720786-6277-1-git-send-email-dirk.behme@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:36694 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966340AbbDVQjw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2015 12:39:52 -0400
Received: by wizk4 with SMTP id k4so185166883wiz.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2015 09:39:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Dirk Behme <dirk.behme@gmail.com>

With the commit 79a9becda8940d ("gpiolib: export descriptor-based
GPIO interface") the gpiolib can return any nonzero value for high.
Not only 1. Correct this in the documentation.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---

Note: Commit 79a9becda8940d has been merged in v3.13. If this
      patch is considered to be fine, please think about applying
      it to -stable >= v3.14, too.

 Documentation/gpio/sysfs.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpio/sysfs.txt b/Documentation/gpio/sysfs.txt
index c2c3a97..bc7f31d 100644
--- a/Documentation/gpio/sysfs.txt
+++ b/Documentation/gpio/sysfs.txt
@@ -69,7 +69,7 @@ and have the following read/write attributes:
 		it was exported by kernel code that didn't explicitly
 		allow userspace to reconfigure this GPIO's direction.
 
-	"value" ... reads as either 0 (low) or 1 (high). If the GPIO
+	"value" ... reads as either 0 (low) or nonzero (high). If the GPIO
 		is configured as an output, this value may be written;
 		any nonzero value is treated as high.
 
-- 
2.3.6

