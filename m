From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Fri, 30 Sep 2016 09:26:28 -0700
Message-ID: <CACRpkdZDU5=2HO2mmiigOsHJxY95w8=U7RLJ4sqmJvN0B-e8UA@mail.gmail.com>
References: <20160916135808.GA17518@lukather> <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather> <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
 <e1220fe5-f52e-60a3-2070-edb3da382035@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33512 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933145AbcI3Q0b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2016 12:26:31 -0400
Received: by mail-oi0-f42.google.com with SMTP id r126so136054137oib.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Sep 2016 09:26:30 -0700 (PDT)
In-Reply-To: <e1220fe5-f52e-60a3-2070-edb3da382035@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

On Fri, Sep 23, 2016 at 8:24 AM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> I would suggest to set
> the type to strict, at least it might be nice to
>
> a) more precisely describe what is the strict pinctrl controller
>    beast,
> b) ask every pinctrl driver submitter for clear confirmation that
>    their controller is strict or non-strict.

Sure, for (a) I tried to write that in Documentation/pinctrl.txt but if
it's unclear, patches are accepted! :)

For (b) I might have slipped, I need more help with review and
sometimes some guerilla patching to random drivers is
welcome.

Not that strictness is the most important thing in the world, there
are many aspects to pin control, but it is one of the things
you might want.

> This should allow to avoid some degree of pain in the future, when
> it accidentally happens that users (e.g. fossilized in DTBs) of
> a strict pinctrl controller abuse the freedom given exclusively
> for non-strict controllers.

Maybe write some do's and don'ts into the documentation then?
But mainly it comes up during review of course.

> Next are some issues I've observed, due to our specifics we have to
> control pad muxing in runtime between GPIO and functional modes.

Interesting. That is not very common I think, do you mean

> This may imply not only the change of mux setting but as well pin
> config changes, hence limiting the discussion to pin descriptions
> in OF there should be two or more pinctrl tuples (mux function,
> pin config) for the same pin. Usually on practice this case is
> resolved by providing pinctrl-[0-9]+ properties, but this works
> well only if there is no pad ownership transfer, otherwise one of
> two independent users of the same pad resourse will fail to be
> registered during boot time due to a conflict for the resourse.

Yeah for complex use cases you likely need a few non-"default"
pin states and have code explicitly switch between them.

> When a device is unbound in runtime, a pad resourse is released
> and it can be captured by another device (repeat the procedure to
> restore the original state), and when one of the rivals is active
> another shall not get a chance to grab the pads. I didn't manage
> to find a good description of this possibility in DTS though,
> the best one we came across is adding a pinctrl-* property pointing
> to GPIO mux/config settings of wanted GPIOs right into the
> correspondent GPIO controller device node and set it as non-default
> to avoid boot time conflict. When turn for GPIOs begins in runtime
> the mux and config values for a pinctrl hardware are taken from
> that phandle (by an overly hackish in-kernel pinctrl API extension,
> which accounts that non-"default" pinctrl-names values).

Uncertain what you mean here, but yeah, we have certainly not
designed the subsystem for all usecases people may have so
contributions are welcome.

> And here are some conclusions, as I can see often potentially
> dangling pads for GPIOs are described in a hog group (owned by
> pinctrl),

OK

> for strict controllers there is a conflict between
> the pinctrl and an end-point GPIO user,

Do you mean when you need to add a few pin configs (no muxing)
to a pin/pad used for GPIO? So you have a hog or something
setting up the pin config and then grab the GPIO from the gpiolib
side calling down to the pin control subsystem and thus needing the
pin controller to be non-strict?

> probably it might be better
> to neutralize this conflict by moving pad groups with GPIO
> functioning pads into exclusive usage (including formal runtime
> ownership) by GPIO controller drivers and their backends in
> pinctrl subsystem. There should be an anchor in DTS, which says
> that a pad is functioning as a GPIO, it is given if a pad
> belongs to a "gpio-controller" device node.

That is interesting. However the usual pattern is to let the
device consuming both the pin control state and the gpio line
own them both.

So what you're suggesting is that they should only own/fetch
the GPIO line and then the gpio controller handles the
corresponding line config settings when the pin is in GPIO
mode?

That sounds elegant. While old DTS must be supported, a
scheme moving to haing the gpiochip own the pincontrol
settings for each of its pins when and only when used as
GPIO, would be very nice.

I imagine a piece of code added to gpiolib for this in that
case, and some nice DT bindings for it.

I think it could be a bit of work, but it can be done.

> Alternatively hog
> groups may be reviewed, all non-GPIO pads placed there are wiped
> out or moved to more appropriate groups and hog group ownership
> is transferred to the class of GPIO controllers, but this is
> a more questionable path.

Nah not as elegant.

>> I have had some half-finished thoughts here, for example to add
>> more callbacks from GPIO to pinctrl for things like open drain
>> and biasing, so that GPIO would be a "pure" front-end with a pinctrl
>> back-end. It ends up duplicating a lot of stuff from pinctrl in GPIO,
>> but since people will inevitably want to do things like biasing
>> from the GPIO chardev I might have to bite the bullet and do it
>> that way.
>
> Open drain, biasing and so on pad config settings can be taken
> directly from DTB, if there is no intention to change them in runtime
> of course. I don't know if necessity of having OF support is too harsh,
> but this may become a good starting point.

Your idea to have the gpiochip just select the static config for a line
when it is used as GPIO is more elegant I think.

Yours,
Linus Walleij
