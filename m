From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/2] gpio: xgene-sb: Use irq_domain_free_irqs_common
 instead of open coded
Date: Thu, 17 Mar 2016 10:07:48 +0000
Message-ID: <56EA81F4.40503@arm.com>
References: <1458187231.27037.1.camel@ingics.com>
 <1458187303.27037.3.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47149 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935433AbcCQKHw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 17 Mar 2016 06:07:52 -0400
In-Reply-To: <1458187303.27037.3.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Y Vo <yvo@apm.com>, Alexandre Courbot <gnurou@gmail.com>, Jiang Liu <jiang.liu@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 17/03/16 04:01, Axel Lin wrote:
> Current code calls irq_domain_alloc_irqs_parent() in .alloc,
> so it should call irq_domain_free_irqs_parent() accordingly in .free.
> Fix it by switching to use irq_domain_free_irqs_common() instead.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-xgene-sb.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
> index 31cbcb8..0332586 100644
> --- a/drivers/gpio/gpio-xgene-sb.c
> +++ b/drivers/gpio/gpio-xgene-sb.c
> @@ -216,23 +216,10 @@ static int xgene_gpio_sb_domain_alloc(struct irq_domain *domain,
>  			&parent_fwspec);
>  }
>  
> -static void xgene_gpio_sb_domain_free(struct irq_domain *domain,
> -		unsigned int virq,
> -		unsigned int nr_irqs)
> -{
> -	struct irq_data *d;
> -	unsigned int i;
> -
> -	for (i = 0; i < nr_irqs; i++) {
> -		d = irq_domain_get_irq_data(domain, virq + i);
> -		irq_domain_reset_irq_data(d);
> -	}
> -}
> -
>  static const struct irq_domain_ops xgene_gpio_sb_domain_ops = {
>  	.translate      = xgene_gpio_sb_domain_translate,
>  	.alloc          = xgene_gpio_sb_domain_alloc,
> -	.free           = xgene_gpio_sb_domain_free,
> +	.free           = irq_domain_free_irqs_common,
>  	.activate	= xgene_gpio_sb_domain_activate,
>  	.deactivate	= xgene_gpio_sb_domain_deactivate,
>  };
> 

Ah, nice catch. For both patches:

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
