From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Fri, 23 Sep 2016 18:24:04 +0300
Message-ID: <e1220fe5-f52e-60a3-2070-edb3da382035@mentor.com>
References: <20160916135808.GA17518@lukather>
 <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather>
 <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:63591 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034395AbcIWPYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 11:24:19 -0400
In-Reply-To: <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

Hi Linus, Maxime,

On 09/23/2016 04:22 PM, Linus Walleij wrote:
> On Wed, Sep 21, 2016 at 9:51 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>> On Sun, Sep 18, 2016 at 01:30:24PM +0200, Linus Walleij wrote:
>
>>>> I have the feeling that the core should prevent that, making sure that
>>>> the gpiod_request returns EBUSY in such a case, but I'm not really
>>>> sure whether it's the case or not, and if it is, where that check is
>>>> happening.
>>>
>>> - Did you try specifying .strict for the pinmux?
>>>
>>> - Did you read Documentation/pinctrl.txt, section titled
>>>   "GPIO mode pitfalls"?
>>
>> Sigh. Sorry for that, I should learn to read the documentation. This
>> is obviously the right thing to do.
>
> Guessed so.
>
>> However, it does have an unexpected side-effect. On our DT, for the
>> GPIOs, we also set up a pinctrl node (which seem to be along the lines
>> of the doc recommandations, section "Drivers needing both pin control
>> and GPIOs").
>>
>> However, when pinctrl_select_default is called by the core, which in
>> turns ends up calling pinmux_enable_setting, which builds the owner
>> name using the dev_name. However, when we call gpiod_request, it ends
>> up in pinmux_request_gpio, which build the owner string using the
>> pinctrl device name and the pin number.
>>
>> This results in a mismatch of owners, and the gpiod_request fails,
>> while the device really is the same.
>
> Yeah, needing both GPIO and pinctrl on the same pin kind of
> implies that the subsystems are poking at the same hardware and
> that is !=strict.

recently I worked on GPIO to pinctrl connection for i.MX SoCs, so
let me share some details until I forget them while time goes by.

IMHO i.MX* IOMUX controllers are type A strict pinctrl controllers
described in Documentation/pinctrl.txt, however practically it won't
be possible to convert them to the strict type due to the countless
runtime issues on boards when DTBs are not updated at the same time,
in other words backward compatibility with the preexisting firmware
is hardly reachable, however for any next added i.MX pinctrl drivers
(and probably many other pinctrl drivers) I would suggest to set
the type to strict, at least it might be nice to

a) more precisely describe what is the strict pinctrl controller
    beast,
b) ask every pinctrl driver submitter for clear confirmation that
    their controller is strict or non-strict.

This should allow to avoid some degree of pain in the future, when
it accidentally happens that users (e.g. fossilized in DTBs) of
a strict pinctrl controller abuse the freedom given exclusively
for non-strict controllers.

Next are some issues I've observed, due to our specifics we have to
control pad muxing in runtime between GPIO and functional modes.
This may imply not only the change of mux setting but as well pin
config changes, hence limiting the discussion to pin descriptions
in OF there should be two or more pinctrl tuples (mux function,
pin config) for the same pin. Usually on practice this case is
resolved by providing pinctrl-[0-9]+ properties, but this works
well only if there is no pad ownership transfer, otherwise one of
two independent users of the same pad resourse will fail to be
registered during boot time due to a conflict for the resourse.
When a device is unbound in runtime, a pad resourse is released
and it can be captured by another device (repeat the procedure to
restore the original state), and when one of the rivals is active
another shall not get a chance to grab the pads. I didn't manage
to find a good description of this possibility in DTS though,
the best one we came across is adding a pinctrl-* property pointing
to GPIO mux/config settings of wanted GPIOs right into the
correspondent GPIO controller device node and set it as non-default
to avoid boot time conflict. When turn for GPIOs begins in runtime
the mux and config values for a pinctrl hardware are taken from
that phandle (by an overly hackish in-kernel pinctrl API extension,
which accounts that non-"default" pinctrl-names values).

And here are some conclusions, as I can see often potentially
dangling pads for GPIOs are described in a hog group (owned by
pinctrl), for strict controllers there is a conflict between
the pinctrl and an end-point GPIO user, probably it might be better
to neutralize this conflict by moving pad groups with GPIO
functioning pads into exclusive usage (including formal runtime
ownership) by GPIO controller drivers and their backends in
pinctrl subsystem. There should be an anchor in DTS, which says
that a pad is functioning as a GPIO, it is given if a pad
belongs to a "gpio-controller" device node. Alternatively hog
groups may be reviewed, all non-GPIO pads placed there are wiped
out or moved to more appropriate groups and hog group ownership
is transferred to the class of GPIO controllers, but this is
a more questionable path.

> I have had some half-finished thoughts here, for example to add
> more callbacks from GPIO to pinctrl for things like open drain
> and biasing, so that GPIO would be a "pure" front-end with a pinctrl
> back-end. It ends up duplicating a lot of stuff from pinctrl in GPIO,
> but since people will inevitably want to do things like biasing
> from the GPIO chardev I might have to bite the bullet and do it
> that way.
>

Open drain, biasing and so on pad config settings can be taken
directly from DTB, if there is no intention to change them in runtime
of course. I don't know if necessity of having OF support is too harsh,
but this may become a good starting point.

> Other ideas welcome.
>

--
With best wishes,
Vladimir
