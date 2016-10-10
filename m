From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Mon, 10 Oct 2016 10:32:45 +0200
Message-ID: <CACRpkdbr8JLHYvfyRugpv4n3JMr+XYv_CQj_8o3z8p3hYHuewA@mail.gmail.com>
References: <20160927002650.4316-1-stefan@agner.ch> <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch> <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch> <20160928020052.GB2551@vireshk-i7>
 <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch> <20160928041451.GC2551@vireshk-i7>
 <1478f2c1989ab735b0f86d2fe579f94f@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36809 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752172AbcJJIdT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2016 04:33:19 -0400
Received: by mail-oi0-f42.google.com with SMTP id m72so119720019oik.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2016 01:32:46 -0700 (PDT)
In-Reply-To: <1478f2c1989ab735b0f86d2fe579f94f@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Shawn Guo <shawnguo@kernel.org>, Adrian Alonso <aalonso@freescale.com>, Robin Gong <b38343@freescale.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peng Fan <van.freenix@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 29, 2016 at 6:33 PM, Stefan Agner <stefan@agner.ch> wrote:
> On 2016-09-27 21:14, Viresh Kumar wrote:
>> On 27-09-16, 20:38, Stefan Agner wrote:
>>> The i.MX I2C driver touches the pinctrl in its prepare/unprepare
>>> callbacks.
>>>
>>> So, on a i.MX or Vybrid, the call chain looks like this:
>>>
>>> i2c_generic_gpio_recovery
>>>     -> i2c_get_gpios_for_recovery
>>>        -> gpio_request_one
>>>     -> i2c_generic_recovery
>>>        -> prepare_recovery (i2c_imx_prepare_recovery)
>>>           -> pinctrl_select_state [gpio]
>>
>> Why is this done here? And not in gpio_request_one?
>>
>
> You need to differentiate between Vybrid and i.MX:
>
> Vybrid muxes a pin to GPIO on gpio_request_one (via .gpio_request_enable
> callback)
> i.MX does not mux a pin as GPIO on its own, but needs to be muxed
> explicitly. That has been always the case...
>
> I don't know what behavior is right, it is just "different"...

Exactly. It would have been nice if we had defined clear semantics
on how this should work when creating the pin control subsystem,
had we been able to agree. We didn't so it's up to each driver and
system to deal with this in whatever way they like.

Whoever is interested in stringency may drive it.

> In Vybrid I did it that way because I knew that was the behavior of
> another SoC I worked on (namely a Tegra)... And I had to touch the
> pinctrl register anyway (using gpio_set_direction, to set the
> direction).

Yes and that is one school of pin controlling.

> I guess in the end it boils down to one question: Is the GPIO and
> pinctrl API ment to be orthogonal?

Both and.

The platforms implementing the following in their struct pinmux_ops:
.gpio_request_enable()
.gpio_disable_free()
.gpio_set_direction()

AND have a corresponding GPIO driver calling
gpiochip_add_pin_range() or gpiochip_add_pingroup_range()
so we can cross reference pins and GPIO lines, AND
do something like call pinctrl_request_gpio() and
pinctrl_free_gpio() equivalent to the below:

        if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
                chip->gc.request = gpiochip_generic_request;
                chip->gc.free = gpiochip_generic_free;
        }

And potentially also pinctrl_gpio_direction_input()
and pinctrl_gpio_direction_output() will use the corresponing
pin controller as back end in their GPIO set-up when dealing
with request/free and optionally also direction.

This is cooperative and NOT orthogonal.

On the other hand: a pin control driver implementing none of
the above functions will be orthogonal, and in these cases
they just have to mux the line into GPIO mode on their own
using tables, DT, hogs, whatever.

> If so, then we probably should select
> the GPIO via pinctrl in the i.MX I2C driver but mux the pin in
> gpio_request_one similar as we do it on Vybrid... But that would be
> rather invasive change...
>
> @Shawn, Linus Walleij, others, what is your take on that?

You can choose. Do everything muxwise in the pin controller
or do it all as a back-end per above.

Notice that the above approach has "holes": we can only set
direction. Any other pin configuration (drive strength, push/pull
or open drain, bias etc) still need to be set up from pin control.

I had some ideas of how to deal with that by adding yet another
cross call but never get around to fixing it.

>>>        -> unprepare_recovery (i2c_imx_unprepare_recovery)
>>>           -> pinctrl_select_state [default]
>>>     -> i2c_put_gpios_for_recovery
>>>        -> gpio_free
>
> Currently free does not restore the last pinmux, so if the API's are
> meant to be completely orthogonal we need to store the pinmux in
> gpio_request_one so we can restore it in gpio_free.

I don't understand this but it sounds like some frankenstein
solution. If you can't get the two subsystems orthogonal for your
usecases then rewrite your driver as per above implementing
pin control as a back-end to GPIO.

Yours,
Linus Walleij
