From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10 1/1] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Wed, 26 Oct 2016 13:50:14 +0200
Message-ID: <CACRpkdYiWMPXeQs3h=gEic+Zh6bhPvtgTvmDpeMA3o07bvRZaQ@mail.gmail.com>
References: <33cb529dad5c28a135e9e21460582c3cc4e6d4b5.1476950450.git.martyn.welch@collabora.co.uk>
 <CACRpkdab5d71TgrTD-4U95R6MvWdFcaqRcGpPS0D8sExKi=b3g@mail.gmail.com> <20161026090944.GI12024@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:39233 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754814AbcJZLuQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2016 07:50:16 -0400
Received: by mail-qt0-f180.google.com with SMTP id g49so2679160qtc.6
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2016 04:50:15 -0700 (PDT)
In-Reply-To: <20161026090944.GI12024@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>

On Wed, Oct 26, 2016 at 11:09 AM, Johan Hovold <johan@kernel.org> wrote:
> On Tue, Oct 25, 2016 at 11:34:40AM +0200, Linus Walleij wrote:

>> I was thinking on either reusing the .names field of the
>> struct gpiochip to name the lines for the userspace
>> chardev. With the sideeffect of the names getting reflected
>> also to sysfs if using that.
>
> Simply reusing .names would cause problems since the old sysfs name
> space is flat, so you would be unable to use more than one pluggable
> expander (unless also encoding the topology in the name).

Hm it seems we should actually #ifdef that field for sysfs then,
it has no applicability outside the legacy sysfs.

> Providing default names from the driver could perhaps be useful at
> times. For this particular chip the names would still be GPIO_0, GPIO_1
> and GPIO_2 (possibly with a suffix depending on which of the two
> controllers they hang off of) however, which may not be much better than
> using chip->base + offset. I'd assume this to be the common case.

The chardev names are pertaining to a certain device like
"gpiochip1" already so the names only need to be unique
per-instance.

If we made them globally unique we could just use the .names
in gpiochip anyways, but that seems ugly.

What about suppling

gpiochip_set_names(struct gpio_chip *gc,
                               char **names);

As the size of the array is implicit from ngpios and the function
would be kernel-internal anyways.

> Device-tree overlays is what I see a real use for where different
> overlays can be applied based on topology data to describe what is
> actually connected to a pin in a specific setup. And that seems like
> something that could be useful for normal (static) DT systems as well
> (e.g. describe what's actually connected to those Beaglebone pins).

Yeah these overlays ... discussed that a lot recently.
It fits the Beaglebone indeed.

Yours,
Linus Walleij
