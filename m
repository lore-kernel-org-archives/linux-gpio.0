From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [RFC PATCH 2/2] gpio: provide a consumer when requesting a gpio
Date: Thu, 18 Jan 2018 16:22:28 +0100
Message-ID: <20180118152228.GX2989@rfolt0960.corp.atmel.com>
References: <20180115162407.6314-1-ludovic.desroches@microchip.com>
 <20180115162407.6314-3-ludovic.desroches@microchip.com>
 <CACRpkdbsYyHRz826K0QA=Y7Dvf_sm714o5601KBD7Zo4+1hrQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:31841 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932124AbeARPWn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jan 2018 10:22:43 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdbsYyHRz826K0QA=Y7Dvf_sm714o5601KBD7Zo4+1hrQA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>

On Thu, Jan 18, 2018 at 11:30:00AM +0100, Linus Walleij wrote:
> On Mon, Jan 15, 2018 at 5:24 PM, Ludovic Desroches
> <ludovic.desroches@microchip.com> wrote:
> 
> > It can be useful for the pinmuxing layer to know which device is
> > requesting a GPIO. Add a consumer variant for gpiod_request to
> > reach this goal.
> >
> > GPIO chips managed by pin controllers should provide the new
> > request_consumer operation. They can rely on
> > gpiochip_generic_request_consumer instead of
> > gpiochip_generic_request.
> >
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> 
> I think we need to think over what is a good way to share ownership
> of a pin.
> 
> Russell pointed me to a similar problem incidentally and I briefly looked
> into it: there are cases when several devices may need to hold the
> same pin.
> 
> Can't we just look up the associated gpio_chip from the GPIO range,
> and in case the pin is connected between the pin controller and
> the GPIO chip, then we allow the gpiochip to also take a
> reference?
> 

It's the probably the way to go, it was Maxime's proposal and Andy seems
to agree this solution.

> I.e. in that case you just allow gpio_owner to proceed and take the
> pin just like with a non-strict controller.
> 
> Yours,
> Linus Walleij

Regards

Ludovic
