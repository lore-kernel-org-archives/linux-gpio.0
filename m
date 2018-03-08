From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 5/8] Documentation: gpio: Move legacy documentation to driver-api
Date: Fri,  9 Mar 2018 00:40:21 +0100
Message-ID: <20180308234024.24145-6-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-gpio@vger.kernel.org

Move gpio/gpio-legacy.txt to driver-api/gpio/legacy.rst and make sure it
builds cleanly as ReST.

Also move the legacy API reference from index.rst to legacy.rst.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 Documentation/driver-api/gpio/index.rst            | 10 +---
 .../gpio-legacy.txt => driver-api/gpio/legacy.rst} | 68 +++++++++++++---------
 Documentation/gpio/00-INDEX                        |  2 -
 3 files changed, 41 insertions(+), 39 deletions(-)
 rename Documentation/{gpio/gpio-legacy.txt => driver-api/gpio/legacy.rst} (96%)

diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index e1fbc5408cf6..fd22c0d1419e 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -9,6 +9,7 @@ Contents:
 
    intro
    driver
+   legacy
 
 Core
 ====
@@ -19,15 +20,6 @@ Core
 .. kernel-doc:: drivers/gpio/gpiolib.c
    :export:
 
-Legacy API
-==========
-
-The functions listed in this section are deprecated. The GPIO descriptor based
-API described above should be used in new code.
-
-.. kernel-doc:: drivers/gpio/gpiolib-legacy.c
-   :export:
-
 ACPI support
 ============
 
diff --git a/Documentation/gpio/gpio-legacy.txt b/Documentation/driver-api/gpio/legacy.rst
similarity index 96%
rename from Documentation/gpio/gpio-legacy.txt
rename to Documentation/driver-api/gpio/legacy.rst
index 8356d0e78f67..5e9421e05f1d 100644
--- a/Documentation/gpio/gpio-legacy.txt
+++ b/Documentation/driver-api/gpio/legacy.rst
@@ -1,4 +1,6 @@
-GPIO Interfaces
+======================
+Legacy GPIO Interfaces
+======================
 
 This provides an overview of GPIO access conventions on Linux.
 
@@ -129,7 +131,7 @@ The first thing a system should do with a GPIO is allocate it, using
 the gpio_request() call; see later.
 
 One of the next things to do with a GPIO, often in board setup code when
-setting up a platform_device using the GPIO, is mark its direction:
+setting up a platform_device using the GPIO, is mark its direction::
 
 	/* set as input or output, returning 0 or negative errno */
 	int gpio_direction_input(unsigned gpio);
@@ -164,7 +166,7 @@ Those don't need to sleep, and can safely be done from inside hard
 (nonthreaded) IRQ handlers and similar contexts.
 
 Use the following calls to access such GPIOs,
-for which gpio_cansleep() will always return false (see below):
+for which gpio_cansleep() will always return false (see below)::
 
 	/* GPIO INPUT:  return zero or nonzero */
 	int gpio_get_value(unsigned gpio);
@@ -201,11 +203,11 @@ This requires sleeping, which can't be done from inside IRQ handlers.
 
 Platforms that support this type of GPIO distinguish them from other GPIOs
 by returning nonzero from this call (which requires a valid GPIO number,
-which should have been previously allocated with gpio_request):
+which should have been previously allocated with gpio_request)::
 
 	int gpio_cansleep(unsigned gpio);
 
-To access such GPIOs, a different set of accessors is defined:
+To access such GPIOs, a different set of accessors is defined::
 
 	/* GPIO INPUT:  return zero or nonzero, might sleep */
 	int gpio_get_value_cansleep(unsigned gpio);
@@ -222,27 +224,27 @@ Other than the fact that these accessors might sleep, and will work
 on GPIOs that can't be accessed from hardIRQ handlers, these calls act
 the same as the spinlock-safe calls.
 
-  ** IN ADDITION ** calls to setup and configure such GPIOs must be made
+**IN ADDITION** calls to setup and configure such GPIOs must be made
 from contexts which may sleep, since they may need to access the GPIO
-controller chip too:  (These setup calls are usually made from board
-setup or driver probe/teardown code, so this is an easy constraint.)
+controller chip too  (These setup calls are usually made from board
+setup or driver probe/teardown code, so this is an easy constraint.)::
 
-	gpio_direction_input()
-	gpio_direction_output()
-	gpio_request()
+                gpio_direction_input()
+                gpio_direction_output()
+                gpio_request()
 
-## 	gpio_request_one()
-##	gpio_request_array()
-## 	gpio_free_array()
+        ## 	gpio_request_one()
+        ##	gpio_request_array()
+        ## 	gpio_free_array()
 
