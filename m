From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Wed, 27 Dec 2017 19:42:21 +0100
Message-ID: <d6f8aa80-47f1-ccf2-8c85-6839f13058fb@maciej.szmigiero.name>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <20171224224215.GA2372@sophia>
 <f3ebd850-c301-2adb-95e7-3a1f37c2259c@maciej.szmigiero.name>
 <0e8ece1e-3041-ea58-f5b6-298c163fa747@maciej.szmigiero.name>
 <20171227002410.GA12050@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:57336 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751145AbdL0SmZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Dec 2017 13:42:25 -0500
In-Reply-To: <20171227002410.GA12050@sophia>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On 27.12.2017 01:24, William Breathitt Gray wrote:
> On Mon, Dec 25, 2017 at 03:48:16PM +0100, Maciej S. Szmigiero wrote:
(..)
>> All the existing ISA bus drivers seem to depend on CONFIG_ISA_BUS_API
>> instead of selecting it but IMHO this is wrong because:
>> 1) This Kconfig option doesn't really enable or disable any bus support
>> but building of a library of some common boilerplate code.
>> Libraries are normally selected by drivers needing them and only provided
>> as an user-selectable option if there is a possibility that a out-of-tree
>> module would need it,
>>
>> 2) On x86_64 this option (or rather, its parent option CONFIG_ISA_BUS)
>> cannot be enabled without CONFIG_EXPERT,
>>
>> 3) This device isn't really a ISA bus device any more than, for example,
>> a 8250 serial port or a PC-style parallel port and these don't need
>> that an user explicitly enables "ISA bus support" in his kernel
>> configuration.
> 
> I can see what you mean about selecting ISA_BUS_API rather than having
> it as a dependency for drivers. Part of the reason I added the
> CONFIG_EXPERT dependency for CONFIG_ISA_BUS -- as well as having
> CONFIG_ISA_BUS_API be a dependency for the drivers themselves -- was to
> hide the ISA-style drivers which blindly poke at I/O port addresses,
> lest a niave user enable all available drivers and unintentionally brick
> their system when the drivers execute.
> 
> I think there is still merit in masking dangerous drivers such as this,
> since the expected behavior nowadays is for the driver to probe for the
> device before poking at memory; since ISA-style communication lacks a
> standard method of detecting devices in hardware, these devices
> generally pose a danger when loaded by niave users.

This driver accesses the same Super I/O chip as w83627ehf hwmon and
w83627hf_wdt watchdog drivers.
In addition to this, there are loads of other hwmon and watchdog drivers
for x86 Super I/Os in the tree, most of them using the same probing and
communication style.
There are even existing GPIO drivers for some Super I/Os like gpio-it87
and gpio-f7188x.

None of these drivers need CONFIG_EXPERT to be selected.

Also, CONFIG_EXPERT is described as "Configure standard kernel features"
and that "[it] allows certain base kernel options and settings to be
disabled or tweaked" for "specialized environments".
Enabling this driver is not about changing "standard kernel feature" or
a "base kernel option [or] setting".

> However, I think CONFIG_EXPERT by itself is sufficient enough masking
> to help prevent niave users from enabling these drivers on a whim.
> Linus and Jonathan, do you have any objections if I replace the
> ISA_BUS_API dependencies on my drivers to respective select lines? I
> think this would have the benefit of resolving the Kconfig recursive
> dependency issue too.
> 
>>
>> To be clear I'm fine with converting this driver to use the ISA bus (in
>> fact, I have already done so), but I think that currently this would be
>> a regression from user-friendliness perspective due to the points above.
> 
> Regardless of the Kconfig decisions we make, continue to utilize the ISA
> bus driver in your code as this API is the correct one to use for your
> LPC devices. Kconfig improvements can be made later on, separate from
> the driver code, so there's no need to let that be a deciding factor in
> getting the driver itself right -- although I do agree that having a
> Kconfig setup that does not appeal solely to the masochists is an
> important end goal. ;)

I'm fine with using the ISA bus for this driver, however I cannot submit
a driver for inclusion that causes an error during kernel configuration,
while, on the other hand, I think (for the reasons described above) that
it shouldn't be dependent on the CONFIG_EXPERT option.

> 
> William Breathitt Gray

Maciej Szmigiero
