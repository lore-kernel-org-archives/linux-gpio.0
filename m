From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Subject: Re: Right amount of info in the DT
Date: Wed, 14 Jun 2017 15:51:29 +0200
Message-ID: <bef42259-fb97-c916-2433-a5c1155fcd25@sigmadesigns.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
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
 <d6ac5fea-5324-7321-744f-6b248ac7320c@sigmadesigns.com>
 <CACRpkda-ZMMR5WbgVF-BXx1HiYY8VrkLN1QC64fvY4xS4zNUJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from us-smtp-delivery-107.mimecast.com ([216.205.24.107]:56995 "EHLO
        us-smtp-delivery-107.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750728AbdFNNvg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Jun 2017 09:51:36 -0400
In-Reply-To: <CACRpkda-ZMMR5WbgVF-BXx1HiYY8VrkLN1QC64fvY4xS4zNUJA@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>


On 06/09/2017 10:14 AM, Linus Walleij wrote:
> Please do not use sysfs for userspace tests, familiarize yourself with
> tools/gpio in the kernel and use these for testing using the ioctl()s.
OK I will. What is the reasoning behind using ioctl()s instead of sysfs?

>> But that's not the case for the ethernet device, whose pins are already in
>> use, although not requested explicitly by its driver
>> (drivers/net/ethernet/aurora/nb8800.c). Which means user-space can also
>> request/set them within the sysfs, and that is wrong.
> 
> It is common that a device allows simultaneous use of a pin for
> GPIO and a certain device. (E.g. so that GPIO can "spy" on the pin
> or similar.)
In my case, this is not allowed, writing the registers won't do anything.

> If on a certain system, this is not allowed, one shall set
> .strict = true on the struct pinmux_ops, see
> include/linux/pinctrl/pinmux.h
Yes I was already using this property, but it didn't give me the exclusivity.
I think that this was because I never made the call to pinctrl_request_gpio().
Looking at "drivers/pinctrl/meson/pinctrl-meson.c", I tried to add a call to
that function in the gpiochip.request() op.

And then something strange happened: I'm only able to export to user-space the
GPIOs from the `gpio_sys' group, but not from the `gpio_smcard' group (see DT
below).

Here's how I'm seeing that (yes I know I should switch to tools/gpio!):


# ls /sys/class/gpio
export      gpiochip0   gpiochip71  unexport
# echo 0 > /sys/class/gpio/export
[  543.733511] pinctrl-tango pinctrl: request pin 0 (PIN0) for sys:0
[  543.739696] device: 'gpio0': device_add
# echo 71 > /sys/class/gpio/export
[  626.460176] pinctrl-tango pinctrl: pin 71 is not registered so it cannot be requested
[  626.468092] pinctrl-tango pinctrl: pin-71 (smcard:71) status -22
[  626.474148] gpio-71 (?): gpiod_request: status -22
[  626.479121] export_store: status -22
bash: echo: write error: Invalid argument


