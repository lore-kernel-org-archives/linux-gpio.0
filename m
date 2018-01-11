From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] gpio: winbond: fix ISA_BUS_API dependency
Date: Thu, 11 Jan 2018 07:42:20 -0500
Message-ID: <20180111124220.GA23490@sophia>
References: <20180111083600.4121805-1-arnd@arndb.de>
 <CACRpkdZwigBVA04=XZNfU72AseRW8DFWsqm2of5Wv7YVpoCMOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f193.google.com ([209.85.213.193]:39298 "EHLO
        mail-yb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932361AbeAKMm2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jan 2018 07:42:28 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZwigBVA04=XZNfU72AseRW8DFWsqm2of5Wv7YVpoCMOA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 11, 2018 at 10:18:56AM +0100, Linus Walleij wrote:
>On Thu, Jan 11, 2018 at 9:35 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>
>> The newly added GPIO driver for winbond chipsets causes a
>> circular dependency warning in Kconfig:
>>
>> drivers/gpio/Kconfig:13:error: recursive dependency detected!
>> drivers/gpio/Kconfig:13:        symbol GPIOLIB is selected by STX104
>> drivers/iio/adc/Kconfig:699:    symbol STX104 depends on ISA_BUS_API
>> arch/Kconfig:830:       symbol ISA_BUS_API is selected by GPIO_WINBOND
>> drivers/gpio/Kconfig:701:       symbol GPIO_WINBOND depends on GPIOLIB
>>
>> The underlying problem is that ISA_BUS_API is not meant to be selected by
>> device drivers, instead it is provided by the architectures that support
>> ISA add-on card devices, or in case of x86 have this explicitly enabled.
>>
>> This particular driver appears to be different from the other ISA_BUS_API
>> based drivers, in that it is not normally an add-on card (ISA or PC104)
>> but instead is an LPC-attached component on the mainboard. We already
>> support other functionality provided by this chip, at least
>> drivers/watchdog/w83627hf_wdt.c and drivers/hwmon/w83627ehf.c, plus
>> there is a discovery function for this hardware in
>> drivers/parport/parport_pc.c.
>>
>> If we want to use this driver without having to enable CONFIG_EXPERT,
>> it might be better to not use the isa_bus_type for it, but rather
>> turn it into a platform_driver, acpi_driver or add an MFD for it that
>> is shared with the wdt and hwmon portions and does the probing.
>>
>> For now, this patch fixes the dependency by changing 'select' into
>> 'depends on'.
>>
>> Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Fixes: a0d65009411c ("gpio: winbond: Add driver")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>I've tentatively applied this patch so we don't break the builds.
>
>We had a bunch of discussion about this already ... I guess we
>need to go at it again, waiting for comments from Maciej and
>William.
>
>Yours,
>Linus Walleij

Hi Linus,

I don't believe this patch is necessary if you pull in the "Change
ISA_BUS_API dependency to selection" patchset
(https://patchwork.ozlabs.org/project/linux-gpio/list/?series=20657) as
it has the proper fix for this recursive dependency.

William Breathitt Gray
