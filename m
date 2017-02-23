From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: altera: Use handle_level_irq when configured
 as a level_high
Date: Thu, 23 Feb 2017 16:10:16 +0100
Message-ID: <CACRpkdYwqH3tP=VaVr9bv5ttaqfh-PGf1qCJKT+rhwBTKWaz5g@mail.gmail.com>
References: <1487554905-24714-1-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487554905-24714-1-git-send-email-preid@electromag.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Tien Hock Loh <thloh@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 20, 2017 at 2:41 AM, Phil Reid <preid@electromag.com.au> wrote:

> When a threaded irq handler is chained attached to one of the gpio
> pins when configure for level irq the altera_gpio_irq_leveL_high_handler
> does not mask the interrupt while being handled by the chained irq.
> This resulting in the threaded irq not getting enough cycles to complete
> quickly enough before the irq was disabled as faulty. handle_level_irq
> should be used in this situation instead of handle_simple_irq.
>
> In gpiochip_irqchip_add set default handler to handle_bad_irq as
> per Documentation/gpio/driver.txt. Then set the correct handler in
> the set_type callback.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>
> Notes:
>     Change from v1:
>     - As per hint from Andy.
>       Set handler to handle_bad_irq in gpiochip_irqchip_add
>       This is inline with documentation but not what most gpio drivers do.
>       So I'm guessing this is now the correct way to do things.

Heh I caught up on reviews and in the inbox is already this patch
that fixes my review comments before I even sent them...

Thanks and patch applied for fixes.

Yours,
Linus Walleij
