From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: Add a driver for Cadence GPIO controller
Date: Thu, 30 Mar 2017 13:51:11 +0200
Message-ID: <CACRpkdbaCsNndVWADwuEL0=4d45qPa0ZTfO7AGfYh0UCEdSq5g@mail.gmail.com>
References: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
 <CACRpkdZ6w_tuzSNmFE=2BpeASNOSq0cV4fYM6F8-57Q2+3n-aQ@mail.gmail.com> <20170330132946.41314874@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170330132946.41314874@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Hatliff <hatliff@cadence.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 30, 2017 at 1:29 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Linus Walleij <linus.walleij@linaro.org> wrote:

>> then in your dynamic gpiochip something like
>>
>>         ret = bgpio_init(&g->gc, dev, 4,
>>                          g->base + GPIO_DATA_IN,
>>                          g->base + GPIO_DATA_SET,
>>                          g->base + GPIO_DATA_CLR,
>>                          g->base + GPIO_DIR,
>>                          NULL,
>>                          0);
>
> Actually, for ->direction_output() it's not working (see the
> implementation: we need to change both CDNS_GPIO_DIRECTION_MODE and
> CDNS_GPIO_OUTPUT_EN to enable the output mode).
>
> I can modify generic GPIO code to handle this case, but I thought my
> case was specific enough to not complexify the generic code with a case
> that is unlikely to be re-used elsewhere. Maybe I was wrong.

You can also just override this one function after initializing
with bgpio_init? I don't know if it's OK to pass NULL
for the direction register.

Whatever becomes most elegant I guess?

>> You can still assign the .request and .free callbacks and
>> the irqchip after this, that is fine.
>> See drivers/gpio/gpio-gemini.c for my example
>
> As said above, the generic ->direction_output() implementation does not
> match the Cadence controller logic. It's almost possible to make it fit,
> but it requires extending gpio-generic.c.

OK I don't know if it's worth it. Make an educated decision,
I will not nix the patch if you keep with the custom implementation
for all functions.

> Could be, if we modify gpio-mmio.c to support my case. I have the
> feeling that you'd prefer this solution, so I'll try to do that in my
> v2 ;-).

If you think it just looks butt ugly then don't do it.

> Another solution would be to write 0xffffffff into CDNS_GPIO_OUTPUT_EN
> at probe time so that each time CDNS_GPIO_DIRECTION_MODE is modified to
> set a pin in output mode, the CDNS_GPIO_OUTPUT_EN is already correctly
> configured.
> Simon, would that work? Is there a good reason to keep a bit in
> CDNS_GPIO_OUTPUT_EN set to 0 when the GPIO is in input mode (power
> consumption?)?

Hm. Let's see.

> Sure. I'm so used to the container_of() trick that I sometime forget to
> look at how the subsystem maintainer prefers to do it.

I usually prefer it to use the associated data, but some still prefer
to use container_of() for type safety.

>> Have you tried to use a chained interrupt? Like gpio-pl061 does?
>> You can just copy/paste and try it. Don't miss the chained_irq_enter()
>> and friends.
>
> Well, yes. I'm always unsure when a nested IRQ should be used compared
> to an irqchain (other drivers in the gpio subsystem are using the
> nested IRQ approach, just grep for handle_nested_irq in drivers/gpio).
> Maybe it has to be done this way when you use a threaded interrupt. I
> looked at that a while ago, but I don't remember the differences and
> when one should be used instead of the other.

To me chained handlers are for fast things than can be handled entirely in
interrupt context, traversing the chain immediately when the IRQ
fires. Like this driver.

Nested threads are ideal for say GPIO expanders on I2S or SPI, where
you have to do a bunch of process context business to handle the
interrupt.

Yours,
Linus Walleij
