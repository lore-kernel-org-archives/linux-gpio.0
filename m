From: Aaron Lu <aaron.lu@intel.com>
Subject: [PATCH] gpio / ACPI: use *_cansleep version of gpiod_get/set APIs
Date: Tue, 20 May 2014 16:43:12 +0800
Message-ID: <537B15A0.3080406@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:65272 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751598AbaETInR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 20 May 2014 04:43:17 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

The GPIO operation region handler should be called where sleep is
allowed, so we should use the *_cansleep version of gpiod_get/set APIs
or we will get a warning message complaining invalid context if the GPIO
chip has the cansleep flag set.

Signed-off-by: Aaron Lu <aaron.lu@intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index bf0f8b4..2d398a6 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -17,6 +17,7 @@
 #include <linux/acpi.h>
 #include <linux/interrupt.h>
 #include <linux/mutex.h>
+#include <linux/gpio.h>
 
 #include "gpiolib.h"
 
@@ -449,9 +450,10 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		mutex_unlock(&achip->conn_lock);
 
 		if (function == ACPI_WRITE)
-			gpiod_set_raw_value(desc, !!((1 << i) & *value));
+			gpiod_set_raw_value_cansleep(desc,
+						     !!((1 << i) & *value));
 		else
-			*value |= gpiod_get_raw_value(desc) << i;
+			*value |= gpiod_get_raw_value_cansleep(desc) << i;
 	}
 
 out:
-- 
1.9.0

