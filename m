From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: unmap gpio irqs properly
Date: Sun, 30 Mar 2014 01:27:00 +0900
Message-ID: <CAAVeFu+Z33toX=ye7yncE+HhsymKO114QtD_OZsACDQdm69N=g@mail.gmail.com>
References: <1396035858-23758-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:64332 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbaC2Q1V (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Mar 2014 12:27:21 -0400
Received: by mail-ig0-f170.google.com with SMTP id uq10so1927694igb.1
        for <linux-gpio@vger.kernel.org>; Sat, 29 Mar 2014 09:27:20 -0700 (PDT)
In-Reply-To: <1396035858-23758-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Sat, Mar 29, 2014 at 4:44 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> When using the irqchip helper inside the gpiolib, make sure
> the IRQs are unmapped/disposed before the irqdomain is removed
> as part of removing the gpiochip.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c      | 33 +++++++++++++++++++++++++++++----
>  include/linux/gpio/driver.h |  1 +
>  2 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f41cb4f3d715..761013f8b82f 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1399,8 +1399,18 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
>         return 0;
>  }
>
> +static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
> +{
> +#ifdef CONFIG_ARM
> +       set_irq_flags(irq, 0);
> +#endif

Just curious here, why is a special case needed for ARM? I would not
expect architecture-specific code on gpiolib, but I'm sure you have
your reasons for that.
