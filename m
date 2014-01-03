From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] gpio: samsung: Remove hardware.h inclusion
Date: Fri,  3 Jan 2014 15:06:24 +0530
Message-ID: <1388741785-24240-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:48295 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750841AbaACJkL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2014 04:40:11 -0500
Received: by mail-pa0-f50.google.com with SMTP id kp14so13762755pab.9
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2014 01:40:11 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linus.walleij@linaro.org, rob@landley.net, sachin.kamat@linaro.org, patches@linaro.org, Heiko Stuebner <heiko@sntech.de>

The contents of this header file are not referenced in the driver.
Remove its inclusion.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpio/gpio-samsung.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index be7b0bd4eed4..2376e6278388 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -36,7 +36,6 @@
 
 #include <asm/irq.h>
 
-#include <mach/hardware.h>
 #include <mach/map.h>
 #include <mach/regs-gpio.h>
 
-- 
1.7.9.5

