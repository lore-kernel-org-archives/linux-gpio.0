From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Wed, 27 Dec 2017 12:16:53 +0100
Message-ID: <CACRpkdYtGKWtodP9tb+ZdQ=dsSouvpMGeXRR_TDNV8hR53c+NQ@mail.gmail.com>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <20171224224215.GA2372@sophia> <f3ebd850-c301-2adb-95e7-3a1f37c2259c@maciej.szmigiero.name>
 <0e8ece1e-3041-ea58-f5b6-298c163fa747@maciej.szmigiero.name> <20171227002410.GA12050@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171227002410.GA12050@sophia>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 27, 2017 at 1:24 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> Here are the error messages printed on my system when I add a select
> ISA_BUS_API line to the GPIO_WINBOND Kconfig option in the version 2 of
> your patch:
>
> drivers/gpio/Kconfig:13:error: recursive dependency detected!
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/gpio/Kconfig:13:        symbol GPIOLIB is selected by STX104
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/iio/adc/Kconfig:659:    symbol STX104 depends on ISA_BUS_API
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> arch/Kconfig:818:       symbol ISA_BUS_API is selected by GPIO_WINBOND
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/gpio/Kconfig:701:       symbol GPIO_WINBOND depends on GPIOLIB

So STX104 depends on ISA_BUS_API which in turn is
selected by GPIO_WINBOND which also depends on GPIOLIB.

> The issue seems to relate to the select GPIOLIB line for the STX104
> Kconfig option (which has a ISA_BUS_API dependency). Switching GPIOLIB
> to be a dependency, or alternatively selecting ISA_BUS_API, alleviates
> the recursion.
>
> Linus, is my use of select GPIOLIB for the STX104 Kconfig option
> appropriate in this context -- or should it instead be part of the
> depends on line? The STX104 driver includes linux/gpio/driver.h and
> makes use of the devm_gpiochip_add_data function to add support for some
> minor auxililary GPIO lines on the STX104 device.

In the STX104 case, it seems to be appropriate to
select GPIOLIB, as it is a GPIO provider, not consumer.

Usually I prefer that drivers just select what they need so I don't
have to run around in the whole kernel tree and turn things on
to the left and right before I can finally select my driver, but
maybe that is just me.

The other ISA GPIO drivers depends on ISA_BUS_API, I guess
in difference from the symbol GPIOLIB it cannot be universally
selected, so shouldn't this driver also just depends on ISA_BUS_API
and select it from the machine or wherever?

Yours,
Linus Walleij