Eventually, I managed to find the root cause of this issue:
For every "group" in the pinctrl node of my DT, there is a different pinctrl_dev,
because I make for every one of them a call to `devm_pinctrl_register'.
When the gpiolib parses the gpio-controller nodes of the DT and creates the GPIO
ranges with gpiochip_add_pin_range(), it tries to retrieve a pinctrl_dev with
of_pinctrl_get(), and attaches the GPIO range to it.
But the thing is, of_pinctrl_get() just returns the first pinctrl_dev that
corresponds to the pinctrl node, and in my case, that's always the "sys" one.

So instead of having:
- pinctrl:
	- pinctrl_dev: sys
		- gpio_range: sys
	- pinctrl_dev: smcard
		- gpio_range: smcard

I have:
- pinctrl:
	- pinctrl_dev: sys
		- gpio_range: sys
		- gpio_range: smcard
	- pinctrl_dev: smcard

However, pinctrl_request_gpio() which, as I said, is now called by my code, calls
pinctrl_get_device_gpio_range() and therefore does check the GPIO range of the
pinctrl_dev before returning it.
When exporting GPIO-0, the "sys" GPIO range does exist in the "sys" pinctrl_dev,
so that works. But when exporting GPIO-71, the "smcard" GPIO range does not for
the "smcard" pinctrl_dev, hence the error.

I think of_pinctrl_get() should check the pin range as well, do you concur?

Best regards,
Yves.


>From 62cfce78da5bc3d4a8d8870bad8396747f7b5806 Mon Sep 17 00:00:00 2001
From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Date: Tue, 25 Apr 2017 14:06:46 +0200
Subject: [PATCH] drivers: pinctrl: Add a pinctrl for mach-tango 

Change-Id: Id5b5872b2a7d116829ddc75577f26115eb6e1c98
Signed-off-by: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
---
 arch/arm/boot/dts/tango4-common.dtsi |  31 ++
 arch/arm/configs/tango4_defconfig    |   2 +
 arch/arm/mach-tango/Kconfig          |   1 +
 drivers/pinctrl/Kconfig              |   7 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-tango.c      | 559 +++++++++++++++++++++++++++++++++++
 6 files changed, 601 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-tango.c

diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tango4-common.dtsi
index a3e81ab..7cf698a 100644
--- a/arch/arm/boot/dts/tango4-common.dtsi
+++ b/arch/arm/boot/dts/tango4-common.dtsi
@@ -18,6 +18,37 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	pinctrl: pinctrl {
+		compatible = "sigma,smp8758-pinctrl";
+		groups = <&gpio_sys>, <&gpio_smcard>;
+	};
+
+	gpio_sys: gpio@10500 {
+		reg = <0x10500 0x8>;
+		tango,mux = "none";
+		tango,label = "sys";
+		gpio-controller;
+		#gpio-cells = <1>;
+		gpio-ranges = <&pinctrl 0 0 16>;
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
+			tango,label = "smcard";
+			gpio-controller;
+			#gpio-cells = <1>;
+			gpio-ranges = <&pinctrl 0 71 8>;
+		};
+	};
+
 	periph_clk: periph_clk {
 		compatible = "fixed-factor-clock";
 		clocks = <&clkgen CPU_CLK>;
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
index 0000000..3170d8f
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-tango.c
@@ -0,0 +1,559 @@
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
+	struct device_node *np;
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
+static int gpio_request(struct gpio_chip *gc, unsigned offset)
+{
+	return pinctrl_request_gpio(gc->base + offset);
+}
+
+static void gpio_free(struct gpio_chip *gc, unsigned offset)
+{
+	pinctrl_free_gpio(gc->base + offset);
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
+	u32 reg[2];
+	const char *label;
+	const char *tango_mux;
+	struct of_phandle_args ranges;
+
+	ret = of_property_read_string(np, "tango,mux", &tango_mux);
+	if (ret)
+		return ret;
+	ret = of_property_read_string(np, "tango,label", &label);
+	if (ret)
+		return ret;
+	ret = of_property_read_u32_array(np, "reg", reg, 2);
+	if (ret)
+		return ret;
+	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges",
+			3, 0, &ranges);
+	if (ret)
+		return ret;
+
+	ret = get_mux_type_from_str(tango_mux, &group->mux_type);
+	if (ret)
+		return ret;
+	group->label = label;
+	group->pa = reg[0];
+	group->sz = reg[1];
+	group->base = ranges.args[1];
+	group->ngpio = ranges.args[2];
+
+	group->np = np;
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
+	gchip->request = gpio_request;
+	gchip->free = gpio_free;
+	gchip->get_direction = gpio_get_direction;
+	gchip->direction_input = gpio_direction_input;
+	gchip->direction_output = gpio_direction_output;
+	gchip->get = gpio_get;
+	gchip->set = gpio_set;
+	gchip->set_multiple = gpio_set_multiple;
+	gchip->base = group->base;
+	gchip->ngpio = group->ngpio;
+	gchip->of_node = group->np;
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
+static struct pingroup *create_group(struct device *dev, struct device_node *np)
+{
+	int ret;
+	struct pingroup *group;
+
+	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return ERR_PTR(-ENOMEM);
+
+	/* Extract info from the device node. */
+	ret = get_node_info(np, group);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* Ioremap the group registers. */
+	group->va = devm_ioremap_nocache(dev, group->pa, group->sz);
+	if (!group->va)
+		return ERR_PTR(-ENOMEM);
+
+	/* Register the group pins. */
+	ret = register_group_pins(dev, group);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* Register the group GPIOs. */
+	ret = register_group_gpios(dev, group);
+	if (ret)
+		return ERR_PTR(ret);
+
+	dev_dbg(dev, "%-8s base=%-2d ngpio=%-2d OK\n",
+			group->label, group->base, group->ngpio);
+	return group;
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
+		struct pingroup *group;
+		struct of_phandle_args args;
+
+		ret = of_parse_phandle_with_args(np, "groups", NULL, i, &args);
+		if (ret)
+			return ret;
+
+		group = create_group(&pdev->dev, args.np);
+		if (IS_ERR(group))
+			return PTR_ERR(group);
+		else
+			list_add_tail(&group->list, &pdata->group_list);
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
+arch_initcall(tango_pinctrl_init);
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

