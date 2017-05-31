From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Subject: Re: Right amount of info in the DT
Date: Wed, 31 May 2017 18:36:46 +0200
Message-ID: <d6ac5fea-5324-7321-744f-6b248ac7320c@sigmadesigns.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com>
 <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com>
 <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
 <0409ece2-dce3-d77f-f8e5-50fe96aaea1a@sigmadesigns.com>
 <CACRpkdbB9kUaRbm-=1c_kzZ9p2ghh==HNb-8vkGkF3Zrx0rr_Q@mail.gmail.com>
 <42ae4b79-9917-3f9d-8962-d09fbe8c9b1c@sigmadesigns.com>
 <CACRpkdZg--owpSdpyGUzHKNDS+Wk9juvobGiCNt4vsMEytNPaQ@mail.gmail.com>
 <526a19bc-932a-3f84-eaf7-03c0b67bae2f@sigmadesigns.com>
 <CACRpkdY8Lfum4ahKrmvbtNDn9JZeZ1xi0eAsXdF9-8h4+VKaRA@mail.gmail.com>
 <64acfa45-b9ac-450a-96e5-a28c96790ff3@sigmadesigns.com>
 <CACRpkdaKHf+OZJCv-nCuihakv9Vcg=rN-NwGwk4N+FeEWDm9mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from us-smtp-delivery-212.mimecast.com ([216.205.24.212]:42326 "EHLO
        us-smtp-delivery-212.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750912AbdEaQgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 May 2017 12:36:55 -0400
In-Reply-To: <CACRpkdaKHf+OZJCv-nCuihakv9Vcg=rN-NwGwk4N+FeEWDm9mg@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>

On 05/31/2017 02:24 AM, Linus Walleij wrote:
>> BTW, I'm sure there is a far better way than this `all_pins' array, let me know
>> if you have feedback on that.
> 
> So that is this:
> 
>> +static const unsigned int all_pins[] = {
>> +       0,  1,  2,  3,  4,  5,  6,  7,  8,  9,
>> +       10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
>> +       20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
>> +       30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
>> +       40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
>> +       50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
>> +       60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
>> +       70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
>> +       80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
>> +       90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
>> +};
> 
> That looks a bit like what we usually put in pin descriptors.

This array is here because of my implementation of get_group_pins() in
`struct pinctrl_ops'. It seems the function is expecting such an array.
I mean I probably could have done something like:

static const unsigned int smcard_pins[] = { 35, 36, 37, ... };

and returned `smcard_pins' instead of `&all_pins[35]'
But the thing is, this `35' is not a constant number because it depends
on the number of pins that got registered before the smartcard's own.
I know it should reflect the number of the pin on my board's spec, and it
will once all pin groups are put in the device tree in the right order.

That being said, we might want to add a `base' property to the GPIO nodes
which are parsed by the pinctrl driver to make sure this `35' never moves.

> This:
> 
>> +       struct pinctrl_gpio_range *prange;
>> +
> (...)
>> +       prange->name = group->label;
>> +       prange->id = group->base;
>> +       prange->base = group->base;
>> +       prange->pin_base = group->base;
>> +       prange->npins = group->ngpio;
>> +       prange->gc = gchip;
>> +       pinctrl_add_gpio_range(pindev, prange);
> 
> Can't you just add that to the device tree using the gpio-ranges
> property? It is handled in the core and should "just work".
> 
> The documentation for that is a bit terse in
> Documentation/devicetree/bindings/gpio/gpio.txt
> but if you just grep for gpio-ranges you will get the hang of it.
> 
> It is handled from the gpiochip side which is advisible, even if
> you hardcode it in the driver.

OK got it. I missed the deprecation warning in the doc, my bad.
I've updated the patch to reflect this change, and got rid of the
`label' property in the GPIO nodes to use `gpio-ranges-group-names' instead.


I tried to carry on and add the other IPs' pins, and I've got a question
regarding pin requesting.
See, adding the smartcard's pins was easy because we don't have a driver for
it yet, so the pins are just straightforward GPIOs, which the user-space can
request using /sys/class/gpio/export.
But that's not the case for the ethernet device, whose pins are already in
use, although not requested explicitly by its driver
(drivers/net/ethernet/aurora/nb8800.c). Which means user-space can also
request/set them within the sysfs, and that is wrong. So I wondered:

- Is there a mechanism in the device tree to automatically request some pins
for a driver once it gets loaded? I have looked at the `stateN_nodeM' thing
in the documentation, but that doesn't seem to do the job without changes in
the ethernet driver's code.

- Should the pins be declared at all if we know they are not going to be used
for anything else than, for instance, ethernet? What about some removable
device then, for instance UART as Thibaud pointed out previously?


Thanks and regards,
Yves.



>From 0c0d9bd5e55203b4a450e44097e1e50fa1d525aa Mon Sep 17 00:00:00 2001
From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Date: Tue, 25 Apr 2017 14:06:46 +0200
Subject: [PATCH] drivers: pinctrl: Add a pinctrl for mach-tango

Change-Id: Id5b5872b2a7d116829ddc75577f26115eb6e1c98
Signed-off-by: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
---
 arch/arm/boot/dts/tango4-common.dtsi |  46 +++
 arch/arm/configs/tango4_defconfig    |   2 +
 arch/arm/mach-tango/Kconfig          |   1 +
 drivers/pinctrl/Kconfig              |   7 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-tango.c      | 552 +++++++++++++++++++++++++++++++++++
 6 files changed, 609 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-tango.c

diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tango4-common.dtsi
index a3e81ab..4eee27d 100644
--- a/arch/arm/boot/dts/tango4-common.dtsi
+++ b/arch/arm/boot/dts/tango4-common.dtsi
@@ -18,6 +18,42 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	pinctrl: pinctrl {
+		compatible = "sigma,smp8758-pinctrl";
+		groups = <&gpio_sys>, <&gpio_eth0>, <&gpio_smcard>;
+
+		pin_state_eth0: state_eth0 {
+			function = "eth0";
+			groups = "eth0";
+		};
+	};
+
+	gpio_sys: gpio@10500 {
+		reg = <0x10500 0x8>;
+		ngpios = <16>;
+		tango,mux = "none";
+		gpio-controller;
+		#gpio-cells = <1>;
+		gpio-ranges = <&pinctrl 0 0 0>;
+		gpio-ranges-group-names = "sys";
+	};
+
+	smcard: smcard@6c300 {
+		/* Driver in the works. */
+		reg = <0x6c300 0x6c>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gpio_smcard: gpio@6c358 {
+			reg = <0x6c358 0xc>;
+			ngpios = <8>;
+			tango,mux = "pin";
+			gpio-controller;
+			#gpio-cells = <1>;
+			gpio-ranges-group-names = "smcard";
+		};
+	};
+
 	periph_clk: periph_clk {
 		compatible = "fixed-factor-clock";
 		clocks = <&clkgen CPU_CLK>;
@@ -151,6 +187,16 @@
 			reg = <0x26000 0x800>;
 			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkgen SYS_CLK>;
+			pinctrl-0 = <&pin_state_eth0>;
+
+			gpio_eth0: gpio@26404 {
+				reg = <0x26404 0x10>;
+				ngpios = <19>;
+				tango,mux = "group";
+				gpio-controller;
+				#gpio-cells = <1>;
+				gpio-ranges-group-names = "eth0";
+			};
 		};
 
 		dma: dma@290a0 {
diff --git a/arch/arm/configs/tango4_defconfig b/arch/arm/configs/tango4_defconfig
index b26bb4e..b58b01b 100644
--- a/arch/arm/configs/tango4_defconfig
+++ b/arch/arm/configs/tango4_defconfig
@@ -68,7 +68,9 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_XLR=y
+CONFIG_PINCTRL_TANGO=y
 CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
 CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_TANGO_THERMAL=y
diff --git a/arch/arm/mach-tango/Kconfig b/arch/arm/mach-tango/Kconfig
index ebe15b9..479c9aa 100644
--- a/arch/arm/mach-tango/Kconfig
+++ b/arch/arm/mach-tango/Kconfig
@@ -11,3 +11,4 @@ config ARCH_TANGO
 	select HAVE_ARM_SCU
 	select HAVE_ARM_TWD
 	select TANGO_IRQ
+	select PINCTRL
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 0e75d94..5648e76 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -179,6 +179,13 @@ config PINCTRL_ST
 	select PINCONF
 	select GPIOLIB_IRQCHIP
 
+config PINCTRL_TANGO
+	tristate "Tango pin control driver"
+	depends on OF
+	select PINMUX
+	help
+	  Say yes to activate the pinctrl/gpio driver for Tango chips.
+
 config PINCTRL_TZ1090
 	bool "Toumaz Xenif TZ1090 pin control driver"
 	depends on SOC_TZ1090
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 11bad37..d5563e49 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_SIRF)	+= sirf/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
+obj-$(CONFIG_PINCTRL_TANGO)	+= pinctrl-tango.o
 obj-$(CONFIG_PINCTRL_TZ1090)	+= pinctrl-tz1090.o
 obj-$(CONFIG_PINCTRL_TZ1090_PDC)	+= pinctrl-tz1090-pdc.o
 obj-$(CONFIG_PINCTRL_U300)	+= pinctrl-u300.o
diff --git a/drivers/pinctrl/pinctrl-tango.c b/drivers/pinctrl/pinctrl-tango.c
new file mode 100644
index 0000000..0a50238
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-tango.c
@@ -0,0 +1,552 @@
+/*
+ * Copyright (C) 2017 Sigma Designs
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ */
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+
+/* Pin regs are laid out this way:
+ * ______________________________
+ * | bitwise mask | bitwise val |
+ * 32             16            0
+ *
+ * To set bit n, one must write (1 << (16+n) | n) to the reg.
+ * Consequently, one reg can't handle more than 16 pins, so n < 16.
+ *
+ * There are 3 kind of registers that follow this layout: value registers,
+ * direction registers, and gpio-mode registers.
+ * The latter kind allows muxing between the primary function (eg UART), which
+ * is the pin's direction and value entirely controlled by hardware, and the
+ * "GPIO mode", which is the pin's direction and value entirely controlled by
+ * software. This gpio-mode register only exists for some GPIO groups.
+ *
+ * Additionally, for some pin groups, there is no gpio-mode register that muxes
+ * with the granularity of a pin, but rather with the granularity of the whole
+ * group. In that case, such mux register does *not* follow the layout above.
+ *
+ * Finally, it is possible for some groups to have neither type of muxing. In
+ * that case, the pins are dedicated GPIOs.
+ *
+ * Registers are organized this way for each group:
+ * group_mux? (direction value pin_mux?)+
+ */
+
+enum mux_type {
+	MUX_NONE,
+	MUX_PIN,
+	MUX_GROUP,
+};
+
+/* Which magic values to write in the mux group registers. */
+#define MUX_GROUP_GPIO 0x6
+#define MUX_GROUP_ALTF 0x1
+
+/* Conversion table for char* <-> enum mux_type */
+static const struct {
+	const char *str;
+	enum mux_type type;
+} mux_types[] = {
+	{ .str = "none",  .type = MUX_NONE,  },
+	{ .str = "pin",   .type = MUX_PIN,   },
+	{ .str = "group", .type = MUX_GROUP, },
+};
+
+/* Pinctrl device data */
+struct pingroup {
+	struct list_head list;
+	const char *label;
+	unsigned base;
+	unsigned ngpio;
+	size_t sz;
+	phys_addr_t pa;
+	void __iomem *va;
+	enum mux_type mux_type;
+};
+
+/* Platform device data */
+struct pinctrl_data {
+	struct list_head group_list;
+};
+
+#define __reg_offset_from_pin(pg, pin) ( \
+		((pg)->mux_type == MUX_GROUP ? sizeof(u32) : 0) + \
+		((pg)->mux_type == MUX_PIN ? 3 : 2) * sizeof(u32) * ((pin)/16) \
+		)
+#define group_mux_reg_va(pg)    ((pg)->va)
+#define dir_reg_va(pg, pin)     (group_mux_reg_va(pg) + __reg_offset_from_pin(pg, pin))
+#define val_reg_va(pg, pin)     (dir_reg_va(pg, pin)  + sizeof(u32))
+#define pin_mux_reg_va(pg, pin) (val_reg_va(pg, pin)  + sizeof(u32))
+
+static int pinreg_get_bit(void __iomem *addr, unsigned offset)
+{
+	unsigned long val = readl(addr);
+
+	/* TODO remove me later */
+#if IS_ENABLED(CONFIG_DEBUG)
+	BUG_ON(val & GENMASK(31, 16));
+#endif
+
+	return test_bit(offset, &val);
+}
+
+static void pinreg_set_bit(void __iomem *addr, unsigned offset, int value)
+{
+	unsigned long val = 0;
+
+	/* Enable change by writing upper half-word too. */
+	set_bit(offset + 16, &val);
+	if (value)
+		set_bit(offset, &val);
+
+	writel(val, addr);
+
+	/* TODO remove me later */
+#if IS_ENABLED(CONFIG_DEBUG)
+	BUG_ON(pinreg_get_bit(addr, offset) != value);
+#endif
+}
+
+static void pinreg_set_multiple(void __iomem *addr, u16 mask, u16 bits)
+{
+	unsigned long val = (mask << 16) | bits;
+
+	writel(val, addr);
+}
+
+static int gpio_get(struct gpio_chip *gc, unsigned offset)
+{
+	struct pingroup *group = gpiochip_get_data(gc);
+
+	if (!group || offset >= group->ngpio)
+		return -EINVAL;
+
+	return pinreg_get_bit(val_reg_va(group, offset), offset % 16);
+}
+
+static void gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct pingroup *group = gpiochip_get_data(gc);
+
+	if (!group || offset >= group->ngpio)
+		return;
+
+	pinreg_set_bit(val_reg_va(group, offset), offset % 16, value);
+}
+
+static int gpio_get_direction(struct gpio_chip *gc, unsigned offset)
+{
+	struct pingroup *group = gpiochip_get_data(gc);
+
+	if (!group || offset >= group->ngpio)
+		return -EINVAL;
+
+	/* Bit set means output. */
+	return !pinreg_get_bit(dir_reg_va(group, offset), offset % 16);
+}
+
+static int gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	struct pingroup *group = gpiochip_get_data(gc);
+
+	if (!group || offset >= group->ngpio)
+		return -EINVAL;
+
+	/* Bit set means output. */
+	pinreg_set_bit(dir_reg_va(group, offset), offset % 16, 0);
+
+	return 0;
+}
+
+static int gpio_direction_output(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct pingroup *group = gpiochip_get_data(gc);
+
+	if (!group || offset >= group->ngpio)
+		return -EINVAL;
+
+	/* The output value can be changed before the direction is. */
+	pinreg_set_bit(val_reg_va(group, offset), offset % 16, value);
+
+	/* Bit set means output. */
+	pinreg_set_bit(dir_reg_va(group, offset), offset % 16, 1);
+
+	return 0;
+}
+
+static void gpio_set_multiple(struct gpio_chip *gc,
+		unsigned long *mask, unsigned long *bits)
+{
+	unsigned i, j;
+	unsigned num_of_ulongs;
+	struct pingroup *group = gpiochip_get_data(gc);
+
+	if (!group)
+		return;
+
+	num_of_ulongs = (group->ngpio / 32) + 1;
+	for (i = 0; i < num_of_ulongs; i++)
+		for (j = 0; j < 1; j++) {
+			u16 _mask = (u16)(*(mask + i) >> (16 * j));
+			u16 _bits = (u16)(*(bits + i) >> (16 * j));
+			pinreg_set_multiple(val_reg_va(group, 2*i + j), _mask, _bits);
+		}
+}
+
+static const unsigned int all_pins[] = {
+	0,  1,  2,  3,  4,  5,  6,  7,  8,  9,
+	10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
+	20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
+	30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
+	40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
+	50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
+	60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
+	70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
+	80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
+	90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
+};
+
+static int get_group_count(struct pinctrl_dev *pctldev)
+{
+	struct pingroup *group = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!group)
+		return -EINVAL;
+
+	return group->mux_type == MUX_NONE ? 0 : 1;
+}
+
+static const char *get_group_name(struct pinctrl_dev *pctldev, unsigned selector)
+{
+	struct pingroup *group = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!group)
+		return ERR_PTR(-EINVAL);
+
+	return group->label;
+}
+
+static int get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
+		const unsigned **pins, unsigned *num_pins)
+{
+	struct pingroup *group = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!group)
+		return -EINVAL;
+
+	*pins = all_pins + group->base;
+	*num_pins = group->ngpio;
+
+	return 0;
+}
+
+static const struct pinctrl_ops pctlops = {
+	.get_groups_count = get_group_count,
+	.get_group_name = get_group_name,
+	.get_group_pins = get_group_pins,
+};
+
+int get_function_groups(struct pinctrl_dev *pctldev, unsigned selector,
+		const char * const **groups, unsigned *num_groups)
+{
+	struct pingroup *group = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!group)
+		return -EINVAL;
+
+	if (group->mux_type == MUX_NONE) {
+		*groups = NULL;
+		*num_groups = 0;
+	} else {
+		*groups = &group->label;
+		*num_groups = 1;
+	}
+
+	return 0;
+}
+
+int set_mux(struct pinctrl_dev *pctldev, unsigned func_selector,
+		unsigned group_selector)
+{
+	/* With only one possible alt function, muxing is only
+	 * necessary for GPIO request/free.
+	 */
+	return 0;
+}
+
+int gpio_request_enable(struct pinctrl_dev *pctldev,
+		struct pinctrl_gpio_range *range, unsigned offset)
+{
+	struct pingroup *group = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!group || offset >= group->ngpio)
+		return -EINVAL;
+
+	switch (group->mux_type) {
+	case MUX_NONE:
+		break;
+	case MUX_PIN:
+		pinreg_set_bit(pin_mux_reg_va(group, offset), offset % 16, 1);
+		break;
+	case MUX_GROUP:
+		writel(MUX_GROUP_GPIO, group_mux_reg_va(group));
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+void gpio_disable_free(struct pinctrl_dev *pctldev,
+		struct pinctrl_gpio_range *range, unsigned offset)
+{
+	struct pingroup *group;
+
+	group = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!group || offset >= group->ngpio)
+		return;
+
+	switch (group->mux_type) {
+	case MUX_NONE:
+		break;
+	case MUX_PIN:
+		pinreg_set_bit(pin_mux_reg_va(group, offset), offset % 16, 0);
+		break;
+	case MUX_GROUP:
+		writel(MUX_GROUP_ALTF, group_mux_reg_va(group));
+		break;
+	}
+}
+
+const static struct pinmux_ops pmxops = {
+	.get_functions_count = get_group_count,
+	.get_function_name = get_group_name,
+	.get_function_groups = get_function_groups,
+	.set_mux = set_mux,
+	.gpio_request_enable = gpio_request_enable,
+	.gpio_disable_free = gpio_disable_free,
+	.strict = true,
+};
+
+static int get_mux_type_from_str(const char *str, enum mux_type *type)
+{
+	unsigned i;
+	for (i = 0; i < ARRAY_SIZE(mux_types); i++)
+		if (!strcmp(mux_types[i].str, str)) {
+			*type = mux_types[i].type;
+			return 0;
+		}
+	return -EINVAL;
+}
+
+static int get_node_info(struct device_node *np, struct pingroup *group)
+{
+	/* Extract info from the pinctrl node:
+	 * - the label;
+	 * - the number of pins;
+	 * - the address and size of the registers;
+	 * - the mux type.
+	 */
+	int ret;
+	u32 ngpio;
+	u32 reg[2];
+	const char *label;
+	const char *tango_mux;
+
+	ret = of_property_read_u32(np, "ngpios", &ngpio);
+	if (ret)
+		return ret;
+	ret = of_property_read_u32_array(np, "reg", reg, 2);
+	if (ret)
+		return ret;
+	ret = of_property_read_string(np, "gpio-ranges-group-names", &label);
+	if (ret)
+		return ret;
+	ret = of_property_read_string(np, "tango,mux", &tango_mux);
+	if (ret)
+		return ret;
+
+	ret = get_mux_type_from_str(tango_mux, &group->mux_type);
+	if (ret)
+		return ret;
+	group->label = label;
+	group->ngpio = ngpio;
+	group->pa = reg[0];
+	group->sz = reg[1];
+
+	return 0;
+}
+
+static int register_group_gpios(struct device *dev, struct pingroup *group)
+{
+	struct gpio_chip *gchip;
+
+	gchip = devm_kzalloc(dev, sizeof(*gchip), GFP_KERNEL);
+	if (!gchip)
+		return -ENOMEM;
+
+	gchip->label = group->label;
+	gchip->parent = dev;
+	gchip->owner = THIS_MODULE;
+	gchip->get_direction = gpio_get_direction;
+	gchip->direction_input = gpio_direction_input;
+	gchip->direction_output = gpio_direction_output;
+	gchip->get = gpio_get;
+	gchip->set = gpio_set;
+	gchip->set_multiple = gpio_set_multiple;
+	gchip->base = group->base;
+	gchip->ngpio = group->ngpio;
+
+	return devm_gpiochip_add_data(dev, gchip, group);
+}
+
+static int register_group_pins(struct device *dev, struct pingroup *group)
+{
+	unsigned i;
+	struct pinctrl_desc *pdesc;
+	struct pinctrl_pin_desc *ppdesc;
+	struct pinctrl_dev *pindev;
+
+	pdesc = devm_kzalloc(dev, sizeof(*pdesc), GFP_KERNEL);
+	if (!pdesc)
+		return -ENOMEM;
+	ppdesc = devm_kzalloc(dev, group->ngpio * sizeof(*ppdesc), GFP_KERNEL);
+	if (!ppdesc)
+		return -ENOMEM;
+
+	for (i = 0; i < group->ngpio; i++)
+		ppdesc[i].number = group->base + i;
+
+	pdesc->name = group->label;
+	pdesc->pins = ppdesc;
+	pdesc->npins = group->ngpio;
+	pdesc->pctlops = &pctlops;
+	pdesc->pmxops = &pmxops;
+	pdesc->owner = THIS_MODULE;
+
+	pindev = devm_pinctrl_register(dev, pdesc, group);
+	if (IS_ERR(pindev))
+		return PTR_ERR(pindev);
+
+	return 0;
+}
+
+static int register_group(struct platform_device *pdev, struct device_node *np)
+{
+	int ret;
+	struct pingroup *group;
+	struct pinctrl_data *pdata;
+
+	group = devm_kzalloc(&pdev->dev, sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return -ENOMEM;
+
+	/* Extract info from the device node. */
+	ret = get_node_info(np, group);
+	if (ret)
+		return ret;
+
+	/* Get the base number of this group by looking at the previous one. */
+	pdata = platform_get_drvdata(pdev);
+	if (!pdata)
+		return -EINVAL;
+	if (list_empty(&pdata->group_list)) {
+		group->base = 0;
+	} else {
+		struct pingroup *prev;
+		prev = list_last_entry(&pdata->group_list, typeof(*prev), list);
+		group->base = prev->base + prev->ngpio;
+	}
+
+	/* Ioremap the group registers. */
+	group->va = devm_ioremap_nocache(&pdev->dev, group->pa, group->sz);
+	if (!group->va)
+		return -ENOMEM;
+
+	/* Register the group pins. */
+	ret = register_group_pins(&pdev->dev, group);
+	if (ret)
+		return ret;
+
+	/* Register the group GPIOs. */
+	ret = register_group_gpios(&pdev->dev, group);
+	if (ret)
+		return ret;
+
+	/* Add this new group to the list. */
+	list_add_tail(&group->list, &pdata->group_list);
+
+	dev_dbg(&pdev->dev, "%-8s base=%-2d ngpio=%-2d OK\n",
+			group->label, group->base, group->ngpio);
+	return 0;
+}
+
+static int tango_pinctrl_probe(struct platform_device *pdev)
+{
+	unsigned i = 0;
+	unsigned groups_num;
+	struct pinctrl_data *pdata;
+	struct device_node *np = pdev->dev.of_node;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&pdata->group_list);
+	platform_set_drvdata(pdev, pdata);
+
+	groups_num = of_count_phandle_with_args(np, "groups", NULL);
+	if (!groups_num)
+		return -EINVAL;
+
+	for (i = 0; i < groups_num; i++) {
+		int ret;
+		struct of_phandle_args args;
+		ret = of_parse_phandle_with_args(np, "groups", NULL, i, &args);
+		if (ret)
+			return ret;
+		ret = register_group(pdev, args.np);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id tango_pinctrl_of_match[] = {
+	{ .compatible =  "sigma,smp8758-pinctrl", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tango_pinctrl_of_match);
+
+static struct platform_driver tango_pinctrl_driver = {
+	.driver = {
+		.name = "pinctrl-tango",
+		.of_match_table = of_match_ptr(tango_pinctrl_of_match),
+	},
+	.probe = tango_pinctrl_probe,
+};
+
+static int __init tango_pinctrl_init(void)
+{
+	return platform_driver_register(&tango_pinctrl_driver);
+}
+module_init(tango_pinctrl_init);
+
+static void __exit tango_pinctrl_exit(void)
+{
+	platform_driver_unregister(&tango_pinctrl_driver);
+}
+module_exit(tango_pinctrl_exit);
+
+MODULE_AUTHOR("Sigma Designs");
+MODULE_DESCRIPTION("Tango pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.10.1





















