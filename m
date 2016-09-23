From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Fri, 23 Sep 2016 15:22:53 +0200
Message-ID: <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
References: <20160916135808.GA17518@lukather> <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35703 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965572AbcIWNWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 09:22:55 -0400
Received: by mail-oi0-f43.google.com with SMTP id w11so133904992oia.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 06:22:54 -0700 (PDT)
In-Reply-To: <20160921195128.GG8719@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

On Wed, Sep 21, 2016 at 9:51 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Sun, Sep 18, 2016 at 01:30:24PM +0200, Linus Walleij wrote:

>> > I have the feeling that the core should prevent that, making sure that
>> > the gpiod_request returns EBUSY in such a case, but I'm not really
>> > sure whether it's the case or not, and if it is, where that check is
>> > happening.
>>
>> - Did you try specifying .strict for the pinmux?
>>
>> - Did you read Documentation/pinctrl.txt, section titled
>>   "GPIO mode pitfalls"?
>
> Sigh. Sorry for that, I should learn to read the documentation. This
> is obviously the right thing to do.

Guessed so.

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

Yeah, needing both GPIO and pinctrl on the same pin kind of
implies that the subsystems are poking at the same hardware and
that is !=strict.

I have had some half-finished thoughts here, for example to add
more callbacks from GPIO to pinctrl for things like open drain
and biasing, so that GPIO would be a "pure" front-end with a pinctrl
back-end. It ends up duplicating a lot of stuff from pinctrl in GPIO,
but since people will inevitably want to do things like biasing
from the GPIO chardev I might have to bite the bullet and do it
that way.

Other ideas welcome.

Yours,
Linus Walleij
