From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 01/29] pinctrl.txt: standardize document format
Date: Thu, 18 May 2017 22:25:45 -0300
Message-ID: <d16c41b5f7022add66672d43b5d595af74a1db34.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:43851
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932636AbdESB0h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 May 2017 21:26:37 -0400
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx.

This document is almost following the standard stile.

There are only two things to adjust on it:

- promote the level of the document title;
- mark literal blocks as such.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/pinctrl.txt | 1104 +++++++++++++++++++++++----------------------
 1 file changed, 560 insertions(+), 544 deletions(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index f2af35f6d6b2..bc1eb2ca3342 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -1,4 +1,7 @@
+===============================
 PINCTRL (PIN CONTROL) subsystem
+===============================
+
 This document outlines the pin control subsystem in Linux
 
 This subsystem deals with:
@@ -33,7 +36,7 @@ When a PIN CONTROLLER is instantiated, it will register a descriptor to the
 pin control framework, and this descriptor contains an array of pin descriptors
 describing the pins handled by this specific pin controller.
 
-Here is an example of a PGA (Pin Grid Array) chip seen from underneath:
+Here is an example of a PGA (Pin Grid Array) chip seen from underneath::
 
         A   B   C   D   E   F   G   H
 
@@ -54,39 +57,40 @@ Here is an example of a PGA (Pin Grid Array) chip seen from underneath:
    1    o   o   o   o   o   o   o   o
 
 To register a pin controller and name all the pins on this package we can do
-this in our driver:
+this in our driver::
 
-#include <linux/pinctrl/pinctrl.h>
+	#include <linux/pinctrl/pinctrl.h>
 
-const struct pinctrl_pin_desc foo_pins[] = {
-      PINCTRL_PIN(0, "A8"),
-      PINCTRL_PIN(1, "B8"),
-      PINCTRL_PIN(2, "C8"),
-      ...
-      PINCTRL_PIN(61, "F1"),
-      PINCTRL_PIN(62, "G1"),
-      PINCTRL_PIN(63, "H1"),
-};
+	const struct pinctrl_pin_desc foo_pins[] = {
+	PINCTRL_PIN(0, "A8"),
+	PINCTRL_PIN(1, "B8"),
+	PINCTRL_PIN(2, "C8"),
+	...
+	PINCTRL_PIN(61, "F1"),
+	PINCTRL_PIN(62, "G1"),
+	PINCTRL_PIN(63, "H1"),
+	};
 
-static struct pinctrl_desc foo_desc = {
-	.name = "foo",
-	.pins = foo_pins,
-	.npins = ARRAY_SIZE(foo_pins),
-	.owner = THIS_MODULE,
-};
+	static struct pinctrl_desc foo_desc = {
+		.name = "foo",
+		.pins = foo_pins,
+		.npins = ARRAY_SIZE(foo_pins),
+		.owner = THIS_MODULE,
+	};
 
-int __init foo_probe(void)
-{
-	int error;
+	int __init foo_probe(void)
+	{
+		int error;
 
-	struct pinctrl_dev *pctl;
+		struct pinctrl_dev *pctl;
 
-	error = pinctrl_register_and_init(&foo_desc, <PARENT>, NULL, &pctl);
-	if (error)
-		return error;
+		error = pinctrl_register_and_init(&foo_desc, <PARENT>,
+						  NULL, &pctl);
+		if (error)
+			return error;
 
-	return pinctrl_enable(pctl);
-}
+		return pinctrl_enable(pctl);
+	}
 
 To enable the pinctrl subsystem and the subgroups for PINMUX and PINCONF and
 selected drivers, you need to select them from your machine's Kconfig entry,
@@ -105,7 +109,7 @@ the pin controller.
 
 For a padring with 467 pads, as opposed to actual pins, I used an enumeration
 like this, walking around the edge of the chip, which seems to be industry
-standard too (all these pads had names, too):
+standard too (all these pads had names, too)::
 
 
      0 ..... 104
@@ -128,64 +132,64 @@ on { 0, 8, 16, 24 }, and a group of pins dealing with an I2C interface on pins
 on { 24, 25 }.
 
 These two groups are presented to the pin control subsystem by implementing
-some generic pinctrl_ops like this:
-
-#include <linux/pinctrl/pinctrl.h>
-
-struct foo_group {
-	const char *name;
-	const unsigned int *pins;
-	const unsigned num_pins;
-};
-
-static const unsigned int spi0_pins[] = { 0, 8, 16, 24 };
-static const unsigned int i2c0_pins[] = { 24, 25 };
+some generic pinctrl_ops like this::
+
+	#include <linux/pinctrl/pinctrl.h>
+
+	struct foo_group {
+		const char *name;
+		const unsigned int *pins;
+		const unsigned num_pins;
+	};
+
+	static const unsigned int spi0_pins[] = { 0, 8, 16, 24 };
+	static const unsigned int i2c0_pins[] = { 24, 25 };
+
+	static const struct foo_group foo_groups[] = {
+		{
+			.name = "spi0_grp",
+			.pins = spi0_pins,
+			.num_pins = ARRAY_SIZE(spi0_pins),
+		},
+		{
+			.name = "i2c0_grp",
+			.pins = i2c0_pins,
+			.num_pins = ARRAY_SIZE(i2c0_pins),
+		},
+	};
+
+
+	static int foo_get_groups_count(struct pinctrl_dev *pctldev)
+	{
+		return ARRAY_SIZE(foo_groups);
+	}
 
-static const struct foo_group foo_groups[] = {
+	static const char *foo_get_group_name(struct pinctrl_dev *pctldev,
+					unsigned selector)
 	{
-		.name = "spi0_grp",
-		.pins = spi0_pins,
-		.num_pins = ARRAY_SIZE(spi0_pins),
-	},
+		return foo_groups[selector].name;
+	}
+
+	static int foo_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
+				const unsigned **pins,
+				unsigned *num_pins)
 	{
-		.name = "i2c0_grp",
-		.pins = i2c0_pins,
-		.num_pins = ARRAY_SIZE(i2c0_pins),
-	},
-};
-
-
-static int foo_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	return ARRAY_SIZE(foo_groups);
-}
-
-static const char *foo_get_group_name(struct pinctrl_dev *pctldev,
-				       unsigned selector)
-{
-	return foo_groups[selector].name;
-}
-
-static int foo_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
-			       const unsigned **pins,
-			       unsigned *num_pins)
-{
-	*pins = (unsigned *) foo_groups[selector].pins;
-	*num_pins = foo_groups[selector].num_pins;
-	return 0;
-}
-
-static struct pinctrl_ops foo_pctrl_ops = {
-	.get_groups_count = foo_get_groups_count,
-	.get_group_name = foo_get_group_name,
-	.get_group_pins = foo_get_group_pins,
-};
-
-
-static struct pinctrl_desc foo_desc = {
-       ...
-       .pctlops = &foo_pctrl_ops,
-};
+		*pins = (unsigned *) foo_groups[selector].pins;
+		*num_pins = foo_groups[selector].num_pins;
+		return 0;
+	}
+
+	static struct pinctrl_ops foo_pctrl_ops = {
+		.get_groups_count = foo_get_groups_count,
+		.get_group_name = foo_get_group_name,
+		.get_group_pins = foo_get_group_pins,
+	};
+
+
+	static struct pinctrl_desc foo_desc = {
+	...
+	.pctlops = &foo_pctrl_ops,
+	};
 
 The pin control subsystem will call the .get_groups_count() function to
 determine the total number of legal selectors, then it will call the other functions
