From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/5] gpiolib: uniform messages in gpiod_find()
Date: Wed,  4 Dec 2013 15:43:00 +0200
Message-ID: <1386164580-32288-6-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:17755 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932452Ab3LDNnb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 4 Dec 2013 08:43:31 -0500
In-Reply-To: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This patch uniforms messages in gpiod_find() to follow what chip_* do.

There is no functional change.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 013e5a5..cbd7b34 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2391,13 +2391,13 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		chip = find_chip_by_name(p->chip_label);
 
 		if (!chip) {
-			dev_warn(dev, "cannot find GPIO chip %s\n",
+			dev_warn(dev, "%s: GPIO chip: cannot find\n",
 				 p->chip_label);
 			continue;
 		}
 
 		if (chip->ngpio <= p->chip_hwnum) {
-			dev_warn(dev, "GPIO chip %s has %d GPIOs\n",
+			dev_warn(dev, "%s: GPIO chip: has %d GPIOs\n",
 				 chip->label, chip->ngpio);
 			continue;
 		}
-- 
1.8.4.4

