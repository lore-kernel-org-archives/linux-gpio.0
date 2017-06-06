From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpio: merrifield: Remove unused header
Date: Tue,  6 Jun 2017 17:28:51 +0300
Message-ID: <20170606142851.76094-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:3070 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751399AbdFFO24 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Jun 2017 10:28:56 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I don't remember how linux/gpio.h made the source, now it seems unused.
Remove it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 9dbdc3672f5e..ec8560298805 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -11,7 +11,6 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-- 
2.11.0

