From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] pinctrl: pinconf-generic: sort pin configuration params alphabetically
Date: Wed, 30 Sep 2015 21:07:17 +0900
Message-ID: <1443614838-23569-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:23655 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752513AbbI3MHS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2015 08:07:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

Currently, the dt_params array in drivers/pinctrl/pinconf-generic.c
is not sorted in the same order as the enum pin_config_param in
include/linux/pinctrl/pinconf-generic.h.

Sort enum pin_config_param, conf_items, dt_params, alphabetically
for consistency.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinconf-generic.c       | 34 +++++++++---------
 include/linux/pinctrl/pinconf-generic.h | 64 ++++++++++++++++-----------------
 2 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index e63ad9f..a88a559 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -28,25 +28,25 @@
 
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item conf_items[] = {
+	PCONFDUMP(PIN_CONFIG_BIAS_BUS_HOLD, "input bias bus hold", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_DISABLE, "input bias disabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, "input bias high impedance", NULL, false),
-	PCONFDUMP(PIN_CONFIG_BIAS_BUS_HOLD, "input bias bus hold", NULL, false),
-	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_PULL_DOWN, "input bias pull down", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
 				"input bias pull to pin specific state", NULL, false),
-	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
+	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_DRAIN, "output drive open drain", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_SOURCE, "output drive open source", NULL, false),
+	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH, "output drive strength", "mA", true),
+	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
-	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_ENABLE, "input schmitt enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
-	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
-	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
-	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
+	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_ENABLE, "input schmitt enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_LOW_POWER_MODE, "pin low power", "mode", true),
 	PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
+	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
+	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
 };
 
 static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
