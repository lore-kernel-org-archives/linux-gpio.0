From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Tue, 3 Nov 2015 13:06:05 +0100
Message-ID: <20151103120605.GA18098@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
 <20151102101347.GA14066@localhost>
 <3389425.noBYZr9C6e@adelgunde>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:35180 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbbKCMF7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2015 07:05:59 -0500
Received: by lfbn126 with SMTP id n126so15036026lfb.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2015 04:05:58 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <3389425.noBYZr9C6e@adelgunde>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Tue, Nov 03, 2015 at 08:23:24AM +0100, Markus Pargmann wrote:
> On Monday 02 November 2015 11:13:47 Johan Hovold wrote:
> > On Fri, Oct 30, 2015 at 08:48:44PM +0100, Linus Walleij wrote:
> > > On Fri, Oct 30, 2015 at 2:55 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> > > > On Sun, Oct 25, 2015 at 3:42 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
> > > 
> > > >> What happens if we have two I2C gpio expanders with the same I2C
> > > >> addresses connected to different I2C busses? If I see this correctly
> > > >> they would both show up with the same name. Is there an easy and
> > > >> race-free way to see which GPIO chip is connected to which I2C bus?
> > > >
> > > > I suppose the bus path could be part of the GPIO chip name to avoid
> > > > this ambiguity, something like: 7000c000.i2c/0-001c.gpio
> > > 
> > > For DT that is the simple solution.
> > 
> > Not all devices are platform devices, and the bus path can become quite
> > long, for example for usb to uniquely identify the gpio controller this
> > could be:
> > 
> > 	platform/68000000.ocp/48064000.usbhshost/48064800.ehci/usb1/1-2/1-2.3/1-2.3:1.0/gpiochip7
> > 
> > > Right now it used gpiochip->label if that is set, else the name of
> > > the gpiochip device like gpiochip0, gpiochip1 etc.
> > 
> > Perhaps better to just stick to the bus unique names (e.g. gpopchip7),
> > and possibly export the label as an additional attribute.
> 
> I think this wouldn't be enough. We would still have trouble identifying the
> gpiochips, right?

That information is already available through sysfs so there's no need
to try and re-encode it in device links etc.

> As an idea: We could use the complete path to create some sort of unique id for
> the device (perhaps hash or something different). This id can be exported as
> device attribute and would allow udev to create some links as known from
> /dev/disk/by-id for example. This would make identifying a single chip quite
> easy for any userspace application and we would avoid having this really long
> path somewhere.

The unique ids are already there in sysfs, for example:

$ for x in /sys/bus/gpio/devices/gpiochip*; do readlink $x; done
../../../devices/platform/68000000.ocp/48310000.gpio/gpiochip0
../../../devices/platform/68000000.ocp/49050000.gpio/gpiochip1
../../../devices/platform/68000000.ocp/49052000.gpio/gpiochip2
../../../devices/platform/68000000.ocp/49054000.gpio/gpiochip3
../../../devices/platform/68000000.ocp/49056000.gpio/gpiochip4
../../../devices/platform/68000000.ocp/49058000.gpio/gpiochip5
../../../devices/platform/68000000.ocp/48070000.i2c/i2c-0/0-0048/twl4030-gpio/gpiochip6
../../../devices/platform/68000000.ocp/48064000.usbhshost/48064800.ehci/usb1/1-2/1-2.3/1-2.3:1.0/gpiochip7

And libudev can be used to lookup devices based on (parent) attributes
(such as USB VID/PID, serial numbers, etc).

We could also export further attributes if that would help (e.g.
gpio-chip labels).

Johan
