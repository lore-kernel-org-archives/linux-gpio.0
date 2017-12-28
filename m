From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Thu, 28 Dec 2017 17:12:34 +0200
Message-ID: <1514473954.7000.418.camel@linux.intel.com>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:59821 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753293AbdL1PMh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Dec 2017 10:12:37 -0500
In-Reply-To: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Linus Walleij <linus.walleij@linaro.org>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Fri, 2017-12-22 at 19:58 +0100, Maciej S. Szmigiero wrote:
> This commit adds GPIO driver for Winbond Super I/Os.
> 
> Currently, only W83627UHG model (also known as Nuvoton NCT6627UD) is
> supported but in the future a support for other Winbond models, too,
> can
> be added to the driver.
> 
> A module parameter "gpios" sets a bitmask of GPIO ports to enable (bit
> 0 is
> GPIO1, bit 1 is GPIO2, etc.).
> One should be careful which ports one tinkers with since some might be
> managed by the firmware (for functions like powering on and off,
> sleeping,
> BIOS recovery, etc.) and some of GPIO port pins are physically shared
> with
> other devices included in the Super I/O chip.
 
> +config GPIO_WINBOND
> +	tristate "Winbond Super I/O GPIO support"
> +	help
> +	  This option enables support for GPIOs found on Winbond
> Super I/O
> +	  chips.
> +	  Currently, only W83627UHG (also known as Nuvoton NCT6627UD)
> is
> +	  supported.
> +
> +	  You will need to provide a module parameter "gpios", or a
> +	  boot-time parameter "gpio_winbond.gpios" with a bitmask of
> GPIO
> +	  ports to enable (bit 0 is GPIO1, bit 1 is GPIO2, etc.).

1. Why it's required?
2. GPIO1 -> GPIO0, GPIO2 -> GPIO1, etc ?

> +
> +	  To compile this driver as a module, choose M here: the
> module will
> +	  be called gpio-winbond.
> 

> +#include <linux/errno.h>
> +#include <linux/gpio.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Perhaps, alphabetically ordered?

> +
> +#define WB_GPIO_DRIVER_NAME "gpio-winbond"
> +
> +#define WB_SIO_BASE 0x2e
> +#define WB_SIO_BASE_HIGH 0x4e

Is it my mail client or you didn't use TAB(s) as separator?

> +#define WB_SIO_CHIP_ID_W83627UHG 0xa230
> +#define WB_SIO_CHIP_ID_W83627UHG_MASK 0xfff0

GENMASK()

> +
> +/* not an actual device number, just a value meaning 'no device' */
> +#define WB_SIO_DEV_NONE 0xff



> +
> +#define WB_SIO_DEV_UARTB 3
> +#define WB_SIO_UARTB_REG_ENABLE 0x30
> +#define WB_SIO_UARTB_ENABLE_ON 0

What does it mean?

1. ???
2. Register offset
3. Bit to enable

?

> +
> +#define WB_SIO_DEV_UARTC 6
> +#define WB_SIO_UARTC_REG_ENABLE 0x30
> +#define WB_SIO_UARTC_ENABLE_ON 0
> +
> +#define WB_SIO_DEV_GPIO34 7
> +#define WB_SIO_GPIO34_REG_ENABLE 0x30

> +#define WB_SIO_GPIO34_ENABLE_4 1
> +#define WB_SIO_GPIO34_ENABLE_3 0

Perhaps swap them?

> +#define WB_SIO_GPIO34_REG_IO3 0xe0
> +#define WB_SIO_GPIO34_REG_DATA3 0xe1
> +#define WB_SIO_GPIO34_REG_INV3 0xe2
> +#define WB_SIO_GPIO34_REG_IO4 0xe4
> +#define WB_SIO_GPIO34_REG_DATA4 0xe5
> +#define WB_SIO_GPIO34_REG_INV4 0xe6
> +
> +#define WB_SIO_DEV_WDGPIO56 8

> +#define WB_SIO_WDGPIO56_REG_ENABLE 0x30

Why do we have duplication here?

