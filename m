From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Fri, 30 Oct 2015 10:55:28 +0900
Message-ID: <CAAVeFuJ7nykUpJjotmXyB6ngb3g3KF5amfO73nSWQfKSLHfFnw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org> <20151024184253.GC22220@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:38009 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757252AbbJ3Bzs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2015 21:55:48 -0400
Received: by igbdj2 with SMTP id dj2so1846649igb.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2015 18:55:48 -0700 (PDT)
In-Reply-To: <20151024184253.GC22220@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Sun, Oct 25, 2015 at 3:42 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
> On Thu, Oct 22, 2015 at 10:32:24AM +0200, Linus Walleij wrote:
>> OK so this is it, I had no patience waiting for users to come up
>> with this new ABI, and the requests for a way for userspace to
>> use GPIOs properly is coming up again and again. So I created the
>> basics for it, so we can then build on top of this to get things
>> right. I want to get these very first things right before we go
>> wild with setting/getting pin values etc.
>>
>> We add ONE ioctl() to get information on the gpiochip. Now we can
>> do this (example from ux500):
>>
>> root@Ux500:/ lsgpio
>> GPIO chip: a03fe000.gpio, 32 GPIO lines
>> GPIO chip: 8011e080.gpio, 32 GPIO lines
>> GPIO chip: 8011e000.gpio, 32 GPIO lines
>> GPIO chip: 8000e180.gpio, 32 GPIO lines
>> GPIO chip: 8000e100.gpio, 32 GPIO lines
>> GPIO chip: 8000e080.gpio, 32 GPIO lines
>> GPIO chip: 8000e000.gpio, 32 GPIO lines
>> GPIO chip: 8012e080.gpio, 32 GPIO lines
>> GPIO chip: 8012e000.gpio, 32 GPIO lines
>> GPIO chip: abx500-gpio, 42 GPIO lines
>> GPIO chip: tc3589x, 20 GPIO lines
>
> What happens if we have two I2C gpio expanders with the same I2C
> addresses connected to different I2C busses? If I see this correctly
> they would both show up with the same name. Is there an easy and
> race-free way to see which GPIO chip is connected to which I2C bus?

I suppose the bus path could be part of the GPIO chip name to avoid
this ambiguity, something like: 7000c000.i2c/0-001c.gpio
