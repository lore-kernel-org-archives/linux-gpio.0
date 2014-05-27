From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: pch: add slab include
Date: Tue, 27 May 2014 15:17:44 +0200
Message-ID: <1401196664-14223-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:44472 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752289AbaE0NRx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 09:17:53 -0400
Received: by mail-wg0-f45.google.com with SMTP id m15so9278606wgh.4
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2014 06:17:52 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.de>

After change 3ff35cbcfa4bc7d7dbdd0279e32ea677567ded02
"gpio-pch: Fix Kconfig dependencies"
which enabled COMPILE_TEST as an alternative for the PCH
driver, we get build failures like this:

drivers/gpio/gpio-pch.c: In function 'pch_gpio_probe':
drivers/gpio/gpio-pch.c:359:2: error: implicit declaration
of function 'kzalloc' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pch.c:359:7: warning: assignment makes
pointer from integer without a cast [enabled by default]
drivers/gpio/gpio-pch.c:442:2: error: implicit declaration
of function 'kfree' [-Werror=implicit-function-declaration]

Fix this by including <linux/slab.h> explicitly.

Cc: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 83a156397474..d6eac9b17db9 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -20,6 +20,7 @@
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/slab.h>
 
 #define PCH_EDGE_FALLING	0
 #define PCH_EDGE_RISING		BIT(0)
-- 
1.9.0

