From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Mon, 25 Dec 2017 01:00:00 +0100
Message-ID: <f3ebd850-c301-2adb-95e7-3a1f37c2259c@maciej.szmigiero.name>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <20171224224215.GA2372@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:39408 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751265AbdLYAAF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 24 Dec 2017 19:00:05 -0500
In-Reply-To: <20171224224215.GA2372@sophia>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On 24.12.2017 23:42, William Breathitt Gray wrote:
> On Fri, Dec 22, 2017 at 07:58:49PM +0100, Maciej S. Szmigiero wrote:
>> This commit adds GPIO driver for Winbond Super I/Os.
>>
>> Currently, only W83627UHG model (also known as Nuvoton NCT6627UD) is
>> supported but in the future a support for other Winbond models, too, can
>> be added to the driver.
>>
>> A module parameter "gpios" sets a bitmask of GPIO ports to enable (bit 0 is
>> GPIO1, bit 1 is GPIO2, etc.).
>> One should be careful which ports one tinkers with since some might be
>> managed by the firmware (for functions like powering on and off, sleeping,
>> BIOS recovery, etc.) and some of GPIO port pins are physically shared with
>> other devices included in the Super I/O chip.
>>
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>> ---
>> Changes from v1:
(..)
>>
>> Didn't change "linux/errno.h" and "linux/gpio.h" includes to
>> "linux/driver.h" since there is no such file in the current linux-gpio
>> tree and so the driver would not compile with this change.
>> Other GPIO drivers are using these former two include files, too.

Hi William,

> 
> Hi Maciej,
> 
> Sorry for the late response; it looks like you already made it to
> version 2 of this patch from Linus' initial review. I'll leave the GPIO
> subsystem related code to him, and stick to the ISA bus style LPC
> interface communication in my review. ;)
> 
> First a quick clarification: I suspect Linus meant to suggest
> 
>     +#include <linux/gpio/driver.h>
> 
> as an alternative to the "linux/errno.h" and "linux/gpio.h" includes.

Thanks for your overall input and clarification, will change these
headers to "linux/gpio/driver.h" in a respin.

(..)
>> diff --git a/drivers/gpio/gpio-winbond.c b/drivers/gpio/gpio-winbond.c
>> new file mode 100644
>> index 000000000000..385855fb6c9e
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-winbond.c
>> @@ -0,0 +1,758 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * GPIO interface for Winbond Super I/O chips
>> + * Currently, only W83627UHG (Nuvoton NCT6627UD) is supported.
>> + *
>> + * Author: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/gpio.h>
>> +#include <linux/ioport.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> 
> I suggest taking a look at the "linux/isa.h" file. For ISA-style
> communication such as you would have for LPC interface device, the ISA
> subsystem can be more practical to utilize than creating a platform
> device.
> 
> The 104-IDIO-16 GPIO driver can serve as a good template for ISA-style
> drivers; you can find it at drivers/gpio/gpio-104-idio-16.c

OK, will convert the driver to use the ISA instead of platform bus.

