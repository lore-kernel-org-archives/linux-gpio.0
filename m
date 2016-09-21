From: Michael Welling <mwelling@ieee.org>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Wed, 21 Sep 2016 15:34:35 -0500
Message-ID: <20160921203435.GA14965@sysresccd>
References: <20160916135808.GA17518@lukather>
 <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35839 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933548AbcIUUen (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2016 16:34:43 -0400
Received: by mail-it0-f46.google.com with SMTP id r192so138960174ita.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2016 13:34:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160921195128.GG8719@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

On Wed, Sep 21, 2016 at 10:51:28PM +0300, Maxime Ripard wrote:
> Hi Linus,
> 
> Thanks for your reply.
> 
> On Sun, Sep 18, 2016 at 01:30:24PM +0200, Linus Walleij wrote:
> > On Fri, Sep 16, 2016 at 3:58 PM, Maxime Ripard
> > <maxime.ripard@free-electrons.com> wrote:
> > 
> > > However, things are getting weird when you have that requested pin
> > > assigned to one device, and you try to export the GPIO on that pin
> > > (through sysfs for example,
> > 
> > DON'T use sysfs. Use the new chardev ABI which is by the way enabled
> > by default.
> > 
> > (But you will face the same issue there I guess.)
> 
> Yeah, well, we could re-do the discussion on ksummit-discuss :)

Are you guys trolling me?

> 
> > > but given the implementation, I think that
> > > it would work alike by calling gpiod_request).
> > 
> > Yes
> > 
> > > In this case, you get no error, and the GPIO is indeed exported,
> > > allowing the user to change the direction and / or value of the pin,
> > > taking away that pin from its device.
> > 
> > If and only if the pin controller does not specify .strict in
> > struct pinmux_ops.
> > 
> > > I have the feeling that the core should prevent that, making sure that
> > > the gpiod_request returns EBUSY in such a case, but I'm not really
> > > sure whether it's the case or not, and if it is, where that check is
> > > happening.
> > 
> > - Did you try specifying .strict for the pinmux?
> > 
> > - Did you read Documentation/pinctrl.txt, section titled
> >   "GPIO mode pitfalls"?
> 
> Sigh. Sorry for that, I should learn to read the documentation. This
> is obviously the right thing to do.
> 
> However, it does have an unexpected side-effect. On our DT, for the
> GPIOs, we also set up a pinctrl node (which seem to be along the lines
> of the doc recommandations, section "Drivers needing both pin control
> and GPIOs").
> 
> However, when pinctrl_select_default is called by the core, which in
> turns ends up calling pinmux_enable_setting, which builds the owner
> name using the dev_name. However, when we call gpiod_request, it ends
> up in pinmux_request_gpio, which build the owner string using the
> pinctrl device name and the pin number.
> 
> This results in a mismatch of owners, and the gpiod_request fails,
> while the device really is the same.
> 
> Thanks,
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