@@ -150,27 +150,27 @@ EXPORT_SYMBOL_GPL(pinconf_generic_dump_config);
 
 #ifdef CONFIG_OF
 static const struct pinconf_generic_params dt_params[] = {
+	{ "bias-bus-hold", PIN_CONFIG_BIAS_BUS_HOLD, 0 },
 	{ "bias-disable", PIN_CONFIG_BIAS_DISABLE, 0 },
 	{ "bias-high-impedance", PIN_CONFIG_BIAS_HIGH_IMPEDANCE, 0 },
-	{ "bias-bus-hold", PIN_CONFIG_BIAS_BUS_HOLD, 0 },
 	{ "bias-pull-up", PIN_CONFIG_BIAS_PULL_UP, 1 },
-	{ "bias-pull-down", PIN_CONFIG_BIAS_PULL_DOWN, 1 },
 	{ "bias-pull-pin-default", PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, 1 },
-	{ "drive-push-pull", PIN_CONFIG_DRIVE_PUSH_PULL, 0 },
+	{ "bias-pull-down", PIN_CONFIG_BIAS_PULL_DOWN, 1 },
 	{ "drive-open-drain", PIN_CONFIG_DRIVE_OPEN_DRAIN, 0 },
 	{ "drive-open-source", PIN_CONFIG_DRIVE_OPEN_SOURCE, 0 },
+	{ "drive-push-pull", PIN_CONFIG_DRIVE_PUSH_PULL, 0 },
 	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
-	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
+	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
 	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
-	{ "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
+	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
 	{ "input-schmitt-disable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 0 },
-	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
-	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
-	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
+	{ "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
 	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
-	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
+	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
 	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
-	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0},
+	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
+	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
+	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
 };
 
 /**
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index fe65962..d921afd 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -20,6 +20,11 @@
 
 /**
  * enum pin_config_param - possible pin configuration parameters
+ * @PIN_CONFIG_BIAS_BUS_HOLD: the pin will be set to weakly latch so that it
+ *	weakly drives the last value on a tristate bus, also known as a "bus
+ *	holder", "bus keeper" or "repeater". This allows another device on the
+ *	bus to change the value by driving the bus high or low and switching to
+ *	tristate. The argument is ignored.
  * @PIN_CONFIG_BIAS_DISABLE: disable any pin bias on the pin, a
  *	transition from say pull-up to pull-down implies that you disable
  *	pull-up in the process, this setting disables all biasing.
@@ -29,14 +34,6 @@
  *	if for example some other pin is going to drive the signal connected
  *	to it for a while. Pins used for input are usually always high
  *	impedance.
- * @PIN_CONFIG_BIAS_BUS_HOLD: the pin will be set to weakly latch so that it
- *	weakly drives the last value on a tristate bus, also known as a "bus
- *	holder", "bus keeper" or "repeater". This allows another device on the
- *	bus to change the value by driving the bus high or low and switching to
- *	tristate. The argument is ignored.
- * @PIN_CONFIG_BIAS_PULL_UP: the pin will be pulled up (usually with high
- *	impedance to VDD). If the argument is != 0 pull-up is enabled,
- *	if it is 0, pull-up is total, i.e. the pin is connected to VDD.
  * @PIN_CONFIG_BIAS_PULL_DOWN: the pin will be pulled down (usually with high
  *	impedance to GROUND). If the argument is != 0 pull-down is enabled,
  *	if it is 0, pull-down is total, i.e. the pin is connected to GROUND.
@@ -48,10 +45,9 @@
  *	If the argument is != 0 pull up/down is enabled, if it is 0, the
  *	configuration is ignored. The proper way to disable it is to use
  *	@PIN_CONFIG_BIAS_DISABLE.
- * @PIN_CONFIG_DRIVE_PUSH_PULL: the pin will be driven actively high and
- *	low, this is the most typical case and is typically achieved with two
- *	active transistors on the output. Setting this config will enable
- *	push-pull mode, the argument is ignored.
+ * @PIN_CONFIG_BIAS_PULL_UP: the pin will be pulled up (usually with high
+ *	impedance to VDD). If the argument is != 0 pull-up is enabled,
+ *	if it is 0, pull-up is total, i.e. the pin is connected to VDD.
  * @PIN_CONFIG_DRIVE_OPEN_DRAIN: the pin will be driven with open drain (open
  *	collector) which means it is usually wired with other output ports
  *	which are then pulled up with an external resistor. Setting this
@@ -59,28 +55,26 @@
  * @PIN_CONFIG_DRIVE_OPEN_SOURCE: the pin will be driven with open source
  *	(open emitter). Setting this config will enable open source mode, the
  *	argument is ignored.
+ * @PIN_CONFIG_DRIVE_PUSH_PULL: the pin will be driven actively high and
+ *	low, this is the most typical case and is typically achieved with two
+ *	active transistors on the output. Setting this config will enable
+ *	push-pull mode, the argument is ignored.
  * @PIN_CONFIG_DRIVE_STRENGTH: the pin will sink or source at most the current
  *	passed as argument. The argument is in mA.
+ * @PIN_CONFIG_INPUT_DEBOUNCE: this will configure the pin to debounce mode,
+ *	which means it will wait for signals to settle when reading inputs. The
+ *	argument gives the debounce time in usecs. Setting the
+ *	argument to zero turns debouncing off.
  * @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this does not
  *	affect the pin's ability to drive output.  1 enables input, 0 disables
  *	input.
- * @PIN_CONFIG_INPUT_SCHMITT_ENABLE: control schmitt-trigger mode on the pin.
- *      If the argument != 0, schmitt-trigger mode is enabled. If it's 0,
- *      schmitt-trigger mode is disabled.
  * @PIN_CONFIG_INPUT_SCHMITT: this will configure an input pin to run in
  *	schmitt-trigger mode. If the schmitt-trigger has adjustable hysteresis,
  *	the threshold value is given on a custom format as argument when
  *	setting pins to this mode.
- * @PIN_CONFIG_INPUT_DEBOUNCE: this will configure the pin to debounce mode,
- *	which means it will wait for signals to settle when reading inputs. The
- *	argument gives the debounce time in usecs. Setting the
- *	argument to zero turns debouncing off.
- * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
- *	supplies, the argument to this parameter (on a custom format) tells
- *	the driver which alternative power source to use.
- * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
- *	this parameter (on a custom format) tells the driver which alternative
- *	slew rate to use.
+ * @PIN_CONFIG_INPUT_SCHMITT_ENABLE: control schmitt-trigger mode on the pin.
+ *      If the argument != 0, schmitt-trigger mode is enabled. If it's 0,
+ *      schmitt-trigger mode is disabled.
  * @PIN_CONFIG_LOW_POWER_MODE: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
@@ -89,29 +83,35 @@
  *	1 to indicate high level, argument 0 to indicate low level. (Please
  *	see Documentation/pinctrl.txt, section "GPIO mode pitfalls" for a
  *	discussion around this parameter.)
+ * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
+ *	supplies, the argument to this parameter (on a custom format) tells
+ *	the driver which alternative power source to use.
+ * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
+ *	this parameter (on a custom format) tells the driver which alternative
+ *	slew rate to use.
  * @PIN_CONFIG_END: this is the last enumerator for pin configurations, if
  *	you need to pass in custom configurations to the pin controller, use
  *	PIN_CONFIG_END+1 as the base offset.
  */
 enum pin_config_param {
+	PIN_CONFIG_BIAS_BUS_HOLD,
 	PIN_CONFIG_BIAS_DISABLE,
 	PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
-	PIN_CONFIG_BIAS_BUS_HOLD,
-	PIN_CONFIG_BIAS_PULL_UP,
 	PIN_CONFIG_BIAS_PULL_DOWN,
 	PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
-	PIN_CONFIG_DRIVE_PUSH_PULL,
+	PIN_CONFIG_BIAS_PULL_UP,
 	PIN_CONFIG_DRIVE_OPEN_DRAIN,
 	PIN_CONFIG_DRIVE_OPEN_SOURCE,
+	PIN_CONFIG_DRIVE_PUSH_PULL,
 	PIN_CONFIG_DRIVE_STRENGTH,
+	PIN_CONFIG_INPUT_DEBOUNCE,
 	PIN_CONFIG_INPUT_ENABLE,
-	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
-	PIN_CONFIG_INPUT_DEBOUNCE,
-	PIN_CONFIG_POWER_SOURCE,
-	PIN_CONFIG_SLEW_RATE,
+	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_LOW_POWER_MODE,
 	PIN_CONFIG_OUTPUT,
+	PIN_CONFIG_POWER_SOURCE,
+	PIN_CONFIG_SLEW_RATE,
 	PIN_CONFIG_END = 0x7FFF,
 };
 
-- 
1.9.1

