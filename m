From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/3] gpiolib: Switch to for_each_set_bit()
Date: Mon,  9 Jan 2017 16:02:26 +0200
Message-ID: <20170109140228.47613-2-andriy.shevchenko@linux.intel.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:28970 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S940263AbdAIODD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Jan 2017 09:03:03 -0500
In-Reply-To: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The macro for_each_set_bit() effectively looks up to the next set bit in array
of bits.

Instead of open coding that switch to for_each_set_bit() in
gpio_chip_set_multiple().

While here, make gpio_chip_set_multiple() non-destructive against its
parameters. We are safe since all callers, i.e.
gpiod_set_array_value_complex(), handle that already.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f4c26c7826cd..7f51c9bf5533 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1,3 +1,4 @@
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -2570,18 +2571,11 @@ static void gpio_chip_set_multiple(struct gpio_chip *chip,
 	if (chip->set_multiple) {
 		chip->set_multiple(chip, mask, bits);
 	} else {
-		int i;
-		for (i = 0; i < chip->ngpio; i++) {
-			if (mask[BIT_WORD(i)] == 0) {
-				/* no more set bits in this mask word;
-				 * skip ahead to the next word */
-				i = (BIT_WORD(i) + 1) * BITS_PER_LONG - 1;
-				continue;
-			}
-			/* set outputs if the corresponding mask bit is set */
-			if (__test_and_clear_bit(i, mask))
-				chip->set(chip, i, test_bit(i, bits));
-		}
+		unsigned int i;
+
+		/* set outputs if the corresponding mask bit is set */
+		for_each_set_bit(i, mask, chip->ngpio)
+			chip->set(chip, i, test_bit(i, bits));
 	}
 }
 
-- 
2.11.0

