From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: random documentation update
Date: Tue, 31 Jan 2017 15:43:50 +0100
Message-ID: <20170131144350.28025-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34652 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbdAaOn5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2017 09:43:57 -0500
Received: by mail-lf0-f41.google.com with SMTP id v186so212512506lfa.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2017 06:43:56 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Updated and proofread the documentation for GPIO drivers a bit
when looking over the changes for generic configuration.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/driver.txt | 55 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index ad8f0c0cd13f..fc1d2f83564d 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -41,34 +41,71 @@ In the gpiolib framework each GPIO controller is packaged as a "struct
 gpio_chip" (see linux/gpio/driver.h for its complete definition) with members
 common to each controller of that type:
 
- - methods to establish GPIO direction
- - methods used to access GPIO values
- - method to return the IRQ number associated to a given GPIO
+ - methods to establish GPIO line direction
+ - methods used to access GPIO line values
+ - method to set electrical configuration to a a given GPIO line
+ - method to return the IRQ number associated to a given GPIO line
  - flag saying whether calls to its methods may sleep
+ - optional line names array to identify lines
  - optional debugfs dump method (showing extra state like pullup config)
  - optional base number (will be automatically assigned if omitted)
- - label for diagnostics and GPIOs mapping using platform data
+ - optional label for diagnostics and GPIO chip mapping using platform data
 
 The code implementing a gpio_chip should support multiple instances of the
 controller, possibly using the driver model. That code will configure each
-gpio_chip and issue gpiochip_add(). Removing a GPIO controller should be rare;
-use gpiochip_remove() when it is unavoidable.
+gpio_chip and issue gpiochip_add[_data]() or devm_gpiochip_add_data().
+Removing a GPIO controller should be rare; use [devm_]gpiochip_remove() when
+it is unavoidable.
 
-Most often a gpio_chip is part of an instance-specific structure with state not
+Often a gpio_chip is part of an instance-specific structure with states not
 exposed by the GPIO interfaces, such as addressing, power management, and more.
-Chips such as codecs will have complex non-GPIO state.
+Chips such as audio codecs will have complex non-GPIO states.
 
 Any debugfs dump method should normally ignore signals which haven't been
 requested as GPIOs. They can use gpiochip_is_requested(), which returns either
 NULL or the label associated with that GPIO when it was requested.
 
-RT_FULL: GPIO driver should not use spinlock_t or any sleepable APIs
+RT_FULL: the GPIO driver should not use spinlock_t or any sleepable APIs
 (like PM runtime) in its gpio_chip implementation (.get/.set and direction
 control callbacks) if it is expected to call GPIO APIs from atomic context
 on -RT (inside hard IRQ handlers and similar contexts). Normally this should
 not be required.
 
 
+GPIO electrical configuration
+-----------------------------
+
+GPIOs can be configured for several electrical modes of operation by using the
+.set_config() callback. Currently this API supports setting debouncing and
+single-ended modes (open drain/open source). These settings are described
+below.
+
+The .set_config() callback uses the same enumerators and configuration
+semantics as the generic pin control drivers. This is not a coincidence: it is
+possible to assign the .set_config() to the function gpiochip_generic_config()
+which will result in pinctrl_gpio_set_config() being called and eventually
+ending up in the pin control back-end "behind" the GPIO controller, usually
+closer to the actual pins. This way the pin controller can manage the below
+listed GPIO configurations.
+
+
+GPIOs with debounce support
+---------------------------
+
+Debouncing is a configuration set to a pin indicating that it is connected to
+a mechanical switch or button, or similar that may bounce. Bouncing means the
+line is pulled high/low quickly at very short intervals for mechanical
+reasons. This can result in the value being unstable or irqs fireing repeatedly
+unless the line is debounced.
+
+Debouncing in practice involves setting up a timer when something happens on
+the line, wait a little while and then sample the line again, so see if it
+still has the same value (low or high). This could also be repeated by a clever
+state machine, waiting for a line to become stable. In either case, it sets
+a certain number of milliseconds for debouncing, or just "on/off" if that time
+is not configurable.
+
+
 GPIOs with open drain/source support
 ------------------------------------
 
-- 
2.9.3

