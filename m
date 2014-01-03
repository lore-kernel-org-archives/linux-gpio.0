From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] gpio: samsung: Update documentation
Date: Fri,  3 Jan 2014 15:06:25 +0530
Message-ID: <1388741785-24240-2-git-send-email-sachin.kamat@linaro.org>
References: <1388741785-24240-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:56228 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099AbaACJkO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2014 04:40:14 -0500
Received: by mail-pb0-f50.google.com with SMTP id rr13so15569395pbb.9
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2014 01:40:14 -0800 (PST)
In-Reply-To: <1388741785-24240-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linus.walleij@linaro.org, rob@landley.net, sachin.kamat@linaro.org, patches@linaro.org

hardware.h inclusion is no longer needed. Update the documentation section
related to it and fix a file path.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 Documentation/arm/Samsung-S3C24XX/GPIO.txt |   13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/Documentation/arm/Samsung-S3C24XX/GPIO.txt b/Documentation/arm/Samsung-S3C24XX/GPIO.txt
index 8b46c79679c4..0ebd7e2244d0 100644
--- a/Documentation/arm/Samsung-S3C24XX/GPIO.txt
+++ b/Documentation/arm/Samsung-S3C24XX/GPIO.txt
@@ -85,21 +85,10 @@ between the calls.
 Headers
 -------
 
-  See arch/arm/mach-s3c2410/include/mach/regs-gpio.h for the list
+  See arch/arm/mach-s3c24xx/include/mach/regs-gpio.h for the list
   of GPIO pins, and the configuration values for them. This
   is included by using #include <mach/regs-gpio.h>
 
-  The GPIO management functions are defined in the hardware
-  header arch/arm/mach-s3c2410/include/mach/hardware.h which can be
-  included by #include <mach/hardware.h>
-
-  A useful amount of documentation can be found in the hardware
-  header on how the GPIO functions (and others) work.
-
-  Whilst a number of these functions do make some checks on what
-  is passed to them, for speed of use, they may not always ensure
-  that the user supplied data to them is correct.
-
 
 PIN Numbers
 -----------
-- 
1.7.9.5

