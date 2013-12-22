From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/2] gpio: davinci: don't create irq_domain in case
	of unbanked irqs
Date: Sun, 22 Dec 2013 21:22:24 +0530
Message-ID: <52B70AB8.6030503@ti.com>
References: <1387361272-20861-1-git-send-email-grygorii.strashko@ti.com>
	<1387361272-20861-2-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1387361272-20861-2-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Wednesday 18 December 2013 03:37 PM, Grygorii Strashko wrote:
> The system may crash if:
> - there are more then 1 bank

s/then/than

> - unbanked irqs are enabled
> - someone will call gpio_to_irq() for GPIO from bank2 or above
> 
> Hence, fix it by not creating irq_domain if unbanked irqs are enabled
> and correct gpio_to_irq_banked() to handle this properly.
> 
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
> 
> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/gpio/gpio-davinci.c |   34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 5d163c0..1b33806 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -351,7 +351,10 @@ static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct davinci_gpio_controller *d = chip2controller(chip);
>  
> -	return irq_create_mapping(d->irq_domain, d->chip.base + offset);
> +	if (d->irq_domain)
> +		return irq_create_mapping(d->irq_domain, d->chip.base + offset);
> +	else
> +		return -ENXIO;
>  }
>  
>  static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
> @@ -429,7 +432,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>  	struct davinci_gpio_controller *chips = platform_get_drvdata(pdev);
>  	struct davinci_gpio_platform_data *pdata = dev->platform_data;
>  	struct davinci_gpio_regs __iomem *g;
> -	struct irq_domain	*irq_domain;
> +	struct irq_domain	*irq_domain = NULL;
>  
>  	ngpio = pdata->ngpio;
>  	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> @@ -453,18 +456,20 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>  	}
>  	clk_prepare_enable(clk);
>  
> -	irq = irq_alloc_descs(-1, 0, ngpio, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "Couldn't allocate IRQ numbers\n");
> -		return irq;
> -	}
> +	if (!pdata->gpio_unbanked) {
> +		irq = irq_alloc_descs(-1, 0, ngpio, 0);
> +		if (irq < 0) {
> +			dev_err(dev, "Couldn't allocate IRQ numbers\n");
> +			return -ENODEV;

The code was correct before moving. Any objections to doing

			return irq;

instead?

Thanks,
Sekhar
