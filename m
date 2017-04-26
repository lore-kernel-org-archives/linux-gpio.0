From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Subject: Re: Right amount of info in the DT
Date: Wed, 26 Apr 2017 17:47:25 +0200
Message-ID: <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com>
 <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.bemta12.messagelabs.com ([216.82.251.4]:49296 "EHLO
        mail1.bemta12.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751077AbdDZPrn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Apr 2017 11:47:43 -0400
In-Reply-To: <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>



On 04/24/2017 06:45 PM, Linus Walleij wrote:
> Isn't the best approach to add a pin controller as a subnode of the ethernet
> controller in the device tree, so that the probe() of you main driver looks
> for it and instantiates a pin controller that is then referenced by the
> driver itself?

I guess that could do it, but I'm not confident enough in my kernel abilities
to modify such a big driver just yet (drivers/net/ethernet/aurora).
I've decided not to support ethernet pins, at least for the first iteration
of the driver.

I've put together a first draft, would you mind taking a look at it?
I haven't documented the DT binding yet, though.

Regards,
Yves.



From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Date: Tue, 25 Apr 2017 14:06:46 +0200
Subject: [PATCH] drivers: pinctrl: Add a pinctrl for mach-tango

Signed-off-by: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
---
 arch/arm/boot/dts/tango4-common.dtsi |  98 ++++++++
 arch/arm/configs/tango4_defconfig    |   2 +
 arch/arm/mach-tango/Kconfig          |   1 +
 drivers/pinctrl/Kconfig              |   7 +
 drivers/pinctrl/Makefile             |   1 +
 drivers/pinctrl/pinctrl-tango.c      | 421 +++++++++++++++++++++++++++++++++++
 6 files changed, 530 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-tango.c

diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tango4-common.dtsi
index a3e81ab..5e89af9 100644
--- a/arch/arm/boot/dts/tango4-common.dtsi
+++ b/arch/arm/boot/dts/tango4-common.dtsi
@@ -18,6 +18,104 @@
 	#address-cells = <1>;
 	#size-cells = <1>;

+	pins {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		pinctrl@10500 {
+			reg = <0x10500 0x8>;
+			compatible = "sigma,smp8758-pinctrl";
+			label = "sys";
+			tango,pins = <0 16>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpio {
+				gpio-controller;
+				#gpio-cells = <1>;
+			};
+		};
+
+		pinctrl@15b8e0 {
+			compatible = "sigma,smp8758-pinctrl";
+			label = "tdmux";
+			reg = <0x15b8e0 0xc>;
+			tango,pins = <16 2>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpio {
+				gpio-controller;
+				#gpio-cells = <1>;
+			};
+
+			alt_function {
+				function = "tdmux";
+				groups = "tdmux";
+			};
+		};
+
+		pinctrl@6c130 {
+			compatible = "sigma,smp8758-pinctrl";
+			label = "spi";
+			reg = <0x6c130 0xc>;
+			tango,pins = <18 8>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpio {
+				gpio-controller;
+				#gpio-cells = <1>;
+			};
+
+			alt_function {
+				function = "spi";
+				groups = "spi";
+			};
+		};
+
+		pinctrl@6c230 {
+			compatible = "sigma,smp8758-pinctrl";
+			label = "uart1";
+			reg = <0x6c230 0xc>;
+			tango,pins = <26 7>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpio {
+				gpio-controller;
+				#gpio-cells = <1>;
+			};
+
+			alt_function {
+				function = "uart1";
+				groups = "uart1";
+			};
+
+		};
+
+		pinctrl@6c358 {
+			compatible = "sigma,smp8758-pinctrl";
+			label = "smcard";
+			reg = <0x6c368 0xc>;
+			tango,pins = <71 8>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpio {
+				gpio-controller;
+				#gpio-cells = <1>;
+			};
+
+			alt_function {
+				function = "smcard";
+				groups = "smcard";
+			};
+		};
+	};
+
 	periph_clk: periph_clk {
 		compatible = "fixed-factor-clock";
 		clocks = <&clkgen CPU_CLK>;
diff --git a/arch/arm/configs/tango4_defconfig b/arch/arm/configs/tango4_defconfig
index b26bb4e..c973758 100644
--- a/arch/arm/configs/tango4_defconfig
+++ b/arch/arm/configs/tango4_defconfig
@@ -68,7 +68,9 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_XLR=y
+CONFIG_PINCTRL_TANGO=m
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
index 0000000..1112047
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-tango.c
@@ -0,0 +1,421 @@
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
+ * To set bit 1, one must write (1 << (16+1) | 1).
+ *
+ * Because of this layout, there are no more than 16 pins in a reg.
+ */
+
+/*
+ * Offsets from `addr' in `struct tango_pinctrl'.
+ * The `mod' register isn't there for pins dedicated to GPIO.
+ */
+#define GPIO_OFF_DIR 0x0
+#define GPIO_OFF_VAL 0x4
+#define GPIO_OFF_MOD 0x8
+
+struct tango_pinctrl {
+	const char *label;
+	u8 id;
+	u8 len;
+	bool dedicated;
+	void __iomem *addr;
+
+	struct pinctrl_desc pd;
+	struct pinctrl_gpio_range gr;
+};
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
+	struct tango_pinctrl *data = gpiochip_get_data(gc);
+
+	if (!data)
+		return -EINVAL;
+
+	return pinreg_get_bit(data->addr + GPIO_OFF_VAL, offset);
+}
+
+static void gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct tango_pinctrl *data = gpiochip_get_data(gc);
+
+	if (!data)
+		return;
+
+	pinreg_set_bit(data->addr + GPIO_OFF_VAL, offset, value);
+}
+
+static int gpio_get_direction(struct gpio_chip *gc, unsigned offset)
+{
+	struct tango_pinctrl *data = gpiochip_get_data(gc);
+
+	if (!data)
+		return -EINVAL;
+
+	/* Bit set means output. */
+	return !pinreg_get_bit(data->addr + GPIO_OFF_DIR, offset);
+}
+
+static int gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	struct tango_pinctrl *data = gpiochip_get_data(gc);
+
+	if (!data)
+		return -EINVAL;
+
+	/* Bit set means output. */
+	pinreg_set_bit(data->addr + GPIO_OFF_DIR, offset, 0);
+
+	return 0;
+}
+
+static int gpio_direction_output(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct tango_pinctrl *data = gpiochip_get_data(gc);
+
+	if (!data)
+		return -EINVAL;
+
+	/* The output value can be changed before the direction is. */
+	pinreg_set_bit(data->addr + GPIO_OFF_VAL, offset, value);
+
+	/* Bit set means output. */
+	pinreg_set_bit(data->addr + GPIO_OFF_DIR, offset, 1);
+
+	return 0;
+}
+
+static void gpio_set_multiple(struct gpio_chip *gc,
+		unsigned long *mask, unsigned long *bits)
+{
+	u16 _mask = (u16) *mask;
+	u16 _bits = (u16) *bits;
+	struct tango_pinctrl *data = gpiochip_get_data(gc);
+	if (!data)
+		return;
+
+	pinreg_set_multiple(data->addr + GPIO_OFF_VAL, _mask, _bits);
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
+	struct tango_pinctrl *data;
+
+	data = pinctrl_dev_get_drvdata(pctldev);
+	if (!data)
+		return -EINVAL;
+
+	return data->dedicated ? 0 : 1;
+}
+
+static const char *get_group_name(struct pinctrl_dev *pctldev, unsigned selector)
+{
+	struct tango_pinctrl *data;
+
+	data = pinctrl_dev_get_drvdata(pctldev);
+	if (!data)
+		return ERR_PTR(-EINVAL);
+
+	return data->label;
+}
+
+static int get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
+		const unsigned **pins, unsigned *num_pins)
+{
+	struct tango_pinctrl *data;
+
+	data = pinctrl_dev_get_drvdata(pctldev);
+	if (!data)
+		return -EINVAL;
+
+	*pins = all_pins + data->id;
+	*num_pins = data->len;
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
+	struct tango_pinctrl *data;
+
+	data = pinctrl_dev_get_drvdata(pctldev);
+	if (!data)
+		return -EINVAL;
+
+	*groups = &data->label;
+	*num_groups = 1;
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
+	struct tango_pinctrl *data;
+
+	data = pinctrl_dev_get_drvdata(pctldev);
+	if (!data)
+		return -EINVAL;
+
+	if (offset >= data->len)
+		return -EINVAL;
+
+	if (!data->dedicated)
+		pinreg_set_bit(data->addr + GPIO_OFF_MOD, offset, 1);
+
+	return 0;
+}
+
+void gpio_disable_free(struct pinctrl_dev *pctldev,
+		struct pinctrl_gpio_range *range, unsigned offset)
+{
+	struct tango_pinctrl *data;
+
+	data = pinctrl_dev_get_drvdata(pctldev);
+	if (!data)
+		return;
+
+	if (offset >= data->len)
+		return;
+
+	if (!data->dedicated)
+		pinreg_set_bit(data->addr + GPIO_OFF_MOD, offset, 0);
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
+static int get_node_info(struct device_node *np, struct tango_pinctrl *data)
+{
+	/* Extract info from the pinctrl node:
+	 * - the human-friendly name;
+	 * - the base num and the num of pins;
+	 * - whether pins are dedicated to GPIO (no alt state).
+	 */
+	int ret;
+	u32 tango_pins[2];
+
+	ret = of_property_read_string(np, "label", &data->label);
+	if (ret)
+		return ret;
+	ret = of_property_read_u32_array(np, "tango,pins", tango_pins, 2);
+	if (ret)
+		return ret;
+	data->id = tango_pins[0];
+	data->len = tango_pins[1];
+	data->dedicated = !of_get_property(np, "alt_function", NULL);
+
+	return 0;
+}
+
+static int init_pd(struct device *dev, struct tango_pinctrl *data)
+{
+	int i;
+	struct pinctrl_pin_desc *pdesc;
+
+	pdesc = devm_kzalloc(dev, data->len * sizeof(*pdesc), GFP_KERNEL);
+	if (!pdesc)
+		return -ENOMEM;
+	for (i = 0; i < data->len; i++)
+		pdesc[i].number = data->id + i;
+
+	data->pd.name = data->label;
+	data->pd.pins = pdesc;
+	data->pd.npins = data->len;
+	data->pd.pctlops = &pctlops;
+	data->pd.pmxops = &pmxops;
+	data->pd.owner = THIS_MODULE;
+
+	return 0;
+}
+
+static int init_gr(struct device *dev, struct tango_pinctrl *data)
+{
+	struct gpio_chip *gc;
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	data->gr.name = data->label;
+	data->gr.id = data->id;
+	data->gr.base = data->id;
+	data->gr.pin_base = data->id;
+	data->gr.npins = data->len;
+	data->gr.gc = gc;
+
+	gc->label = data->label;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->get_direction = gpio_get_direction;
+	gc->direction_input = gpio_direction_input;
+	gc->direction_output = gpio_direction_output;
+	gc->get = gpio_get;
+	gc->set = gpio_set;
+	gc->set_multiple = gpio_set_multiple;
+	gc->base = data->id;
+	gc->ngpio = data->len;
+
+	return devm_gpiochip_add_data(dev, gc, data);
+}
+
+static int tango_pinctrl_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct resource *res;
+	struct tango_pinctrl *data;
+	struct pinctrl_dev *pindev;
+	struct device_node *np = pdev->dev.of_node;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, data);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+	data->addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(data->addr))
+		return PTR_ERR(data->addr);
+
+	ret = get_node_info(np, data);
+	if (ret)
+		return ret;
+	dev_dbg(&pdev->dev, "%8s id=%d len=%d\n",
+			data->label, data->id, data->len);
+
+	ret = init_pd(&pdev->dev, data);
+	if (ret)
+		return ret;
+
+	pindev = devm_pinctrl_register(&pdev->dev, &data->pd, data);
+	if (IS_ERR(pindev))
+		return PTR_ERR(pindev);
+
+	ret = init_gr(&pdev->dev, data);
+	if (ret)
+		return ret;
+	pinctrl_add_gpio_range(pindev, &data->gr);
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
