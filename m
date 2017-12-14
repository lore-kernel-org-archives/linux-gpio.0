From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: [PATCH] gpio: winbond: add driver
Date: Thu, 14 Dec 2017 23:05:01 +0100
Message-ID: <f105bdb7-9b29-517f-1fb6-935ee9e2045c@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:56196 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752656AbdLNWFE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Dec 2017 17:05:04 -0500
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

This commit adds GPIO driver for Winbond Super I/Os.

Currently, only W83627UHG model (also known as Nuvoton NCT6627UD) is
supported but in the future a support for other Winbond models, too, can
be added to the driver.

A module parameter "gpios" sets a bitmask of GPIO ports to enable (bit 0 is
GPIO1, bit 1 is GPIO2, etc.).
One should be careful which ports one tinkers with since some might be
managed by the firmware (for functions like powering on and off, sleeping,
BIOS recovery, etc.) and some of GPIO port pins are physically shared with
other devices included in the Super I/O chip.

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/gpio/Kconfig        |  15 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-winbond.c | 694 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 710 insertions(+)
 create mode 100644 drivers/gpio/gpio-winbond.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 395669bfcc26..3384a4675a0c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -698,6 +698,21 @@ config GPIO_TS5500
 	  blocks of the TS-5500: DIO1, DIO2 and the LCD port, and the TS-5600
 	  LCD port.
 
+config GPIO_WINBOND
+	tristate "Winbond Super I/O GPIO support"
+	help
+	  This option enables support for GPIOs found on Winbond Super I/O
+	  chips.
+	  Currently, only W83627UHG (also known as Nuvoton NCT6627UD) is
+	  supported.
+
+	  You will need to provide a module parameter "gpios", or a
+	  boot-time parameter "gpio_winbond.gpios" with a bitmask of GPIO
+	  ports to enable (bit 0 is GPIO1, bit 1 is GPIO2, etc.).
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-winbond.
+
 config GPIO_WS16C48
 	tristate "WinSystems WS16C48 GPIO support"
 	depends on ISA_BUS_API
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index bc5dd673fa11..ff3d36d0a443 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -139,6 +139,7 @@ obj-$(CONFIG_GPIO_VIPERBOARD)	+= gpio-viperboard.o
 obj-$(CONFIG_GPIO_VR41XX)	+= gpio-vr41xx.o
 obj-$(CONFIG_GPIO_VX855)	+= gpio-vx855.o
 obj-$(CONFIG_GPIO_WHISKEY_COVE)	+= gpio-wcove.o
+obj-$(CONFIG_GPIO_WINBOND)	+= gpio-winbond.o
 obj-$(CONFIG_GPIO_WM831X)	+= gpio-wm831x.o
 obj-$(CONFIG_GPIO_WM8350)	+= gpio-wm8350.o
 obj-$(CONFIG_GPIO_WM8994)	+= gpio-wm8994.o
