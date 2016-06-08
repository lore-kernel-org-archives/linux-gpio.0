From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: include <linux/io-mapping.h> in gpiolib-of
Date: Wed,  8 Jun 2016 11:02:46 +0200
Message-ID: <1465376566-29052-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34458 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753098AbcFHJCw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 05:02:52 -0400
Received: by mail-lf0-f46.google.com with SMTP id s186so1332169lfs.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 02:02:52 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

When enabling the gpiolib for all archs a build robot came
up with this:

All errors (new ones prefixed by >>):

   drivers/gpio/gpiolib-of.c: In function 'of_mm_gpiochip_add_data':
>> drivers/gpio/gpiolib-of.c:317:2: error: implicit declaration of
   function 'iounmap' [-Werror=implicit-function-declaration]
     iounmap(mm_gc->regs);
     ^~~~~~~
   cc1: some warnings being treated as errors

Fix this by including <linux/io-mapping.h> explicitly.

Fixes: 296ad4acb8ef ("gpio: remove deps on ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB")
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index d22dcc38179d..4aabddb38b59 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -16,6 +16,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/io-mapping.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-- 
2.4.11

