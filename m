From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: include consumer header in gpiolib.h
Date: Mon, 12 Feb 2018 11:11:15 +0100
Message-ID: <20180212101115.7836-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:43655 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932630AbeBLKLU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Feb 2018 05:11:20 -0500
Received: by mail-lf0-f68.google.com with SMTP id q69so1834607lfi.10
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2018 02:11:19 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Hoan Tran <hotran@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

We are forward-declaring enum gpiod_flags, but this is not referenced
by pointer, it is a real struct member, so we need to actually include
it to compile anything including the local gpiolib.h header.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index b17ec6795c81..ad456b6f9d8b 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -13,13 +13,13 @@
 #define GPIOLIB_H
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/consumer.h> /* for enum gpiod_flags */
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/cdev.h>
 
 enum of_gpio_flags;
-enum gpiod_flags;
 enum gpio_lookup_flags;
 struct acpi_device;
 
-- 
2.14.3

