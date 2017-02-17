From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/1] gpio: altera: Use handle_level_irq when configured as
 a level_high
Date: Fri, 17 Feb 2017 11:23:45 +0200
Message-ID: <CAHp75VdK2sL1WyjfcRzQZ4Q+i5mnbcsYA4jPJhx=-g-e03KOog@mail.gmail.com>
References: <1487322752-31896-1-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:35737 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750780AbdBQJXq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Feb 2017 04:23:46 -0500
In-Reply-To: <1487322752-31896-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: thloh@altera.com, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 17, 2017 at 11:12 AM, Phil Reid <preid@electromag.com.au> wrote:
> When a threaded irq handler is chained attached to one of the gpio
> pins when configure for level irq the altera_gpio_irq_leveL_high_handler
> does not mask the interrupt while being handled by the chained irq.
> This resulting in the threaded irq not getting enough cycles to complete
> quickly enough before the irq was disabled as faulty.
> It looks like handle_level_irq should be used in this situation
> instead of handle_simple_irq.

> @@ -310,7 +310,8 @@ static int altera_gpio_probe(struct platform_device *pdev)
>         altera_gc->interrupt_trigger = reg;
>
>         ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_irq_chip, 0,
> -               handle_simple_irq, IRQ_TYPE_NONE);
> +               altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
> +               handle_level_irq : handle_simple_irq, IRQ_TYPE_NONE);

AFAIK, handle_bad_irq() should be used here.

-- 
With Best Regards,
Andy Shevchenko