@@ -213,62 +217,62 @@ The format and meaning of the configuration parameter, PLATFORM_X_PULL_UP
 above, is entirely defined by the pin controller driver.
 
 The pin configuration driver implements callbacks for changing pin
-configuration in the pin controller ops like this:
+configuration in the pin controller ops like this::
 
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinconf.h>
-#include "platform_x_pindefs.h"
+	#include <linux/pinctrl/pinctrl.h>
+	#include <linux/pinctrl/pinconf.h>
+	#include "platform_x_pindefs.h"
 
-static int foo_pin_config_get(struct pinctrl_dev *pctldev,
-		    unsigned offset,
-		    unsigned long *config)
-{
-	struct my_conftype conf;
+	static int foo_pin_config_get(struct pinctrl_dev *pctldev,
+			unsigned offset,
+			unsigned long *config)
+	{
+		struct my_conftype conf;
 
-	... Find setting for pin @ offset ...
+		... Find setting for pin @ offset ...
 
-	*config = (unsigned long) conf;
-}
+		*config = (unsigned long) conf;
+	}
 
-static int foo_pin_config_set(struct pinctrl_dev *pctldev,
-		    unsigned offset,
-		    unsigned long config)
-{
-	struct my_conftype *conf = (struct my_conftype *) config;
+	static int foo_pin_config_set(struct pinctrl_dev *pctldev,
+			unsigned offset,
+			unsigned long config)
+	{
+		struct my_conftype *conf = (struct my_conftype *) config;
 
-	switch (conf) {
-		case PLATFORM_X_PULL_UP:
-		...
+		switch (conf) {
+			case PLATFORM_X_PULL_UP:
+			...
+			}
 		}
 	}
-}
 
-static int foo_pin_config_group_get (struct pinctrl_dev *pctldev,
-		    unsigned selector,
-		    unsigned long *config)
-{
-	...
-}
+	static int foo_pin_config_group_get (struct pinctrl_dev *pctldev,
+			unsigned selector,
+			unsigned long *config)
+	{
+		...
+	}
 
-static int foo_pin_config_group_set (struct pinctrl_dev *pctldev,
-		    unsigned selector,
-		    unsigned long config)
-{
-	...
-}
+	static int foo_pin_config_group_set (struct pinctrl_dev *pctldev,
+			unsigned selector,
+			unsigned long config)
+	{
+		...
+	}
 
-static struct pinconf_ops foo_pconf_ops = {
-	.pin_config_get = foo_pin_config_get,
-	.pin_config_set = foo_pin_config_set,
-	.pin_config_group_get = foo_pin_config_group_get,
-	.pin_config_group_set = foo_pin_config_group_set,
-};
+	static struct pinconf_ops foo_pconf_ops = {
+		.pin_config_get = foo_pin_config_get,
+		.pin_config_set = foo_pin_config_set,
+		.pin_config_group_get = foo_pin_config_group_get,
+		.pin_config_group_set = foo_pin_config_group_set,
+	};
 
-/* Pin config operations are handled by some pin controller */
-static struct pinctrl_desc foo_desc = {
-	...
-	.confops = &foo_pconf_ops,
-};
+	/* Pin config operations are handled by some pin controller */
+	static struct pinctrl_desc foo_desc = {
+		...
+		.confops = &foo_pconf_ops,
+	};
 
 Since some controllers have special logic for handling entire groups of pins
 they can exploit the special whole-group pin control function. The
@@ -296,35 +300,35 @@ controller handles control of a certain GPIO pin. Since a single pin controller
 may be muxing several GPIO ranges (typically SoCs that have one set of pins,
 but internally several GPIO silicon blocks, each modelled as a struct
 gpio_chip) any number of GPIO ranges can be added to a pin controller instance
-like this:
+like this::
 
-struct gpio_chip chip_a;
-struct gpio_chip chip_b;
+	struct gpio_chip chip_a;
+	struct gpio_chip chip_b;
 
-static struct pinctrl_gpio_range gpio_range_a = {
-	.name = "chip a",
-	.id = 0,
-	.base = 32,
-	.pin_base = 32,
-	.npins = 16,
-	.gc = &chip_a;
-};
+	static struct pinctrl_gpio_range gpio_range_a = {
+		.name = "chip a",
+		.id = 0,
+		.base = 32,
+		.pin_base = 32,
+		.npins = 16,
+		.gc = &chip_a;
+	};
 
-static struct pinctrl_gpio_range gpio_range_b = {
-	.name = "chip b",
-	.id = 0,
-	.base = 48,
-	.pin_base = 64,
-	.npins = 8,
-	.gc = &chip_b;
-};
+	static struct pinctrl_gpio_range gpio_range_b = {
+		.name = "chip b",
+		.id = 0,
+		.base = 48,
+		.pin_base = 64,
+		.npins = 8,
+		.gc = &chip_b;
+	};
 
