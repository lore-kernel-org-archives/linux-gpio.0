From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH v6 1/1] USB: serial: cp210x: Adding GPIO support for
 CP2105
Date: Fri, 7 Oct 2016 18:02:40 +0100
Message-ID: <20161007170240.GB355@hermes.home>
References: <b77f588156e346037d7efda72f9ed1dc460b810a.1474670298.git.martyn.welch@collabora.co.uk>
 <CACRpkdbQzigYvx61S__+=qW1+NWxDyxUyg-Tm0=8Sj42xy6EWg@mail.gmail.com>
 <20161007153126.GA355@hermes.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39127 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932268AbcJGRJq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2016 13:09:46 -0400
Content-Disposition: inline
In-Reply-To: <20161007153126.GA355@hermes.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>

On Fri, Oct 07, 2016 at 04:31:26PM +0100, Martyn Welch wrote:
> Also, if an output can only be open-drain, attempting to set the pin as
> push-pull succeeds because gpiolib (currently) assumes that a pin can
> always be p-p and doesn't even check the return value of it's call to
> .set_single_ended:
> 
> 
>                /* Make sure to disable open drain/source hardware, if any */
>                 if (gc->set_single_ended)
>                         gc->set_single_ended(gc,
>                                              gpio_chip_hwgpio(desc),
>                                              LINE_MODE_PUSH_PULL);
> 
> 
> This is clearly a separate issue.
> 

A bit of testing also show that a "open-drain only" output will succeed when
an open-source output driven high is requested. Rather than having a pin
pulled hard to VCC, we have a pin pulled to VCC via a resistor and thus
(if there are other devices connected to the pin pulling to GND via a
resistor, which would kinda stand to reason given the pin is being
configured for open-source mode) we have the signal floating at a voltage
determined by the effect of the two sets of resistors acting as a voltage
divider.

Martyn
