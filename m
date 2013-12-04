From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/5] gpiolib: update commentary at gpiod_get_index()
Date: Wed,  4 Dec 2013 15:42:59 +0200
Message-ID: <1386164580-32288-5-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:60594 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932470Ab3LDNnh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 4 Dec 2013 08:43:37 -0500
In-Reply-To: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

THe patch just accents that @dev could be NULL.

There is no functional change.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 70e560c..013e5a5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2425,7 +2425,7 @@ EXPORT_SYMBOL_GPL(gpiod_get);
 
 /**
  * gpiod_get_index - obtain a GPIO from a multi-index GPIO function
- * @dev:	GPIO consumer
+ * @dev:	GPIO consumer, can be NULL for system-global GPIOs
  * @con_id:	function within the GPIO consumer
  * @idx:	index of the GPIO to obtain in the consumer
  *
-- 
1.8.4.4

