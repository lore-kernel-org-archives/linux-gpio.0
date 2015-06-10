From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] gpio / ACPI: Return -EPROBE_DEFER if the gpiochip was not found
Date: Wed, 10 Jun 2015 16:05:05 +0300
Message-ID: <1433941505-135180-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:18176 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964781AbbFJNHK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 10 Jun 2015 09:07:10 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tobias Diedrich <tobiasdiedrich@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

If a driver requests a GPIO described in its _CRS but the GPIO host
controller (gpiochip) driver providing the GPIO has not been loaded yet
acpi_get_gpiod() returns -ENODEV which causes the calling driver to fail.

If the gpiochip driver is loaded afterwards the driver requesting the GPIO
will not notice this.

Better approach is to return -EPROBE_DEFER in such case. Then when the
gpiochip driver appears the driver requesting the GPIO will be probed
again. This also aligns ACPI GPIO lookup code closer to DT as it does
pretty much the same when no gpiochip driver was found.

Reported-by: Tobias Diedrich <tobiasdiedrich@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 19b99d0c2bf0..b49006c81a7f 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -114,10 +114,11 @@ static inline int acpi_gpiochip_pin_to_gpio_offset(struct gpio_chip *chip,
  * @path:	ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
  * @pin:	ACPI GPIO pin number (0-based, controller-relative)
  *
- * Returns GPIO descriptor to use with Linux generic GPIO API, or ERR_PTR
- * error value
+ * Return: GPIO descriptor to use with Linux generic GPIO API, or ERR_PTR
+ * error value. Specifically returns %-EPROBE_DEFER if the referenced GPIO
+ * controller does not have gpiochip registered at the moment. This is to
+ * support probe deferral.
  */
-
 static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
 {
 	struct gpio_chip *chip;
@@ -131,7 +132,7 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
 
 	chip = gpiochip_find(handle, acpi_gpiochip_find);
 	if (!chip)
-		return ERR_PTR(-ENODEV);
+		return ERR_PTR(-EPROBE_DEFER);
 
 	offset = acpi_gpiochip_pin_to_gpio_offset(chip, pin);
 	if (offset < 0)
-- 
2.1.4

