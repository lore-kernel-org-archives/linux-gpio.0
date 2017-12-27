From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Tue, 26 Dec 2017 19:24:10 -0500
Message-ID: <20171227002410.GA12050@sophia>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <20171224224215.GA2372@sophia>
 <f3ebd850-c301-2adb-95e7-3a1f37c2259c@maciej.szmigiero.name>
 <0e8ece1e-3041-ea58-f5b6-298c163fa747@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:46565 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751083AbdL0AYR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Dec 2017 19:24:17 -0500
Content-Disposition: inline
In-Reply-To: <0e8ece1e-3041-ea58-f5b6-298c163fa747@maciej.szmigiero.name>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Mon, Dec 25, 2017 at 03:48:16PM +0100, Maciej S. Szmigiero wrote:
>On 24.12.2017 23:42, William Breathitt Gray wrote:
>(..)
>> By the way, don't hesitate to ask for more information on the ISA
>> subsystem -- a lot of maintainers are unaware that it even exists since
>> so few devices nowadays use ISA-style communication -- but I'm always
>> happy to help. :)
>
>It turns out that all this ISA bus is behind CONFIG_ISA_BUS_API which
>cannot be automatically selected by this driver due to a recursive
>dependency conflict with CONFIG_STX104.

Hmm, you may have discovered a bug in my STX104 Kconfig option. I'm
CCing Jonathan Cameron to keep him in the loop if I send a patch to fix
this issue down the road.

Here are the error messages printed on my system when I add a select
ISA_BUS_API line to the GPIO_WINBOND Kconfig option in the version 2 of
your patch:

drivers/gpio/Kconfig:13:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpio/Kconfig:13:	symbol GPIOLIB is selected by STX104
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/iio/adc/Kconfig:659:	symbol STX104 depends on ISA_BUS_API
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
arch/Kconfig:818:	symbol ISA_BUS_API is selected by GPIO_WINBOND
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpio/Kconfig:701:	symbol GPIO_WINBOND depends on GPIOLIB

The issue seems to relate to the select GPIOLIB line for the STX104
Kconfig option (which has a ISA_BUS_API dependency). Switching GPIOLIB
to be a dependency, or alternatively selecting ISA_BUS_API, alleviates
the recursion.

Linus, is my use of select GPIOLIB for the STX104 Kconfig option
appropriate in this context -- or should it instead be part of the
depends on line? The STX104 driver includes linux/gpio/driver.h and
makes use of the devm_gpiochip_add_data function to add support for some
minor auxililary GPIO lines on the STX104 device.

>
>All the existing ISA bus drivers seem to depend on CONFIG_ISA_BUS_API
>instead of selecting it but IMHO this is wrong because:
>1) This Kconfig option doesn't really enable or disable any bus support
>but building of a library of some common boilerplate code.
>Libraries are normally selected by drivers needing them and only provided
>as an user-selectable option if there is a possibility that a out-of-tree
>module would need it,
>
>2) On x86_64 this option (or rather, its parent option CONFIG_ISA_BUS)
>cannot be enabled without CONFIG_EXPERT,
>
>3) This device isn't really a ISA bus device any more than, for example,
>a 8250 serial port or a PC-style parallel port and these don't need
>that an user explicitly enables "ISA bus support" in his kernel
>configuration.

I can see what you mean about selecting ISA_BUS_API rather than having
it as a dependency for drivers. Part of the reason I added the
CONFIG_EXPERT dependency for CONFIG_ISA_BUS -- as well as having
CONFIG_ISA_BUS_API be a dependency for the drivers themselves -- was to
hide the ISA-style drivers which blindly poke at I/O port addresses,
lest a niave user enable all available drivers and unintentionally brick
their system when the drivers execute.

I think there is still merit in masking dangerous drivers such as this,
since the expected behavior nowadays is for the driver to probe for the
device before poking at memory; since ISA-style communication lacks a
standard method of detecting devices in hardware, these devices
generally pose a danger when loaded by niave users.

However, I think CONFIG_EXPERT by itself is sufficient enough masking
to help prevent niave users from enabling these drivers on a whim.
Linus and Jonathan, do you have any objections if I replace the
ISA_BUS_API dependencies on my drivers to respective select lines? I
think this would have the benefit of resolving the Kconfig recursive
dependency issue too.

>
>To be clear I'm fine with converting this driver to use the ISA bus (in
>fact, I have already done so), but I think that currently this would be
>a regression from user-friendliness perspective due to the points above.

Regardless of the Kconfig decisions we make, continue to utilize the ISA
bus driver in your code as this API is the correct one to use for your
LPC devices. Kconfig improvements can be made later on, separate from
the driver code, so there's no need to let that be a deciding factor in
getting the driver itself right -- although I do agree that having a
Kconfig setup that does not appeal solely to the masochists is an
important end goal. ;)

William Breathitt Gray

>
>> William Breathitt Gray
>
>Best regards,
>Maciej Szmigiero