> +#define WB_SIO_WDGPIO56_ENABLE_6 2
> +#define WB_SIO_WDGPIO56_ENABLE_5 1

Swap.

> +#define WB_SIO_WDGPIO56_REG_IO5 0xe0
> +#define WB_SIO_WDGPIO56_REG_DATA5 0xe1
> +#define WB_SIO_WDGPIO56_REG_INV5 0xe2
> +#define WB_SIO_WDGPIO56_REG_IO6 0xe4
> +#define WB_SIO_WDGPIO56_REG_DATA6 0xe5
> +#define WB_SIO_WDGPIO56_REG_INV6 0xe6

Duplication?

> +
> +#define WB_SIO_DEV_GPIO12 9
> +#define WB_SIO_GPIO12_REG_ENABLE 0x30
> +#define WB_SIO_GPIO12_ENABLE_2 1
> +#define WB_SIO_GPIO12_ENABLE_1 0
> +#define WB_SIO_GPIO12_REG_IO1 0xe0
> +#define WB_SIO_GPIO12_REG_DATA1 0xe1
> +#define WB_SIO_GPIO12_REG_INV1 0xe2
> +#define WB_SIO_GPIO12_REG_IO2 0xe4
> +#define WB_SIO_GPIO12_REG_DATA2 0xe5
> +#define WB_SIO_GPIO12_REG_INV2 0xe6
> +
> +#define WB_SIO_DEV_UARTD 0xd
> +#define WB_SIO_UARTD_REG_ENABLE 0x30
> +#define WB_SIO_UARTD_ENABLE_ON 0
> +
> +#define WB_SIO_DEV_UARTE 0xe
> +#define WB_SIO_UARTE_REG_ENABLE 0x30
> +#define WB_SIO_UARTE_ENABLE_ON 0
> +
> +#define WB_SIO_REG_LOGICAL 7
> +
> +#define WB_SIO_REG_CHIP_MSB 0x20
> +#define WB_SIO_REG_CHIP_LSB 0x21
> +
> +#define WB_SIO_REG_DPD 0x22
> +#define WB_SIO_REG_DPD_UARTA 4
> +#define WB_SIO_REG_DPD_UARTB 5
> +
> +#define WB_SIO_REG_IDPD 0x23
> +#define WB_SIO_REG_IDPD_UARTF 7
> +#define WB_SIO_REG_IDPD_UARTE 6
> +#define WB_SIO_REG_IDPD_UARTD 5
> +#define WB_SIO_REG_IDPD_UARTC 4
> +
> +#define WB_SIO_REG_GLOBAL_OPT 0x24
> +#define WB_SIO_REG_GO_ENFDC 1
> +
> +#define WB_SIO_REG_OVTGPIO3456 0x29
> +#define WB_SIO_REG_OG3456_G6PP 7
> +#define WB_SIO_REG_OG3456_G5PP 5
> +#define WB_SIO_REG_OG3456_G4PP 4
> +#define WB_SIO_REG_OG3456_G3PP 3
> +
> +#define WB_SIO_REG_I2C_PS 0x2A
> +#define WB_SIO_REG_I2CPS_I2CFS 1
> +
> +#define WB_SIO_REG_GPIO1_MF 0x2c
> +#define WB_SIO_REG_G1MF_G2PP 7
> +#define WB_SIO_REG_G1MF_G1PP 6
> +#define WB_SIO_REG_G1MF_FS 3
> +#define WB_SIO_REG_G1MF_FS_UARTB 3
> +#define WB_SIO_REG_G1MF_FS_GPIO1 2
> +#define WB_SIO_REG_G1MF_FS_IR 1
> +#define WB_SIO_REG_G1MF_FS_IR_OFF 0
> +

> +static u8 gpios;
> +static u8 ppgpios;
> +static u8 odgpios;
> +static bool pledgpio;
> +static bool beepgpio;
> +static bool i2cgpio;

Hmm... Too many global variables.

