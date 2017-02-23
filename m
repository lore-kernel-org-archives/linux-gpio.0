From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: altera: Use handle_level_irq when configured as
 a level_high
Date: Thu, 23 Feb 2017 15:52:37 +0100
Message-ID: <CACRpkda=w8a8sP-h6_0_NGPyMGjUAUMH7m26+dGPX0AEP+b6AA@mail.gmail.com>
References: <1487322752-31896-1-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:36731 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751202AbdBWOyR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2017 09:54:17 -0500
Received: by mail-it0-f48.google.com with SMTP id h10so168707375ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2017 06:52:41 -0800 (PST)
In-Reply-To: <1487322752-31896-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Tien Hock Loh <thloh@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 17, 2017 at 10:12 AM, Phil Reid <preid@electromag.com.au> wrote:

>         ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_irq_chip, 0,
> -               handle_simple_irq, IRQ_TYPE_NONE);
> +               altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
> +               handle_level_irq : handle_simple_irq, IRQ_TYPE_NONE);

I would say: set it to handle_bad_irq() for everything and then set it
to handle_level_irq() or handle_simple_irq() in the .set_type() function
using the rq_set_handler_locked() callback like everyone else,
nicely reflecting the synthesized trigger type.

I think that would work?

Yours,
Linus Walleij
