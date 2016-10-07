From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH v6 1/1] USB: serial: cp210x: Adding GPIO support for
 CP2105
Date: Fri, 7 Oct 2016 16:31:26 +0100
Message-ID: <20161007153126.GA355@hermes.home>
References: <b77f588156e346037d7efda72f9ed1dc460b810a.1474670298.git.martyn.welch@collabora.co.uk>
 <CACRpkdbQzigYvx61S__+=qW1+NWxDyxUyg-Tm0=8Sj42xy6EWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38986 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756612AbcJGPbf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2016 11:31:35 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbQzigYvx61S__+=qW1+NWxDyxUyg-Tm0=8Sj42xy6EWg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>

On Tue, Oct 04, 2016 at 02:13:26PM +0200, Linus Walleij wrote:
> On Sat, Sep 24, 2016 at 12:50 AM, Martyn Welch
> <martyn.welch@collabora.co.uk> wrote:
> 
> > This patch adds support for the GPIO found on the CP2105.
> 
> 
> > This device supports either push-pull or open-drain modes, it doesn't
> > provide an explicit input mode, though the state of the GPIO can be read
> > when used in open-drain mode. Like with pin use, the mode is configured in
> > the one-time programable PROM and can't be changed at runtime.
> 
> I see.
> 
> So implement .direction_input() and .direction_output()
> anyways.
> 
> Return failure on .direction_input() if it is in push-pull mode.
> 
> Return success on all .direction_output() calls.
> 
> Then implement .set_single_ended() and return success for open drain
> if the is in open drain, success for push-pull if the line is in push-pull
> mode, and failure in all other cases. Simple, but correct.
> 

This is proving to be problematic, because we are trying to be clever in
gpiolib and the driver.

I have the driver setup as above, if I have a pin that is configured as
open-drain (and can't be changed) and I try to drive it as an open-source
output with a low output value, it succeeds.

This is because, in gpiolib, if the device can't actually be set as o-s,
we configure it as input to emulate o-s (_gpiod_direction_output_raw):


        else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
                if (gc->set_single_ended) {
                        ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
                                                   LINE_MODE_OPEN_SOURCE);
                        if (!ret)
                                goto set_output_value;
                }
                /* Emulate open source by not actively driving the line low */
                if (!value)
                        return gpiod_direction_input(desc);


In the driver we can't change it to input, but we are trying to be clever,
so we allow pins which are o-d to be treated as though they are inputs. However, for the o-d to behave like an input at all, the pin must be driven with a "1" (i.e. pulled up, rather than driven low), so:


        /*
         * Return failure if pin is configured in push-pull mode, can only
         * emulate input when pin is configured as open-drain
         */
        if (priv->gpio_mode & BIT(gpio))
                return -ENOTSUPP;

        /*
         * Ensure we are outputting a high state so that we can use the
         * open-drain output as an input
         */
        cp210x_gpio_set(gc, gpio, 1);


So now we have a pin that is supposed to be pulling to ground that is
actually pulling to VCC.

Also, if an output can only be open-drain, attempting to set the pin as
push-pull succeeds because gpiolib (currently) assumes that a pin can
always be p-p and doesn't even check the return value of it's call to
.set_single_ended:


               /* Make sure to disable open drain/source hardware, if any */
                if (gc->set_single_ended)
                        gc->set_single_ended(gc,
                                             gpio_chip_hwgpio(desc),
                                             LINE_MODE_PUSH_PULL);


This is clearly a separate issue.

WRT this driver, I think I need to keep set_single_ended, but change .direction_input to always return a failure and have .direction_output always return success to avoid pins being driven in unexpected ways. Does that sould acceptable?

Martyn
