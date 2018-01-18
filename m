From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Documentation update
Date: Thu, 18 Jan 2018 10:44:57 +0100
Message-ID: <20180118094457.15304-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:43280 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754902AbeARJrD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jan 2018 04:47:03 -0500
Received: by mail-lf0-f65.google.com with SMTP id o89so21639995lfg.10
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 01:47:02 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

Update a slew of documentation files with the latest changes in the
API/ABI. Again stress that sysfs is deprecated. Add all new flags and
clean up and move some text.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/board.txt    |  14 ++++--
 Documentation/gpio/consumer.txt | 105 ++++++++++++++++++++++++----------------
 Documentation/gpio/driver.txt   |   4 ++
 Documentation/gpio/sysfs.txt    |  11 +++++
 4 files changed, 88 insertions(+), 46 deletions(-)

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index a0f61898d493..b1d106167baa 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -2,6 +2,7 @@ GPIO Mappings
 =============
 
 This document explains how GPIOs can be assigned to given devices and functions.
+
 Note that it only applies to the new descriptor-based interface. For a
 description of the deprecated integer-based GPIO interface please refer to
 gpio-legacy.txt (actually, there is no real mapping possible with the old
@@ -49,7 +50,7 @@ This property will make GPIOs 15, 16 and 17 available to the driver under the
 
 	power = gpiod_get(dev, "power", GPIOD_OUT_HIGH);
 
-The led GPIOs will be active-high, while the power GPIO will be active-low (i.e.
+The led GPIOs will be active high, while the power GPIO will be active low (i.e.
 gpiod_is_active_low(power) will be true).
 
 The second parameter of the gpiod_get() functions, the con_id string, has to be
@@ -122,9 +123,14 @@ where
 	can be NULL, in which case it will match any function.
   - idx is the index of the GPIO within the function.
   - flags is defined to specify the following properties:
-	* GPIOF_ACTIVE_LOW	- to configure the GPIO as active-low
-	* GPIOF_OPEN_DRAIN	- GPIO pin is open drain type.
-	* GPIOF_OPEN_SOURCE	- GPIO pin is open source type.
+	* GPIO_ACTIVE_HIGH	- GPIO line is active high
+	* GPIO_ACTIVE_LOW	- GPIO line is active low
+	* GPIO_OPEN_DRAIN	- GPIO line ise set up as open drain
+	* GPIO_OPEN_SOURCE	- GPIO line is set up as open source
+	* GPIO_PERSISTENT	- GPIO line is persistent during
+				  suspend/resume and maintains its value
+	* GPIO_TRANSITORY	- GPIO line is transitory and may loose its
+				  electrical state during suspend/resume
 
 In the future, these flags might be extended to support more properties.
 
diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 7aac33081510..d53e5b5cfc9c 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -66,6 +66,15 @@ for the GPIO. Values can be:
 * GPIOD_IN to initialize the GPIO as input.
 * GPIOD_OUT_LOW to initialize the GPIO as output with a value of 0.
 * GPIOD_OUT_HIGH to initialize the GPIO as output with a value of 1.
+* GPIOD_OUT_LOW_OPEN_DRAIN same as GPIOD_OUT_LOW but also enforce the line
+  to be electrically used with open drain.
+* GPIOD_OUT_HIGH_OPEN_DRAIN same as GPIOD_OUT_HIGH but also enforce the line
+  to be electrically used with open drain.
+
+The two last flags are used for use cases where open drain is mandatory, such
+as I2C: if the line is not already configured as open drain in the mappings
+(see board.txt), then open drain will be enforced anyway and a warning will be
+printed that the board configuration needs to be updated to match the use case.
 
 Both functions return either a valid GPIO descriptor, or an error code checkable
 with IS_ERR() (they will never return a NULL pointer). -ENOENT will be returned
@@ -240,59 +249,71 @@ that can't be accessed from hardIRQ handlers, these calls act the same as the
 spinlock-safe calls.
 
 
-Active-low State and Raw GPIO Values
-------------------------------------
-Device drivers like to manage the logical state of a GPIO, i.e. the value their
-device will actually receive, no matter what lies between it and the GPIO line.
-In some cases, it might make sense to control the actual GPIO line value. The
-following set of calls ignore the active-low property of a GPIO and work on the
-raw line value:
-
-	int gpiod_get_raw_value(const struct gpio_desc *desc)
-	void gpiod_set_raw_value(struct gpio_desc *desc, int value)
-	int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
-	void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
-	int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
-
-The active-low state of a GPIO can also be queried using the following call:
-
-	int gpiod_is_active_low(const struct gpio_desc *desc)
-
-Note that these functions should only be used with great moderation ; a driver
-should not have to care about the physical line level.
-
-
-The active-low property
------------------------
-
-As a driver should not have to care about the physical line level, all of the
+The active low and open drain semantics
+---------------------------------------
+As a consumer should not have to care about the physical line level, all of the
 gpiod_set_value_xxx() or gpiod_set_array_value_xxx() functions operate with
-the *logical* value. With this they take the active-low property into account.
-This means that they check whether the GPIO is configured to be active-low,
+the *logical* value. With this they take the active low property into account.
+This means that they check whether the GPIO is configured to be active low,
 and if so, they manipulate the passed value before the physical line level is
 driven.
 
+The same is applicable for open drain or open source output lines: those do not
+actively drive their output high (open drain) or low (open source), they just
+switch their output to a high impedance value. The consumer should not need to
+care. (For details read about open drain in driver.txt.)
+
 With this, all the gpiod_set_(array)_value_xxx() functions interpret the
-parameter "value" as "active" ("1") or "inactive" ("0"). The physical line
+parameter "value" as "asserted" ("1") or "de-asserted" ("0"). The physical line
 level will be driven accordingly.
 
-As an example, if the active-low property for a dedicated GPIO is set, and the
-gpiod_set_(array)_value_xxx() passes "active" ("1"), the physical line level
+As an example, if the active low property for a dedicated GPIO is set, and the
+gpiod_set_(array)_value_xxx() passes "asserted" ("1"), the physical line level
 will be driven low.
 
 To summarize:
 
-Function (example)               active-low property  physical line
-gpiod_set_raw_value(desc, 0);        don't care           low
-gpiod_set_raw_value(desc, 1);        don't care           high
-gpiod_set_value(desc, 0);       default (active-high)     low
-gpiod_set_value(desc, 1);       default (active-high)     high
-gpiod_set_value(desc, 0);             active-low          high
-gpiod_set_value(desc, 1);             active-low          low
-
-Please note again that the set_raw/get_raw functions should be avoided as much
-as possible, especially by drivers which should not care about the actual
-physical line level and worry about the logical value instead.
+Function (example)                 line property          physical line
+gpiod_set_raw_value(desc, 0);      don't care             low
+gpiod_set_raw_value(desc, 1);      don't care             high
+gpiod_set_value(desc, 0);          default (active high)  low
+gpiod_set_value(desc, 1);          default (active high)  high
+gpiod_set_value(desc, 0);          active low             high
+gpiod_set_value(desc, 1);          active low             low
+gpiod_set_value(desc, 0);          default (active high)  low
+gpiod_set_value(desc, 1);          default (active high)  high
+gpiod_set_value(desc, 0);          open drain             low
+gpiod_set_value(desc, 1);          open drain             high impedance
+gpiod_set_value(desc, 0);          open source            high impedance
+gpiod_set_value(desc, 1);          open source            high
+
+It is possible to override these semantics using the *set_raw/'get_raw functions
+but it should be avoided as much as possible, especially by system-agnostic drivers
+which should not need to care about the actual physical line level and worry about
+the logical value instead.
+
+
+Accessing raw GPIO values
+-------------------------
+Consumers exist that need to manage the logical state of a GPIO line, i.e. the value
+their device will actually receive, no matter what lies between it and the GPIO
+line.
+
+The following set of calls ignore the active-low or open drain property of a GPIO and
+work on the raw line value:
+
+	int gpiod_get_raw_value(const struct gpio_desc *desc)
+	void gpiod_set_raw_value(struct gpio_desc *desc, int value)
+	int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
+	void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
+	int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
+
+The active low state of a GPIO can also be queried using the following call:
+
+	int gpiod_is_active_low(const struct gpio_desc *desc)
+
+Note that these functions should only be used with great moderation; a driver
+should not have to care about the physical line level or open drain semantics.
 
 
 Access multiple GPIOs with a single function call
diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index d8de1c7de85a..3392a0fd4c23 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -88,6 +88,10 @@ ending up in the pin control back-end "behind" the GPIO controller, usually
 closer to the actual pins. This way the pin controller can manage the below
 listed GPIO configurations.
 
+If a pin controller back-end is used, the GPIO controller or hardware
+description needs to provide "GPIO ranges" mapping the GPIO line offsets to pin
+numbers on the pin controller so they can properly cross-reference each other.
+
 
 GPIOs with debounce support
 ---------------------------
diff --git a/Documentation/gpio/sysfs.txt b/Documentation/gpio/sysfs.txt
index aeab01aa4d00..6cdeab8650cd 100644
--- a/Documentation/gpio/sysfs.txt
+++ b/Documentation/gpio/sysfs.txt
@@ -1,6 +1,17 @@
 GPIO Sysfs Interface for Userspace
 ==================================
 
+THIS ABI IS DEPRECATED, THE ABI DOCUMENTATION HAS BEEN MOVED TO
+Documentation/ABI/obsolete/sysfs-gpio AND NEW USERSPACE CONSUMERS
+ARE SUPPOSED TO USE THE CHARACTER DEVICE ABI. THIS OLD SYSFS ABI WILL
+NOT BE DEVELOPED (NO NEW FEATURES), IT WILL JUST BE MAINTAINED.
+
+Refer to the examples in tools/gpio/* for an introduction to the new
+character device ABI. Also see the userspace header in
+include/uapi/linux/gpio.h
+
+The deprecated sysfs ABI
+------------------------
 Platforms which use the "gpiolib" implementors framework may choose to
 configure a sysfs user interface to GPIOs. This is different from the
 debugfs interface, since it provides control over GPIO direction and
-- 
2.14.3

