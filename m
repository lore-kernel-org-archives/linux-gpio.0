From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: always include linux/gpio/consumer.h in linux/gpio.h
Date: Wed, 15 Nov 2017 10:12:02 +0100
Message-ID: <CAK8P3a1v+c7Zj+FvyqtKRntQ86VuCMQ-0eeS9-8DxzZZ0moDxg@mail.gmail.com>
References: <20171114114002.234250-1-arnd@arndb.de> <CACRpkdb2UH0QisZCgNJTMEpcihsaQbw_1RgRMKPU==1up_ibng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:52406 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755811AbdKOJME (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Nov 2017 04:12:04 -0500
In-Reply-To: <CACRpkdb2UH0QisZCgNJTMEpcihsaQbw_1RgRMKPU==1up_ibng@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 15, 2017 at 8:43 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 14, 2017 at 12:39 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>
>> linux/gpio/consumer.h is a bit odd, it contains definitions for a number
>> of the advanced gpio interfaces, in variants for both gpiolib-based
>> platforms and those not using gpiolib.
>>
>> The file gets included implicitly by linux/gpio.h, but only if gpiolib
>> is enabled. Driver writers regularly fail to notice this and include
>> the top-level linux/gpio.h but use the newer interfaces.
>>
>> The latest such driver is a new touchscreen driver that produced this
>> build failure on an x86 randconfig build:
>>
>> drivers/input/touchscreen/hideep.c: In function 'hideep_power_on':
>> drivers/input/touchscreen/hideep.c:670:3: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
>>    gpiod_set_value_cansleep(ts->reset_gpio, 0);
>>
>> I don't want to manually add linux/gpio/consumer.h inclusions to each
>> such file any more, so let's just include this in linux/gpio.h for everyone.
>
> Consumers should really just use <linux/gpio/consumer.h>
> and stop including <linux/gpio.h> at all.
>
> <linux/gpio.h> does not have the producer/consumer split
> that the new API has, and the latter was inspired by
> <linux/regulator/driver.h> and <linux/regulator/machine.h>
> etc.
>
> I.e. the right fix is not just to add #include <linux/gpio/consumer.h>
> but also *delete* #include <linux/gpio.h>

Ok.

> The only time a driver need both includes is when they
> use the legacy GPIO API and the new consumer API
> at the same time. Or if they both produce and consume
> GPIOs (such as some GPIO drivers do).
>
> I don't know what to do besides documenting it, and it is
> documented clearly in:
> Documentation/gpio/consumer.txt
>
> Apparently people write their drivers for GPIO without reading
> this documentation and just including random headers or
> copy-pasting.

Yes, this is usually the case, also a good rule is that people
will (and should) use the simplest API available. In case
of the header file that in turn means that they will go for
linux/gpio.h over linux/gpio/consumer.h if both appear to
work equally well. The rest of the kernel API has trained
us to think that way.

> I am trying to make more drivers good examples, one at a
> time, starting with the most important and used ones.
> drivers/gpio/busses/i2c-gpio.c is the most recent cleanup.
>
> We can't delete the inclusion of <linux/gpio/consumer.h> from
> <linux/gpio.h> however much we wanted to, because it breaks
> a ton of legacy code. Instead we move one step at the time.
>
> What we *could* do is try to emit a build warning for drivers
> that use the implicit include of <linux/gpio/consumer.h>
> from <linux/gpio.h>.
>
> Or add some code to checkpatch to scream about it.
>
> Ideas?

I think a good step forward would be to make it clearer
from looking at linux/gpio.h what that file is for, since it
is used for a couple of different things at the moment.

It should be easy to split it up into e.g. linux/gpio/common.h
for the flags, linux/gpio/legacy-consumer.h for the parts
that just use the old gpio_* functions, plus maybe
linux/gpio/legacy-driver.h if that helps (probably not).

Once linux/gpio.h contains nothing else but e.g.

#include <linux/gpio/consumer.h>
#include <linux/gpio/legacy-consumer.h>
#include <linux/gpio/driver.h>

and some comments, that improves the chances that
people pick the right header after looking at the global one.
Ideally the three or four headers you use should not
include each other, but

It might also help to add a shorter linux/gpiod.h
in place of linux/gpio/consumer.h and let new drivers use
that instead.

Once the structure is in place (in whichever form), we can
start warning in checkpatch.pl for any inclusion of
linux/gpio.h, and do automated conversions, e.g. one
patch per subsystem, to move drivers over from
linux/gpio.h to linux/gpio/legacy-consumer.h. The
new longer name should also make it clear to driver
writers that they use the wrong interface ;-)

Getting the linux/gpio/driver.h stuff out of linux/gpio.h
is probably easier still, but also also less important.

    Arnd
