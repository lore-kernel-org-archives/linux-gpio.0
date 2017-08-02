From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v3] [BUGFIX] gpio: reject invalid gpio before getting gpio_desc
Date: Wed,  2 Aug 2017 13:47:42 +0900
Message-ID: <150164925133.3914.939655218385978578.stgit@devbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750985AbdHBEsj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Aug 2017 00:48:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>

Check user-given gpio number and reject it before
calling gpio_to_desc() because gpio_to_desc() is
for kernel driver and it expects given gpio number
is valid (means 0 to 511).
If given number is invalid, gpio_to_desc() calls
WARN() and dump registers and stack for debug.
This means user can easily kick WARN() just by
writing invalid gpio number (e.g. 512) to
/sys/class/gpio/export.

Fixes: 0e9a5edf5d01 ("gpio: fix deferred probe detection for legacy API")
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
  Changes in v3:
   - Remove unneeded empty lines.
---
 drivers/gpio/gpiolib-sysfs.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 16fe9742597b..fc80add5fedb 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -2,6 +2,7 @@
 #include <linux/mutex.h>
 #include <linux/device.h>
 #include <linux/sysfs.h>
+#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
@@ -432,6 +433,11 @@ static struct attribute *gpiochip_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpiochip);
 
+static struct gpio_desc *gpio_to_valid_desc(int gpio)
+{
+	return gpio_is_valid(gpio) ? gpio_to_desc(gpio) : NULL;
+}
+
 /*
  * /sys/class/gpio/export ... write-only
  *	integer N ... number of GPIO to export (full access)
@@ -450,7 +456,7 @@ static ssize_t export_store(struct class *class,
 	if (status < 0)
 		goto done;
 
-	desc = gpio_to_desc(gpio);
+	desc = gpio_to_valid_desc(gpio);
 	/* reject invalid GPIOs */
 	if (!desc) {
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
@@ -493,7 +499,7 @@ static ssize_t unexport_store(struct class *class,
 	if (status < 0)
 		goto done;
 
-	desc = gpio_to_desc(gpio);
+	desc = gpio_to_valid_desc(gpio);
 	/* reject bogus commands (gpio_unexport ignores them) */
 	if (!desc) {
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);

