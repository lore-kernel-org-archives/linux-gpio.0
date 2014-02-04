From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] gpiolib: consumer.h: Move forward declarations outside #ifdef
Date: Tue,  4 Feb 2014 13:42:10 +0100
Message-ID: <1391517730-13627-1-git-send-email-lars@metafoo.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-out-089.synserver.de ([212.40.185.89]:1062 "EHLO
	smtp-out-089.synserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752714AbaBDMyD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2014 07:54:03 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

Make sure that the forward declared structs in gpio/consumer.h are also visible
on the else branch of the CONFIG_GPIOLIB #ifdef.

Fixes the following warnings and their associated errors when CONFIG_GPIOLIB is
not selected:
	include/linux/gpio/consumer.h:67:14: warning: 'struct device' declared inside parameter list
	include/linux/gpio/consumer.h:67:14: warning: its scope is only this definition or declaration, which is probably not what you want
	[...]

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 include/linux/gpio/consumer.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 4d34dbb..7a8144f 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -4,8 +4,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 
-#ifdef CONFIG_GPIOLIB
-
 struct device;
 struct gpio_chip;
 
@@ -18,6 +16,8 @@ struct gpio_chip;
  */
 struct gpio_desc;
 
+#ifdef CONFIG_GPIOLIB
+
 /* Acquire and dispose GPIOs */
 struct gpio_desc *__must_check gpiod_get(struct device *dev,
 					 const char *con_id);
-- 
1.8.0

