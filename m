From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Fri, 19 Feb 2016 12:51:48 +0100
Message-ID: <CACRpkdb2+MDhTiUy9bS-dVORyQpCo-MNvtKpU3TSpq=5JkXDWw@mail.gmail.com>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
	<20160217205445.GA2394@deathstar>
	<CACRpkdYgxJme3V1RSkvmsBL=b5zroNKwPJH70mgDbxMD=XQJtw@mail.gmail.com>
	<20160219094620.GA28750@deathstar>
	<CACRpkdairn2nnpWz48gakwdwcbPUiv3mVOzcdhdW9Yy8W=XZog@mail.gmail.com>
	<20160219102614.GA31335@deathstar>
	<CACRpkdYEpzPX+4fCwUixbvGnGgR4Vm2j8DGL7aqNGWKbFD+PWg@mail.gmail.com>
	<8756ef874911997cc5ef45fec30fb75e@jic23.retrosnub.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34006 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1427832AbcBSLvt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 06:51:49 -0500
Received: by mail-ob0-f174.google.com with SMTP id kf7so4662262obb.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 03:51:49 -0800 (PST)
In-Reply-To: <8756ef874911997cc5ef45fec30fb75e@jic23.retrosnub.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Cc: Michael Welling <mwelling@ieee.org>, Jonathan Cameron <jic23@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Feb 19, 2016 at 12:35 PM,  <jic23@jic23.retrosnub.co.uk> wrote:
> [Me]
>> Here I lean toward the IIO event interface, that if you want to
>> monitor a GPIO line you should ask for an event file
>> descriptor and select() it waiting for events in userspace,
>> i.e. every such request comes with obtaining a new fd
>> and watching it.
>>
> On events, it might be worth doing it a bit more input evdev
> like and allowing mor than one consumer.

Hm. I'm not familiar with how that works... I guess I just
have to go and read the code.

> Do we need to describe to userspace what GPIOs are available?
> Right now I don't have a board to hand to see what info is
> already available on that front.  Strikes me as that side of
> things may be more complex than the interface to actually get hole
> of them.  It's this side of things that makes IOCTLs on highly
> varied devices a pain (any why we ended up with the split interface
> in IIO which is sort of an input / hwmon hybrid).

So the usecase that has been around the recent months is
basically Arduino-type usecases, where you want a Linux
SoC+board to be used for clever electronics prototyping
(Internet of Things-yada yada thingofabobs).

Those are by definition one-off kind of things, and people
want to go around having to implement kernelspace stuff
for their one-offs.

Another typical example is industrial
automation, PLCs. Those currently mmap() their GPIO
address range to userspace and hammers them from
there, because they think Linux GPIO suck and they
rather break down the kernelspace/userspace barrier
than try to fix it. (Whether this stance come from
laziness, ignorance or plain "not my problem" attitude,
I don't know.)

Industrial automation with relays and shutter and
valves and whatnot are probably better off in userspace
than in kernelspace, a bunch of GPIO onebit reading
and writing drivers in the kernel is not gonna be helpful.
If it's something more complex like a sensor they should
use IIO, if it's a LED then they should use that
subsystem etc. But for all these binary things that
are really dumb analog components, like relays doing
something misc.

A typical case is a PLC or lab board such as
BeagleBone or 96board, where there is a number of
GPIO lines, that all come out on the same identical
header on the board (96board has this). Then you want
to put an accessory on this header and access it from
userspace. But you want it to work the same no matter
whether it is SoC A or SoC B.

So in order to satisfy that usecase, you need to look up
the GPIO by name. And that mechanism is now in
place, just that we need some DT bindings or board
data to name the lines (it can currently be done using
the char *names[] array in struct gpio_chip).

Yours,
Linus Walleij
