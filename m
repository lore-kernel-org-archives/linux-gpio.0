From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] gpio: switch drivers to use new callback
Date: Tue, 18 Mar 2014 10:34:59 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1403181023090.18573@ionos.tec.linutronix.de>
References: <1395128912-3370-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:52099 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753543AbaCRJev (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Mar 2014 05:34:51 -0400
In-Reply-To: <1395128912-3370-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>

On Tue, 18 Mar 2014, Linus Walleij wrote:
> This switches all GPIO and pin control drivers with irqchips
> that were using .startup() and .shutdown() callbacks to lock
> GPIO lines for IRQ usage over to using the .request_resources()
> and .release_resources() callbacks just introduced into the
> irqchip vtable.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix signedness of some callbacks.
> ---
>  drivers/gpio/gpio-adnp.c            | 15 +++++++--------
>  drivers/gpio/gpio-bcm-kona.c        | 14 +++++++-------
>  drivers/gpio/gpio-dwapb.c           | 16 ++++++++--------
>  drivers/gpio/gpio-em.c              | 14 +++++++-------
>  drivers/gpio/gpio-intel-mid.c       | 14 +++++++-------
>  drivers/gpio/gpio-lynxpoint.c       | 14 +++++++-------
>  drivers/gpio/gpio-mcp23s08.c        | 14 +++++++-------
>  drivers/gpio/gpio-pl061.c           | 14 +++++++-------
>  drivers/pinctrl/pinctrl-adi2.c      |  1 +
>  drivers/pinctrl/pinctrl-baytrail.c  | 14 +++++++-------
>  drivers/pinctrl/pinctrl-msm.c       | 11 +++++------
>  drivers/pinctrl/pinctrl-nomadik.c   | 25 +++++++++++++++++++++----
>  drivers/pinctrl/sirf/pinctrl-sirf.c | 14 +++++++-------
>  13 files changed, 98 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
> index 6fc6206b38bd..b2239d678d01 100644
> --- a/drivers/gpio/gpio-adnp.c
> +++ b/drivers/gpio/gpio-adnp.c
> @@ -408,24 +408,23 @@ static void adnp_irq_bus_unlock(struct irq_data *data)
>  	mutex_unlock(&adnp->irq_lock);
>  }
>  
> -static unsigned int adnp_irq_startup(struct irq_data *data)
> +static int adnp_irq_reqres(struct irq_data *data)
>  {
>  	struct adnp *adnp = irq_data_get_irq_chip_data(data);
>  
> -	if (gpio_lock_as_irq(&adnp->gpio, data->hwirq))
> +	if (gpio_lock_as_irq(&adnp->gpio, data->hwirq)) {

So you need a per chip function because all chips have their own
private data struct in irq_chip_data. Sigh. 

It'd be nice if we'd have gpio in the data, so you could have a
generic function which does the right thing.

In principle it'd be simple.

   struct gpio *gpio = irq_data_get_irq_chip_data(data);
   struct adnp *adnp = container_of(gpio, struct adnp, gpio);

Ditto for all other drivers. But that requires a major overhaul.

I wonder if it'd be worth to add another pointer to irq_data for such
purposes.

Thoughts?

Thanks,

	tglx
