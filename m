From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] gpio: pca953x: Expand comment for "reset" GPIO in ACPI case
Date: Mon, 20 Mar 2017 17:45:17 +0200
Message-ID: <20170320154517.41003-3-andriy.shevchenko@linux.intel.com>
References: <20170320154517.41003-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:40844 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754166AbdCTPp3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Mar 2017 11:45:29 -0400
In-Reply-To: <20170320154517.41003-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

GPIO ACPI library is going to be stricter about resources, thus, expand
comment regarding "reset" GPIO resource in this driver to clarify its
usage in ACPI case.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index cd6c9c5f3e77..7a503d2b7d15 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -777,7 +777,13 @@ static int pca953x_probe(struct i2c_client *client,
 		chip->gpio_start = -1;
 		irq_base = 0;
 
-		/* See if we need to de-assert a reset pin */
+		/*
+		 * See if we need to de-assert a reset pin.
+		 *
+		 * There is no known ACPI-enabled platforms that are
+		 * using "reset" GPIO. Otherwise any of those platform
+		 * must use _DSD method with corresponding property.
+		 */
 		reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
 						     GPIOD_OUT_LOW);
 		if (IS_ERR(reset_gpio))
-- 
2.11.0

