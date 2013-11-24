From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH] gpiolib: Replace WARN_ON with WARN_ON_ONCE
Date: Sun, 24 Nov 2013 09:37:45 -0300
Message-ID: <1385296665-23713-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:41359 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751795Ab3KXMhf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Nov 2013 07:37:35 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

These warnings can be very spammy, since they could be called from
kernel threads. Use WARN_ON_ONCE, which is enough to warn developers
about the 'can_sleep' usage.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7dd4461..9568998 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1927,7 +1927,7 @@ int gpiod_get_raw_value(const struct gpio_desc *desc)
 	if (!desc)
 		return 0;
 	/* Should be using gpio_get_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
+	WARN_ON_ONCE(desc->chip->can_sleep);
 	return _gpiod_get_raw_value(desc);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
@@ -1948,7 +1948,7 @@ int gpiod_get_value(const struct gpio_desc *desc)
 	if (!desc)
 		return 0;
 	/* Should be using gpio_get_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
+	WARN_ON_ONCE(desc->chip->can_sleep);
 
 	value = _gpiod_get_raw_value(desc);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
@@ -2042,7 +2042,7 @@ void gpiod_set_raw_value(struct gpio_desc *desc, int value)
 	if (!desc)
 		return;
 	/* Should be using gpio_set_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
+	WARN_ON_ONCE(desc->chip->can_sleep);
 	_gpiod_set_raw_value(desc, value);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_raw_value);
@@ -2063,7 +2063,7 @@ void gpiod_set_value(struct gpio_desc *desc, int value)
 	if (!desc)
 		return;
 	/* Should be using gpio_set_value_cansleep() */
-	WARN_ON(desc->chip->can_sleep);
+	WARN_ON_ONCE(desc->chip->can_sleep);
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 	_gpiod_set_raw_value(desc, value);
-- 
1.8.1.5