-{
-	struct pinctrl_dev *pctl;
-	...
-	pinctrl_add_gpio_range(pctl, &gpio_range_a);
-	pinctrl_add_gpio_range(pctl, &gpio_range_b);
-}
+	{
+		struct pinctrl_dev *pctl;
+		...
+		pinctrl_add_gpio_range(pctl, &gpio_range_a);
+		pinctrl_add_gpio_range(pctl, &gpio_range_b);
+	}
 
 So this complex system has one pin controller handling two different
 GPIO chips. "chip a" has 16 pins and "chip b" has 8 pins. The "chip a" and
@@ -348,25 +352,26 @@ chip b:
 
 The above examples assume the mapping between the GPIOs and pins is
 linear. If the mapping is sparse or haphazard, an array of arbitrary pin
-numbers can be encoded in the range like this:
+numbers can be encoded in the range like this::
 
-static const unsigned range_pins[] = { 14, 1, 22, 17, 10, 8, 6, 2 };
+	static const unsigned range_pins[] = { 14, 1, 22, 17, 10, 8, 6, 2 };
 
-static struct pinctrl_gpio_range gpio_range = {
-	.name = "chip",
-	.id = 0,
-	.base = 32,
-	.pins = &range_pins,
-	.npins = ARRAY_SIZE(range_pins),
-	.gc = &chip;
-};
+	static struct pinctrl_gpio_range gpio_range = {
+		.name = "chip",
+		.id = 0,
+		.base = 32,
+		.pins = &range_pins,
+		.npins = ARRAY_SIZE(range_pins),
+		.gc = &chip;
+	};
 
 In this case the pin_base property will be ignored. If the name of a pin
 group is known, the pins and npins elements of the above structure can be
 initialised using the function pinctrl_get_group_pins(), e.g. for pin
-group "foo":
+group "foo"::
 
-pinctrl_get_group_pins(pctl, "foo", &gpio_range.pins, &gpio_range.npins);
+	pinctrl_get_group_pins(pctl, "foo", &gpio_range.pins,
+			       &gpio_range.npins);
 
 When GPIO-specific functions in the pin control subsystem are called, these
 ranges will be used to look up the appropriate pin controller by inspecting
@@ -405,7 +410,7 @@ we usually mean a way of soldering or wiring the package into an electronic
 system, even though the framework makes it possible to also change the function
 at runtime.
 
-Here is an example of a PGA (Pin Grid Array) chip seen from underneath:
+Here is an example of a PGA (Pin Grid Array) chip seen from underneath::
 
         A   B   C   D   E   F   G   H
       +---+
@@ -519,12 +524,12 @@ Definitions:
   In the example case we can define that this particular machine shall
   use device spi0 with pinmux function fspi0 group gspi0 and i2c0 on function
   fi2c0 group gi2c0, on the primary pin controller, we get mappings
-  like these:
+  like these::
 
-  {
-    {"map-spi0", spi0, pinctrl0, fspi0, gspi0},
-    {"map-i2c0", i2c0, pinctrl0, fi2c0, gi2c0}
-  }
+	{
+		{"map-spi0", spi0, pinctrl0, fspi0, gspi0},
+		{"map-i2c0", i2c0, pinctrl0, fi2c0, gi2c0}
+	}
 
   Every map must be assigned a state name, pin controller, device and
   function. The group is not compulsory - if it is omitted the first group
@@ -578,155 +583,155 @@ some certain registers to activate a certain mux setting for a certain pin.
 
 A simple driver for the above example will work by setting bits 0, 1, 2, 3 or 4
 into some register named MUX to select a certain function with a certain