> +
> +static int winbond_sio_enter(u16 base)
> +{
> +	if (request_muxed_region(base, 2, WB_GPIO_DRIVER_NAME) ==
> NULL) {

if (!request_...())

> +		pr_err(WB_GPIO_DRIVER_NAME ": cannot enter SIO at
> address %x\n",
> +		       (unsigned int)base);

%x, %hx, %hhx. No explicit casting.

Moreover, please, use dev_err() instead or drop this message completely.

> +		return -EBUSY;

> +	}
> +

> +	outb(WB_SIO_EXT_ENTER_KEY, base);
> +	outb(WB_SIO_EXT_ENTER_KEY, base);

Comment why double write is needed.

> +
> +	return 0;
> +}
> +
> +static void winbond_sio_select_logical(u16 base, u8 dev)
> +{
> +	outb(WB_SIO_REG_LOGICAL, base);
> +	outb(dev, base + 1);
> +}
> +
> +static void winbond_sio_leave(u16 base)
> +{
> +	outb(WB_SIO_EXT_EXIT_KEY, base);
> +
> +	release_region(base, 2);
> +}

> +static void winbond_sio_reg_write(u16 base, u8 reg, u8 data)
> +static u8 winbond_sio_reg_read(u16 base, u8 reg)
> +static void winbond_sio_reg_bset(u16 base, u8 reg, u8 bit)
> +static void winbond_sio_reg_bclear(u16 base, u8 reg, u8 bit)
> +static bool winbond_sio_reg_btest(u16 base, u8 reg, u8 bit)

regmap API?

> +static const struct winbond_gpio_info winbond_gpio_infos[6] = {

Certainly candidate for regmap API.

> +	{ /* 5 */
> +		.dev = WB_SIO_DEV_WDGPIO56,
> +		.enablereg = WB_SIO_WDGPIO56_REG_ENABLE,
> +		.enablebit = WB_SIO_WDGPIO56_ENABLE_6,
> +		.outputreg = WB_SIO_REG_OVTGPIO3456,
> +		.outputppbit = WB_SIO_REG_OG3456_G6PP,
> +		.ioreg = WB_SIO_WDGPIO56_REG_IO6,
> +		.invreg = WB_SIO_WDGPIO56_REG_INV6,
> +		.datareg = WB_SIO_WDGPIO56_REG_DATA6,
> +		.conflict = {
> +			.name = "FDC",
> +			.dev = WB_SIO_DEV_NONE,
> +			.testreg = WB_SIO_REG_GLOBAL_OPT,
> +			.testbit = WB_SIO_REG_GO_ENFDC,
> +			.warnonly = false
> +		}
> +	}
> +};
> +
> +/* returns whether changing a pin is allowed */
> +static bool winbond_gpio_get_info(unsigned int gpio_num,
> +				  const struct winbond_gpio_info
> **info)
> +{
> +	bool allow_changing = true;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(winbond_gpio_infos); i++) {
> +		if (!(gpios & BIT(i)))
> +			continue;

for_each_set_bit()

> +
> +		if (gpio_num < 8)
> +			break;
> +

> +		gpio_num -= 8;

Yeah, consider to use % and / paired, see below.

> +	}
> +
> +	/*
> +	 * If for any reason we can't find this gpio number make sure
> we
> +	 * don't access the winbond_gpio_infos array beyond its
> bounds.
> +	 * Also, warn in this case, so we know something is seriously
> wrong.
> +	 */
> +	if (WARN_ON(i >= ARRAY_SIZE(winbond_gpio_infos)))
> +		i = 0;

Something is even more seriously wrong if you are going to mess with
GPIO 0.

You have to return an error here.

Although it should not happen at all, AFAIU.

> +
> +	*info = &winbond_gpio_infos[i];
> +
> +	/*
> +	 * GPIO2 (the second port) shares some pins with a basic PC
> +	 * functionality, which is very likely controlled by the
> firmware.
> +	 * Don't allow changing these pins by default.
> +	 */
> +	if (i == 1) {
> +		if (gpio_num == 0 && !pledgpio)
> +			allow_changing = false;
> +		else if (gpio_num == 1 && !beepgpio)
> +			allow_changing = false;
> +		else if ((gpio_num == 5 || gpio_num == 6) &&
> !i2cgpio)
> +			allow_changing = false;

Instead of allow_changing perhaps you need to use gpio_valid_mask
(though it's not in upstream, yet? Linus?)

> +	}
> +
> +	return allow_changing;
> +}

