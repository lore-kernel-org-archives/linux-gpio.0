From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Tue, 19 May 2015 16:28:55 +0200
Message-ID: <CACRpkdb9K5oi0Ld-njEz2a85X1NhYgFa8DCTZquqALdohL7WKA@mail.gmail.com>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
	<20150518110214.GC28127@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33634 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756061AbbESO2z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2015 10:28:55 -0400
Received: by oica37 with SMTP id a37so12231621oic.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2015 07:28:55 -0700 (PDT)
In-Reply-To: <20150518110214.GC28127@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Grygorii Strashko <grygorii.strashko@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 18, 2015 at 1:02 PM, Johan Hovold <johan@kernel.org> wrote:
> On Fri, May 15, 2015 at 04:25:21PM +0300, grygorii.strashko@linaro.org wrote:

>> GPIOs 192-223, platform/48051000.gpio, gpio:
>>  gpio-203 (vtt_fixed           ) out hi requested
>
> This is backwards. All gpios *should* be requested. *If* we are to
> include not-requested gpios in the debug output, then it is those pins
> that need to be marked as not-requested.

It depends, really. As concluded in earlier discussions when we
introduced gpiochip_[un]lock_as_irq() the gpiolib and irqchip APIs
are essentially orthogonal.

At one point I was suggesting that any driver using a GPIO for
IRQ should first request the gpio line with gpiod_get() and then
use gpio_to_irq() on the descriptor. Always.

However as it turns out (and after being hammered down by
the DT and ACPI people for this stance) I changed opinion,
because even if that stringence would be nice, it doesn't
abstract the hardware well enough for drivers that "just need
an IRQ". These don't care of whether a line to the primary
IRQ controller or a dedicated external IRQ pin or some
cascaded GPIO chip is providing the IRQ, they just want
their IRQ resource.

If I would persist in my stance that the API must be used like
so it would have implications on how HW descriptions such
as DT or ACPI describe their resources and essentially put
requirements out to other operating systems than Linux using
DT or ACPI to do it the same way for this reason. That would
be unreasonable.

So it was deemed these resource APIs need to be orthogonal.

The same would apply to any other resource that is similar to a
GPIO and an IRQ line, don't know what a good example would be.

So to atleast try to safeguard from a scenario such as

- Client A requests IRQ from the irqchip side of the API
  and sets up a level active-low IRQ on it

- Client B request the same line as GPIO

- Client B sets it to output and drivers it low.

- Client A crashes in an infinite IRQ loop as that line
  is not hammered low and will generate IRQs until
  the end of time.

I introduced the gpiochip_[un]lock_as_irq() calls so we
could safeguard against this. Notably that blocks client A
from setting the line as output. I hope.

I thought this would mean the line would only be used as IRQ
in this case, so I could block any gpiod_get() calls to that
line but *of course* some driver is using the IRQ and snooping
into the GPIO value at the same time. So can't simplify things
like so either.

Maybe I'm smashing open doors here...

Anyway to get back to the original statement:

> This is backwards. All gpios *should* be requested. *If* we are to
> include not-requested gpios in the debug output, then it is those pins
> that need to be marked as not-requested.

This is correct, all GPIOs accessed *as gpios* should be
requested, no matter if they are then cast to IRQs by gpiod_to_irq
or not. However if the same hardware is used as only "some IRQ"
through it's irqchip interface, it needs not be requested, but
that is by definition not a GPIO, it is an IRQ.

Yours,
Linus Walleij