-group of pins would work something like this:
-
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinmux.h>
-
-struct foo_group {
-	const char *name;
-	const unsigned int *pins;
-	const unsigned num_pins;
-};
-
-static const unsigned spi0_0_pins[] = { 0, 8, 16, 24 };
-static const unsigned spi0_1_pins[] = { 38, 46, 54, 62 };
-static const unsigned i2c0_pins[] = { 24, 25 };
-static const unsigned mmc0_1_pins[] = { 56, 57 };
-static const unsigned mmc0_2_pins[] = { 58, 59 };
-static const unsigned mmc0_3_pins[] = { 60, 61, 62, 63 };
-
-static const struct foo_group foo_groups[] = {
-	{
-		.name = "spi0_0_grp",
-		.pins = spi0_0_pins,
-		.num_pins = ARRAY_SIZE(spi0_0_pins),
-	},
-	{
-		.name = "spi0_1_grp",
-		.pins = spi0_1_pins,
-		.num_pins = ARRAY_SIZE(spi0_1_pins),
-	},
+group of pins would work something like this::
+
+	#include <linux/pinctrl/pinctrl.h>
+	#include <linux/pinctrl/pinmux.h>
+
+	struct foo_group {
+		const char *name;
+		const unsigned int *pins;
+		const unsigned num_pins;
+	};
+
+	static const unsigned spi0_0_pins[] = { 0, 8, 16, 24 };
+	static const unsigned spi0_1_pins[] = { 38, 46, 54, 62 };
+	static const unsigned i2c0_pins[] = { 24, 25 };
+	static const unsigned mmc0_1_pins[] = { 56, 57 };
+	static const unsigned mmc0_2_pins[] = { 58, 59 };
+	static const unsigned mmc0_3_pins[] = { 60, 61, 62, 63 };
+
+	static const struct foo_group foo_groups[] = {
+		{
+			.name = "spi0_0_grp",
+			.pins = spi0_0_pins,
+			.num_pins = ARRAY_SIZE(spi0_0_pins),
+		},
+		{
+			.name = "spi0_1_grp",
+			.pins = spi0_1_pins,
+			.num_pins = ARRAY_SIZE(spi0_1_pins),
+		},
+		{
+			.name = "i2c0_grp",
+			.pins = i2c0_pins,
+			.num_pins = ARRAY_SIZE(i2c0_pins),
+		},
+		{
+			.name = "mmc0_1_grp",
+			.pins = mmc0_1_pins,
+			.num_pins = ARRAY_SIZE(mmc0_1_pins),
+		},
+		{
+			.name = "mmc0_2_grp",
+			.pins = mmc0_2_pins,
+			.num_pins = ARRAY_SIZE(mmc0_2_pins),
+		},
+		{
+			.name = "mmc0_3_grp",
+			.pins = mmc0_3_pins,
+			.num_pins = ARRAY_SIZE(mmc0_3_pins),
+		},
+	};
+
+
+	static int foo_get_groups_count(struct pinctrl_dev *pctldev)
 	{
-		.name = "i2c0_grp",
-		.pins = i2c0_pins,
-		.num_pins = ARRAY_SIZE(i2c0_pins),
-	},
+		return ARRAY_SIZE(foo_groups);
+	}
+
+	static const char *foo_get_group_name(struct pinctrl_dev *pctldev,
+					unsigned selector)
 	{
-		.name = "mmc0_1_grp",
-		.pins = mmc0_1_pins,
-		.num_pins = ARRAY_SIZE(mmc0_1_pins),
-	},
+		return foo_groups[selector].name;
+	}
+
+	static int foo_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
+				unsigned ** const pins,
+				unsigned * const num_pins)
 	{
-		.name = "mmc0_2_grp",
-		.pins = mmc0_2_pins,
-		.num_pins = ARRAY_SIZE(mmc0_2_pins),
-	},
+		*pins = (unsigned *) foo_groups[selector].pins;
+		*num_pins = foo_groups[selector].num_pins;
+		return 0;
+	}
+
+	static struct pinctrl_ops foo_pctrl_ops = {
+		.get_groups_count = foo_get_groups_count,
+		.get_group_name = foo_get_group_name,
+		.get_group_pins = foo_get_group_pins,
+	};
+
+	struct foo_pmx_func {
+		const char *name;
+		const char * const *groups;
+		const unsigned num_groups;
+	};
+
+	static const char * const spi0_groups[] = { "spi0_0_grp", "spi0_1_grp" };
+	static const char * const i2c0_groups[] = { "i2c0_grp" };
+	static const char * const mmc0_groups[] = { "mmc0_1_grp", "mmc0_2_grp",
+						"mmc0_3_grp" };
+
+	static const struct foo_pmx_func foo_functions[] = {
+		{
+			.name = "spi0",
+			.groups = spi0_groups,
+			.num_groups = ARRAY_SIZE(spi0_groups),
+		},
+		{
+			.name = "i2c0",
+			.groups = i2c0_groups,
+			.num_groups = ARRAY_SIZE(i2c0_groups),
+		},
+		{
+			.name = "mmc0",
+			.groups = mmc0_groups,
+			.num_groups = ARRAY_SIZE(mmc0_groups),
+		},
+	};
+
+	static int foo_get_functions_count(struct pinctrl_dev *pctldev)
 	{
-		.name = "mmc0_3_grp",
-		.pins = mmc0_3_pins,
-		.num_pins = ARRAY_SIZE(mmc0_3_pins),
-	},
-};
-
-
-static int foo_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	return ARRAY_SIZE(foo_groups);
-}
-
-static const char *foo_get_group_name(struct pinctrl_dev *pctldev,
-				       unsigned selector)
-{
-	return foo_groups[selector].name;
-}
-
-static int foo_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
-			       unsigned ** const pins,
-			       unsigned * const num_pins)
-{
-	*pins = (unsigned *) foo_groups[selector].pins;
-	*num_pins = foo_groups[selector].num_pins;
-	return 0;
-}
-
-static struct pinctrl_ops foo_pctrl_ops = {
-	.get_groups_count = foo_get_groups_count,
-	.get_group_name = foo_get_group_name,
-	.get_group_pins = foo_get_group_pins,
-};
-
-struct foo_pmx_func {
-	const char *name;
-	const char * const *groups;
-	const unsigned num_groups;
-};
-
-static const char * const spi0_groups[] = { "spi0_0_grp", "spi0_1_grp" };
-static const char * const i2c0_groups[] = { "i2c0_grp" };
-static const char * const mmc0_groups[] = { "mmc0_1_grp", "mmc0_2_grp",
-					"mmc0_3_grp" };
-
-static const struct foo_pmx_func foo_functions[] = {
+		return ARRAY_SIZE(foo_functions);
+	}
+
+	static const char *foo_get_fname(struct pinctrl_dev *pctldev, unsigned selector)
 	{
-		.name = "spi0",
-		.groups = spi0_groups,
-		.num_groups = ARRAY_SIZE(spi0_groups),
-	},
+		return foo_functions[selector].name;
+	}
+
+	static int foo_get_groups(struct pinctrl_dev *pctldev, unsigned selector,
+				const char * const **groups,
+				unsigned * const num_groups)
 	{
-		.name = "i2c0",
-		.groups = i2c0_groups,
-		.num_groups = ARRAY_SIZE(i2c0_groups),
-	},
+		*groups = foo_functions[selector].groups;
+		*num_groups = foo_functions[selector].num_groups;
+		return 0;
+	}
+
+	static int foo_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
+			unsigned group)
 	{
-		.name = "mmc0",
-		.groups = mmc0_groups,
-		.num_groups = ARRAY_SIZE(mmc0_groups),
-	},
-};
-
-static int foo_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	return ARRAY_SIZE(foo_functions);
-}
-
-static const char *foo_get_fname(struct pinctrl_dev *pctldev, unsigned selector)
-{
-	return foo_functions[selector].name;
-}
-
-static int foo_get_groups(struct pinctrl_dev *pctldev, unsigned selector,
-			  const char * const **groups,
-			  unsigned * const num_groups)
-{
-	*groups = foo_functions[selector].groups;
-	*num_groups = foo_functions[selector].num_groups;
-	return 0;
-}
-
-static int foo_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
-		unsigned group)
-{
-	u8 regbit = (1 << selector + group);
-
-	writeb((readb(MUX)|regbit), MUX)
-	return 0;
-}
-
-static struct pinmux_ops foo_pmxops = {
-	.get_functions_count = foo_get_functions_count,
-	.get_function_name = foo_get_fname,
-	.get_function_groups = foo_get_groups,
-	.set_mux = foo_set_mux,
-	.strict = true,
-};
-
-/* Pinmux operations are handled by some pin controller */
-static struct pinctrl_desc foo_desc = {
-	...
-	.pctlops = &foo_pctrl_ops,
-	.pmxops = &foo_pmxops,
-};
+		u8 regbit = (1 << selector + group);
+
+		writeb((readb(MUX)|regbit), MUX)
+		return 0;
+	}
+
+	static struct pinmux_ops foo_pmxops = {
+		.get_functions_count = foo_get_functions_count,
+		.get_function_name = foo_get_fname,
+		.get_function_groups = foo_get_groups,
+		.set_mux = foo_set_mux,
+		.strict = true,
+	};
+
+	/* Pinmux operations are handled by some pin controller */
+	static struct pinctrl_desc foo_desc = {
+		...
+		.pctlops = &foo_pctrl_ops,
+		.pmxops = &foo_pmxops,
+	};
 
 In the example activating muxing 0 and 1 at the same time setting bits
 0 and 1, uses one pin in common so they would collide.
