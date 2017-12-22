From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: [PATCH v2] gpio: winbond: add driver
Date: Fri, 22 Dec 2017 19:58:49 +0100
Message-ID: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

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
Changes from v1:
* Added SPDX license tag,

* Removed gpiobase parameter,

* Changed uint{8,16}_t types to u{8,16},

* Added kerneldoc descriptions of driver structures,

* Reformatted winbond_gpio_infos array fields so they are on separate
lines,

* Added few comments here and there as requested,

* Moved port configuration code from separate winbond_gpio_configure_X()
functions to one, common, parametrized winbond_gpio_configure_port()
function.

Didn't change "linux/errno.h" and "linux/gpio.h" includes to
"linux/driver.h" since there is no such file in the current linux-gpio
tree and so the driver would not compile with this change.
Other GPIO drivers are using these former two include files, too.

 drivers/gpio/Kconfig        |  15 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-winbond.c | 758 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 774 insertions(+)
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
index 000000000000..385855fb6c9e
--- /dev/null
+++ b/drivers/gpio/gpio-winbond.c
@@ -0,0 +1,758 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * GPIO interface for Winbond Super I/O chips
+ * Currently, only W83627UHG (Nuvoton NCT6627UD) is supported.
+ *
+ * Author: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
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
+/* not an actual device number, just a value meaning 'no device' */
+#define WB_SIO_DEV_NONE 0xff
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
+static u8 gpios;
+static u8 ppgpios;
+static u8 odgpios;
+static bool pledgpio;
+static bool beepgpio;
+static bool i2cgpio;
+
+static int winbond_sio_enter(u16 base)
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
+static void winbond_sio_select_logical(u16 base, u8 dev)
+{
+	outb(WB_SIO_REG_LOGICAL, base);
+	outb(dev, base + 1);
+}
+
+static void winbond_sio_leave(u16 base)
+{
+	outb(WB_SIO_EXT_EXIT_KEY, base);
+
+	release_region(base, 2);
+}
+
+static void winbond_sio_reg_write(u16 base, u8 reg, u8 data)
+{
+	outb(reg, base);
+	outb(data, base + 1);
+}
+
+static u8 winbond_sio_reg_read(u16 base, u8 reg)
+{
+	outb(reg, base);
+	return inb(base + 1);
+}
+
+static void winbond_sio_reg_bset(u16 base, u8 reg, u8 bit)
+{
+	u8 val;
+
+	val = winbond_sio_reg_read(base, reg);
+	val |= BIT(bit);
+	winbond_sio_reg_write(base, reg, val);
+}
+
+static void winbond_sio_reg_bclear(u16 base, u8 reg, u8 bit)
+{
+	u8 val;
+
+	val = winbond_sio_reg_read(base, reg);
+	val &= ~BIT(bit);
+	winbond_sio_reg_write(base, reg, val);
+}
+
+static bool winbond_sio_reg_btest(u16 base, u8 reg, u8 bit)
+{
+	return winbond_sio_reg_read(base, reg) & BIT(bit);
+}
+
+/**
+ * struct winbond_gpio_port_conflict - possibly conflicting device information
+ * @name:	device name (NULL means no conflicting device defined)
+ * @dev:	Super I/O logical device number where the testreg register
+ *		is located (or WB_SIO_DEV_NONE - don't select any
+ *		logical device)
+ * @testreg:	register number where the testbit bit is located
+ * @testbit:	index of a bit to check whether an actual conflict exists
+ * @warnonly:	if set then a conflict isn't fatal (just warn about it),
+ *		otherwise disable the particular GPIO port if a conflict
+ *		is detected
+ */
+struct winbond_gpio_port_conflict {
+	const char *name;
+	u8 dev;
+	u8 testreg;
+	u8 testbit;
+	bool warnonly;
+};
+
+/**
+ * struct winbond_gpio_info - information about a particular GPIO port (device)
+ * @dev:		Super I/O logical device number of the registers
+ *			specified below
+ * @enablereg:		port enable bit register number
+ * @enablebit:		index of a port enable bit
+ * @outputreg:		output driver mode bit register number
+ * @outputppbit:	index of a push-pull output driver mode bit
+ * @ioreg:		data direction register number
+ * @invreg:		pin data inversion register number
+ * @datareg:		pin data register number
+ * @conflict:		description of a device that possibly conflicts with
+ *			this port
+ */
+struct winbond_gpio_info {
+	u8 dev;
+	u8 enablereg;
+	u8 enablebit;
+	u8 outputreg;
+	u8 outputppbit;
+	u8 ioreg;
+	u8 invreg;
+	u8 datareg;
+	struct winbond_gpio_port_conflict conflict;
+};
+
+static const struct winbond_gpio_info winbond_gpio_infos[6] = {
+	{ /* 0 */
+		.dev = WB_SIO_DEV_GPIO12,
+		.enablereg = WB_SIO_GPIO12_REG_ENABLE,
+		.enablebit = WB_SIO_GPIO12_ENABLE_1,
+		.outputreg = WB_SIO_REG_GPIO1_MF,
+		.outputppbit = WB_SIO_REG_G1MF_G1PP,
+		.ioreg = WB_SIO_GPIO12_REG_IO1,
+		.invreg = WB_SIO_GPIO12_REG_INV1,
+		.datareg = WB_SIO_GPIO12_REG_DATA1,
+		.conflict = {
+			.name = "UARTB",
+			.dev = WB_SIO_DEV_UARTB,
+			.testreg = WB_SIO_UARTB_REG_ENABLE,
+			.testbit = WB_SIO_UARTB_ENABLE_ON,
+			.warnonly = true
+		}
+	},
+	{ /* 1 */
+		.dev = WB_SIO_DEV_GPIO12,
+		.enablereg = WB_SIO_GPIO12_REG_ENABLE,
+		.enablebit = WB_SIO_GPIO12_ENABLE_2,
+		.outputreg = WB_SIO_REG_GPIO1_MF,
+		.outputppbit = WB_SIO_REG_G1MF_G2PP,
+		.ioreg = WB_SIO_GPIO12_REG_IO2,
+		.invreg = WB_SIO_GPIO12_REG_INV2,
+		.datareg = WB_SIO_GPIO12_REG_DATA2
+		/* special conflict handling so doesn't use conflict data */
+	},
+	{ /* 2 */
+		.dev = WB_SIO_DEV_GPIO34,
+		.enablereg = WB_SIO_GPIO34_REG_ENABLE,
+		.enablebit = WB_SIO_GPIO34_ENABLE_3,
+		.outputreg = WB_SIO_REG_OVTGPIO3456,
+		.outputppbit = WB_SIO_REG_OG3456_G3PP,
+		.ioreg = WB_SIO_GPIO34_REG_IO3,
+		.invreg = WB_SIO_GPIO34_REG_INV3,
+		.datareg = WB_SIO_GPIO34_REG_DATA3,
+		.conflict = {
+			.name = "UARTC",
+			.dev = WB_SIO_DEV_UARTC,
+			.testreg = WB_SIO_UARTC_REG_ENABLE,
+			.testbit = WB_SIO_UARTC_ENABLE_ON,
+			.warnonly = true
+		}
+	},
+	{ /* 3 */
+		.dev = WB_SIO_DEV_GPIO34,
+		.enablereg = WB_SIO_GPIO34_REG_ENABLE,
+		.enablebit = WB_SIO_GPIO34_ENABLE_4,
+		.outputreg = WB_SIO_REG_OVTGPIO3456,
+		.outputppbit = WB_SIO_REG_OG3456_G4PP,
+		.ioreg = WB_SIO_GPIO34_REG_IO4,
+		.invreg = WB_SIO_GPIO34_REG_INV4,
+		.datareg = WB_SIO_GPIO34_REG_DATA4,
+		.conflict = {
+			.name = "UARTD",
+			.dev = WB_SIO_DEV_UARTD,
+			.testreg = WB_SIO_UARTD_REG_ENABLE,
+			.testbit = WB_SIO_UARTD_ENABLE_ON,
+			.warnonly = true
+		}
+	},
+	{ /* 4 */
+		.dev = WB_SIO_DEV_WDGPIO56,
+		.enablereg = WB_SIO_WDGPIO56_REG_ENABLE,
+		.enablebit = WB_SIO_WDGPIO56_ENABLE_5,
+		.outputreg = WB_SIO_REG_OVTGPIO3456,
+		.outputppbit = WB_SIO_REG_OG3456_G5PP,
+		.ioreg = WB_SIO_WDGPIO56_REG_IO5,
+		.invreg = WB_SIO_WDGPIO56_REG_INV5,
+		.datareg = WB_SIO_WDGPIO56_REG_DATA5,
+		.conflict = {
+			.name = "UARTE",
+			.dev = WB_SIO_DEV_UARTE,
+			.testreg = WB_SIO_UARTE_REG_ENABLE,
+			.testbit = WB_SIO_UARTE_ENABLE_ON,
+			.warnonly = true
+		}
+	},
+	{ /* 5 */
+		.dev = WB_SIO_DEV_WDGPIO56,
+		.enablereg = WB_SIO_WDGPIO56_REG_ENABLE,
+		.enablebit = WB_SIO_WDGPIO56_ENABLE_6,
+		.outputreg = WB_SIO_REG_OVTGPIO3456,
+		.outputppbit = WB_SIO_REG_OG3456_G6PP,
+		.ioreg = WB_SIO_WDGPIO56_REG_IO6,
+		.invreg = WB_SIO_WDGPIO56_REG_INV6,
+		.datareg = WB_SIO_WDGPIO56_REG_DATA6,
+		.conflict = {
+			.name = "FDC",
+			.dev = WB_SIO_DEV_NONE,
+			.testreg = WB_SIO_REG_GLOBAL_OPT,
+			.testbit = WB_SIO_REG_GO_ENFDC,
+			.warnonly = false
+		}
+	}
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
+	/*
+	 * If for any reason we can't find this gpio number make sure we
+	 * don't access the winbond_gpio_infos array beyond its bounds.
+	 * Also, warn in this case, so we know something is seriously wrong.
+	 */
+	if (WARN_ON(i >= ARRAY_SIZE(winbond_gpio_infos)))
+		i = 0;
+
+	*info = &winbond_gpio_infos[i];
+
+	/*
+	 * GPIO2 (the second port) shares some pins with a basic PC
+	 * functionality, which is very likely controlled by the firmware.
+	 * Don't allow changing these pins by default.
+	 */
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
+	u16 *base = gpiochip_get_data(gc);
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
+	u16 *base = gpiochip_get_data(gc);
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
+	u16 *base = gpiochip_get_data(gc);
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
+	u16 *base = gpiochip_get_data(gc);
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
+	.base			= -1,
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
+	u16 *base = dev_get_platdata(&pdev->dev);
+	unsigned int i;
+
+	if (base == NULL)
+		return -EINVAL;
+
+	/*
+	 * Add 8 gpios for every GPIO port that was enabled in gpios
+	 * module parameter (that wasn't disabled earlier in
+	 * winbond_gpio_configure() & co. due to, for example, a pin conflict).
+	 */
+	winbond_gpio_chip.ngpio = 0;
+	for (i = 0; i < 5; i++)
+		if (gpios & BIT(i))
+			winbond_gpio_chip.ngpio += 8;
+
+	if (gpios & BIT(5))
+		winbond_gpio_chip.ngpio += 5;
+
+	winbond_gpio_chip.parent = &pdev->dev;
+
+	return devm_gpiochip_add_data(&pdev->dev, &winbond_gpio_chip, base);
+}
+
+static void winbond_gpio_configure_port0_pins(u16 base)
+{
+	u8 val;
+
+	val = winbond_sio_reg_read(base, WB_SIO_REG_GPIO1_MF);
+	if ((val & WB_SIO_REG_G1MF_FS) == WB_SIO_REG_G1MF_FS_GPIO1)
+		return;
+
+	pr_warn(WB_GPIO_DRIVER_NAME
+		": GPIO1 pins were connected to something else (%.2x), fixing\n",
+		(unsigned int)val);
+
+	val &= ~WB_SIO_REG_G1MF_FS;
+	val |= WB_SIO_REG_G1MF_FS_GPIO1;
+
+	winbond_sio_reg_write(base, WB_SIO_REG_GPIO1_MF, val);
+}
+
+static void winbond_gpio_configure_port1_check_i2c(u16 base)
+{
+	i2cgpio = !winbond_sio_reg_btest(base, WB_SIO_REG_I2C_PS,
+					 WB_SIO_REG_I2CPS_I2CFS);
+	if (!i2cgpio)
+		pr_warn(WB_GPIO_DRIVER_NAME
+			": disabling GPIO2.5 and GPIO2.6 as I2C is enabled\n");
+}
+
+static bool winbond_gpio_configure_port(u16 base, unsigned int idx)
+{
+	const struct winbond_gpio_info *info = &winbond_gpio_infos[idx];
+	const struct winbond_gpio_port_conflict *conflict = &info->conflict;
+
+	/* is there a possible conflicting device defined? */
+	if (conflict->name != NULL) {
+		if (conflict->dev != WB_SIO_DEV_NONE)
+			winbond_sio_select_logical(base, conflict->dev);
+
+		if (winbond_sio_reg_btest(base, conflict->testreg,
+					  conflict->testbit)) {
+			if (conflict->warnonly)
+				pr_warn(WB_GPIO_DRIVER_NAME
+					": enabled GPIO%u share pins with active %s\n",
+					idx + 1, conflict->name);
+			else {
+				pr_warn(WB_GPIO_DRIVER_NAME
+					": disabling GPIO%u as %s is enabled\n",
+					idx + 1, conflict->name);
+				return false;
+			}
+		}
+	}
+
+	/* GPIO1 and GPIO2 need some (additional) special handling */
+	if (idx == 0)
+		winbond_gpio_configure_port0_pins(base);
+	else if (idx == 1)
+		winbond_gpio_configure_port1_check_i2c(base);
+
+	winbond_sio_select_logical(base, info->dev);
+
+	winbond_sio_reg_bset(base, info->enablereg, info->enablebit);
+
+	if (ppgpios & BIT(idx))
+		winbond_sio_reg_bset(base, info->outputreg,
+				     info->outputppbit);
+	else if (odgpios & BIT(idx))
+		winbond_sio_reg_bclear(base, info->outputreg,
+				       info->outputppbit);
+	else
+		pr_notice(WB_GPIO_DRIVER_NAME ": GPIO%u pins are %s\n", idx + 1,
+			  winbond_sio_reg_btest(base, info->outputreg,
+						info->outputppbit) ?
+			  "push-pull" :
+			  "open drain");
+
+	return true;
+}
+
+static int winbond_gpio_configure(u16 base)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(winbond_gpio_infos); i++) {
+		if (!(gpios & BIT(i)))
+			continue;
+
+		if (!winbond_gpio_configure_port(base, i))
+			gpios &= ~BIT(i);
+	}
+
+	if (!(gpios & GENMASK(ARRAY_SIZE(winbond_gpio_infos) - 1, 0))) {
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
+/* probes chip at provided I/O base address, initializes and registers it */
+static int winbond_gpio_try_probe_init(u16 base)
+{
+	u16 chip;
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
+static int __init winbond_gpio_mod_init(void)
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
+	ret = winbond_gpio_try_probe_init(WB_SIO_BASE);
+	if (ret == -ENODEV || ret == -EBUSY)
+		ret = winbond_gpio_try_probe_init(WB_SIO_BASE_HIGH);
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
+static void __exit winbond_gpio_mod_exit(void)
+{
+	platform_device_unregister(winbond_gpio_pdev);
+	platform_driver_unregister(&winbond_gpio_pdriver);
+}
+
+module_init(winbond_gpio_mod_init);
+module_exit(winbond_gpio_mod_exit);
+
+/* This parameter sets which GPIO devices (ports) we enable */
+module_param(gpios, byte, 0444);
+MODULE_PARM_DESC(gpios,
+		 "bitmask of GPIO ports to enable (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
+
+/*
+ * These two parameters below set how we configure GPIO ports output drivers.
+ * It can't be a one bitmask since we need three values per port: push-pull,
+ * open-drain and keep as-is (this is the default).
+ */
+module_param(ppgpios, byte, 0444);
+MODULE_PARM_DESC(ppgpios,
+		 "bitmask of GPIO ports to set to push-pull mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
+
+module_param(odgpios, byte, 0444);
+MODULE_PARM_DESC(odgpios,
+		 "bitmask of GPIO ports to set to open drain mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
+
+/*
+ * GPIO2.0 and GPIO2.1 control a basic PC functionality that we
+ * don't allow tinkering with by default (it is very likely that the
+ * firmware owns these pins).
+ * These two parameters below allow overriding these prohibitions.
+ */
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
