From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v10 1/1] USB: serial: cp210x: Adding GPIO support for
 CP2105
Date: Wed, 26 Oct 2016 14:16:59 +0200
Message-ID: <20161026121659.GJ12024@localhost>
References: <33cb529dad5c28a135e9e21460582c3cc4e6d4b5.1476950450.git.martyn.welch@collabora.co.uk>
 <CACRpkdab5d71TgrTD-4U95R6MvWdFcaqRcGpPS0D8sExKi=b3g@mail.gmail.com>
 <20161026090944.GI12024@localhost>
 <CACRpkdYiWMPXeQs3h=gEic+Zh6bhPvtgTvmDpeMA3o07bvRZaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33319 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755267AbcJZMRC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2016 08:17:02 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYiWMPXeQs3h=gEic+Zh6bhPvtgTvmDpeMA3o07bvRZaQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Martyn Welch <martyn.welch@collabora.co.uk>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>

On Wed, Oct 26, 2016 at 01:50:14PM +0200, Linus Walleij wrote:
> On Wed, Oct 26, 2016 at 11:09 AM, Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Oct 25, 2016 at 11:34:40AM +0200, Linus Walleij wrote:
> 
> >> I was thinking on either reusing the .names field of the
> >> struct gpiochip to name the lines for the userspace
> >> chardev. With the sideeffect of the names getting reflected
> >> also to sysfs if using that.
> >
> > Simply reusing .names would cause problems since the old sysfs name
> > space is flat, so you would be unable to use more than one pluggable
> > expander (unless also encoding the topology in the name).
> 
> Hm it seems we should actually #ifdef that field for sysfs then,
> it has no applicability outside the legacy sysfs.

Might make sense. If I remember correctly, this isn't the first time
we've had this discussion. ;)

> > Providing default names from the driver could perhaps be useful at
> > times. For this particular chip the names would still be GPIO_0, GPIO_1
> > and GPIO_2 (possibly with a suffix depending on which of the two
> > controllers they hang off of) however, which may not be much better than
> > using chip->base + offset. I'd assume this to be the common case.
> 
> The chardev names are pertaining to a certain device like
> "gpiochip1" already so the names only need to be unique
> per-instance.

Yeah, I was referring to the legacy sysfs interface above.

> If we made them globally unique we could just use the .names
> in gpiochip anyways, but that seems ugly.

Agreed.

> What about suppling
> 
> gpiochip_set_names(struct gpio_chip *gc,
>                                char **names);
> 
> As the size of the array is implicit from ngpios and the function
> would be kernel-internal anyways.

You'd at least want to provide a way to set these names before the
gpiochip is registered if you go down this path.

But the point I was trying to make above was whether it was at all worth
it. If the pins are truly general purpose, you would typically not be
providing any more information than the pin chip-offset (e.g. GPIO_1).

But sure, some device might use "a", "b", "c, or whatever...

> > Device-tree overlays is what I see a real use for where different
> > overlays can be applied based on topology data to describe what is
> > actually connected to a pin in a specific setup. And that seems like
> > something that could be useful for normal (static) DT systems as well
> > (e.g. describe what's actually connected to those Beaglebone pins).
> 
> Yeah these overlays ... discussed that a lot recently.
> It fits the Beaglebone indeed.

Not just Beaglebone. It would be generally useful for anything
hotpluggable (e.g. we intended to use this for Greybus) where you need
to describe something non-discoverable (e.g. i2c, spi, gpio) that's
sitting behind a controller on a discoverable bus (e.g. greybus or usb).

Thanks,
Johan