(..)
>> +static struct platform_device *winbond_gpio_pdev;
>> +
>> +/* probes chip at provided I/O base address, initializes and registers it */
>> +static int winbond_gpio_try_probe_init(u16 base)
>> +{
>> +	u16 chip;
>> +	int ret;
>> +
>> +	ret = winbond_sio_enter(base);
>> +	if (ret)
>> +		return ret;
>> +
>> +	chip = winbond_sio_reg_read(base, WB_SIO_REG_CHIP_MSB) << 8;
>> +	chip |= winbond_sio_reg_read(base, WB_SIO_REG_CHIP_LSB);
>> +
>> +	pr_notice(WB_GPIO_DRIVER_NAME
>> +		  ": chip ID at %hx is %.4x\n",
>> +		  (unsigned int)base,
>> +		  (unsigned int)chip);
>> +
>> +	if ((chip & WB_SIO_CHIP_ID_W83627UHG_MASK) !=
>> +	    WB_SIO_CHIP_ID_W83627UHG) {
>> +		pr_err(WB_GPIO_DRIVER_NAME
>> +		       ": not an our chip\n");
>> +		winbond_sio_leave(base);
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = winbond_gpio_configure(base);
>> +
>> +	winbond_sio_leave(base);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	winbond_gpio_pdev = platform_device_alloc(WB_GPIO_DRIVER_NAME, -1);
>> +	if (winbond_gpio_pdev == NULL)
>> +		return -ENOMEM;
>> +
>> +	ret = platform_device_add_data(winbond_gpio_pdev,
>> +				       &base, sizeof(base));
>> +	if (ret) {
>> +		pr_err(WB_GPIO_DRIVER_NAME
>> +		       ": cannot add platform data\n");
>> +		goto ret_put;
>> +	}
>> +
>> +	ret = platform_device_add(winbond_gpio_pdev);
>> +	if (ret) {
>> +		pr_err(WB_GPIO_DRIVER_NAME
>> +		       ": cannot add platform device\n");
>> +		goto ret_put;
>> +	}
> 
> These platform_device functions can all go away if you take advantage of
> the ISA subsystem; the ISA driver handles multiple device allocations
> for you, and feeds each new device structure to the registered probe
> callback you set.

OK, I see (although the driver supports just one chip per system since
motherboards don't have multiple Super I/O chips).

> 
> By the way Linus, this is the ISA bus equivalent of an "autodetect" you
> were hoping for in your version 1 responses. It is not a true autodetect
> in the sense that hardware does not determine the device, but rather the
> ISA subsystem fakes detection of the devices to feed to the probe
> callback so that the subsequent driver code fits the device driver model
> closer to how other subsystems expect it; thus the difference between an
> ISA and PCI device are abstracted away by their respective ISA and PCI
> bus drivers.

OK.

>> +
>> +	return 0;
>> +
>> +ret_put:
>> +	platform_device_put(winbond_gpio_pdev);
>> +	winbond_gpio_pdev = NULL;
>> +
>> +	return ret;
>> +}
>> +
>> +static struct platform_driver winbond_gpio_pdriver = {
>> +	.driver = {
>> +		.name	= WB_GPIO_DRIVER_NAME,
>> +	},
>> +	.probe		= winbond_gpio_probe,
>> +};
> 
> Reimplement this as a struct isa_driver with respective probe callback.

OK.

>> +
>> +static int __init winbond_gpio_mod_init(void)
>> +{
>> +	int ret;
>> +
>> +	if (ppgpios & odgpios) {
>> +		pr_err(WB_GPIO_DRIVER_NAME
>> +			": some GPIO ports are set both to push-pull and open drain mode at the same time\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = platform_driver_register(&winbond_gpio_pdriver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = winbond_gpio_try_probe_init(WB_SIO_BASE);
>> +	if (ret == -ENODEV || ret == -EBUSY)
>> +		ret = winbond_gpio_try_probe_init(WB_SIO_BASE_HIGH);
>> +	if (ret)
>> +		goto ret_unreg;
>> +
>> +	return 0;
>> +
>> +ret_unreg:
>> +	platform_driver_unregister(&winbond_gpio_pdriver);
>> +
>> +	return ret;
>> +}
>> +
>> +static void __exit winbond_gpio_mod_exit(void)
>> +{
>> +	platform_device_unregister(winbond_gpio_pdev);
>> +	platform_driver_unregister(&winbond_gpio_pdriver);
>> +}
>> +
>> +module_init(winbond_gpio_mod_init);
>> +module_exit(winbond_gpio_mod_exit);
> 
> The winbond_gpio_mod_init and winbond_gpio_mod_exit functions can be
> entirely removed as the ISA bus driver handles this for you. Replace the
> module_init and module_exit macros with simply a module_isa_driver
> macro.

OK.

> The winbond_gpio_try_probe_init function call should now be moved to the
> probe callback.
> 
> I see that you have a hard-coded WB_SIO_BASE I/O port address. Rather, I
> would suggest implementing a "base" module parameter array similar to
> the 104-IDIO-16 driver; this will match the current convention used by
> ISA-style drivers (I know in this case we only have one device, but it's
> good to follow convention for other users familar with the ISA
> subsystem).
>
> For reference, when I want to load the 104-IDIO-16 GPIO driver to handle
> 2 distinct 104-idio-16 devices (one located at 0x200 and the other at
> 0x300) on my system, I do something like the following:
> 
>     # modprobe gpio-104-idio-16 base=0x200,0x300 irq=3,5
> 
> Your Winbond driver will only have the "base" module parameter, but you
> get the idea: the user can pass in the base address for each specific
> device.

The device has just two hardcoded I/O port addresses, so 99% of users
would probably want the driver to probe these two addresses
automatically without them needing to provide the base address
explicitly.

However, I can add the "base" module parameter as an override - the
driver then will simply use it if it is provided, otherwise will try
the hardcoded addresses.

> By the way, don't hesitate to ask for more information on the ISA
> subsystem -- a lot of maintainers are unaware that it even exists since
> so few devices nowadays use ISA-style communication -- but I'm always
> happy to help. :)

Okay, thanks.

> William Breathitt Gray

Best regards,
Maciej Szmigiero
 
>> +
>> +/* This parameter sets which GPIO devices (ports) we enable */
>> +module_param(gpios, byte, 0444);
>> +MODULE_PARM_DESC(gpios,
>> +		 "bitmask of GPIO ports to enable (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
>> +
>> +/*
>> + * These two parameters below set how we configure GPIO ports output drivers.
>> + * It can't be a one bitmask since we need three values per port: push-pull,
>> + * open-drain and keep as-is (this is the default).
>> + */
>> +module_param(ppgpios, byte, 0444);
>> +MODULE_PARM_DESC(ppgpios,
>> +		 "bitmask of GPIO ports to set to push-pull mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
>> +
>> +module_param(odgpios, byte, 0444);
>> +MODULE_PARM_DESC(odgpios,
>> +		 "bitmask of GPIO ports to set to open drain mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
>> +
>> +/*
>> + * GPIO2.0 and GPIO2.1 control a basic PC functionality that we
>> + * don't allow tinkering with by default (it is very likely that the
>> + * firmware owns these pins).
>> + * These two parameters below allow overriding these prohibitions.
>> + */
>> +module_param(pledgpio, bool, 0644);
>> +MODULE_PARM_DESC(pledgpio,
>> +		 "enable changing value of GPIO2.0 bit (Power LED), default no.");
>> +
>> +module_param(beepgpio, bool, 0644);
>> +MODULE_PARM_DESC(beepgpio,
>> +		 "enable changing value of GPIO2.1 bit (BEEP), default no.");
>> +
>> +MODULE_AUTHOR("Maciej S. Szmigiero <mail@maciej.szmigiero.name>");
>> +MODULE_DESCRIPTION("GPIO interface for Winbond Super I/O chips");
>> +MODULE_LICENSE("GPL");

