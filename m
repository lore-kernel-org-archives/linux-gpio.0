From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/4] gpio: tc3589x: get rid of static IRQ base
Date: Thu, 17 Apr 2014 08:47:42 +0100
Message-ID: <20140417074742.GD28725@lee--X1>
References: <1397044139-19306-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:63008 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751052AbaDQHrr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Apr 2014 03:47:47 -0400
Received: by mail-wi0-f171.google.com with SMTP id q5so2512448wiv.4
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2014 00:47:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1397044139-19306-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Samuel Ortiz <sameo@linux.intel.com>

> The static IRQ base is not used on any platforms with this chip
> (only Ux500). Get rid of it forever, and rely on dynamic IRQ
> descriptor allocation.
>=20
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-tc3589x.c | 10 +---------
>  include/linux/mfd/tc3589x.h |  1 -
>  2 files changed, 1 insertion(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.=
c
> index 113e50cb1f59..4b0d8ccbe561 100644
> --- a/drivers/gpio/gpio-tc3589x.c
> +++ b/drivers/gpio/gpio-tc3589x.c
> @@ -32,9 +32,6 @@ struct tc3589x_gpio {
>  	struct device *dev;
>  	struct mutex irq_lock;
>  	struct irq_domain *domain;
> -
> -	int irq_base;
> -
>  	/* Caches of interrupt control registers for bus_lock */
>  	u8 regs[CACHE_NR_REGS][CACHE_NR_BANKS];
>  	u8 oldregs[CACHE_NR_REGS][CACHE_NR_BANKS];
> @@ -290,8 +287,6 @@ static struct irq_domain_ops tc3589x_irq_ops =3D =
{
>  static int tc3589x_gpio_irq_init(struct tc3589x_gpio *tc3589x_gpio,
>  				struct device_node *np)
>  {
> -	int base =3D tc3589x_gpio->irq_base;
> -
>  	/*
>  	 * If this results in a linear domain, irq_create_mapping() will
>  	 * take care of allocating IRQ descriptors at runtime. When a base
> @@ -299,7 +294,7 @@ static int tc3589x_gpio_irq_init(struct tc3589x_g=
pio *tc3589x_gpio,
>  	 * domain is instantiated.
>  	 */
>  	tc3589x_gpio->domain =3D irq_domain_add_simple(np,
> -			tc3589x_gpio->chip.ngpio, base, &tc3589x_irq_ops,
> +			tc3589x_gpio->chip.ngpio, 0, &tc3589x_irq_ops,
>  			tc3589x_gpio);
>  	if (!tc3589x_gpio->domain) {
>  		dev_err(tc3589x_gpio->dev, "Failed to create irqdomain\n");
> @@ -348,9 +343,6 @@ static int tc3589x_gpio_probe(struct platform_dev=
ice *pdev)
>  	tc3589x_gpio->chip.of_node =3D np;
>  #endif
> =20
> -	tc3589x_gpio->irq_base =3D tc3589x->irq_base ?
> -		tc3589x->irq_base + TC3589x_INT_GPIO(0) : 0;
> -
>  	/* Bring the GPIO module out of reset */
>  	ret =3D tc3589x_set_bits(tc3589x, TC3589x_RSTCTRL,
>  			       TC3589x_RSTCTRL_GPIRST, 0);
> diff --git a/include/linux/mfd/tc3589x.h b/include/linux/mfd/tc3589x.=
h
> index 6b8e1ff4672b..e6088c2e2092 100644
> --- a/include/linux/mfd/tc3589x.h
> +++ b/include/linux/mfd/tc3589x.h
> @@ -111,7 +111,6 @@ enum tx3589x_block {
>  #define TC3589x_INT_PORIRQ	7
> =20
>  #define TC3589x_NR_INTERNAL_IRQS	8
> -#define TC3589x_INT_GPIO(x)	(TC3589x_NR_INTERNAL_IRQS + (x))
> =20
>  struct tc3589x {
>  	struct mutex lock;

Does this actually compile? Does this patch have a dependency?

I see TC3589x_INT_GPIO(x) being used still:

  include/linux/mfd/tc3589x.h:
    #define TC3589x_NR_IRQS                TC3589x_INT_GPIO(TC3589x_NR_=
GPIOS)
--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
