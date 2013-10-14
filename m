From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH] gpio: adnp: rename "virq" to "child_irq"
Date: Mon, 14 Oct 2013 11:25:12 +0200
Message-ID: <2498682.Tok0xRnD2G@lem-wkst-02>
References: <1381511518-5929-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp1-2.goneo.de ([212.90.139.84]:52585 "EHLO smtp1-2.goneo.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754431Ab3JNJZP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 14 Oct 2013 05:25:15 -0400
In-Reply-To: <1381511518-5929-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Monday 14 October 2013 19:11:58, Linus Walleij wrote:
> This variable is confusingly named, the different Linux IRQs
> aren't any more virtual than any other Linux IRQ. Give it a
> non-misleading name.
> 
> Cc: Lars Poeschel <poeschel@lemonage.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-adnp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
> index 6439e0e..b204033 100644
> --- a/drivers/gpio/gpio-adnp.c
> +++ b/drivers/gpio/gpio-adnp.c
> @@ -325,9 +325,9 @@ static irqreturn_t adnp_irq(int irq, void *data)
>  		pending &= isr & ier;
> 
>  		for_each_set_bit(bit, &pending, 8) {
> -			unsigned int virq;
> -			virq = irq_find_mapping(adnp->domain, base + bit);
> -			handle_nested_irq(virq);
> +			unsigned int child_irq;
> +			child_irq = irq_find_mapping(adnp->domain, base + bit);
> +			handle_nested_irq(child_irq);
>  		}
>  	}

Acked-by: Lars Poeschel <poeschel@lemonage.de>