@@ -809,9 +814,9 @@ for a device.
 
 The GPIO portions of a pin and its relation to a certain pin controller
 configuration and muxing logic can be constructed in several ways. Here
-are two examples:
+are two examples::
 
-(A)
+     (A)
                        pin config
                        logic regs
                        |               +- SPI
@@ -840,7 +845,9 @@ simultaneous access to the same pin from GPIO and pin multiplexing
 consumers on hardware of this type. The pinctrl driver should set this flag
 accordingly.
 
-(B)
+::
+
+     (B)
 
                        pin config
                        logic regs
@@ -911,52 +918,55 @@ has to be handled by the <linux/gpio.h> interface. Instead view this as
 a certain pin config setting. Look in e.g. <linux/pinctrl/pinconf-generic.h>
 and you find this in the documentation:
 
-  PIN_CONFIG_OUTPUT: this will configure the pin in output, use argument
+  PIN_CONFIG_OUTPUT:
+     this will configure the pin in output, use argument
      1 to indicate high level, argument 0 to indicate low level.
 
 So it is perfectly possible to push a pin into "GPIO mode" and drive the
 line low as part of the usual pin control map. So for example your UART
-driver may look like this:
+driver may look like this::
 
-#include <linux/pinctrl/consumer.h>
+	#include <linux/pinctrl/consumer.h>
 
-struct pinctrl          *pinctrl;
-struct pinctrl_state    *pins_default;
-struct pinctrl_state    *pins_sleep;
+	struct pinctrl          *pinctrl;
+	struct pinctrl_state    *pins_default;
+	struct pinctrl_state    *pins_sleep;
 
-pins_default = pinctrl_lookup_state(uap->pinctrl, PINCTRL_STATE_DEFAULT);
-pins_sleep = pinctrl_lookup_state(uap->pinctrl, PINCTRL_STATE_SLEEP);
+	pins_default = pinctrl_lookup_state(uap->pinctrl, PINCTRL_STATE_DEFAULT);
+	pins_sleep = pinctrl_lookup_state(uap->pinctrl, PINCTRL_STATE_SLEEP);
 
-/* Normal mode */
-retval = pinctrl_select_state(pinctrl, pins_default);
-/* Sleep mode */
-retval = pinctrl_select_state(pinctrl, pins_sleep);
+	/* Normal mode */
+	retval = pinctrl_select_state(pinctrl, pins_default);
+	/* Sleep mode */
+	retval = pinctrl_select_state(pinctrl, pins_sleep);
 
 And your machine configuration may look like this:
 --------------------------------------------------
 
-static unsigned long uart_default_mode[] = {
-    PIN_CONF_PACKED(PIN_CONFIG_DRIVE_PUSH_PULL, 0),
-};
+::
 
-static unsigned long uart_sleep_mode[] = {
-    PIN_CONF_PACKED(PIN_CONFIG_OUTPUT, 0),
-};
+	static unsigned long uart_default_mode[] = {
+	PIN_CONF_PACKED(PIN_CONFIG_DRIVE_PUSH_PULL, 0),
+	};
 
-static struct pinctrl_map pinmap[] __initdata = {
-    PIN_MAP_MUX_GROUP("uart", PINCTRL_STATE_DEFAULT, "pinctrl-foo",
-                      "u0_group", "u0"),
-    PIN_MAP_CONFIGS_PIN("uart", PINCTRL_STATE_DEFAULT, "pinctrl-foo",
-                        "UART_TX_PIN", uart_default_mode),
-    PIN_MAP_MUX_GROUP("uart", PINCTRL_STATE_SLEEP, "pinctrl-foo",
-                      "u0_group", "gpio-mode"),
-    PIN_MAP_CONFIGS_PIN("uart", PINCTRL_STATE_SLEEP, "pinctrl-foo",
-                        "UART_TX_PIN", uart_sleep_mode),
-};
+	static unsigned long uart_sleep_mode[] = {
+	PIN_CONF_PACKED(PIN_CONFIG_OUTPUT, 0),
+	};
 
-foo_init(void) {
-    pinctrl_register_mappings(pinmap, ARRAY_SIZE(pinmap));
-}
+	static struct pinctrl_map pinmap[] __initdata = {
+	PIN_MAP_MUX_GROUP("uart", PINCTRL_STATE_DEFAULT, "pinctrl-foo",
+			"u0_group", "u0"),
+	PIN_MAP_CONFIGS_PIN("uart", PINCTRL_STATE_DEFAULT, "pinctrl-foo",
+				"UART_TX_PIN", uart_default_mode),
+	PIN_MAP_MUX_GROUP("uart", PINCTRL_STATE_SLEEP, "pinctrl-foo",
+			"u0_group", "gpio-mode"),
+	PIN_MAP_CONFIGS_PIN("uart", PINCTRL_STATE_SLEEP, "pinctrl-foo",
+				"UART_TX_PIN", uart_sleep_mode),
+	};
+
+	foo_init(void) {
+	pinctrl_register_mappings(pinmap, ARRAY_SIZE(pinmap));
+	}
 
 Here the pins we want to control are in the "u0_group" and there is some
 function called "u0" that can be enabled on this group of pins, and then
@@ -985,7 +995,7 @@ API.
 
 
 Board/machine configuration
-==================================
+===========================
 
 Boards and machines define how a certain complete running system is put
 together, including how GPIOs and devices are muxed, how regulators are
@@ -994,33 +1004,33 @@ part of this.
 
 A pin controller configuration for a machine looks pretty much like a simple
 regulator configuration, so for the example array above we want to enable i2c
-and spi on the second function mapping:
+and spi on the second function mapping::
 
-#include <linux/pinctrl/machine.h>
+	#include <linux/pinctrl/machine.h>
 
