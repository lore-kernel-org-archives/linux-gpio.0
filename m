From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH] gpio: drop users of irq_set_chip_and_handler_name()
Date: Mon, 02 Dec 2013 10:27:52 -0800
Message-ID: <529CD128.9000904@linux.intel.com>
References: <1385472771-26681-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:42628 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751965Ab3LBSXO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 2 Dec 2013 13:23:14 -0500
In-Reply-To: <1385472771-26681-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

Hi Linus,

On 11/26/2013 05:32 AM, Linus Walleij wrote:
> Switch all users of irq_set_chip_and_handler_name() to simply
> use irq_set_chip_and_handler(), all just provide a boilerplate
> name like "demux" or "mux" - a fact which is anyway obvious
> from the hwirq number from the irqdomain now present in e.g.
> /proc/interrupts.
> 
> Cc: David Cohen <david.a.cohen@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> I'm challenging all users of this function to make an argument
> for it to stay in, and suspecting that this is mostly a copy
> and paste artifact...
> ---
>  drivers/gpio/gpio-intel-mid.c  | 3 +--
>  drivers/gpio/gpio-lynxpoint.c  | 3 +--
>  drivers/gpio/gpio-msic.c       | 7 +++----
>  drivers/gpio/gpio-timberdale.c | 4 ++--
>  4 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
> index be803af658ac..17f135046c7f 100644
> --- a/drivers/gpio/gpio-intel-mid.c
> +++ b/drivers/gpio/gpio-intel-mid.c
> @@ -358,8 +358,7 @@ static int intel_gpio_irq_map(struct irq_domain *d, unsigned int irq,
>  {
>  	struct intel_mid_gpio *priv = d->host_data;
>  
> -	irq_set_chip_and_handler_name(irq, &intel_mid_irqchip,
> -				      handle_simple_irq, "demux");
> +	irq_set_chip_and_handler(irq, &intel_mid_irqchip, handle_simple_irq);
>  	irq_set_chip_data(irq, priv);
>  	irq_set_irq_type(irq, IRQ_TYPE_NONE);
>  

For intel-mid case:
Acked-by: David Cohen <david.a.cohen@linux.intel.com>
