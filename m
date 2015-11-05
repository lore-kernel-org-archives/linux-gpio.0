From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Thu, 5 Nov 2015 10:40:15 +0100
Message-ID: <20151105094015.GC7561@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
 <20151102101347.GA14066@localhost>
 <3389425.noBYZr9C6e@adelgunde>
 <20151103120605.GA18098@localhost>
 <CACRpkdaQYDk4s9b79xh+vL-3SFYp5GN3KpjgsSshzF0E+1-r5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35811 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031675AbbKEJkH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2015 04:40:07 -0500
Received: by lfbn126 with SMTP id n126so55102528lfb.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2015 01:40:05 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdaQYDk4s9b79xh+vL-3SFYp5GN3KpjgsSshzF0E+1-r5A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Tue, Nov 03, 2015 at 06:18:42PM +0100, Linus Walleij wrote:
> On Tue, Nov 3, 2015 at 1:06 PM, Johan Hovold <johan@kernel.org> wrote:
> > [Pargmann]
> >> As an idea: We could use the complete path to create some sort of unique id for
> >> the device (perhaps hash or something different). This id can be exported as
> >> device attribute and would allow udev to create some links as known from
> >> /dev/disk/by-id for example. This would make identifying a single chip quite
> >> easy for any userspace application and we would avoid having this really long
> >> path somewhere.
> >
> > The unique ids are already there in sysfs, for example:
> >
> > $ for x in /sys/bus/gpio/devices/gpiochip*; do readlink $x; done
> > ../../../devices/platform/68000000.ocp/48310000.gpio/gpiochip0
> > ../../../devices/platform/68000000.ocp/49050000.gpio/gpiochip1
> > ../../../devices/platform/68000000.ocp/49052000.gpio/gpiochip2
> > ../../../devices/platform/68000000.ocp/49054000.gpio/gpiochip3
> > ../../../devices/platform/68000000.ocp/49056000.gpio/gpiochip4
> > ../../../devices/platform/68000000.ocp/49058000.gpio/gpiochip5
> > ../../../devices/platform/68000000.ocp/48070000.i2c/i2c-0/0-0048/twl4030-gpio/gpiochip6
> > ../../../devices/platform/68000000.ocp/48064000.usbhshost/48064800.ehci/usb1/1-2/1-2.3/1-2.3:1.0/gpiochip7
> >
> > And libudev can be used to lookup devices based on (parent) attributes
> > (such as USB VID/PID, serial numbers, etc).
> >
> > We could also export further attributes if that would help (e.g.
> > gpio-chip labels).
> 
> Yeah sysfs does provide this.
>
> This has the problem that everyone and their dog need to use udev
> or something like it. Some library or so that run around in sysfs like
> libudev+systemdlib does currently.
> 
> And since Android does not use udev, and Busybox does not use udev,
> there are quite a few million users there. Or at least two big projects that
> need to reimplement the same idea. It could be argued that they should,
> since sysfs is indeed an ABI.
>
> In the Busybox mdev case part of the goal is to minimize userspace code
> size too, and it does not support the complex rules of udev for example.
> 
> It'd be nice if devices could be uniquely identified in the chardev alone
> I think, then we don't need to much reliance on external assumptions
> and traversing sysfs somehow for more info.

Point is that this is not a gpio-specific problem. Userspace needs to
deal with this for any resource it wants to access (e.g. i2c or spi).

And you should be able to use libudev for tree-traversal without actually
using udevd, right?

Johan
