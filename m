From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Clarify consumer stubs use-cases
Date: Tue, 12 Sep 2017 09:34:02 +0200
Message-ID: <20170912073402.2893-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35332 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751015AbdILHeI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2017 03:34:08 -0400
Received: by mail-lf0-f41.google.com with SMTP id d17so24100283lfe.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2017 00:34:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Andrew Lunn <andrew@lunn.ch>

After discussion we add a few blurbs to clarify how the stubs
in the consumer API are supposed to be used.

Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/consumer.txt | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 912568baabb9..ddbfa775a78a 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -10,14 +10,30 @@ Guidelines for GPIOs consumers
 ==============================
 
 Drivers that can't work without standard GPIO calls should have Kconfig entries
-that depend on GPIOLIB. The functions that allow a driver to obtain and use
-GPIOs are available by including the following file:
+that depend on GPIOLIB or select GPIOLIB. The functions that allow a driver to
+obtain and use GPIOs are available by including the following file:
 
 	#include <linux/gpio/consumer.h>
 
+There are static inline stubs for all functions in the header file in the case
+where GPIOLIB is disabled. When these stubs are called they will emit
+warnings. These stubs are used for two use cases:
+
+- Simple compile coverage with e.g. COMPILE_TEST - it does not matter that
+  the current platform does not enable or select GPIOLIB because we are not
+  going to execute the system anyway.
+
+- Truly optional GPIOLIB support - where the driver does not really make use
+  of the GPIOs on certain compile-time configurations for certain systems, but
+  will use it under other compile-time configurations. In this case the
+  consumer must make sure not to call into these functions, or the user will
+  be met with console warnings that may be perceived as intimidating.
+
 All the functions that work with the descriptor-based GPIO interface are
 prefixed with gpiod_. The gpio_ prefix is used for the legacy interface. No
-other function in the kernel should use these prefixes.
+other function in the kernel should use these prefixes. The use of the legacy
+functions is strongly discouraged, new code should use <linux/gpio/consumer.h>
+and descriptors exclusively.
 
 
 Obtaining and Disposing GPIOs
-- 
2.13.5

