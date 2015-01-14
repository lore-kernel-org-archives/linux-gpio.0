From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v1 5/5] gpio: document basic mmio gpio library
Date: Wed, 14 Jan 2015 14:22:26 +0900
Message-ID: <CAAVeFu+j_UTQRw+Qhdfj4wAq3usc=Y=f-ACS3J6VH-PyRjLPgA@mail.gmail.com>
References: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
 <1417435778-21879-6-git-send-email-kamlakant.patel@linaro.org>
 <CAAVeFuJ0iOY7XdZfhMUyo=Hsh7xjF-GNqk6DkAT-ZwydpsE1_Q@mail.gmail.com>
 <CA+aN+ytaGkpxh81e+1r8-05nm4sw5oKb2bykiiEuPUzAeqx6Ow@mail.gmail.com> <20141218134417.GB2518@linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:32789 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750715AbbANFWr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 00:22:47 -0500
In-Reply-To: <20141218134417.GB2518@linaro>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>

On Thu, Dec 18, 2014 at 10:44 PM, Kamlakant Patel
<kamlakant.patel@linaro.org> wrote:
> On Thu, Dec 04, 2014 at 05:52:24PM +0530, Kamlakant Patel wrote:
>> On 4 December 2014 at 14:42, Alexandre Courbot <gnurou@gmail.com> wrote:
>> > On Mon, Dec 1, 2014 at 9:09 PM,  <kamlakant.patel@linaro.org> wrote:
>> >> From: Kamlakant Patel <kamlakant.patel@linaro.org>
>> >>
>> >> This is a brief documentation on how to use GPIO Generic
>> >> library for memory-mapped GPIO controllers.
>> >>
>> >> Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
>> >> ---
>> >>  Documentation/gpio/driver.txt | 50 +++++++++++++++++++++++++++++++++++++++++++
>> >>  1 file changed, 50 insertions(+)
>> >
>> > Yum, more doc!
>> >
>> >>
>> >> diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
>> >> index 31e0b5d..563abea 100644
>> >> --- a/Documentation/gpio/driver.txt
>> >> +++ b/Documentation/gpio/driver.txt
>> >> @@ -190,3 +190,53 @@ gpiochip_free_own_desc().
>> >>  These functions must be used with care since they do not affect module use
>> >>  count. Do not use the functions to request gpio descriptors not owned by the
>> >>  calling driver.
>> >> +
>> >> +
>> >> +Generic driver for memory-mapped GPIO controllers
>> >> +-------------------------------------------------
>> >> +The GPIO generic library provides support for basic platform_device
>> >> +memory-mapped GPIO controllers, which can be accessed by selecting Kconfig
>> >> +symbol GPIO_GENERIC and using library functions provided by GPIO generic
>> >> +driver (see drivers/gpio/gpio-generic.c).
>> >> +The simplest form of a GPIO controller that the driver support is just a
>> >
>> > s/support/supports
>> >
>> >> +single "data" register, where GPIO state can be read and/or written.
>> >> +
>> >> +The driver can be registered using "basic-mmio-gpio" or for big-endian
>> >> +notation support use "basic-mmio-gpio-be". The code will configure gpio_chip
>> >
>> > Using where? You should say that this is for the platform device name.
>> >
>> >> +and issue gpiochip_add().
>> >
>> >> +
>> >> +The driver supports:
>> >> +- 8/16/32/64 bits registers. The number of GPIOs is determined by the width of
>> >> +  the registers.
>> >> +- GPIO controllers with clear/set registers.
>> >> +- GPIO controllers with a single "data" register.
>> >> +- Big endian bits/GPIOs ordering.
>> >
>> > Maybe add a sentence indicating that these settings are defined in the
>> > drivers using named memory resources.
>> >
>> >> +
>> >> +For setting GPIO's there are three supported configurations:
>> >> +- single input/output register resource (named "dat").
>> >
>> > This resource seems to be mandatory - please make sure you mention this fact.
>> >
>> >> +- set/clear pair (named "set" and "clr").
>> >> +- single output register resource and single input resource ("set" and dat").
>> >> +
>> >> +For setting the GPIO direction, there are three supported configurations:
>> >> +- simple bidirection GPIO that requires no configuration.
>> >
>> > s/bidirection/bidirectional maybe?
>> >
>> >> +- an output direction register (named "dirout") where a 1 bit indicates the
>> >> +  GPIO is an output.
>> >> +- an input direction register (named "dirin") where a 1 bit indicates the GPIO
>> >> +  is an input.
>> >> +
>> >> +It is possible to use only parts of GPIO generic library. Each GPIO controller
>> >> +using GPIO generic library needs to include the following header.
>> >> +
>> >> +        #include <linux/basic_mmio_gpio.h>
>> >> +
>> >> +Use bgpio_init to configure gpio_chip and bgpio_remove to remove the controller.
>> >> +int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
>> >> +               unsigned long sz, void __iomem *dat, void __iomem *set,
>> >> +               void __iomem *clr, void __iomem *dirout, void __iomem *dirin,
>> >> +               unsigned long flags);
>> >
>> > If you put the prototype for bgpio_init(), please also put the one of
>> > bgpio_remove()...
>> >
>> >> +
>> >> +The "flag" parameter can be following depending on controller configuration:
>> >> +BGPIOF_BIG_ENDIAN               BIT(0)
>> >> +BGPIOF_UNREADABLE_REG_SET       BIT(1) /* reg_set is unreadable */
>> >> +BGPIOF_UNREADABLE_REG_DIR       BIT(2) /* reg_dir is unreadable */
>> >> +BGPIOF_BIG_ENDIAN_BYTE_ORDER    BIT(3)
>> >
>> > Right now this documentation is a little bit confusing. Basically
>> > there are two ways to use this driver:
>> >
>> > 1) Name your platform device ""basic-mmio-gpio" or
>> > "basic-mmio-gpio-be", set the right named memory resources to specify
>> > the desired configuration, and let bgpio_pdev_probe() do all the work.
>> >
>> > 2) Allocate a bgpio_chip yourself, call bgpio_init() on it and its
>> > resources, and finally invoke gpiochip_add() yourself.
>> >
>> > These two different ways of doing kind of seem to be mixed together.
>> > Can you try to highlight the fact that these are alternatives?
>>
>
> This is an updated version of previous patch. Please review.
>
> diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
> index 31e0b5d..f6b617a 100644
> --- a/Documentation/gpio/driver.txt
> +++ b/Documentation/gpio/driver.txt
> @@ -190,3 +190,45 @@ gpiochip_free_own_desc().
>  These functions must be used with care since they do not affect module use
>  count. Do not use the functions to request gpio descriptors not owned by the
>  calling driver.
> +
> +
> +Generic driver for memory-mapped GPIO controllers
> +-------------------------------------------------
> +The GPIO generic library provides support for basic platform_device
> +memory-mapped GPIO controllers, which can be accessed by selecting Kconfig
> +symbol GPIO_GENERIC and using library functions provided by GPIO generic
> +driver (see drivers/gpio/gpio-generic.c).
> +
> +The driver supports registers of the sizes of 8/16/32/64 bits and the number
> +of GPIOs are determined by the width of the registers. A set of named memory
> +resources should be defined in the drivers (e.g "dat", "set", "clr", "dirout"
> +and "dirin"), where "dat" is a mandatory resource.
> +
> +Each GPIO controller using GPIO generic library needs to include the following
> +header.
> +        #include <linux/basic_mmio_gpio.h>