-static const struct pinctrl_map mapping[] __initconst = {
-	{
-		.dev_name = "foo-spi.0",
-		.name = PINCTRL_STATE_DEFAULT,
-		.type = PIN_MAP_TYPE_MUX_GROUP,
-		.ctrl_dev_name = "pinctrl-foo",
-		.data.mux.function = "spi0",
-	},
-	{
-		.dev_name = "foo-i2c.0",
-		.name = PINCTRL_STATE_DEFAULT,
-		.type = PIN_MAP_TYPE_MUX_GROUP,
-		.ctrl_dev_name = "pinctrl-foo",
-		.data.mux.function = "i2c0",
-	},
-	{
-		.dev_name = "foo-mmc.0",
-		.name = PINCTRL_STATE_DEFAULT,
-		.type = PIN_MAP_TYPE_MUX_GROUP,
-		.ctrl_dev_name = "pinctrl-foo",
-		.data.mux.function = "mmc0",
-	},
-};
+	static const struct pinctrl_map mapping[] __initconst = {
+		{
+			.dev_name = "foo-spi.0",
+			.name = PINCTRL_STATE_DEFAULT,
+			.type = PIN_MAP_TYPE_MUX_GROUP,
+			.ctrl_dev_name = "pinctrl-foo",
+			.data.mux.function = "spi0",
+		},
+		{
+			.dev_name = "foo-i2c.0",
+			.name = PINCTRL_STATE_DEFAULT,
+			.type = PIN_MAP_TYPE_MUX_GROUP,
+			.ctrl_dev_name = "pinctrl-foo",
+			.data.mux.function = "i2c0",
+		},
+		{
+			.dev_name = "foo-mmc.0",
+			.name = PINCTRL_STATE_DEFAULT,
+			.type = PIN_MAP_TYPE_MUX_GROUP,
+			.ctrl_dev_name = "pinctrl-foo",
+			.data.mux.function = "mmc0",
+		},
+	};
 
 The dev_name here matches to the unique device name that can be used to look
 up the device struct (just like with clockdev or regulators). The function name
@@ -1029,76 +1039,81 @@ must match a function provided by the pinmux driver handling this pin range.
 As you can see we may have several pin controllers on the system and thus
 we need to specify which one of them contains the functions we wish to map.
 
-You register this pinmux mapping to the pinmux subsystem by simply:
+You register this pinmux mapping to the pinmux subsystem by simply::
 
        ret = pinctrl_register_mappings(mapping, ARRAY_SIZE(mapping));
 
 Since the above construct is pretty common there is a helper macro to make
 it even more compact which assumes you want to use pinctrl-foo and position
-0 for mapping, for example:
+0 for mapping, for example::
 
-static struct pinctrl_map mapping[] __initdata = {
-	PIN_MAP_MUX_GROUP("foo-i2c.o", PINCTRL_STATE_DEFAULT, "pinctrl-foo", NULL, "i2c0"),
-};
+	static struct pinctrl_map mapping[] __initdata = {
+		PIN_MAP_MUX_GROUP("foo-i2c.o", PINCTRL_STATE_DEFAULT,
+				  "pinctrl-foo", NULL, "i2c0"),
+	};
 
 The mapping table may also contain pin configuration entries. It's common for
 each pin/group to have a number of configuration entries that affect it, so
 the table entries for configuration reference an array of config parameters
-and values. An example using the convenience macros is shown below:
+and values. An example using the convenience macros is shown below::
 
-static unsigned long i2c_grp_configs[] = {
-	FOO_PIN_DRIVEN,
-	FOO_PIN_PULLUP,
-};
+	static unsigned long i2c_grp_configs[] = {
+		FOO_PIN_DRIVEN,
+		FOO_PIN_PULLUP,
+	};
 
-static unsigned long i2c_pin_configs[] = {
-	FOO_OPEN_COLLECTOR,
-	FOO_SLEW_RATE_SLOW,
-};
+	static unsigned long i2c_pin_configs[] = {
+		FOO_OPEN_COLLECTOR,
+		FOO_SLEW_RATE_SLOW,
+	};
 
-static struct pinctrl_map mapping[] __initdata = {
-	PIN_MAP_MUX_GROUP("foo-i2c.0", PINCTRL_STATE_DEFAULT, "pinctrl-foo", "i2c0", "i2c0"),
-	PIN_MAP_CONFIGS_GROUP("foo-i2c.0", PINCTRL_STATE_DEFAULT, "pinctrl-foo", "i2c0", i2c_grp_configs),
-	PIN_MAP_CONFIGS_PIN("foo-i2c.0", PINCTRL_STATE_DEFAULT, "pinctrl-foo", "i2c0scl", i2c_pin_configs),
-	PIN_MAP_CONFIGS_PIN("foo-i2c.0", PINCTRL_STATE_DEFAULT, "pinctrl-foo", "i2c0sda", i2c_pin_configs),
-};
+	static struct pinctrl_map mapping[] __initdata = {
+		PIN_MAP_MUX_GROUP("foo-i2c.0", PINCTRL_STATE_DEFAULT,
+				  "pinctrl-foo", "i2c0", "i2c0"),
+		PIN_MAP_CONFIGS_GROUP("foo-i2c.0", PINCTRL_STATE_DEFAULT,
+				      "pinctrl-foo", "i2c0", i2c_grp_configs),
+		PIN_MAP_CONFIGS_PIN("foo-i2c.0", PINCTRL_STATE_DEFAULT,
+				    "pinctrl-foo", "i2c0scl", i2c_pin_configs),
+		PIN_MAP_CONFIGS_PIN("foo-i2c.0", PINCTRL_STATE_DEFAULT,
+				    "pinctrl-foo", "i2c0sda", i2c_pin_configs),
+	};
 
 Finally, some devices expect the mapping table to contain certain specific
 named states. When running on hardware that doesn't need any pin controller
 configuration, the mapping table must still contain those named states, in
 order to explicitly indicate that the states were provided and intended to
 be empty. Table entry macro PIN_MAP_DUMMY_STATE serves the purpose of defining
-a named state without causing any pin controller to be programmed:
+a named state without causing any pin controller to be programmed::
 
-static struct pinctrl_map mapping[] __initdata = {
-	PIN_MAP_DUMMY_STATE("foo-i2c.0", PINCTRL_STATE_DEFAULT),
-};
+	static struct pinctrl_map mapping[] __initdata = {
+		PIN_MAP_DUMMY_STATE("foo-i2c.0", PINCTRL_STATE_DEFAULT),
+	};
 
 
 Complex mappings
 ================
 
 As it is possible to map a function to different groups of pins an optional
