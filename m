From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/7] gpiolib: clean up includes
Date: Wed, 25 Jan 2017 16:34:15 +0100
Message-ID: <1485358461-24070-2-git-send-email-bgolaszewski@baylibre.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

gpiolib.h uses enum gpiod_flags, but doesn't pull in gpio/consumer.h.
Include it in gpiolib.h and don't include neither consumer.h nor
driver.h from modules that already include gpiolib.h.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-dwapb.c      | 1 -
 drivers/gpio/gpio-xgene-sb.c   | 1 -
 drivers/gpio/gpiolib-acpi.c    | 2 --
 drivers/gpio/gpiolib-devprop.c | 2 --
 drivers/gpio/gpiolib-legacy.c  | 3 ---
 drivers/gpio/gpiolib-of.c      | 1 -
 drivers/gpio/gpiolib-sysfs.c   | 2 --
 drivers/gpio/gpiolib.c         | 1 -
 drivers/gpio/gpiolib.h         | 1 +
 9 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 6193f62..e486633 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -8,7 +8,6 @@
  * All enquiries to support@picochip.com
  */
 #include <linux/acpi.h>
-#include <linux/gpio/driver.h>
 /* FIXME: for gpio_get_value(), replace this with direct register read */
 #include <linux/gpio.h>
 #include <linux/err.h>
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 0332586..eb156c3 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -24,7 +24,6 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/of_gpio.h>
-#include <linux/gpio/driver.h>
 #include <linux/acpi.h>
 
 #include "gpiolib.h"
diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 9b37a36..aebd072 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -12,8 +12,6 @@
 
 #include <linux/errno.h>
 #include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/export.h>
 #include <linux/acpi.h>
diff --git a/drivers/gpio/gpiolib-devprop.c b/drivers/gpio/gpiolib-devprop.c
index 27f383b..cf4c677 100644
--- a/drivers/gpio/gpiolib-devprop.c
+++ b/drivers/gpio/gpiolib-devprop.c
@@ -11,8 +11,6 @@
 
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
 
 #include "gpiolib.h"
 
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 8b83099..f5e7ce8 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -1,6 +1,3 @@
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
-
 #include <linux/gpio.h>
 
 #include "gpiolib.h"
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 975b9f6..064d51f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -16,7 +16,6 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/io.h>
-#include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_gpio.h>
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 4b44dd9..844a7cd 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -2,8 +2,6 @@
 #include <linux/mutex.h>
 #include <linux/device.h>
 #include <linux/sysfs.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/kdev_t.h>
 #include <linux/slab.h>
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59d3d96..6722579 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -14,7 +14,6 @@
 #include <linux/idr.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
-#include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/cdev.h>
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2495b7e..067e5e5 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -13,6 +13,7 @@
 #define GPIOLIB_H
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/consumer.h>
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/module.h>
-- 
2.9.3
