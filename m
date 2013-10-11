From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] gpio: rcar: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 21:48:37 +0200
Message-ID: <1882093.YGqDmvRXf2@avalon>
References: <1381513489-8044-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:46772 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753816Ab3JKTs0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 15:48:26 -0400
In-Reply-To: <1381513489-8044-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Magnus Damm <damm@opensource.se>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Hi Linus,

Thanks for the patch.

On Friday 11 October 2013 19:44:49 Linus Walleij wrote:
> Rename the argument "virq" to just "irq", this IRQ isn't any
> more "virtual" than any other Linux IRQ number, we use "hwirq"
> for the actual hw-numbers, "virq" is just bogus.
> 
> Cc: Magnus Damm <damm@opensource.se>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

As you maintain the GPIO tree, I don't think there's a need for me to take the 
patch in my tree and then send you a pull request, is there ? :-)

> ---
>  drivers/gpio/gpio-rcar.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index e3745eb..65dbf87 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -266,16 +266,16 @@ static int gpio_rcar_to_irq(struct gpio_chip *chip,
> unsigned offset) return irq_create_mapping(gpio_to_priv(chip)->irq_domain,
> offset); }
> 
> -static int gpio_rcar_irq_domain_map(struct irq_domain *h, unsigned int
> virq, -				 irq_hw_number_t hw)
> +static int gpio_rcar_irq_domain_map(struct irq_domain *h, unsigned int irq,
> +				 irq_hw_number_t hwirq)
>  {
>  	struct gpio_rcar_priv *p = h->host_data;
> 
> -	dev_dbg(&p->pdev->dev, "map hw irq = %d, virq = %d\n", (int)hw, virq);
> +	dev_dbg(&p->pdev->dev, "map hw irq = %d, irq = %d\n", (int)hwirq, irq);
> 
> -	irq_set_chip_data(virq, h->host_data);
> -	irq_set_chip_and_handler(virq, &p->irq_chip, handle_level_irq);
> -	set_irq_flags(virq, IRQF_VALID); /* kill me now */
> +	irq_set_chip_data(irq, h->host_data);
> +	irq_set_chip_and_handler(irq, &p->irq_chip, handle_level_irq);
> +	set_irq_flags(irq, IRQF_VALID); /* kill me now */
>  	return 0;
>  }
-- 
Regards,

Laurent Pinchart