-.group can be specified like this:
+.group can be specified like this::
 
-...
-{
-	.dev_name = "foo-spi.0",
-	.name = "spi0-pos-A",
-	.type = PIN_MAP_TYPE_MUX_GROUP,
-	.ctrl_dev_name = "pinctrl-foo",
-	.function = "spi0",
-	.group = "spi0_0_grp",
-},
-{
-	.dev_name = "foo-spi.0",
-	.name = "spi0-pos-B",
-	.type = PIN_MAP_TYPE_MUX_GROUP,
-	.ctrl_dev_name = "pinctrl-foo",
-	.function = "spi0",
-	.group = "spi0_1_grp",
-},
-...
+	...
+	{
+		.dev_name = "foo-spi.0",
+		.name = "spi0-pos-A",
+		.type = PIN_MAP_TYPE_MUX_GROUP,
+		.ctrl_dev_name = "pinctrl-foo",
+		.function = "spi0",
+		.group = "spi0_0_grp",
+	},
+	{
+		.dev_name = "foo-spi.0",
+		.name = "spi0-pos-B",
+		.type = PIN_MAP_TYPE_MUX_GROUP,
+		.ctrl_dev_name = "pinctrl-foo",
+		.function = "spi0",
+		.group = "spi0_1_grp",
+	},
+	...
 
 This example mapping is used to switch between two positions for spi0 at
 runtime, as described further below under the heading "Runtime pinmuxing".
@@ -1107,67 +1122,67 @@ Further it is possible for one named state to affect the muxing of several
 groups of pins, say for example in the mmc0 example above, where you can
 additively expand the mmc0 bus from 2 to 4 to 8 pins. If we want to use all
 three groups for a total of 2+2+4 = 8 pins (for an 8-bit MMC bus as is the
-case), we define a mapping like this:
+case), we define a mapping like this::
 
-...
-{
-	.dev_name = "foo-mmc.0",
-	.name = "2bit"
-	.type = PIN_MAP_TYPE_MUX_GROUP,
-	.ctrl_dev_name = "pinctrl-foo",
-	.function = "mmc0",
-	.group = "mmc0_1_grp",
-},
-{
-	.dev_name = "foo-mmc.0",
-	.name = "4bit"
-	.type = PIN_MAP_TYPE_MUX_GROUP,
-	.ctrl_dev_name = "pinctrl-foo",
-	.function = "mmc0",
-	.group = "mmc0_1_grp",
-},
-{
-	.dev_name = "foo-mmc.0",
-	.name = "4bit"
-	.type = PIN_MAP_TYPE_MUX_GROUP,
-	.ctrl_dev_name = "pinctrl-foo",
-	.function = "mmc0",
-	.group = "mmc0_2_grp",
-},
-{
-	.dev_name = "foo-mmc.0",
-	.name = "8bit"
-	.type = PIN_MAP_TYPE_MUX_GROUP,
-	.ctrl_dev_name = "pinctrl-foo",
-	.function = "mmc0",
-	.group = "mmc0_1_grp",
-},
-{
-	.dev_name = "foo-mmc.0",
-	.name = "8bit"
-	.type = PIN_MAP_TYPE_MUX_GROUP,
-	.ctrl_dev_name = "pinctrl-foo",
-	.function = "mmc0",
-	.group = "mmc0_2_grp",
-},
-{
-	.dev_name = "foo-mmc.0",
-	.name = "8bit"
-	.type = PIN_MAP_TYPE_MUX_GROUP,
-	.ctrl_dev_name = "pinctrl-foo",
-	.function = "mmc0",
-	.group = "mmc0_3_grp",
-},
-...
+	...
+	{
+		.dev_name = "foo-mmc.0",
+		.name = "2bit"
+		.type = PIN_MAP_TYPE_MUX_GROUP,
+		.ctrl_dev_name = "pinctrl-foo",
+		.function = "mmc0",
+		.group = "mmc0_1_grp",
+	},
+	{
+		.dev_name = "foo-mmc.0",
+		.name = "4bit"
+		.type = PIN_MAP_TYPE_MUX_GROUP,
+		.ctrl_dev_name = "pinctrl-foo",
+		.function = "mmc0",
+		.group = "mmc0_1_grp",
+	},
+	{
+		.dev_name = "foo-mmc.0",
+		.name = "4bit"
+		.type = PIN_MAP_TYPE_MUX_GROUP,
+		.ctrl_dev_name = "pinctrl-foo",
+		.function = "mmc0",
+		.group = "mmc0_2_grp",
+	},
+	{
+		.dev_name = "foo-mmc.0",
+		.name = "8bit"
+		.type = PIN_MAP_TYPE_MUX_GROUP,
+		.ctrl_dev_name = "pinctrl-foo",
+		.function = "mmc0",
+		.group = "mmc0_1_grp",
+	},
+	{
+		.dev_name = "foo-mmc.0",
+		.name = "8bit"
+		.type = PIN_MAP_TYPE_MUX_GROUP,
+		.ctrl_dev_name = "pinctrl-foo",
+		.function = "mmc0",
+		.group = "mmc0_2_grp",
+	},
+	{
+		.dev_name = "foo-mmc.0",
+		.name = "8bit"
+		.type = PIN_MAP_TYPE_MUX_GROUP,
+		.ctrl_dev_name = "pinctrl-foo",
+		.function = "mmc0",
+		.group = "mmc0_3_grp",
+	},
+	...
 
 The result of grabbing this mapping from the device with something like
-this (see next paragraph):
+this (see next paragraph)::
 
 	p = devm_pinctrl_get(dev);
 	s = pinctrl_lookup_state(p, "8bit");
 	ret = pinctrl_select_state(p, s);
 
-or more simply:
+or more simply::
 
 	p = devm_pinctrl_get_select(dev, "8bit");
 
@@ -1205,39 +1220,39 @@ PINCTRL_STATE_SLEEP at runtime, re-biasing or even re-muxing pins to save
 current in sleep mode.
 
 A driver may request a certain control state to be activated, usually just the
-default state like this:
+default state like this::
 
-#include <linux/pinctrl/consumer.h>
+	#include <linux/pinctrl/consumer.h>
 
