From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Fri, 29 Dec 2017 12:27:12 +0200
Message-ID: <1514543232.7000.507.camel@linux.intel.com>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
         <1514473954.7000.418.camel@linux.intel.com>
         <786affb2-68e9-1c5d-6a73-98f3ea09f7b1@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:46805 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750929AbdL2K1P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Dec 2017 05:27:15 -0500
In-Reply-To: <786affb2-68e9-1c5d-6a73-98f3ea09f7b1@maciej.szmigiero.name>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Fri, 2017-12-29 at 00:44 +0100, Maciej S. Szmigiero wrote:
> On 28.12.2017 16:12, Andy Shevchenko wrote:
> > On Fri, 2017-12-22 at 19:58 +0100, Maciej S. Szmigiero wrote:
> > > 

> > > +	  You will need to provide a module parameter "gpios", or
> > > a
> > > +	  boot-time parameter "gpio_winbond.gpios" with a bitmask
> > > of
> > > GPIO
> > > +	  ports to enable (bit 0 is GPIO1, bit 1 is GPIO2, etc.).
> > 
> > 1. Why it's required?
> 
> It is required bacause "[o]ne should be careful which ports one
> tinkers
> with since some might be managed by the firmware (for functions like
> powering on and off, sleeping, BIOS recovery, etc.) and some of GPIO
> port
> pins are physically shared with other devices included in the Super
> I/O
> chip".

I would like to be clear, I was asking about module parameters. Nowadays
we won't have new parameters to the kernel.

Is there any strong argument to do it so? Is it one above? Can we detect
as much as possible run time?

