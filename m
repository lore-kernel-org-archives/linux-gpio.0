From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: uniphier: merge fix for "Update irq_domain_ops.activate()
 signature"
Date: Wed, 29 Nov 2017 14:08:35 +0100
Message-ID: <CACRpkdb=hL02-yr+bJYiJ4xqR029YUFJHs34TdvCb8aeyJH6Uw@mail.gmail.com>
References: <1510580176-7483-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35884 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752232AbdK2NIg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Nov 2017 08:08:36 -0500
Received: by mail-io0-f193.google.com with SMTP id 81so3630129iof.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2017 05:08:36 -0800 (PST)
In-Reply-To: <1510580176-7483-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Masahiro,

can you check that this ended up all right in the merge window,
else send a fixup patch?

Sorry for the mess.

Yours,
Linus Walleij


On Mon, Nov 13, 2017 at 2:36 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>
> Changes since Stephens's original post
>   - Fix checkpatch.pl warning
>     "CHECK: Alignment should match open parenthesis"
>   - Stretch lines since it fits in 80-columns
>
>
>  drivers/gpio/gpio-uniphier.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
> index d62cea4..71b768e 100644
> --- a/drivers/gpio/gpio-uniphier.c
> +++ b/drivers/gpio/gpio-uniphier.c
> @@ -300,13 +300,15 @@ static int uniphier_gpio_irq_domain_alloc(struct irq_domain *domain,
>         return irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
>  }
>
> -static void uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
> -                                             struct irq_data *data)
> +static int uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
> +                                            struct irq_data *data, bool early)
>  {
>         struct uniphier_gpio_priv *priv = domain->host_data;
>         struct gpio_chip *chip = &priv->chip;
>
>         gpiochip_lock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
> +
> +       return 0;
>  }
>
>  static void uniphier_gpio_irq_domain_deactivate(struct irq_domain *domain,
> --
> 2.7.4
>