> +static int winbond_gpio_direction_in(struct gpio_chip *gc,
> +				     unsigned int gpio_num)

It's not gpio_num, it's offset. That is how we usually refer to that
parameter in the drivers.

> +{
> +	u16 *base = gpiochip_get_data(gc);
> +	const struct winbond_gpio_info *info;
> +	int ret;
> +
> +	if (!winbond_gpio_get_info(gpio_num, &info))
> +		return -EACCES;
> +
> +	gpio_num %= 8;

Usually it goes paired with / 8 or alike.

Note, that
% followed by / makes *one* assembly command on some architectures.

Same comments to the rest of similar functions.

> +
> +	ret = winbond_sio_enter(*base);
> +	if (ret)
> +		return ret;
> +
> +	winbond_sio_select_logical(*base, info->dev);
> +
> +	winbond_sio_reg_bset(*base, info->ioreg, gpio_num);
> +
> +	winbond_sio_leave(*base);
> +
> +	return 0;
> +}
> +
> +static int winbond_gpio_direction_out(struct gpio_chip *gc,
> +				      unsigned int gpio_num,
> +				      int val)
> +{
> +	u16 *base = gpiochip_get_data(gc);

out*() and in*() take unsigned long. So should this driver provide.

> +	return 0;
> +}
> +
> +static void winbond_gpio_set(struct gpio_chip *gc, unsigned int
> gpio_num,
> +			     int val)
> +{
> +	u16 *base = gpiochip_get_data(gc);
> +	const struct winbond_gpio_info *info;
> +
> +	if (!winbond_gpio_get_info(gpio_num, &info))
> +		return;
> +
> +	gpio_num %= 8;
> +
> +	if (winbond_sio_enter(*base) != 0)
> +		return;
> +
> +	winbond_sio_select_logical(*base, info->dev);
> +

> +	if (winbond_sio_reg_btest(*base, info->invreg, gpio_num))
> +		val = !val;
> +
> +	if (val)

if (val ^ winbond_sio_reg_btest()) ?

> +		winbond_sio_reg_bset(*base, info->datareg, gpio_num);
> +	else
> +		winbond_sio_reg_bclear(*base, info->datareg,
> gpio_num);

> +}
> +
> +static struct gpio_chip winbond_gpio_chip = {
> +	.base			= -1,
> +	.label			= WB_GPIO_DRIVER_NAME,

> +	.owner			= THIS_MODULE,



> +	.can_sleep		= true,
> +	.get			= winbond_gpio_get,
> +	.direction_input	= winbond_gpio_direction_in,
> +	.set			= winbond_gpio_set,
> +	.direction_output	= winbond_gpio_direction_out,
> +};
> +
> +static int winbond_gpio_probe(struct platform_device *pdev)
> +{
> +	u16 *base = dev_get_platdata(&pdev->dev);
> +	unsigned int i;
> +
> +	if (base == NULL)
> +		return -EINVAL;
> +
> +	/*
> +	 * Add 8 gpios for every GPIO port that was enabled in gpios
> +	 * module parameter (that wasn't disabled earlier in
> +	 * winbond_gpio_configure() & co. due to, for example, a pin
> conflict).
> +	 */
> +	winbond_gpio_chip.ngpio = 0;

> +	for (i = 0; i < 5; i++)

5 is a magic.

> +		if (gpios & BIT(i))
> +			winbond_gpio_chip.ngpio += 8;

for_each_set_bit()

> +
> +	if (gpios & BIT(5))
> +		winbond_gpio_chip.ngpio += 5;

Comment needed for this one.

> +
> +	winbond_gpio_chip.parent = &pdev->dev;
> +
> +	return devm_gpiochip_add_data(&pdev->dev, &winbond_gpio_chip,
> base);
> +}
> +
> +static void winbond_gpio_configure_port0_pins(u16 base)
> +{
> +	u8 val;
> +
> +	val = winbond_sio_reg_read(base, WB_SIO_REG_GPIO1_MF);
> +	if ((val & WB_SIO_REG_G1MF_FS) == WB_SIO_REG_G1MF_FS_GPIO1)
> +		return;
> +
> +	pr_warn(WB_GPIO_DRIVER_NAME
> +		": GPIO1 pins were connected to something else
> (%.2x), fixing\n",
> +		(unsigned int)val);
> +
> +	val &= ~WB_SIO_REG_G1MF_FS;
> +	val |= WB_SIO_REG_G1MF_FS_GPIO1;
> +
> +	winbond_sio_reg_write(base, WB_SIO_REG_GPIO1_MF, val);
> +}
> +
> +static void winbond_gpio_configure_port1_check_i2c(u16 base)
> +{
> +	i2cgpio = !winbond_sio_reg_btest(base, WB_SIO_REG_I2C_PS,
> +					 WB_SIO_REG_I2CPS_I2CFS);
> +	if (!i2cgpio)
> +		pr_warn(WB_GPIO_DRIVER_NAME
> +			": disabling GPIO2.5 and GPIO2.6 as I2C is
> enabled\n");
> +}
> +
> +static bool winbond_gpio_configure_port(u16 base, unsigned int idx)
> +{
> +	const struct winbond_gpio_info *info =
> &winbond_gpio_infos[idx];
> +	const struct winbond_gpio_port_conflict *conflict = &info-
> >conflict;
> +
> +	/* is there a possible conflicting device defined? */
> +	if (conflict->name != NULL) {
> +		if (conflict->dev != WB_SIO_DEV_NONE)
> +			winbond_sio_select_logical(base, conflict-
> >dev);
> +
> +		if (winbond_sio_reg_btest(base, conflict->testreg,
> +					  conflict->testbit)) {
> +			if (conflict->warnonly)
> +				pr_warn(WB_GPIO_DRIVER_NAME
> +					": enabled GPIO%u share pins
> with active %s\n",
> +					idx + 1, conflict->name);
> +			else {
> +				pr_warn(WB_GPIO_DRIVER_NAME
> +					": disabling GPIO%u as %s is
> enabled\n",
> +					idx + 1, conflict->name);
> +				return false;
> +			}
> +		}
> +	}
> +
> +	/* GPIO1 and GPIO2 need some (additional) special handling */
> +	if (idx == 0)
> +		winbond_gpio_configure_port0_pins(base);
> +	else if (idx == 1)
> +		winbond_gpio_configure_port1_check_i2c(base);
> +
> +	winbond_sio_select_logical(base, info->dev);
> +
> +	winbond_sio_reg_bset(base, info->enablereg, info->enablebit);
> +
> +	if (ppgpios & BIT(idx))
> +		winbond_sio_reg_bset(base, info->outputreg,
> +				     info->outputppbit);
> +	else if (odgpios & BIT(idx))
> +		winbond_sio_reg_bclear(base, info->outputreg,
> +				       info->outputppbit);
> +	else
> +		pr_notice(WB_GPIO_DRIVER_NAME ": GPIO%u pins are
> %s\n", idx + 1,
> +			  winbond_sio_reg_btest(base, info-
> >outputreg,
> +						info->outputppbit) ?
> +			  "push-pull" :
> +			  "open drain");
> +
> +	return true;
> +}
> +
> +static int winbond_gpio_configure(u16 base)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(winbond_gpio_infos); i++) {
> +		if (!(gpios & BIT(i)))
> +			continue;
> +
> +		if (!winbond_gpio_configure_port(base, i))
> +			gpios &= ~BIT(i);
> +	}
> +
> +	if (!(gpios & GENMASK(ARRAY_SIZE(winbond_gpio_infos) - 1,
> 0))) {
> +		pr_err(WB_GPIO_DRIVER_NAME
> +		       ": please use 'gpios' module parameter to
> select some active GPIO ports to enable\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_device *winbond_gpio_pdev;
> +
> +/* probes chip at provided I/O base address, initializes and
> registers it */
> +static int winbond_gpio_try_probe_init(u16 base)

No.

Introduce 

struct winbond_sio_device {
 struct device *dev;
 unsigned long base;
};


Use it everywhere, including driver data.

> +{
> +	u16 chip;
> +	int ret;
> +
> +	ret = winbond_sio_enter(base);
> +	if (ret)
> +		return ret;
> +
> +	chip = winbond_sio_reg_read(base, WB_SIO_REG_CHIP_MSB) << 8;
> +	chip |= winbond_sio_reg_read(base, WB_SIO_REG_CHIP_LSB);
> +
> +	pr_notice(WB_GPIO_DRIVER_NAME
> +		  ": chip ID at %hx is %.4x\n",
> +		  (unsigned int)base,
> +		  (unsigned int)chip);

No explicit casting.

If you do such, you need to think twice what you *do wrong*.

There are really rare cases when it's needed.

> +
> +	if ((chip & WB_SIO_CHIP_ID_W83627UHG_MASK) !=
> +	    WB_SIO_CHIP_ID_W83627UHG) {
> +		pr_err(WB_GPIO_DRIVER_NAME
> +		       ": not an our chip\n");
> +		winbond_sio_leave(base);
> +		return -ENODEV;
> +	}
> +
> +	ret = winbond_gpio_configure(base);
> +
> +	winbond_sio_leave(base);
> +
> +	if (ret)
> +		return ret;
> +
> +	winbond_gpio_pdev =
> platform_device_alloc(WB_GPIO_DRIVER_NAME, -1);
> +	if (winbond_gpio_pdev == NULL)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add_data(winbond_gpio_pdev,
> +				       &base, sizeof(base));
> +	if (ret) {
> +		pr_err(WB_GPIO_DRIVER_NAME
> +		       ": cannot add platform data\n");
> +		goto ret_put;
> +	}
> +
> +	ret = platform_device_add(winbond_gpio_pdev);
> +	if (ret) {
> +		pr_err(WB_GPIO_DRIVER_NAME
> +		       ": cannot add platform device\n");
> +		goto ret_put;
> +	}
> +
> +	return 0;
> +
> +ret_put:
> +	platform_device_put(winbond_gpio_pdev);

> +	winbond_gpio_pdev = NULL;

???

> +
> +	return ret;
> +}
> 

> +static int __init winbond_gpio_mod_init(void)
> +{
> +	int ret;
> +
> +	if (ppgpios & odgpios) {
> +		pr_err(WB_GPIO_DRIVER_NAME

#define pr_fmt

> +			": some GPIO ports are set both to push-pull
> and open drain mode at the same time\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = platform_driver_register(&winbond_gpio_pdriver);
> +	if (ret)
> +		return ret;
> +
> +	ret = winbond_gpio_try_probe_init(WB_SIO_BASE);
> +	if (ret == -ENODEV || ret == -EBUSY)
> +		ret = winbond_gpio_try_probe_init(WB_SIO_BASE_HIGH);
> +	if (ret)
> +		goto ret_unreg;
> +
> +	return 0;
> +
> +ret_unreg:
> +	platform_driver_unregister(&winbond_gpio_pdriver);
> +
> +	return ret;

Oy vey, is it really right place to do this?

> +}
> +
> +static void __exit winbond_gpio_mod_exit(void)
> +{

> +	platform_device_unregister(winbond_gpio_pdev);
> +	platform_driver_unregister(&winbond_gpio_pdriver);

Hmm... what?

> +}
> +
> +module_init(winbond_gpio_mod_init);
> +module_exit(winbond_gpio_mod_exit);
> 

> +MODULE_AUTHOR("Maciej S. Szmigiero <mail@maciej.szmigiero.name>");
> +MODULE_DESCRIPTION("GPIO interface for Winbond Super I/O chips");

> +MODULE_LICENSE("GPL");

Does it match SPDX identifier?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
