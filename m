From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Tue, 22 Nov 2016 11:44:23 +0100
Message-ID: <CACRpkdbY-2iB9oxHfFOJBmJQq-zmOR1YEg0dy5zdx++tg-acGw@mail.gmail.com>
References: <MWHPR12MB1357C965EBE3F1161823C223A0B90@MWHPR12MB1357.namprd12.prod.outlook.com>
 <CACRpkdbab3iEwLOucpAz38AJZaEgpO6mrZrLev+YSYuO7Ox_JA@mail.gmail.com> <469f529e-818b-392f-9ddb-b02e87e50ca9@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:34515 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752101AbcKVKoZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2016 05:44:25 -0500
Received: by mail-qt0-f179.google.com with SMTP id n6so8024883qtd.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2016 02:44:24 -0800 (PST)
In-Reply-To: <469f529e-818b-392f-9ddb-b02e87e50ca9@amd.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>

On Tue, Nov 22, 2016 at 11:19 AM, Shah, Nehal-bakulchandra
<Nehal-Bakulchandra.shah@amd.com> wrote:

> I understood that chained irq and devm_irq can't be used together. Surely,
> I will rework on the patch.

OK! :)

We have a case where devm_request_threaded_irq() is used like this,
that is called *nested* irqs, when an interrupt-handling thread is called
from within another interrupt-handling thread.

But since this handler is not threaded, but rather a hardirq, it is not
a viable option.

> The reason behind using devm_irq is that in our
> upcoming platform bios may report two gpio controllers. Both will have same IRQs.
> In my understanding if I use chained irq handler, it will not be clear interrupt
> is due to which gpio controller.It may lead to serve irq twice.

This is a shared IRQ line.

How stressful that it is shared between two cascaded irqchips!

Shared IRQs should nominally be handled by the leafs of the interrupt
handlers returning IRQ_HANDLED and the ones that did not
trigger an IRQ returning IRQ_NONE.

With a chained handler the assumption is that the flow handler
is not really returning anything, just dispatching down to the
consumer (device etc) to return IRQ_HANDLED if it was
their IRQ.

If you want to "bail out" of the chained handler (in your
case what you pass to gpiochip_set_chained_irqchip())
just check if the IRQ status register happens to be zero,
and in that case return; before even calling
chained_irq_enter().

I do not know if there is a way to mark a line as shared
in a chained flow handler!

The current assumption is that gpiochip_set_chained_irqchip()
is called for one or many *different* IRQs. That will work.
But if it is called twice for the *same* IRQ, we might need
some special work inside gpiochip_set_chained_irqchip()
to make this work properly with shared IRQs...

> Please let me know if anything is incorrect in my understanding or if there is
> a better way to handle this situation.

I think reading a bit in kernel/irq/chip.c to see what is really
happening with chained IRQs help a lot. If there are unclarities,
it needs to be discussed with the IRQchip maintainers
(Marc & Thomas).

Yours,
Linus Walleij
