From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Thu, 28 Dec 2017 23:45:09 +0100
Message-ID: <20148b19-7076-7c27-9d04-54a0849695b4@maciej.szmigiero.name>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <20171224224215.GA2372@sophia>
 <f3ebd850-c301-2adb-95e7-3a1f37c2259c@maciej.szmigiero.name>
 <0e8ece1e-3041-ea58-f5b6-298c163fa747@maciej.szmigiero.name>
 <20171227002410.GA12050@sophia>
 <d6f8aa80-47f1-ccf2-8c85-6839f13058fb@maciej.szmigiero.name>
 <20171228045850.GB11117@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:38148 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751021AbdL1WpO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Dec 2017 17:45:14 -0500
In-Reply-To: <20171228045850.GB11117@sophia>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On 28.12.2017 05:58, William Breathitt Gray wrote:
> On Wed, Dec 27, 2017 at 07:42:21PM +0100, Maciej S. Szmigiero wrote:
>> On 27.12.2017 01:24, William Breathitt Gray wrote:
>>> On Mon, Dec 25, 2017 at 03:48:16PM +0100, Maciej S. Szmigiero wrote:
>> (..)
>>>> All the existing ISA bus drivers seem to depend on CONFIG_ISA_BUS_API
>>>> instead of selecting it but IMHO this is wrong because:
>>>> 1) This Kconfig option doesn't really enable or disable any bus support
>>>> but building of a library of some common boilerplate code.
>>>> Libraries are normally selected by drivers needing them and only provided
>>>> as an user-selectable option if there is a possibility that a out-of-tree
>>>> module would need it,
>>>>
>>>> 2) On x86_64 this option (or rather, its parent option CONFIG_ISA_BUS)
>>>> cannot be enabled without CONFIG_EXPERT,
>>>>
>>>> 3) This device isn't really a ISA bus device any more than, for example,
>>>> a 8250 serial port or a PC-style parallel port and these don't need
>>>> that an user explicitly enables "ISA bus support" in his kernel
>>>> configuration.
>>>
>>> I can see what you mean about selecting ISA_BUS_API rather than having
>>> it as a dependency for drivers. Part of the reason I added the
>>> CONFIG_EXPERT dependency for CONFIG_ISA_BUS -- as well as having
>>> CONFIG_ISA_BUS_API be a dependency for the drivers themselves -- was to
>>> hide the ISA-style drivers which blindly poke at I/O port addresses,
>>> lest a niave user enable all available drivers and unintentionally brick
>>> their system when the drivers execute.
>>>
>>> I think there is still merit in masking dangerous drivers such as this,
>>> since the expected behavior nowadays is for the driver to probe for the
>>> device before poking at memory; since ISA-style communication lacks a
>>> standard method of detecting devices in hardware, these devices
>>> generally pose a danger when loaded by niave users.
>>
>> This driver accesses the same Super I/O chip as w83627ehf hwmon and
>> w83627hf_wdt watchdog drivers.
>> In addition to this, there are loads of other hwmon and watchdog drivers
>> for x86 Super I/Os in the tree, most of them using the same probing and
>> communication style.
>> There are even existing GPIO drivers for some Super I/Os like gpio-it87
>> and gpio-f7188x.
>>
>> None of these drivers need CONFIG_EXPERT to be selected.
>>
>> Also, CONFIG_EXPERT is described as "Configure standard kernel features"
>> and that "[it] allows certain base kernel options and settings to be
>> disabled or tweaked" for "specialized environments".
>> Enabling this driver is not about changing "standard kernel feature" or
>> a "base kernel option [or] setting".
> 
> I'm sorry, I didn't make it quite clear in my previous reply. I agree
> with you that CONFIG_EXPERT shouldn't be necessary for this driver -- in
> the end, a select ISA_BUS_API line should be all that's needed to have
> ISA bus driver support for your driver.

My apologies for misunderstanding you.

> My reference to the CONFIG_EXPERT option is for masking options related
> to other ISA-style buses not commonly found in desktop systems. Devices
> like the Super I/O chip wouldn't fall into this category since LPC is
> pretty common and the relevant I/O port addresses are usually well
> known. Ultimately, the Winbond GPIO driver should not need CONFIG_EXPERT
> to be enabled in order to select ISA_BUS_API.

Thanks for the explanation, it is clear for me now what you had on mind.

> William Breathitt Gray
> 

Maciej Szmigiero
