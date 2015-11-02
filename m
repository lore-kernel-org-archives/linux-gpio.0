From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Mon, 2 Nov 2015 11:13:47 +0100
Message-ID: <20151102101347.GA14066@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <20151024184253.GC22220@pengutronix.de>
 <CAAVeFuJ7nykUpJjotmXyB6ngb3g3KF5amfO73nSWQfKSLHfFnw@mail.gmail.com>
 <CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:35580 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751226AbbKBKNm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 05:13:42 -0500
Received: by lbbes7 with SMTP id es7so84545654lbb.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 02:13:40 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Oct 30, 2015 at 08:48:44PM +0100, Linus Walleij wrote:
> On Fri, Oct 30, 2015 at 2:55 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> > On Sun, Oct 25, 2015 at 3:42 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
> 
> >> What happens if we have two I2C gpio expanders with the same I2C
> >> addresses connected to different I2C busses? If I see this correctly
> >> they would both show up with the same name. Is there an easy and
> >> race-free way to see which GPIO chip is connected to which I2C bus?
> >
> > I suppose the bus path could be part of the GPIO chip name to avoid
> > this ambiguity, something like: 7000c000.i2c/0-001c.gpio
> 
> For DT that is the simple solution.

Not all devices are platform devices, and the bus path can become quite
long, for example for usb to uniquely identify the gpio controller this
could be:

	platform/68000000.ocp/48064000.usbhshost/48064800.ehci/usb1/1-2/1-2.3/1-2.3:1.0/gpiochip7

> Right now it used gpiochip->label if that is set, else the name of
> the gpiochip device like gpiochip0, gpiochip1 etc.

Perhaps better to just stick to the bus unique names (e.g. gpopchip7),
and possibly export the label as an additional attribute.

This is the lsgpio output I get on an omap system by the way:

GPIO chip: gpio, 32 GPIO lines
GPIO chip: gpio, 32 GPIO lines
GPIO chip: gpio, 32 GPIO lines
GPIO chip: gpio, 32 GPIO lines
GPIO chip: gpio, 32 GPIO lines
GPIO chip: gpio, 32 GPIO lines
GPIO chip: twl4030, 20 GPIO lines
GPIO chip: pl2303, 2 GPIO lines

Johan