Need a blank line to separate the paragraph from the #include.

> +
> +There are two ways to use this driver:
> +1. Using basic GPIO MMIO Generic driver directly:
> +   Name your platform device "basic-mmio-gpio" or "basic-mmio-gpio-be", set the
> +   right named memory resources to specify the desired configuration, and let
> +   bgpio_pdev_probe do all the work.
> +
> +2. Using basic GPIO MMIO Generic library in your driver:
> +   Allocate a bgpio_chip yourself in your GPIO driver, call bgpio_init() on it
> +   and its resources, and finally invoke gpiochip_add yourself. It is possible
> +   to use only parts of the driver, you can overwrite functions and variables
> +   in your driver, if necessary.
> +   You can call bgpio_remove() to unregister a gpio_chip.

It would be great if you could also point to very basic drivers that
use these configurations. Expanations on how to use this are by nature
limited, and having an actual example would be greatly helpful to
users.

> +
> +For setting up GPIO's there are three supported configurations:

s/GPIO's/GPIOs

Also "setting up GPIOs" is quite vague here. Maybe this should become
"To specify the mechanism used to set the GPIOs", or something like
that.

> +- single input/output register resource (named "dat").
> +- set/clear pair (named "set" and "clr").
> +- single output register resource and single input resource ("set" and "dat").
> +
> +For setting the GPIO direction, there are three supported configurations:
> +- simple bidirectional GPIO that requires no configuration.
> +- an output direction register (named "dirout") where a 1 bit indicates the
> +  GPIO is an output.
> +- an input direction register (named "dirin") where a 1 bit indicates the GPIO
> +  is an input.

It is not clear how one can set these configurations from these
paragraphs alone.
