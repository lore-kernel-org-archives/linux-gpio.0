From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Fri, 30 Oct 2015 20:48:44 +0100
Message-ID: <CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<20151024184253.GC22220@pengutronix.de>
	<CAAVeFuJ7nykUpJjotmXyB6ngb3g3KF5amfO73nSWQfKSLHfFnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33900 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760757AbbJ3Tsp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 15:48:45 -0400
Received: by oies66 with SMTP id s66so64992763oie.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2015 12:48:44 -0700 (PDT)
In-Reply-To: <CAAVeFuJ7nykUpJjotmXyB6ngb3g3KF5amfO73nSWQfKSLHfFnw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Oct 30, 2015 at 2:55 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Sun, Oct 25, 2015 at 3:42 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

>> What happens if we have two I2C gpio expanders with the same I2C
>> addresses connected to different I2C busses? If I see this correctly
>> they would both show up with the same name. Is there an easy and
>> race-free way to see which GPIO chip is connected to which I2C bus?
>
> I suppose the bus path could be part of the GPIO chip name to avoid
> this ambiguity, something like: 7000c000.i2c/0-001c.gpio

For DT that is the simple solution.

Right now it used gpiochip->label if that is set, else the name of
the gpiochip device like gpiochip0, gpiochip1 etc.

Yours,
Linus Walleij