diff --git a/drivers/gpio/gpio-winbond.c b/drivers/gpio/gpio-winbond.c
new file mode 100644
index 000000000000..899030e91b40
--- /dev/null
+++ b/drivers/gpio/gpio-winbond.c
@@ -0,0 +1,694 @@
+/*
+ * GPIO interface for Winbond Super I/O chips
+ * Currently, only W83627UHG (Nuvoton NCT6627UD) is supported.
+ *
+ * Author: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License 2 as published
+ * by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/errno.h>
+#include <linux/gpio.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define WB_GPIO_DRIVER_NAME "gpio-winbond"
+
+#define WB_SIO_BASE 0x2e
+#define WB_SIO_BASE_HIGH 0x4e
+
+#define WB_SIO_EXT_ENTER_KEY 0x87
+#define WB_SIO_EXT_EXIT_KEY 0xaa
+
+#define WB_SIO_CHIP_ID_W83627UHG 0xa230
+#define WB_SIO_CHIP_ID_W83627UHG_MASK 0xfff0
+
+#define WB_SIO_DEV_UARTB 3
+#define WB_SIO_UARTB_REG_ENABLE 0x30
+#define WB_SIO_UARTB_ENABLE_ON 0
+
+#define WB_SIO_DEV_UARTC 6
+#define WB_SIO_UARTC_REG_ENABLE 0x30
+#define WB_SIO_UARTC_ENABLE_ON 0
+
+#define WB_SIO_DEV_GPIO34 7
+#define WB_SIO_GPIO34_REG_ENABLE 0x30
+#define WB_SIO_GPIO34_ENABLE_4 1
+#define WB_SIO_GPIO34_ENABLE_3 0
+#define WB_SIO_GPIO34_REG_IO3 0xe0
+#define WB_SIO_GPIO34_REG_DATA3 0xe1
+#define WB_SIO_GPIO34_REG_INV3 0xe2
+#define WB_SIO_GPIO34_REG_IO4 0xe4
+#define WB_SIO_GPIO34_REG_DATA4 0xe5
+#define WB_SIO_GPIO34_REG_INV4 0xe6
+
+#define WB_SIO_DEV_WDGPIO56 8
+#define WB_SIO_WDGPIO56_REG_ENABLE 0x30
+#define WB_SIO_WDGPIO56_ENABLE_6 2
+#define WB_SIO_WDGPIO56_ENABLE_5 1
+#define WB_SIO_WDGPIO56_REG_IO5 0xe0
+#define WB_SIO_WDGPIO56_REG_DATA5 0xe1
+#define WB_SIO_WDGPIO56_REG_INV5 0xe2
+#define WB_SIO_WDGPIO56_REG_IO6 0xe4
+#define WB_SIO_WDGPIO56_REG_DATA6 0xe5
+#define WB_SIO_WDGPIO56_REG_INV6 0xe6
+
+#define WB_SIO_DEV_GPIO12 9
+#define WB_SIO_GPIO12_REG_ENABLE 0x30
+#define WB_SIO_GPIO12_ENABLE_2 1
+#define WB_SIO_GPIO12_ENABLE_1 0
+#define WB_SIO_GPIO12_REG_IO1 0xe0
+#define WB_SIO_GPIO12_REG_DATA1 0xe1
+#define WB_SIO_GPIO12_REG_INV1 0xe2
+#define WB_SIO_GPIO12_REG_IO2 0xe4
+#define WB_SIO_GPIO12_REG_DATA2 0xe5
+#define WB_SIO_GPIO12_REG_INV2 0xe6
+
+#define WB_SIO_DEV_UARTD 0xd
+#define WB_SIO_UARTD_REG_ENABLE 0x30
+#define WB_SIO_UARTD_ENABLE_ON 0
+
+#define WB_SIO_DEV_UARTE 0xe
+#define WB_SIO_UARTE_REG_ENABLE 0x30
+#define WB_SIO_UARTE_ENABLE_ON 0
+
+#define WB_SIO_REG_LOGICAL 7
+
+#define WB_SIO_REG_CHIP_MSB 0x20
+#define WB_SIO_REG_CHIP_LSB 0x21
+
+#define WB_SIO_REG_DPD 0x22
+#define WB_SIO_REG_DPD_UARTA 4
+#define WB_SIO_REG_DPD_UARTB 5
+
+#define WB_SIO_REG_IDPD 0x23
+#define WB_SIO_REG_IDPD_UARTF 7
+#define WB_SIO_REG_IDPD_UARTE 6
+#define WB_SIO_REG_IDPD_UARTD 5
+#define WB_SIO_REG_IDPD_UARTC 4
+
+#define WB_SIO_REG_GLOBAL_OPT 0x24
+#define WB_SIO_REG_GO_ENFDC 1
+
+#define WB_SIO_REG_OVTGPIO3456 0x29
+#define WB_SIO_REG_OG3456_G6PP 7
+#define WB_SIO_REG_OG3456_G5PP 5
+#define WB_SIO_REG_OG3456_G4PP 4
+#define WB_SIO_REG_OG3456_G3PP 3
+
+#define WB_SIO_REG_I2C_PS 0x2A
+#define WB_SIO_REG_I2CPS_I2CFS 1
+
+#define WB_SIO_REG_GPIO1_MF 0x2c
+#define WB_SIO_REG_G1MF_G2PP 7
+#define WB_SIO_REG_G1MF_G1PP 6
+#define WB_SIO_REG_G1MF_FS 3
+#define WB_SIO_REG_G1MF_FS_UARTB 3
+#define WB_SIO_REG_G1MF_FS_GPIO1 2
+#define WB_SIO_REG_G1MF_FS_IR 1
+#define WB_SIO_REG_G1MF_FS_IR_OFF 0
+
+static int gpiobase = -1; /* dynamic */
+static uint8_t gpios;
+static uint8_t ppgpios;
+static uint8_t odgpios;
+static bool pledgpio;
+static bool beepgpio;
+static bool i2cgpio;
+
+static int winbond_sio_enter(uint16_t base)
+{
+	if (request_muxed_region(base, 2, WB_GPIO_DRIVER_NAME) == NULL) {
+		pr_err(WB_GPIO_DRIVER_NAME ": cannot enter SIO at address %x\n",
+		       (unsigned int)base);
+		return -EBUSY;
+	}
+
+	outb(WB_SIO_EXT_ENTER_KEY, base);
+	outb(WB_SIO_EXT_ENTER_KEY, base);
+
+	return 0;
+}
+
+static void winbond_sio_select_logical(uint16_t base, uint8_t dev)
+{
+	outb(WB_SIO_REG_LOGICAL, base);
+	outb(dev, base + 1);
+}
+
+static void winbond_sio_leave(uint16_t base)
+{
+	outb(WB_SIO_EXT_EXIT_KEY, base);
+
+	release_region(base, 2);
+}
+
+static void winbond_sio_reg_write(uint16_t base, uint8_t reg, uint8_t data)
+{
+	outb(reg, base);
+	outb(data, base + 1);
+}
+
+static uint8_t winbond_sio_reg_read(uint16_t base, uint8_t reg)
+{
+	outb(reg, base);
+	return inb(base + 1);
+}
+
+static void winbond_sio_reg_bset(uint16_t base, uint8_t reg, uint8_t bit)
+{
+	uint8_t val;
+
+	val = winbond_sio_reg_read(base, reg);
+	val |= BIT(bit);
+	winbond_sio_reg_write(base, reg, val);
+}
+
+static void winbond_sio_reg_bclear(uint16_t base, uint8_t reg, uint8_t bit)
+{
+	uint8_t val;
+
+	val = winbond_sio_reg_read(base, reg);
+	val &= ~BIT(bit);
+	winbond_sio_reg_write(base, reg, val);
+}
+
+static bool winbond_sio_reg_btest(uint16_t base, uint8_t reg, uint8_t bit)
+{
+	return winbond_sio_reg_read(base, reg) & BIT(bit);
+}
+
+struct winbond_gpio_info {
+	uint8_t dev;
+	uint8_t ioreg;
+	uint8_t invreg;
+	uint8_t datareg;
+};
+
+static const struct winbond_gpio_info winbond_gpio_infos[6] = {
+	{ .dev = WB_SIO_DEV_GPIO12, .ioreg = WB_SIO_GPIO12_REG_IO1,
+	  .invreg = WB_SIO_GPIO12_REG_INV1,
+	  .datareg = WB_SIO_GPIO12_REG_DATA1 },
+	{ .dev = WB_SIO_DEV_GPIO12, .ioreg = WB_SIO_GPIO12_REG_IO2,
+	  .invreg = WB_SIO_GPIO12_REG_INV2,
+	  .datareg = WB_SIO_GPIO12_REG_DATA2 },
+	{ .dev = WB_SIO_DEV_GPIO34, .ioreg = WB_SIO_GPIO34_REG_IO3,
+	  .invreg = WB_SIO_GPIO34_REG_INV3,
+	  .datareg = WB_SIO_GPIO34_REG_DATA3 },
+	{ .dev = WB_SIO_DEV_GPIO34, .ioreg = WB_SIO_GPIO34_REG_IO4,
+	  .invreg = WB_SIO_GPIO34_REG_INV4,
+	  .datareg = WB_SIO_GPIO34_REG_DATA4 },
+	{ .dev = WB_SIO_DEV_WDGPIO56, .ioreg = WB_SIO_WDGPIO56_REG_IO5,
+	  .invreg = WB_SIO_WDGPIO56_REG_INV5,
+	  .datareg = WB_SIO_WDGPIO56_REG_DATA5 },
+	{ .dev = WB_SIO_DEV_WDGPIO56, .ioreg = WB_SIO_WDGPIO56_REG_IO6,
+	  .invreg = WB_SIO_WDGPIO56_REG_INV6,
+	  .datareg = WB_SIO_WDGPIO56_REG_DATA6 }
+};
+
+/* returns whether changing a pin is allowed */
+static bool winbond_gpio_get_info(unsigned int gpio_num,
+				  const struct winbond_gpio_info **info)
+{
+	bool allow_changing = true;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(winbond_gpio_infos); i++) {
+		if (!(gpios & BIT(i)))
+			continue;
+
+		if (gpio_num < 8)
+			break;
+
+		gpio_num -= 8;
+	}
+
+	if (WARN_ON(i >= ARRAY_SIZE(winbond_gpio_infos)))
+		i = 0;
+
+	*info = &winbond_gpio_infos[i];
+
+	if (i == 1) {
+		if (gpio_num == 0 && !pledgpio)
+			allow_changing = false;
+		else if (gpio_num == 1 && !beepgpio)
+			allow_changing = false;
+		else if ((gpio_num == 5 || gpio_num == 6) && !i2cgpio)
+			allow_changing = false;
+	}
+
+	return allow_changing;
+}
+
+static int winbond_gpio_get(struct gpio_chip *gc, unsigned int gpio_num)
+{
+	uint16_t *base = gpiochip_get_data(gc);
+	const struct winbond_gpio_info *info;
+	bool val;
+
+	winbond_gpio_get_info(gpio_num, &info);
+	gpio_num %= 8;
+
+	val = winbond_sio_enter(*base);
+	if (val)
+		return val;
+
+	winbond_sio_select_logical(*base, info->dev);
+
+	val = winbond_sio_reg_btest(*base, info->datareg, gpio_num);
+	if (winbond_sio_reg_btest(*base, info->invreg, gpio_num))
+		val = !val;
+
+	winbond_sio_leave(*base);
+
+	return val;
+}
+
+static int winbond_gpio_direction_in(struct gpio_chip *gc,
+				     unsigned int gpio_num)
+{
+	uint16_t *base = gpiochip_get_data(gc);
+	const struct winbond_gpio_info *info;
+	int ret;
+
+	if (!winbond_gpio_get_info(gpio_num, &info))
+		return -EACCES;
+
+	gpio_num %= 8;
+
+	ret = winbond_sio_enter(*base);
+	if (ret)
+		return ret;
+
+	winbond_sio_select_logical(*base, info->dev);
+
+	winbond_sio_reg_bset(*base, info->ioreg, gpio_num);
+
+	winbond_sio_leave(*base);
+
+	return 0;
+}
+
+static int winbond_gpio_direction_out(struct gpio_chip *gc,
+				      unsigned int gpio_num,
+				      int val)
+{
+	uint16_t *base = gpiochip_get_data(gc);
+	const struct winbond_gpio_info *info;
+	int ret;
+
+	if (!winbond_gpio_get_info(gpio_num, &info))
+		return -EACCES;
+
+	gpio_num %= 8;
+
+	ret = winbond_sio_enter(*base);
+	if (ret)
+		return ret;
+
+	winbond_sio_select_logical(*base, info->dev);
+
+	winbond_sio_reg_bclear(*base, info->ioreg, gpio_num);
+	if (winbond_sio_reg_btest(*base, info->invreg, gpio_num))
+		val = !val;
+
+	if (val)
+		winbond_sio_reg_bset(*base, info->datareg, gpio_num);
+	else
+		winbond_sio_reg_bclear(*base, info->datareg, gpio_num);
+
+	winbond_sio_leave(*base);
+
+	return 0;
+}
+
+static void winbond_gpio_set(struct gpio_chip *gc, unsigned int gpio_num,
+			     int val)
+{
+	uint16_t *base = gpiochip_get_data(gc);
+	const struct winbond_gpio_info *info;
+
+	if (!winbond_gpio_get_info(gpio_num, &info))
+		return;
+
+	gpio_num %= 8;
+
+	if (winbond_sio_enter(*base) != 0)
+		return;
+
+	winbond_sio_select_logical(*base, info->dev);
+
+	if (winbond_sio_reg_btest(*base, info->invreg, gpio_num))
+		val = !val;
+
+	if (val)
+		winbond_sio_reg_bset(*base, info->datareg, gpio_num);
+	else
+		winbond_sio_reg_bclear(*base, info->datareg, gpio_num);
+
+	winbond_sio_leave(*base);
+}
+
+static struct gpio_chip winbond_gpio_chip = {
+	.label			= WB_GPIO_DRIVER_NAME,
+	.owner			= THIS_MODULE,
+	.can_sleep		= true,
+	.get			= winbond_gpio_get,
+	.direction_input	= winbond_gpio_direction_in,
+	.set			= winbond_gpio_set,
+	.direction_output	= winbond_gpio_direction_out,
+};
+
+static int winbond_gpio_probe(struct platform_device *pdev)
+{
+	uint16_t *base = dev_get_platdata(&pdev->dev);
+	unsigned int i;
+
+	if (base == NULL)
+		return -EINVAL;
+
+	winbond_gpio_chip.ngpio = 0;
+	for (i = 0; i < 5; i++)
+		if (gpios & BIT(i))
+			winbond_gpio_chip.ngpio += 8;
+
+	if (gpios & BIT(5))
+		winbond_gpio_chip.ngpio += 5;
+
+	winbond_gpio_chip.base = gpiobase;
+	winbond_gpio_chip.parent = &pdev->dev;
+
+	return devm_gpiochip_add_data(&pdev->dev, &winbond_gpio_chip, base);
+}
+
+static void winbond_gpio_warn_conflict(unsigned int idx, const char *otherdev)
+{
+	pr_warn(WB_GPIO_DRIVER_NAME
+		": enabled GPIO%u share pins with active %s\n", idx + 1,
+		otherdev);
+}
+
+static void winbond_gpio_configure_common(uint16_t base, unsigned int idx,
+					  uint8_t dev, uint8_t enable_reg,
+					  uint8_t enable_bit,
+					  uint8_t output_reg,
+					  uint8_t output_pp_bit)
+{
+	winbond_sio_select_logical(base, dev);
+
+	winbond_sio_reg_bset(base, enable_reg, enable_bit);
+
+	if (ppgpios & BIT(idx))
+		winbond_sio_reg_bset(base, output_reg,
+				     output_pp_bit);
+	else if (odgpios & BIT(idx))
+		winbond_sio_reg_bclear(base, output_reg,
+				       output_pp_bit);
+	else
+		pr_notice(WB_GPIO_DRIVER_NAME ": GPIO%u pins are %s\n", idx + 1,
+			  winbond_sio_reg_btest(base, output_reg,
+						output_pp_bit) ?
+			  "push-pull" :
+			  "open drain");
+}
+
+static void winbond_gpio_configure_0(uint16_t base)
+{
+	uint8_t val;
+
+	if (!(gpios & BIT(0)))
+		return;
+
+	winbond_sio_select_logical(base, WB_SIO_DEV_UARTB);
+	if (winbond_sio_reg_btest(base, WB_SIO_UARTB_REG_ENABLE,
+				  WB_SIO_UARTB_ENABLE_ON))
+		winbond_gpio_warn_conflict(0, "UARTB");
+
+	val = winbond_sio_reg_read(base, WB_SIO_REG_GPIO1_MF);
+	if ((val & WB_SIO_REG_G1MF_FS) != WB_SIO_REG_G1MF_FS_GPIO1) {
+		pr_warn(WB_GPIO_DRIVER_NAME
+			": GPIO1 pins were connected to something else (%.2x), fixing\n",
+			(unsigned int)val);
+
+		val &= ~WB_SIO_REG_G1MF_FS;
+		val |= WB_SIO_REG_G1MF_FS_GPIO1;
+
+		winbond_sio_reg_write(base, WB_SIO_REG_GPIO1_MF, val);
+	}
+
+	winbond_gpio_configure_common(base, 0, WB_SIO_DEV_GPIO12,
+				      WB_SIO_GPIO12_REG_ENABLE,
+				      WB_SIO_GPIO12_ENABLE_1,
+				      WB_SIO_REG_GPIO1_MF,
+				      WB_SIO_REG_G1MF_G1PP);
+}
+
+static void winbond_gpio_configure_1(uint16_t base)
+{
+	if (!(gpios & BIT(1)))
+		return;
+
+	i2cgpio = !winbond_sio_reg_btest(base, WB_SIO_REG_I2C_PS,
+					 WB_SIO_REG_I2CPS_I2CFS);
+	if (!i2cgpio)
+		pr_warn(WB_GPIO_DRIVER_NAME
+			": disabling GPIO2.5 and GPIO2.6 as I2C is enabled\n");
+
+	winbond_gpio_configure_common(base, 1, WB_SIO_DEV_GPIO12,
+				      WB_SIO_GPIO12_REG_ENABLE,
+				      WB_SIO_GPIO12_ENABLE_2,
+				      WB_SIO_REG_GPIO1_MF,
+				      WB_SIO_REG_G1MF_G2PP);
+}
+
+static void winbond_gpio_configure_2(uint16_t base)
+{
+	if (!(gpios & BIT(2)))
+		return;
+
+	winbond_sio_select_logical(base, WB_SIO_DEV_UARTC);
+	if (winbond_sio_reg_btest(base, WB_SIO_UARTC_REG_ENABLE,
+				  WB_SIO_UARTC_ENABLE_ON))
+		winbond_gpio_warn_conflict(2, "UARTC");
+
+	winbond_gpio_configure_common(base, 2, WB_SIO_DEV_GPIO34,
+				      WB_SIO_GPIO34_REG_ENABLE,
+				      WB_SIO_GPIO34_ENABLE_3,
+				      WB_SIO_REG_OVTGPIO3456,
+				      WB_SIO_REG_OG3456_G3PP);
+}
+
+static void winbond_gpio_configure_3(uint16_t base)
+{
+	if (!(gpios & BIT(3)))
+		return;
+
+	winbond_sio_select_logical(base, WB_SIO_DEV_UARTD);
+	if (winbond_sio_reg_btest(base, WB_SIO_UARTD_REG_ENABLE,
+				  WB_SIO_UARTD_ENABLE_ON))
+		winbond_gpio_warn_conflict(3, "UARTD");
+
+	winbond_gpio_configure_common(base, 3, WB_SIO_DEV_GPIO34,
+				      WB_SIO_GPIO34_REG_ENABLE,
+				      WB_SIO_GPIO34_ENABLE_4,
+				      WB_SIO_REG_OVTGPIO3456,
+				      WB_SIO_REG_OG3456_G4PP);
+}
+
+static void winbond_gpio_configure_4(uint16_t base)
+{
+	if (!(gpios & BIT(4)))
+		return;
+
+	winbond_sio_select_logical(base, WB_SIO_DEV_UARTE);
+	if (winbond_sio_reg_btest(base, WB_SIO_UARTE_REG_ENABLE,
+				  WB_SIO_UARTE_ENABLE_ON))
+		winbond_gpio_warn_conflict(4, "UARTE");
+
+	winbond_gpio_configure_common(base, 4, WB_SIO_DEV_WDGPIO56,
+				      WB_SIO_WDGPIO56_REG_ENABLE,
+				      WB_SIO_WDGPIO56_ENABLE_5,
+				      WB_SIO_REG_OVTGPIO3456,
+				      WB_SIO_REG_OG3456_G5PP);
+}
+
+static void winbond_gpio_configure_5(uint16_t base)
+{
+	if (!(gpios & BIT(5)))
+		return;
+
+	if (winbond_sio_reg_btest(base, WB_SIO_REG_GLOBAL_OPT,
+				  WB_SIO_REG_GO_ENFDC)) {
+		pr_warn(WB_GPIO_DRIVER_NAME
+			": disabling GPIO6 as FDC is enabled\n");
+
+		gpios &= ~BIT(5);
+		return;
+	}
+
+	winbond_gpio_configure_common(base, 5, WB_SIO_DEV_WDGPIO56,
+				      WB_SIO_WDGPIO56_REG_ENABLE,
+				      WB_SIO_WDGPIO56_ENABLE_6,
+				      WB_SIO_REG_OVTGPIO3456,
+				      WB_SIO_REG_OG3456_G6PP);
+}
+
+static int winbond_gpio_configure(uint16_t base)
+{
+	winbond_gpio_configure_0(base);
+	winbond_gpio_configure_1(base);
+	winbond_gpio_configure_2(base);
+	winbond_gpio_configure_3(base);
+	winbond_gpio_configure_4(base);
+	winbond_gpio_configure_5(base);
+
+	if (!(gpios & (BIT(5 + 1) - 1))) {
+		pr_err(WB_GPIO_DRIVER_NAME
+		       ": please use 'gpios' module parameter to select some active GPIO ports to enable\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct platform_device *winbond_gpio_pdev;
+
+static int winbond_gpio_init_one(uint16_t base)
+{
+	uint16_t chip;
+	int ret;
+
+	ret = winbond_sio_enter(base);
+	if (ret)
+		return ret;
+
+	chip = winbond_sio_reg_read(base, WB_SIO_REG_CHIP_MSB) << 8;
+	chip |= winbond_sio_reg_read(base, WB_SIO_REG_CHIP_LSB);
+
+	pr_notice(WB_GPIO_DRIVER_NAME
+		  ": chip ID at %hx is %.4x\n",
+		  (unsigned int)base,
+		  (unsigned int)chip);
+
+	if ((chip & WB_SIO_CHIP_ID_W83627UHG_MASK) !=
+	    WB_SIO_CHIP_ID_W83627UHG) {
+		pr_err(WB_GPIO_DRIVER_NAME
+		       ": not an our chip\n");
+		winbond_sio_leave(base);
+		return -ENODEV;
+	}
+
+	ret = winbond_gpio_configure(base);
+
+	winbond_sio_leave(base);
+
+	if (ret)
+		return ret;
+
+	winbond_gpio_pdev = platform_device_alloc(WB_GPIO_DRIVER_NAME, -1);
+	if (winbond_gpio_pdev == NULL)
+		return -ENOMEM;
+
+	ret = platform_device_add_data(winbond_gpio_pdev,
+				       &base, sizeof(base));
+	if (ret) {
+		pr_err(WB_GPIO_DRIVER_NAME
+		       ": cannot add platform data\n");
+		goto ret_put;
+	}
+
+	ret = platform_device_add(winbond_gpio_pdev);
+	if (ret) {
+		pr_err(WB_GPIO_DRIVER_NAME
+		       ": cannot add platform device\n");
+		goto ret_put;
+	}
+
+	return 0;
+
+ret_put:
+	platform_device_put(winbond_gpio_pdev);
+	winbond_gpio_pdev = NULL;
+
+	return ret;
+}
+
+static struct platform_driver winbond_gpio_pdriver = {
+	.driver = {
+		.name	= WB_GPIO_DRIVER_NAME,
+	},
+	.probe		= winbond_gpio_probe,
+};
+
+static int __init winbond_gpio_init(void)
+{
+	int ret;
+
+	if (ppgpios & odgpios) {
+		pr_err(WB_GPIO_DRIVER_NAME
+			": some GPIO ports are set both to push-pull and open drain mode at the same time\n");
+		return -EINVAL;
+	}
+
+	ret = platform_driver_register(&winbond_gpio_pdriver);
+	if (ret)
+		return ret;
+
+	ret = winbond_gpio_init_one(WB_SIO_BASE);
+	if (ret == -ENODEV || ret == -EBUSY)
+		ret = winbond_gpio_init_one(WB_SIO_BASE_HIGH);
+	if (ret)
+		goto ret_unreg;
+
+	return 0;
+
+ret_unreg:
+	platform_driver_unregister(&winbond_gpio_pdriver);
+
+	return ret;
+}
+
+static void __exit winbond_gpio_exit(void)
+{
+	platform_device_unregister(winbond_gpio_pdev);
+	platform_driver_unregister(&winbond_gpio_pdriver);
+}
+
+module_init(winbond_gpio_init);
+module_exit(winbond_gpio_exit);
+
+module_param(gpiobase, int, 0444);
+MODULE_PARM_DESC(gpiobase,
+		 "number of the first GPIO to register. default is -1, that is, dynamically allocated.");
+
+module_param(gpios, byte, 0444);
+MODULE_PARM_DESC(gpios,
+		 "bitmask of GPIO ports to enable (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
+
+module_param(ppgpios, byte, 0444);
+MODULE_PARM_DESC(ppgpios,
+		 "bitmask of GPIO ports to set to push-pull mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
+
+module_param(odgpios, byte, 0444);
+MODULE_PARM_DESC(odgpios,
+		 "bitmask of GPIO ports to set to open drain mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
+
+module_param(pledgpio, bool, 0644);
+MODULE_PARM_DESC(pledgpio,
+		 "enable changing value of GPIO2.0 bit (Power LED), default no.");
+
+module_param(beepgpio, bool, 0644);
+MODULE_PARM_DESC(beepgpio,
+		 "enable changing value of GPIO2.1 bit (BEEP), default no.");
+
+MODULE_AUTHOR("Maciej S. Szmigiero <mail@maciej.szmigiero.name>");
+MODULE_DESCRIPTION("GPIO interface for Winbond Super I/O chips");
+MODULE_LICENSE("GPL");
