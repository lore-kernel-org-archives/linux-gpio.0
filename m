From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Tue, 20 Jun 2017 10:39:42 +0200
Message-ID: <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
References: <1497543642.3086.35.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:37072 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751029AbdFTIjp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 04:39:45 -0400
Received: by mail-it0-f45.google.com with SMTP id m47so9734989iti.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 01:39:44 -0700 (PDT)
In-Reply-To: <1497543642.3086.35.camel@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>

On Thu, Jun 15, 2017 at 6:20 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> To handle this we tried:
> - [0]: To create the mapping in the gpio_to_irq. Linus, you pointed out that
> this is not allowed as gpio_to_irq is callable in irq context, therefore it
> should not sleep. Actually 3 drivers [2] are calling gpio_to_irq in irq
> handlers.

This is not the problem. The problem is that gpio_to_irq() is entirely
optional: it is not at all requires to have called gpio_to_irq() before using
an IRQ from a GPIO line, as the interrupt chips and gpio chips are
orthogonal.

So if gpio_to_irq() is called, then a mapping needs to be retrieved, using
an irqdomain or similar, and if one does not already exist, it should be mapped
at this point.

But actually doing the mapping/unmapping of IRQs and related resource
management should be handled by the irqchip/irqdomain, not ever by
gpio_to_irq().

And someone may just be requesting an IRQ from the irqchip without
calling gpio_to_irq(). Anytime. And with devicetree this happens all of the
time.

> I would also add that "gpio_to_irq" has no "free" counter part, so this approach
> leaks mappings.

Exactly.

> The fact that 26 gpio drivers [3] create mapping in the
> gpio_to_irq callback shows that the problem of managing the irq mapping is not
> specific to Amlogic and that an evolution might be useful.

Calling irq_create_mapping() in gpio_to_irq() is not a problem if
the mapping is free:ed elsewhere. But yeah, there are lots of old
drivers with old and erroneous solutions to this problem.

> - [1]: To create an empty domain to get a virq for each pins but delay the setup
> of the interrupt hierarchy to the "irq_request_resources" callback. Testing this
> approach led me to some nasty race conditions in the interrupt handlers. I
> discussed this solution with Marc and he told me that doing the setup of the
> interrupt hierarchy in the irqchip callbacks is "too late" . If I understood
> correctly (Marc feel to correct me if necessary), you should only get a virq
> when the full interrupt hierarchy is setup, from the triggering device to the
> CPU.

OK I am as always confused by "virq" which I guess means "virtual IRQ"
which is confusing since all Linux IRQ numbers are in some sense
virtual, and since this has nothing to do with virtualization, which is another
area where IRQchips are very delicate.

But I get it.

> With this last comment, I don't think there is a (clean) way ATM for a gpio
> driver to create the mapping "on demand". By "on-demand", I mean the consumer
> drivers doing this kind of thing:
>
> ret = request_irq(gpio_to_irq(GPIOX_Y), ... )
>
> I would to like propose a way to fix that.

OK solutions are good....

> It is not going to be a oneline fix,
> but I'm convinced we can do it w/o breaking anything:
>
> 1) Introduce new gpio driver callbacks (.irq_prepare, .irq_unprepare): Drivers
> will be free to implement those callbacks or not. Driver which can create all
> their mappings at probe time would obviously skip those.
>
> 2) Introduce gpio_irq_prepare and gpio_irq_unprepare to the gpio API: This
> functions would do refcounting to handle shared irq and avoid wrongly disposing
> of used mappings. Then call the new drivers callbacks, if defined. A devm
> version of gpio_irq_prepare might be usefull
>
> 3) Add calls to gpio_irq_prepare to consumer drivers probe/init which use the
> gpio_to_irq callback. I don't think this is going to be that hard to do, but
> it's going be to long and boring ...

So how are you intending to deal with mixed semantics when, as in the
devicetree case, the GPIO driver is also flagged as an interrupt-controller
and consumers can request IRQs from it with just platform_get_irq()
and expect it to work?

It seems this usecase drives a truck through that approach.

The keyword is separation of concerns, the irqchip abstraction should
deal with interrupts, we do not want the gpiochip to do half of the work.

Here is an example from arch/arm/boot/dts/ste-snowball.dts:

ethernet@0 {
        compatible = "smsc,lan9115";
        reg = <0 0x10000>;
        interrupts = <12 IRQ_TYPE_EDGE_RISING>;
        interrupt-parent = <&gpio4>;
(...)
};

Notice: no GPIOs are taken by this driver, this ethernet driver does not know
that its interrupt is supplied by a GPIO, in fact on many platforms
this ethernet
chip has a dedicated IRQ line so that should not be required, i.e. the ethernet
chip does not need to know that a GPIO controller is supplying this interrupt,
why should it? It is just some interrupt.

The driver looks like so drivers/net/ethernet/smsc/smsc911x.c:

irq = platform_get_irq(pdev, 0);

And that is all it does.

The above usecase is not uncommon.

If this interrupt+GPIO controller was using your scheme, where would these
new callbacks be called?

Yours,
Linus Walleij
