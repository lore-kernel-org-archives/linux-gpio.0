From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Thu, 21 May 2015 16:25:24 +0200
Message-ID: <20150521142524.GA30660@localhost>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
 <20150518110214.GC28127@localhost>
 <CACRpkdb9K5oi0Ld-njEz2a85X1NhYgFa8DCTZquqALdohL7WKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:34140 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213AbbEUOZY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 21 May 2015 10:25:24 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdb9K5oi0Ld-njEz2a85X1NhYgFa8DCTZquqALdohL7WKA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Grygorii Strashko <grygorii.strashko@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 19, 2015 at 04:28:55PM +0200, Linus Walleij wrote:
> On Mon, May 18, 2015 at 1:02 PM, Johan Hovold <johan@kernel.org> wrote:
> > On Fri, May 15, 2015 at 04:25:21PM +0300, grygorii.strashko@linaro.org wrote:
> 
> >> GPIOs 192-223, platform/48051000.gpio, gpio:
> >>  gpio-203 (vtt_fixed           ) out hi requested
> >
> > This is backwards. All gpios *should* be requested. *If* we are to
> > include not-requested gpios in the debug output, then it is those pins
> > that need to be marked as not-requested.
> 
> It depends, really. As concluded in earlier discussions when we
> introduced gpiochip_[un]lock_as_irq() the gpiolib and irqchip APIs
> are essentially orthogonal.

[...]

> So to atleast try to safeguard from a scenario such as
> 
> - Client A requests IRQ from the irqchip side of the API
>   and sets up a level active-low IRQ on it
> 
> - Client B request the same line as GPIO
> 
> - Client B sets it to output and drivers it low.
> 
> - Client A crashes in an infinite IRQ loop as that line
>   is not hammered low and will generate IRQs until
>   the end of time.
> 
> I introduced the gpiochip_[un]lock_as_irq() calls so we
> could safeguard against this. Notably that blocks client A
> from setting the line as output. I hope.

A problem with the current implementation is that it uses as a flag
rather than a refcount. As I pointed out elsewhere in this thread, it is
possible to request a shared IRQ (e.g. via the sysfs interface) and
release it, thereby making it possible to change the direction of the
pin while still in use for irq.

> I thought this would mean the line would only be used as IRQ
> in this case, so I could block any gpiod_get() calls to that
> line but *of course* some driver is using the IRQ and snooping
> into the GPIO value at the same time. So can't simplify things
> like so either.
> 
> Maybe I'm smashing open doors here...

No, I understand that use case. But there are some issues with how it's
currently implemented. Besides the example above, nothing pins a gpio
chip driver in memory unless it has requested gpios, specifically,
requesting a pin for irq use is not enough.

> Anyway to get back to the original statement:
> 
> > This is backwards. All gpios *should* be requested. *If* we are to
> > include not-requested gpios in the debug output, then it is those pins
> > that need to be marked as not-requested.
> 
> This is correct, all GPIOs accessed *as gpios* should be
> requested, no matter if they are then cast to IRQs by gpiod_to_irq
> or not. However if the same hardware is used as only "some IRQ"
> through it's irqchip interface, it needs not be requested, but
> that is by definition not a GPIO, it is an IRQ.

True. And since it is not a GPIO, should it show up in
/sys/kernel/debug/gpio? ;)

Johan
