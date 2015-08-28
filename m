From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH] gpio: Propagate errors from chip->get()
Date: Fri, 28 Aug 2015 09:44:18 -0700
Message-ID: <1440780258-23652-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:9504 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752481AbbH1WOW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 28 Aug 2015 18:14:22 -0400
In-Reply-To: CACRpkdaA2_kHRDdNtUKHg9yqq1akD+yYhgmzFzB5Hkq0=vA-Mw@mail.gmail.com
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

It's possible to have gpio chips hanging off unreliable remote buses
where the get() operation will fail to acquire a readout of the current
gpio state. Propagate these errors to the consumer so that they can
act on, retry or ignore these failing reads, instead of treating them as
the line being held high.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 drivers/gpio/gpiolib.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3b5e516298e0..dc17dbf8c234 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1173,15 +1173,16 @@ EXPORT_SYMBOL_GPL(gpiod_is_active_low);
  * that the GPIO was actually requested.
  */
 
-static bool _gpiod_get_raw_value(const struct gpio_desc *desc)
+static int _gpiod_get_raw_value(const struct gpio_desc *desc)
 {
 	struct gpio_chip	*chip;
-	bool value;
 	int offset;
+	int value;
 
 	chip = desc->chip;
 	offset = gpio_chip_hwgpio(desc);
-	value = chip->get ? chip->get(chip, offset) : false;
+	value = chip->get ? chip->get(chip, offset) : -EIO;
+	value = value < 0 ? value : !!value;
 	trace_gpio_value(desc_to_gpio(desc), 1, value);
 	return value;
 }
@@ -1191,7 +1192,7 @@ static bool _gpiod_get_raw_value(const struct gpio_desc *desc)
  * @desc: gpio whose value will be returned
  *
  * Return the GPIO's raw value, i.e. the value of the physical line disregarding
- * its ACTIVE_LOW status.
+ * its ACTIVE_LOW status, or negative errno on failure.
  *
  * This function should be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
@@ -1211,7 +1212,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
  * @desc: gpio whose value will be returned
  *
  * Return the GPIO's logical value, i.e. taking the ACTIVE_LOW status into
- * account.
+ * account, or negative errno on failure.
  *
  * This function should be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
@@ -1225,6 +1226,9 @@ int gpiod_get_value(const struct gpio_desc *desc)
 	WARN_ON(desc->chip->can_sleep);
 
 	value = _gpiod_get_raw_value(desc);
+	if (value < 0)
+		return value;
+
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 
@@ -1547,7 +1551,7 @@ EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
  * @desc: gpio whose value will be returned
  *
  * Return the GPIO's raw value, i.e. the value of the physical line disregarding
- * its ACTIVE_LOW status.
+ * its ACTIVE_LOW status, or negative errno on failure.
  *
  * This function is to be called from contexts that can sleep.
  */
@@ -1565,7 +1569,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_raw_value_cansleep);
  * @desc: gpio whose value will be returned
  *
  * Return the GPIO's logical value, i.e. taking the ACTIVE_LOW status into
- * account.
+ * account, or negative errno on failure.
  *
  * This function is to be called from contexts that can sleep.
  */
@@ -1578,6 +1582,9 @@ int gpiod_get_value_cansleep(const struct gpio_desc *desc)
 		return 0;
 
 	value = _gpiod_get_raw_value(desc);
+	if (value < 0)
+		return value;
+
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 		value = !value;
 
-- 
1.8.2.2

