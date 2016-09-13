From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Tue, 13 Sep 2016 14:22:25 +0200
Message-ID: <CACRpkdY9+poXW1cw4K20edGYjiuPN9DH0umsEAh31iHXGJhx6g@mail.gmail.com>
References: <20160908162843.GB22716@ktx> <20160909061834.GG15313@lahna.fi.intel.com>
 <20160909082358.GA23895@ktx> <20160909085832.GK15313@lahna.fi.intel.com>
 <20160911080506.GO15313@lahna.fi.intel.com> <20160912065656.GA2411@ktx>
 <20160912090401.GB1811@lahna.fi.intel.com> <20160912130444.GB2411@ktx>
 <20160912131111.GG1811@lahna.fi.intel.com> <CACRpkdZRguTg4davCW-x6HvRJgOxNz8R4KyeFCEnQzyXPkP6cg@mail.gmail.com>
 <20160913093302.GL1811@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35008 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751790AbcIMMW1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 08:22:27 -0400
Received: by mail-oi0-f41.google.com with SMTP id w11so7124983oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 05:22:27 -0700 (PDT)
In-Reply-To: <20160913093302.GL1811@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 13, 2016 at 11:33 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Sep 13, 2016 at 11:18:49AM +0200, Linus Walleij wrote:
>> On Mon, Sep 12, 2016 at 3:11 PM, Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>> > On Mon, Sep 12, 2016 at 09:04:44PM +0800, Phidias Chiang wrote:
>> >> On Mon, Sep 12, 2016 at 12:04:01PM +0300, Mika Westerberg wrote:
>> >> >
>> >> > OK, I see what is going on now. When I changed handle_simple_irq to
>> >> > handle_bad_irq, the IRQ core in __irq_do_set_handler() thinks the
>> >> > handler is uninstalled and masks the line.
>> >> >
>> >> > If you change handle_bad_irq to handle_simple_irq, in call to
>> >> > gpiochip_irqchip_add(), does it work then?
>> >>
>> >> Yes it does :), thank you for the support!
>> >
>> > Thanks for testing.
>> >
>> > So we need to use handle_simple_irq here instead.
>> >
>> > Linus, do you see any problems with that?
>>
>> I need to see the patch in its context with a commit message,
>> I can't figure it out from the thread.
>>
>> handle_simple_irq() is for something generic not level- or
>> edge-triggered. If you support specific triggers only, it
>> should not be used.
>>
>> Nominally assigning handle_bad_irq() until a specific
>> edge or level is requested is the right thing to do, since
>> the IRQ is really not configured for anything at all and
>> hence has undefined behaviour.
>
> For Cherryview/Braswell some interrupts are actually configured by the
> BIOS but they are routed directly to the I/O-APIC and are supposed to be
> handled without involvement of the GPIO driver (an example of this is
> the ACPI SCI interrupt). However, INTMASK GPIO register can still be
> used to mask the interrupt in question.

A-ha! But why are you registering a irqdomain entry for an interrupt
that cannot be used, hm?

> So when we specify handle_bad_irq as handler the IRQ core thinks the
> handler is being uninstalled and masks the interrupt.

You should not register any handle for it.

In fact, IMO the irqdomain should reject it being mapped, as it is not
for the kernel to use.

Check:
drivers/irqchip/irq-vic.c

We supply a u32 to the driver from the device tree named "valid-mask".
This has bits set to 1 for the valid (to be mapped) IRQs and zero
for those we may not touch.

So in our vic_irqdomain_map() call we have:

/* Skip invalid IRQs, only register handlers for the real ones */
if (!(v->valid_sources & (1 << hwirq)))
        return -EPERM;

So it can never be mapped.

Also notice:

/* create an IRQ mapping for each valid IRQ */
for (i = 0; i < fls(valid_sources); i++)
        if (valid_sources & (1 << i))
                irq_create_mapping(v->domain, i);

So we only create mappings where there are valid IRQs,
skipping over any "holes" in the mapping.

We should do something like this.

To make this play nicely with gpiolib_irqchip_add() I suggest
adding a bitmap valid_mask to struct gpio_chip() in
include/linux/gpio/driver.h
inside the CONFIG_GPIOLIB_IRQCHIP

I guess

u32 bitmap[MAX_IRQS_FOR_A_GPIO_CHIP];

Then augment the generic GPIO IRQCHIP helpers in
drivers/gpio/gpiolib.c per above so that the invalid
IRQs can't be mapped.

The driver would just:

/* Mark line N as invalid: used by BIOS */
set_bit(&chip->valid_mask, N);

Before calling gpiolib_irqchip_add().

This has the downside of roofing the number of lines that can
be flagged as valid/invalid, but I'm open to more advanced
ideas on this, but the check needs to be fast in the irqdomain.

Yours,
Linus Walleij
