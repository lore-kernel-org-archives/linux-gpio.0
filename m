From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mxs: fix duplicate level interrupts
Date: Mon, 24 Oct 2016 02:58:59 +0200
Message-ID: <CACRpkdad+ePnYJfpdKKSbzBPtkcf0YYzpB+59ba5R2vC7QjobA@mail.gmail.com>
References: <20161021131138.10467-1-s.hauer@pengutronix.de> <20161021131138.10467-3-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161021131138.10467-3-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 21, 2016 at 3:11 PM, Sascha Hauer <s.hauer@pengutronix.de> wrote:

> According to the reference manual level interrupts can't be acked
> using the IRQSTAT registers. The effect is that when a level interrupt
> triggers the following ack is a no-op and the same interrupt triggers
> again right after it has been unmasked after running the interrupt
> handler.
>
> The reference manual says:
>
> Status bits for pins configured as level sensitive interrupts cannot be
> cleared unless either the actual pin is in the non-interrupting state, or
> the pin has been disabled as an interrupt source by clearing its bit in
> HW_PINCTRL_PIN2IRQ.
>
> To work around the duplicated interrupts we can use the PIN2IRQ
> rather than the IRQEN registers to mask the interrupts. This
> probably does not work for the edge interrupts, so we have to split up
> the irq chip into two chip types, one for the level interrupts and
> one for the edge interrupts. We now make use of two different enable
> registers, so we have to take care to always enable the right one,
> especially during switching of the interrupt type. An easy way
> to accomplish this is to use the IRQCHIP_SET_TYPE_MASKED which
> makes sure that set_irq_type is called with masked interrupts. With this
> the flow to change the irq type is like:
>
> - core masks interrupt (using the current chip type)
> - mxs_gpio_set_irq_type() changes chip type if necessary
> - mxs_gpio_set_irq_type() unconditionally sets the enable bit in the
>   now unused enable register
> - core eventually unmasks the interrupt (using the new chip type)
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Patch applied with Marek's review tag.

Yours,
Linus Walleij
