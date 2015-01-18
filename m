From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] gpio: stmpe: enforce device tree only mode
Date: Sun, 18 Jan 2015 16:46:10 +0000
Message-ID: <20150118164609.GA3574@x1>
References: <1421132429-6947-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:44625 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751261AbbARQqS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Jan 2015 11:46:18 -0500
Received: by mail-ig0-f171.google.com with SMTP id h15so2046077igd.4
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2015 08:46:17 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1421132429-6947-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

On Tue, 13 Jan 2015, Linus Walleij wrote:

> Require that device tree be used with STMPE (all platforms use this)
> and enforce OF_GPIO, then delete the platform data.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> MFD: folks: please ACK this so I can funnel it through the GPIO
> tree.
> ---
>  drivers/gpio/Kconfig      |  1 +
>  drivers/gpio/gpio-stmpe.c | 23 +++--------------------
>  include/linux/mfd/stmpe.h | 16 ----------------

Acked-by: Lee Jones <lee.jones@linaro.org>

>  3 files changed, 4 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 633ec216e185..5b1821daa1bd 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -624,6 +624,7 @@ config GPIO_SX150X
>  config GPIO_STMPE
>  	bool "STMPE GPIOs"
>  	depends on MFD_STMPE
> +	depends on OF_GPIO
>  	select GPIOLIB_IRQCHIP
>  	help
>  	  This enables support for the GPIOs found on the STMPE I/O
> diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
> index 359536eaca0d..926502145492 100644
> --- a/drivers/gpio/gpio-stmpe.c
> +++ b/drivers/gpio/gpio-stmpe.c
> @@ -30,7 +30,7 @@ struct stmpe_gpio {
>  	struct stmpe *stmpe;
>  	struct device *dev;
>  	struct mutex irq_lock;
> -	unsigned norequest_mask;
> +	u32 norequest_mask;
>  	/* Caches of interrupt control registers for bus_lock */
>  	u8 regs[CACHE_NR_REGS][CACHE_NR_BANKS];
>  	u8 oldregs[CACHE_NR_REGS][CACHE_NR_BANKS];
> @@ -350,13 +350,10 @@ static int stmpe_gpio_probe(struct platform_dev=
ice *pdev)
>  {
>  	struct stmpe *stmpe =3D dev_get_drvdata(pdev->dev.parent);
>  	struct device_node *np =3D pdev->dev.of_node;
> -	struct stmpe_gpio_platform_data *pdata;
>  	struct stmpe_gpio *stmpe_gpio;
>  	int ret;
>  	int irq =3D 0;
> =20
> -	pdata =3D stmpe->pdata->gpio;
> -
>  	irq =3D platform_get_irq(pdev, 0);
> =20
>  	stmpe_gpio =3D kzalloc(sizeof(struct stmpe_gpio), GFP_KERNEL);
> @@ -370,19 +367,14 @@ static int stmpe_gpio_probe(struct platform_dev=
ice *pdev)
>  	stmpe_gpio->chip =3D template_chip;
>  	stmpe_gpio->chip.ngpio =3D stmpe->num_gpios;
>  	stmpe_gpio->chip.dev =3D &pdev->dev;
> -#ifdef CONFIG_OF
>  	stmpe_gpio->chip.of_node =3D np;
> -#endif
>  	stmpe_gpio->chip.base =3D -1;
> =20
>  	if (IS_ENABLED(CONFIG_DEBUG_FS))
>                  stmpe_gpio->chip.dbg_show =3D stmpe_dbg_show;
> =20
> -	if (pdata)
> -		stmpe_gpio->norequest_mask =3D pdata->norequest_mask;
> -	else if (np)
> -		of_property_read_u32(np, "st,norequest-mask",
> -				&stmpe_gpio->norequest_mask);
> +	of_property_read_u32(np, "st,norequest-mask",
> +			&stmpe_gpio->norequest_mask);
> =20
>  	if (irq < 0)
>  		dev_info(&pdev->dev,
> @@ -424,9 +416,6 @@ static int stmpe_gpio_probe(struct platform_devic=
e *pdev)
>  					     NULL);
>  	}
> =20
> -	if (pdata && pdata->setup)
> -		pdata->setup(stmpe, stmpe_gpio->chip.base);
> -
>  	platform_set_drvdata(pdev, stmpe_gpio);
> =20
>  	return 0;
> @@ -443,15 +432,9 @@ static int stmpe_gpio_remove(struct platform_dev=
ice *pdev)
>  {
>  	struct stmpe_gpio *stmpe_gpio =3D platform_get_drvdata(pdev);
>  	struct stmpe *stmpe =3D stmpe_gpio->stmpe;
> -	struct stmpe_gpio_platform_data *pdata =3D stmpe->pdata->gpio;
> -
> -	if (pdata && pdata->remove)
> -		pdata->remove(stmpe, stmpe_gpio->chip.base);
> =20
>  	gpiochip_remove(&stmpe_gpio->chip);
> -
>  	stmpe_disable(stmpe, STMPE_BLOCK_GPIO);
> -
>  	kfree(stmpe_gpio);
> =20
>  	return 0;
> diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
> index dd908fea8c5b..23a9722c8176 100644
> --- a/include/linux/mfd/stmpe.h
> +++ b/include/linux/mfd/stmpe.h
> @@ -119,20 +119,6 @@ extern int stmpe_disable(struct stmpe *stmpe, un=
signed int blocks);
>  #define STMPE_GPIO_NOREQ_811_TOUCH	(0xf0)
> =20
>  /**
> - * struct stmpe_gpio_platform_data - STMPE GPIO platform data
> - * @norequest_mask: bitmask specifying which GPIOs should _not_ be
> - *		    requestable due to different usage (e.g. touch, keypad)
> - *		    STMPE_GPIO_NOREQ_* macros can be used here.
> - * @setup: board specific setup callback.
> - * @remove: board specific remove callback
> - */
> -struct stmpe_gpio_platform_data {
> -	unsigned norequest_mask;
> -	void (*setup)(struct stmpe *stmpe, unsigned gpio_base);
> -	void (*remove)(struct stmpe *stmpe, unsigned gpio_base);
> -};
> -
> -/**
>   * struct stmpe_ts_platform_data - stmpe811 touch screen controller =
platform
>   * data
>   * @sample_time: ADC converstion time in number of clock.
> @@ -183,7 +169,6 @@ struct stmpe_ts_platform_data {
>   * @irq_over_gpio: true if gpio is used to get irq
>   * @irq_gpio: gpio number over which irq will be requested (signific=
ant only if
>   *	      irq_over_gpio is true)
> - * @gpio: GPIO-specific platform data
>   * @ts: touchscreen-specific platform data
>   */
>  struct stmpe_platform_data {
> @@ -195,7 +180,6 @@ struct stmpe_platform_data {
>  	int irq_gpio;
>  	int autosleep_timeout;
> =20
> -	struct stmpe_gpio_platform_data *gpio;
>  	struct stmpe_ts_platform_data *ts;
>  };
> =20

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
