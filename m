From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: move GPIOD flags outside #ifdef
Date: Tue, 19 Aug 2014 12:03:40 -0500
Message-ID: <1408467820-4766-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:61999 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752586AbaHSRDy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Aug 2014 13:03:54 -0400
Received: by mail-ig0-f179.google.com with SMTP id h18so9958066igc.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2014 10:03:53 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

The GPIOD flags are defined inside the #ifdef CONFIG_GPIOLIB
switch, making the gpiolib stubs fail if these flags are used
by a consumer. This is not correct: the stubs should compile
fine without GPIOLIB.

Cc: Alexandre Courbot <gnurou@gmail.com>
Reported-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/gpio/consumer.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index b7ce0c64c6f3..c7e17de732f3 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -16,8 +16,6 @@ struct device;
  */
 struct gpio_desc;
 
-#ifdef CONFIG_GPIOLIB
-
 #define GPIOD_FLAGS_BIT_DIR_SET		BIT(0)
 #define GPIOD_FLAGS_BIT_DIR_OUT		BIT(1)
 #define GPIOD_FLAGS_BIT_DIR_VAL		BIT(2)
@@ -34,6 +32,8 @@ enum gpiod_flags {
 			  GPIOD_FLAGS_BIT_DIR_VAL,
 };
 
+#ifdef CONFIG_GPIOLIB
+
 /* Acquire and dispose GPIOs */
 struct gpio_desc *__must_check __gpiod_get(struct device *dev,
 					 const char *con_id,
-- 
1.9.3

