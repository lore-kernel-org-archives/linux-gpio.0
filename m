From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v1 3/3] gpiolib: append SFI helpers for GPIO API
Date: Tue, 10 Dec 2013 12:00:10 +0900
Message-ID: <52A683BA.9090400@nvidia.com>
References: <1386261409-13850-1-git-send-email-andriy.shevchenko@linux.intel.com>	 <1386261409-13850-4-git-send-email-andriy.shevchenko@linux.intel.com>	 <52A12DCB.10306@nvidia.com> <1386583880.1871.119.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11051 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805Ab3LJDAP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2013 22:00:15 -0500
In-Reply-To: <1386583880.1871.119.camel@smile>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On 12/09/2013 07:11 PM, Andy Shevchenko wrote:
> On Fri, 2013-12-06 at 10:52 +0900, Alex Courbot wrote:
>> On 12/06/2013 01:36 AM, Andy Shevchenko wrote:
>>> To support some (legacy) firmwares and platforms let's make life easier for
>>> their customers.
>>>
>>> This patch provides a function which converts sfi_gpio_table_entry to
>>> gpio_desc. The use of it is integrated into GPIO library to enable generic
>>> access to the SFI GPIO resources.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> ---
>>>    drivers/gpio/Kconfig       |  4 ++++
>>>    drivers/gpio/Makefile      |  1 +
>>>    drivers/gpio/gpiolib-sfi.c | 28 ++++++++++++++++++++++++++++
>>>    drivers/gpio/gpiolib.c     |  3 +++
>>>    drivers/gpio/gpiolib.h     | 13 +++++++++++++
>>>    5 files changed, 49 insertions(+)
>>>    create mode 100644 drivers/gpio/gpiolib-sfi.c
>>>
>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>>> index ae3682d..a12752a 100644
>>> --- a/drivers/gpio/Kconfig
>>> +++ b/drivers/gpio/Kconfig
>>> @@ -51,6 +51,10 @@ config OF_GPIO
>>>    	def_bool y
>>>    	depends on OF
>>>
>>> +config GPIO_SFI
>>> +	def_bool y
>>> +	depends on SFI
>>> +
>>>    config GPIO_ACPI
>>>    	def_bool y
>>>    	depends on ACPI
>>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>>> index ee95154..5373e3a 100644
>>> --- a/drivers/gpio/Makefile
>>> +++ b/drivers/gpio/Makefile
>>> @@ -5,6 +5,7 @@ ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
>>>    obj-$(CONFIG_GPIO_DEVRES)	+= devres.o
>>>    obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
>>>    obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
>>> +obj-$(CONFIG_GPIO_SFI)		+= gpiolib-sfi.o
>>>    obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
>>>
>>>    # Device drivers. Generally keep list sorted alphabetically
>>> diff --git a/drivers/gpio/gpiolib-sfi.c b/drivers/gpio/gpiolib-sfi.c
>>> new file mode 100644
>>> index 0000000..c804314
>>> --- /dev/null
>>> +++ b/drivers/gpio/gpiolib-sfi.c
>>> @@ -0,0 +1,28 @@
>>> +/*
>>> + * Simple Firmware Interface (SFI) helpers for GPIO API
>>> + *
>>> + * Copyright (C) 2013, Intel Corporation
>>> + * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/sfi.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/err.h>
>>> +
>>> +#include "gpiolib.h"
>>> +
>>> +struct gpio_desc *sfi_get_gpiod_by_name(const char *name)
>>> +{
>>> +	struct sfi_gpio_table_entry *pentry;
>>> +
>>> +	pentry = sfi_gpio_get_entry_by_name(name);
>>> +	if (!pentry)
>>> +		return ERR_PTR(-ENODEV);
>>> +
>>> +	return gpio_to_desc(pentry->pin_no);
>>> +}
>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>> index bad400c..789ae1c 100644
>>> --- a/drivers/gpio/gpiolib.c
>>> +++ b/drivers/gpio/gpiolib.c
>>> @@ -2451,6 +2451,9 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
>>>    	} else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev)) {
>>>    		dev_dbg(dev, "using ACPI for GPIO lookup\n");
>>>    		desc = acpi_find_gpio(dev, con_id, idx, &flags);
>>> +	} else if (IS_ENABLED(CONFIG_SFI)) {
>>> +		dev_dbg(dev, "using SFI for GPIO lookup\n");
>>> +		desc = sfi_get_gpiod_by_name(con_id);
>>
>> Your lookup function is ignoring the dev argument. Are SFI GPIOs always
>> supposed to be system-global?
>
> It's not clear. It could be device related, though SFI itself has
> probably wrong design. I rather prefer to avoid a dev parameter check at
> all.
>
>>   In this case, your if condition should
>> likely be
>>
>> 	} else if (IS_ENABLED(CONFIG_SFI) && !dev) {
>>
>> So that a global SFI GPIO does not get mistakenly assigned to a device
>> that has, say, a more suited platform mapping on the same con_id.
>
> So, for example in the driver that could be enumerated from SFI, DT, and
> via platform data you suggest to have something like
>
>
> desc = gpiod_get(dev, "con_id_device_tree");
> ...
>
> if (IS_ERR(desc))
>   desc = gpiod_get(NULL, "con_id_sfi");
>
> if (IS_ERR(desc))
>   desc = gpiod_get(???, "con_id_from_platdata");
>
> Correct?

No, this is not what I'm suggesting. Device drivers should not care who 
provides the GPIO, they should just ask for it, and obtain it (or not).

The scope of the problem actually depends on what SFI GPIOs are used 
for. For instance, let's say you have two devices each using an enabling 
GPIO which happens to be provided by SFI. Both drivers for these devices 
obtain the enable GPIO as follows:

	enable_gpio = gpiod_get(dev, "enable");

Here you actually have two problems:

1) Since you only look for con_id, how to you discriminate the enable 
GPIOs for these devices?

2) The device drivers are the one to decide which GPIO name they 
request. How are SFI GPIO names decided? If you don't have any kind of 
flexibility for their naming, and want to use them with devices drivers, 
you will very likely need another naming layer that associates a 
(device_name, con_id) pair to the right SFI GPIO, similarly to what is 
done with platform GPIOs. If the only consumer of SFI GPIOs is platform 
code, and SFI GPIOs are all uniquely named, then you may as well request 
the device to be NULL for their lookup so that they don't interfere with 
more precisely-mapped GPIOs.

I don't know anything about SFI GPIOs, how they are defined, where their 
name comes from, and how they are used so my vision may be incomplete. 
But AFAICT it all comes down to one of these two scenarios:

1) SFI GPIOs are only used in platform code -> using their pin name is 
ok, device argument should be assumed to be NULL for their matching
2) SFI GPIOs are also consumed by device drivers -> you need a way to 
match a (device, con_id) pair to your SFI GPIOs so they can be matched 
exactly and through the names drivers will request.
