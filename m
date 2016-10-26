From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 1/1] USB: serial: cp210x: Adding GPIO support for
 CP2105
Date: Wed, 26 Oct 2016 11:09:44 +0200
Message-ID: <20161026090944.GI12024@localhost>
References: <33cb529dad5c28a135e9e21460582c3cc4e6d4b5.1476950450.git.martyn.welch@collabora.co.uk>
 <CACRpkdab5d71TgrTD-4U95R6MvWdFcaqRcGpPS0D8sExKi=b3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdab5d71TgrTD-4U95R6MvWdFcaqRcGpPS0D8sExKi=b3g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Karl Palsson <karlp-PhA6lrgffZtPR4JQBCEnsQ@public.gmane.org>, Konstantin Shkolnyy <Konstantin.Shkolnyy-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 25, 2016 at 11:34:40AM +0200, Linus Walleij wrote:
> Good work on this patch, nice that it got merged.
> 
> I was just thinking that as an add-on, you may want to name
> the gpio lines so they have meaningful names in userspace
> when you use this with the chardev (I have reasons to believe
> these GPIOs will be used from userspace, tell me if that
> is wrong).
>
> We currently support naming lines for devicetree and
> ACPI (in -next).
> 
> I was thinking on either reusing the .names field of the
> struct gpiochip to name the lines for the userspace
> chardev. With the sideeffect of the names getting reflected
> also to sysfs if using that.

Simply reusing .names would cause problems since the old sysfs name
space is flat, so you would be unable to use more than one pluggable
expander (unless also encoding the topology in the name).

> We could otherwise add a special function to name the
> lines from drivers like this that hang off a pluggable bus.
> 
> Johan/Martyn what is your idea?

Providing default names from the driver could perhaps be useful at
times. For this particular chip the names would still be GPIO_0, GPIO_1
and GPIO_2 (possibly with a suffix depending on which of the two
controllers they hang off of) however, which may not be much better than
using chip->base + offset. I'd assume this to be the common case.

Device-tree overlays is what I see a real use for where different
overlays can be applied based on topology data to describe what is
actually connected to a pin in a specific setup. And that seems like
something that could be useful for normal (static) DT systems as well
(e.g. describe what's actually connected to those Beaglebone pins).

Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