-struct foo_state {
-       struct pinctrl *p;
-       struct pinctrl_state *s;
-       ...
-};
+	struct foo_state {
+	struct pinctrl *p;
+	struct pinctrl_state *s;
+	...
+	};
 
-foo_probe()
-{
-	/* Allocate a state holder named "foo" etc */
-	struct foo_state *foo = ...;
+	foo_probe()
+	{
+		/* Allocate a state holder named "foo" etc */
+		struct foo_state *foo = ...;
 
-	foo->p = devm_pinctrl_get(&device);
-	if (IS_ERR(foo->p)) {
-		/* FIXME: clean up "foo" here */
-		return PTR_ERR(foo->p);
-	}
+		foo->p = devm_pinctrl_get(&device);
+		if (IS_ERR(foo->p)) {
+			/* FIXME: clean up "foo" here */
+			return PTR_ERR(foo->p);
+		}
 
-	foo->s = pinctrl_lookup_state(foo->p, PINCTRL_STATE_DEFAULT);
-	if (IS_ERR(foo->s)) {
-		/* FIXME: clean up "foo" here */
-		return PTR_ERR(s);
-	}
+		foo->s = pinctrl_lookup_state(foo->p, PINCTRL_STATE_DEFAULT);
+		if (IS_ERR(foo->s)) {
+			/* FIXME: clean up "foo" here */
+			return PTR_ERR(s);
+		}
 
-	ret = pinctrl_select_state(foo->s);
-	if (ret < 0) {
-		/* FIXME: clean up "foo" here */
-		return ret;
+		ret = pinctrl_select_state(foo->s);
+		if (ret < 0) {
+			/* FIXME: clean up "foo" here */
+			return ret;
+		}
 	}
-}
 
 This get/lookup/select/put sequence can just as well be handled by bus drivers
 if you don't want each and every driver to handle it and you know the
@@ -1299,16 +1314,16 @@ Drivers needing both pin control and GPIOs
 Again, it is discouraged to let drivers lookup and select pin control states
 themselves, but again sometimes this is unavoidable.
 
-So say that your driver is fetching its resources like this:
+So say that your driver is fetching its resources like this::
 
-#include <linux/pinctrl/consumer.h>
-#include <linux/gpio.h>
+	#include <linux/pinctrl/consumer.h>
+	#include <linux/gpio.h>
 
-struct pinctrl *pinctrl;
-int gpio;
+	struct pinctrl *pinctrl;
+	int gpio;
 
-pinctrl = devm_pinctrl_get_select_default(&dev);
-gpio = devm_gpio_request(&dev, 14, "foo");
+	pinctrl = devm_pinctrl_get_select_default(&dev);
+	gpio = devm_gpio_request(&dev, 14, "foo");
 
 Here we first request a certain pin state and then request GPIO 14 to be
 used. If you're using the subsystems orthogonally like this, you should
@@ -1347,21 +1362,22 @@ lookup_state() and select_state() on it immediately after the pin control
 device has been registered.
 
 This occurs for mapping table entries where the client device name is equal
-to the pin controller device name, and the state name is PINCTRL_STATE_DEFAULT.
+to the pin controller device name, and the state name is PINCTRL_STATE_DEFAULT::
 
-{
-	.dev_name = "pinctrl-foo",
-	.name = PINCTRL_STATE_DEFAULT,
-	.type = PIN_MAP_TYPE_MUX_GROUP,
-	.ctrl_dev_name = "pinctrl-foo",
-	.function = "power_func",
-},
+	{
+		.dev_name = "pinctrl-foo",
+		.name = PINCTRL_STATE_DEFAULT,
+		.type = PIN_MAP_TYPE_MUX_GROUP,
+		.ctrl_dev_name = "pinctrl-foo",
+		.function = "power_func",
+	},
 
 Since it may be common to request the core to hog a few always-applicable
 mux settings on the primary pin controller, there is a convenience macro for
-this:
+this::
 
-PIN_MAP_MUX_GROUP_HOG_DEFAULT("pinctrl-foo", NULL /* group */, "power_func")
+	PIN_MAP_MUX_GROUP_HOG_DEFAULT("pinctrl-foo", NULL /* group */,
+				      "power_func")
 
 This gives the exact same result as the above construction.
 
@@ -1378,45 +1394,45 @@ function, but with different named in the mapping as described under
 
 This snippet first initializes a state object for both groups (in foo_probe()),
 then muxes the function in the pins defined by group A, and finally muxes it in
-on the pins defined by group B:
-
-#include <linux/pinctrl/consumer.h>
-
-struct pinctrl *p;
-struct pinctrl_state *s1, *s2;
-
-foo_probe()
-{
-	/* Setup */
-	p = devm_pinctrl_get(&device);
-	if (IS_ERR(p))
+on the pins defined by group B::
+
+	#include <linux/pinctrl/consumer.h>
+
+	struct pinctrl *p;
+	struct pinctrl_state *s1, *s2;
+
+	foo_probe()
+	{
+		/* Setup */
+		p = devm_pinctrl_get(&device);
+		if (IS_ERR(p))
+			...
+
+		s1 = pinctrl_lookup_state(foo->p, "pos-A");
+		if (IS_ERR(s1))
+			...
+
+		s2 = pinctrl_lookup_state(foo->p, "pos-B");
+		if (IS_ERR(s2))
+			...
+	}
+
+	foo_switch()
+	{
+		/* Enable on position A */
+		ret = pinctrl_select_state(s1);
+		if (ret < 0)
 		...
 
-	s1 = pinctrl_lookup_state(foo->p, "pos-A");
-	if (IS_ERR(s1))
 		...
 
-	s2 = pinctrl_lookup_state(foo->p, "pos-B");
-	if (IS_ERR(s2))
+		/* Enable on position B */
+		ret = pinctrl_select_state(s2);
+		if (ret < 0)
 		...
-}
-
-foo_switch()
-{
-	/* Enable on position A */
-	ret = pinctrl_select_state(s1);
-	if (ret < 0)
-	    ...
 
-	...
-
-	/* Enable on position B */
-	ret = pinctrl_select_state(s2);
-	if (ret < 0)
-	    ...
-
-	...
-}
+		...
+	}
 
 The above has to be done from process context. The reservation of the pins
 will be done when the state is activated, so in effect one specific pin
-- 
2.9.4


