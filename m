From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 6/7] gpiolib: include <gpio/consumer.h> from gpiolib.h
Date: Mon,  6 Feb 2017 13:10:40 +0100
Message-ID: <1486383041-16758-7-git-send-email-bgolaszewski@baylibre.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:36568 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751980AbdBFMKx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 07:10:53 -0500
Received: by mail-wm0-f44.google.com with SMTP id c85so117356699wmi.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 04:10:52 -0800 (PST)
In-Reply-To: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

We want pull gpiolib.h in from the gpio mockup driver, but gpiod_flags
is defined in consumer.h, so we need that too indirectly.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2495b7e..067e5e5 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -13,6 +13,7 @@
 #define GPIOLIB_H
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/consumer.h>
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/module.h>
-- 
2.9.3

