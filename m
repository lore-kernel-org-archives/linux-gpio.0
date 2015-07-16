From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Re: [PATCH] gpio-pca953x: Support NXP PCAL9555A with Agile I/O
Date: Thu, 16 Jul 2015 15:52:02 +0200
Message-ID: <20150716135202.GA2328@pqgruber.com>
References: <1435858426-19623-1-git-send-email-clemens.gruber@pqgruber.com>
 <1435858426-19623-2-git-send-email-clemens.gruber@pqgruber.com>
 <CACRpkdbVQwkLfVdXyuWr4gOezeNcuFHHb5A2VLBwOnHb=k0o5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:60841 "EHLO
	mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483AbbGPNwG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 09:52:06 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbVQwkLfVdXyuWr4gOezeNcuFHHb5A2VLBwOnHb=k0o5Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Thu, Jul 16, 2015 at 01:54:55PM +0200, Linus Walleij wrote:
> On Thu, Jul 2, 2015 at 7:33 PM, Clemens Gruber
> <clemens.gruber@pqgruber.com> wrote:
> 
> > This patch adds support for the NXP PCAL9555A GPIO expander's extra
> > features, called Agile I/O:
> > Input latching, interrupt masks and open-drain output stages can be
> > configured via 3 optional device tree properties.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Alexandre Courbot <gnurou@gmail.com>
> > Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> 
> (...)
> 
> > +Optional properties for chips with Agile I/O:
> > +- nxp,input-latch: Latch input states by setting the pin's corresponding bits
> 
> What does "latch" mean here. We need to know if this is something we will see
> a hundred times in the future or only this once.

The input latch feature ensures that input port registers keep their values
until they are read, even if the connected signal changes in between.
(I have a PWM high side driver which has a status signal for every output. When
an error occurs the status signal goes to high and a few ms later, the chip is
reset. During the reset, the status signal is goes to low and then to high again
as soon as the error condition appears again)
The PCAL9555A is used to remember which status register change caused the
interrupt and whether an error appeared or disappeared.

All chips with the "Agile I/O" feature set support input latching, so there will
come more in the future.

I noticed a problem with the way the pca953x driver checks which line triggered
the interrupt. Just checking against the previous values does not work, because
if the value changed back, we can't determine the source anymore and have an
increasing number of unhandled interrupts, until the IRQ is disabled.

I'd change pca953x_irq_pending for the PCAL9555A. Instead of comparing with
the previous input values, I'd use the interrupt status registers in the
PCAL9555A chip. There, the interrupt line which triggered the interrupt is
guaranteed to stay until we read the input register of said line. So even if the
input state changed from 0 to 1 and back to 0 we do not lose the interrupt.

> 
> I am also very suspicious as to whether this should be in the GPIO controller,
> I think it should be on the consumer, because surely it is the user of the
> GPIO line that requires this, not the GPIO chip.

OK. I'll add a GPIO_INPUT_LATCH flag for the consumer.

> 
> > +- nxp,intr-mask: Enable interrupts by clearing the pin's corresponding mask bits
> 
> This is just wrong. Let the irqchip portions of the driver enable interrupts by
> masking them, don't try to outsmart operating system functions with
> hammering down things in device tree.

The problem is that this hardware interrupt mask is enabled by default on the
PCAL9555A, so unless we set those interrupt mask registers to 0, interrupts are
disabled (to avoid false interrupts, according to the datasheet). Should we just
clear this hardware interrupt mask when the chip is probed and other than that
ignore this hardware mask register / let the irqchip handle the masking by
software?

> 
> > +- nxp,open-drain: Enable the open-drain output stage, one bit per port (bank)
> 
> Again, this should be done on the consumer side. Any driver that reference
> a GPIO line can do this:
> 
> foo-gpios = <&gpioN 12 GPIO_ACTIVE_LOW>;
> 
> So why should it not be able to do this:
> 
> foo-gpios = <&gpioN 12 GPIO_OPEN_DRAIN>;
> 
> Add GPIO_OPEN_DRAIN to include/dt-bindings/gpio/gpio.h and implement
> handling in the GPIO core drivers/gpio/gpiolib-of.c instead of trying to
> duct-tape it with things like this. We already have GPIO_OPEN_DRAIN
> in include/linux/gpio/machine.h for the boardfile case, so implement similar
> handling.

Here, the problem is that the open-drain output stage of the PCAL9555A can only
be enabled for the whole port/bank and not for each output pin individually.

> 
> Yours,
> Linus Walleij

Thanks for your help!

Regards,
Clemens