-	gpio_free()
-	gpio_set_debounce()
+                gpio_free()
+                gpio_set_debounce()
 
 
 
 Claiming and Releasing GPIOs
 ----------------------------
-To help catch system configuration errors, two calls are defined.
+To help catch system configuration errors, two calls are defined::
 
 	/* request GPIO, returning 0 or negative errno.
 	 * non-null labels may be useful for diagnostics.
@@ -296,7 +298,7 @@ Also note that it's your responsibility to have stopped using a GPIO
 before you free it.
 
 Considering in most cases GPIOs are actually configured right after they
-are claimed, three additional calls are defined:
+are claimed, three additional calls are defined::
 
 	/* request a single GPIO, with initial configuration specified by
 	 * 'flags', identical to gpio_request() wrt other arguments and
@@ -347,7 +349,7 @@ to make the pin LOW. The pin is make to HIGH by driving value 1 in output mode.
 In the future, these flags can be extended to support more properties.
 
 Further more, to ease the claim/release of multiple GPIOs, 'struct gpio' is
-introduced to encapsulate all three fields as:
+introduced to encapsulate all three fields as::
 
 	struct gpio {
 		unsigned	gpio;
@@ -355,7 +357,7 @@ introduced to encapsulate all three fields as:
 		const char	*label;
 	};
 
-A typical example of usage:
+A typical example of usage::
 
 	static struct gpio leds_gpios[] = {
 		{ 32, GPIOF_OUT_INIT_HIGH, "Power LED" }, /* default to ON */
@@ -380,7 +382,7 @@ GPIOs mapped to IRQs
 --------------------
 GPIO numbers are unsigned integers; so are IRQ numbers.  These make up
 two logically distinct namespaces (GPIO 0 need not use IRQ 0).  You can
-map between them using calls like:
+map between them using calls like::
 
 	/* map GPIO numbers to IRQ numbers */
 	int gpio_to_irq(unsigned gpio);
@@ -446,12 +448,12 @@ A GPIO controller on a SOC might be tightly coupled with the pinctrl
 subsystem, in the sense that the pins can be used by other functions
 together with an optional gpio feature. We have already covered the
 case where e.g. a GPIO controller need to reserve a pin or set the
-direction of a pin by calling any of:
+direction of a pin by calling any of::
 
-pinctrl_gpio_request()
-pinctrl_gpio_free()
-pinctrl_gpio_direction_input()
-pinctrl_gpio_direction_output()
+  pinctrl_gpio_request()
+  pinctrl_gpio_free()
+  pinctrl_gpio_direction_input()
+  pinctrl_gpio_direction_output()
 
 But how does the pin control subsystem cross-correlate the GPIO
 numbers (which are a global business) to a certain pin on a certain
@@ -565,7 +567,7 @@ If neither of these options are selected, the platform does not support
 GPIOs through GPIO-lib and the code cannot be enabled by the user.
 
 Trivial implementations of those functions can directly use framework
-code, which always dispatches through the gpio_chip:
+code, which always dispatches through the gpio_chip::
 
   #define gpio_get_value	__gpio_get_value
   #define gpio_set_value	__gpio_set_value
@@ -731,7 +733,7 @@ the correct GPIO number to use for a given signal.
 Exporting from Kernel code
 --------------------------
 Kernel code can explicitly manage exports of GPIOs which have already been
-requested using gpio_request():
+requested using gpio_request()::
 
 	/* export the GPIO to userspace */
 	int gpio_export(unsigned gpio, bool direction_may_change);
@@ -756,3 +758,13 @@ After the GPIO has been exported, gpio_export_link() allows creating
 symlinks from elsewhere in sysfs to the GPIO sysfs node.  Drivers can
 use this to provide the interface under their own device in sysfs with
 a descriptive name.
+
+
+API Reference
+=============
+
+The functions listed in this section are deprecated. The GPIO descriptor based
+API should be used in new code.
+
+.. kernel-doc:: drivers/gpio/gpiolib-legacy.c
+   :export:
diff --git a/Documentation/gpio/00-INDEX b/Documentation/gpio/00-INDEX
index 06c25fb7604c..64cf61245861 100644
--- a/Documentation/gpio/00-INDEX
+++ b/Documentation/gpio/00-INDEX
@@ -9,5 +9,3 @@ board.txt
 	- How to assign GPIOs to a consumer device and a function
 sysfs.txt
 	- Information about the GPIO sysfs interface
-gpio-legacy.txt
-	- Historical documentation of the deprecated GPIO integer interface
-- 
2.16.1
