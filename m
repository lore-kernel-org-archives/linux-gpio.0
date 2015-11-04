From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Wed, 4 Nov 2015 13:44:55 -0600
Message-ID: <20151104194455.GA27450@deathstar>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
 <20151102101347.GA14066@localhost>
 <3389425.noBYZr9C6e@adelgunde>
 <20151103120605.GA18098@localhost>
 <CACRpkdaQYDk4s9b79xh+vL-3SFYp5GN3KpjgsSshzF0E+1-r5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:37132 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755531AbbKDTpG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2015 14:45:06 -0500
Received: by igbhv6 with SMTP id hv6so43483689igb.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2015 11:45:05 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdaQYDk4s9b79xh+vL-3SFYp5GN3KpjgsSshzF0E+1-r5A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

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

So I added a few duplicate SPI gpio controllers to see how it looks in userspace.

root@som-imx6q:~# lsgpio
GPIO chip: 209c000.gpio, 32 GPIO lines
GPIO chip: 20a0000.gpio, 32 GPIO lines
GPIO chip: 20a4000.gpio, 32 GPIO lines
GPIO chip: 20a8000.gpio, 32 GPIO lines
GPIO chip: 20ac000.gpio, 32 GPIO lines
GPIO chip: 20b0000.gpio, 32 GPIO lines
GPIO chip: 20b4000.gpio, 32 GPIO lines
GPIO chip: mcp23s08, 8 GPIO lines
GPIO chip: mcp23s08, 8 GPIO lines

As expected the two are indistinguishable using the lsgpio.

Here is how they look in the /sys/bus/gpio directory:
root@som-imx6q:~# for x in /sys/bus/gpio/devices/gpiochip*; do readlink $x; done
../../../devices/soc0/soc/2000000.aips-bus/209c000.gpio/gpiochip0
../../../devices/soc0/soc/2000000.aips-bus/20a0000.gpio/gpiochip1
../../../devices/soc0/soc/2000000.aips-bus/20a4000.gpio/gpiochip2
../../../devices/soc0/soc/2000000.aips-bus/20a8000.gpio/gpiochip3
../../../devices/soc0/soc/2000000.aips-bus/20ac000.gpio/gpiochip4
../../../devices/soc0/soc/2000000.aips-bus/20b0000.gpio/gpiochip5
../../../devices/soc0/soc/2000000.aips-bus/20b4000.gpio/gpiochip6
../../../devices/soc0/soc/2000000.aips-bus/2000000.spba-bus/2008000.ecspi/spi_master/spi0/spi0.0/gpiochip7
../../../devices/soc0/soc/2000000.aips-bus/2000000.spba-bus/200c000.ecspi/spi_master/spi1/spi1.0/gpiochip8

Here is what the debug out looks like:
root@som-imx6q:~# cat /sys/kernel/debug/gpio 
gpiochip0: GPIOs 0-31, parent: platform/209c000.gpio, 209c000.gpio:

gpiochip1: GPIOs 32-63, parent: platform/20a0000.gpio, 20a0000.gpio:
 gpio-33  (                    |PCIe reset          ) out hi    

gpiochip2: GPIOs 64-95, parent: platform/20a4000.gpio, 20a4000.gpio:
 gpio-83  (                    |spi_imx             ) out hi    
 gpio-84  (                    |spi_imx             ) out hi    
 gpio-93  (                    |phy-reset           ) out hi    

gpiochip3: GPIOs 96-127, parent: platform/20a8000.gpio, 20a8000.gpio:

gpiochip4: GPIOs 128-159, parent: platform/20ac000.gpio, 20ac000.gpio:

gpiochip5: GPIOs 160-191, parent: platform/20b0000.gpio, 20b0000.gpio:

gpiochip6: GPIOs 192-223, parent: platform/20b4000.gpio, 20b4000.gpio:

gpiochip8: GPIOs 496-503, parent: spi/spi1.0, mcp23s08, can sleep:

gpiochip7: GPIOs 504-511, parent: spi/spi0.0, mcp23s08, can sleep:

The parent string here is perhaps a good way to distinguish between similar
registrations. Perhaps the bus part of parent string could be added to another
string in the struct that is passed to userspace with the ioctl.

> 
> Yours,
> Linus Walleij