> > 2. GPIO1 -> GPIO0, GPIO2 -> GPIO1, etc ?
> 
> The chip datasheet calls GPIO devices and their pins "GPIO1", "GPIO2",
> etc., however the driver uses a more common zero-based indexing (so,
> for example, we don't waste the zeroth bit).

I dunno what makes less confusion here.

One way, is to provide labels according to data sheet (not so flexible,
though), another waste 0th bit for good.

Linus, what's your opinion?

> > > +#include <linux/errno.h>
> > > +#include <linux/gpio.h>
> > > +#include <linux/ioport.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > 
> > Perhaps, alphabetically ordered?
> 
> Isn't 'e' < 'g' < 'i' < 'm' < 'p' ?

Ah, indeed!

> > > +
> > > +#define WB_SIO_DEV_UARTB 3
> > > +#define WB_SIO_UARTB_REG_ENABLE 0x30
> > > +#define WB_SIO_UARTB_ENABLE_ON 0
> > 
> > What does it mean?
> > 
> > 1. ???
> 
> Super I/O logical device number for UART B.
> 
> > 2. Register offset
> 
> (Device) enable register offset.
> 
> > 3. Bit to enable
> 
> (Device) enable register bit index.


> > > +#define WB_SIO_DEV_WDGPIO56 8
> > > +#define WB_SIO_WDGPIO56_REG_ENABLE 0x30
> > 
> > Why do we have duplication here?
> 
> Registers with offset >= 0x30 are
> specific for a particular device.
> 
> That's a register in a different device
> (which happen to have similar function as
> register 0x30 in, for example, UARTC but
> nothing in the datasheet guarantees that
> such mapping will be universal).

OK, then can you put a comment like this one before this very definition
block (with offsets >= 0x30) and put a one line comment before each
*different* device.

> > > +static u8 gpios;
> > > +static u8 ppgpios;
> > > +static u8 odgpios;
> > > +static bool pledgpio;
> > > +static bool beepgpio;
> > > +static bool i2cgpio;
> > 
> > Hmm... Too many global variables.
> 
> All of them, besides i2cgpio, are module parameters, which require
> global variables.

Same question as on top of this mail.
Why do we need all of them?

> > > +static void winbond_sio_reg_write(u16 base, u8 reg, u8 data)
> > > +static u8 winbond_sio_reg_read(u16 base, u8 reg)
> > > +static void winbond_sio_reg_bset(u16 base, u8 reg, u8 bit)
> > > +static void winbond_sio_reg_bclear(u16 base, u8 reg, u8 bit)
> > > +static bool winbond_sio_reg_btest(u16 base, u8 reg, u8 bit)
> > 
> > regmap API?
> 
> Looking at the regmap API:
> * It does not support a I/O port space,

Not an issue, you may provide your own IO accessors.

> * It does not support a shared (muxed) register space, where one needs
> to first request the space for a particular driver, then can perform
> required sequence of operations, then should release the space,

If it's an MFD, it would be done at MFD level and shared across devices.
Also, there is no problem to remap same IO space as many times as
driver(s) want(s) to.

> * It does not support multiple logical devices sharing a register
> address space where one needs first to select the logical device, then
> perform the required sequence of operations.

We have MFD for precisely that kind of devices.

> > > +	for (i = 0; i < ARRAY_SIZE(winbond_gpio_infos); i++) {
> > > +		if (!(gpios & BIT(i)))
> > > +			continue;
> > 
> > for_each_set_bit()
> 
> Do we really want to replace a simple 6-iteration "for" loop with a
> one that (possibly) does a function call at setup time then an another
> per iteration?

Yes. Rationale is:
- makes less LOCs
- makes code more readable and understandble at a glance
- unloads optimization stuff to compiler's shoulders.

> 
> > > +
> > > +		if (gpio_num < 8)
> > > +			break;
> > > +
> > > +		gpio_num -= 8;
> > 
> > Yeah, consider to use % and / paired, see below.
> 
> Here it is only a simple subtraction of 8 lines per each set bit in
> 'gpios', how do you suggest to replace it with a faster
> division-with-reminder operation (I guess it isn't supposed to be 
> "if (gpio_num / 8 == 0) break;")?

Looking above and below, I actually missed that what you need is
hweight().

> > > +	if (WARN_ON(i >= ARRAY_SIZE(winbond_gpio_infos)))
> > > +		i = 0;
> > 
> > Something is even more seriously wrong if you are going to mess with
> > GPIO 0.
> > 
> > You have to return an error here.
> > 
> > Although it should not happen at all, AFAIU.
> 
> Yes, this condition should never happen in principle (it's only a
> defensive programming check) so I think that printing a warning and
> letting it read the first GPIO that is present while disallowing write
> access would be fine in this very unlikely situation.

I think it's just a waste of effort. If this happens it happens to all
GPIO drivers, otherwise it might be some HW issue with memory, for
example, that again makes entire system unstable.

% git grep -n WARN -- drivers/gpio/ | cut -f1 -d: | sort -u
drivers/gpio/devres.c
drivers/gpio/gpio-aspeed.c
drivers/gpio/gpio-brcmstb.c
drivers/gpio/gpio-bt8xx.c
drivers/gpio/gpio-davinci.c
drivers/gpio/gpio-grgpio.c
drivers/gpio/gpiolib-acpi.c
drivers/gpio/gpiolib.c
drivers/gpio/gpiolib-of.c
drivers/gpio/gpio-omap.c
drivers/gpio/gpio-tegra186.c
drivers/gpio/gpio-thunderx.c
drivers/gpio/gpio-twl4030.c
drivers/gpio/gpio-tz1090.c
drivers/gpio/gpio-uniphier.c
drivers/gpio/gpio-zynq.c

Basically above list minus 4 library files (and perhaps even less to
care about similar "should never happen" cases).

$ ls -1 drivers/gpio/ | wc -l
147

> > > +	/*
> > > +	 * GPIO2 (the second port) shares some pins with a basic
> > > PC
> > > +	 * functionality, which is very likely controlled by the
> > > firmware.
> > > +	 * Don't allow changing these pins by default.
> > > +	 */
> > > +	if (i == 1) {
> > > +		if (gpio_num == 0 && !pledgpio)
> > > +			allow_changing = false;
> > > +		else if (gpio_num == 1 && !beepgpio)
> > > +			allow_changing = false;
> > > +		else if ((gpio_num == 5 || gpio_num == 6) &&
> > > !i2cgpio)
> > > +			allow_changing = false;
> > 
> > Instead of allow_changing perhaps you need to use gpio_valid_mask
> > (though it's not in upstream, yet? Linus?)
> 
> Can't find such identifier in the gpio tree (devel branch).

It's not there, that's why I asked Linus to comment.

> > > +	gpio_num %= 8;
> > 
> > Usually it goes paired with / 8 or alike.
> > 
> > Note, that
> > % followed by / makes *one* assembly command on some architectures.
> > 
> > Same comments to the rest of similar functions.
> 
> I kind of understand what you had in mind, but I have a simpler
> solution:
> I will simply return the reduced gpio number (or offset) from
> winbond_gpio_get_info() function.
> This way no division (or reminder) operation is necessary at all.

Sounds even better!

> > > +	if (winbond_sio_reg_btest(*base, info->invreg, gpio_num))
> > > +		val = !val;
> > > +
> > > +	if (val)
> > 
> > if (val ^ winbond_sio_reg_btest()) ?
> 
> Ok.

Just to be clear, I put "question mark" at the end of my proposals in
which I completely leave choice on author(s) / maintainer(s).

> > > +	/*
> > > +	 * Add 8 gpios for every GPIO port that was enabled in
> > > gpios
> > > +	 * module parameter (that wasn't disabled earlier in
> > > +	 * winbond_gpio_configure() & co. due to, for example, a
> > > pin
> > > conflict).
> > > +	 */
> > > +	winbond_gpio_chip.ngpio = 0;
> > > +	for (i = 0; i < 5; i++)
> > 
> > 5 is a magic.
> 
> Ok, will replace with ARRAY_SIZE as it is done in similar places.
> 
> > > +		if (gpios & BIT(i))
> > > +			winbond_gpio_chip.ngpio += 8;
> > 
> > for_each_set_bit()
> 
> The same situation as with the for_each_set_bit() remark above.

I believe hweight() is suitable here.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
