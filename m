From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: always include linux/gpio/consumer.h in linux/gpio.h
Date: Wed, 15 Nov 2017 08:43:39 +0100
Message-ID: <CACRpkdb2UH0QisZCgNJTMEpcihsaQbw_1RgRMKPU==1up_ibng@mail.gmail.com>
References: <20171114114002.234250-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33431 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752684AbdKOHnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Nov 2017 02:43:41 -0500
Received: by mail-io0-f196.google.com with SMTP id 134so672025ioo.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2017 23:43:41 -0800 (PST)
In-Reply-To: <20171114114002.234250-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Nov 14, 2017 at 12:39 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> linux/gpio/consumer.h is a bit odd, it contains definitions for a number
> of the advanced gpio interfaces, in variants for both gpiolib-based
> platforms and those not using gpiolib.
>
> The file gets included implicitly by linux/gpio.h, but only if gpiolib
> is enabled. Driver writers regularly fail to notice this and include
> the top-level linux/gpio.h but use the newer interfaces.
>
> The latest such driver is a new touchscreen driver that produced this
> build failure on an x86 randconfig build:
>
> drivers/input/touchscreen/hideep.c: In function 'hideep_power_on':
> drivers/input/touchscreen/hideep.c:670:3: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
>    gpiod_set_value_cansleep(ts->reset_gpio, 0);
>
> I don't want to manually add linux/gpio/consumer.h inclusions to each
> such file any more, so let's just include this in linux/gpio.h for everyone.

Consumers should really just use <linux/gpio/consumer.h>
and stop including <linux/gpio.h> at all.

<linux/gpio.h> does not have the producer/consumer split
that the new API has, and the latter was inspired by
<linux/regulator/driver.h> and <linux/regulator/machine.h>
etc.

I.e. the right fix is not just to add #include <linux/gpio/consumer.h>
but also *delete* #include <linux/gpio.h>

The only time a driver need both includes is when they
use the legacy GPIO API and the new consumer API
at the same time. Or if they both produce and consume
GPIOs (such as some GPIO drivers do).

I don't know what to do besides documenting it, and it is
documented clearly in:
Documentation/gpio/consumer.txt

Apparently people write their drivers for GPIO without reading
this documentation and just including random headers or
copy-pasting.

I am trying to make more drivers good examples, one at a
time, starting with the most important and used ones.
drivers/gpio/busses/i2c-gpio.c is the most recent cleanup.

We can't delete the inclusion of <linux/gpio/consumer.h> from
<linux/gpio.h> however much we wanted to, because it breaks
a ton of legacy code. Instead we move one step at the time.

What we *could* do is try to emit a build warning for drivers
that use the implicit include of <linux/gpio/consumer.h>
from <linux/gpio.h>.

Or add some code to checkpatch to scream about it.

Ideas?

Yours,
Linus Walleij
