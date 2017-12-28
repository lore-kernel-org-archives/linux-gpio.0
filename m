From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Wed, 27 Dec 2017 23:33:12 -0500
Message-ID: <20171228043312.GA11117@sophia>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <20171224224215.GA2372@sophia>
 <f3ebd850-c301-2adb-95e7-3a1f37c2259c@maciej.szmigiero.name>
 <0e8ece1e-3041-ea58-f5b6-298c163fa747@maciej.szmigiero.name>
 <20171227002410.GA12050@sophia>
 <CACRpkdYtGKWtodP9tb+ZdQ=dsSouvpMGeXRR_TDNV8hR53c+NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYtGKWtodP9tb+ZdQ=dsSouvpMGeXRR_TDNV8hR53c+NQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 27, 2017 at 12:16:53PM +0100, Linus Walleij wrote:
>On Wed, Dec 27, 2017 at 1:24 AM, William Breathitt Gray
><vilhelm.gray@gmail.com> wrote:
>
>> The issue seems to relate to the select GPIOLIB line for the STX104
>> Kconfig option (which has a ISA_BUS_API dependency). Switching GPIOLIB
>> to be a dependency, or alternatively selecting ISA_BUS_API, alleviates
>> the recursion.
>>
>> Linus, is my use of select GPIOLIB for the STX104 Kconfig option
>> appropriate in this context -- or should it instead be part of the
>> depends on line? The STX104 driver includes linux/gpio/driver.h and
>> makes use of the devm_gpiochip_add_data function to add support for some
>> minor auxililary GPIO lines on the STX104 device.
>
>In the STX104 case, it seems to be appropriate to
>select GPIOLIB, as it is a GPIO provider, not consumer.
>
>Usually I prefer that drivers just select what they need so I don't
>have to run around in the whole kernel tree and turn things on
>to the left and right before I can finally select my driver, but
>maybe that is just me.
>
>The other ISA GPIO drivers depends on ISA_BUS_API, I guess
>in difference from the symbol GPIOLIB it cannot be universally
>selected, so shouldn't this driver also just depends on ISA_BUS_API
>and select it from the machine or wherever?

When I initially submitted the PC/104 device drivers, I added
ISA_BUS_API to their depends on lines in order to mask the respective
drivers from users who do not have a PC/104 bus on their system; in
retrospect, I shouldn't have done it this way. I later added a proper
CONFIG_PC104 option to achieve the masking I initially intended.

The correct semantic would be to treat ISA_BUS_API as we do GPIOLIB:
allow drivers to select it when needed. The reason is that
CONFIG_ISA_BUS_API simply enables the compilation of the
drivers/base/isa.c file. This file has no other Kconfig dependencies and
simply provides a thin layer of code to eliminate some boilerplate
common to ISA-style device drivers; no hardware interactions occur
within this code, just pure software abstractions.

Given that CONFIG_PC104 now fulfills the original purpose of adding
ISA_BUS_API to the depends on line for the PC/104 device drivers, and
that ISA_BUS_API can be selected as necessary with no danger to the
integrity of the system, I think it would be appropriate to change all
the existing ISA_BUS_API depends on lines to respective select lines.
Does that logic make sense?

William Breathitt Gray

>
>Yours,
>Linus Walleij
