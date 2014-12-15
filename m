From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] gpio: tc3589x: get rid of platform data
Date: Mon, 15 Dec 2014 09:59:50 +0000
Message-ID: <20141215095950.GC7972@x1>
References: <1418636522-21296-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:39616 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752214AbaLOJ7z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Dec 2014 04:59:55 -0500
Received: by mail-qg0-f54.google.com with SMTP id l89so8061307qgf.41
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2014 01:59:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1418636522-21296-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Samuel Ortiz <sameo@linux.intel.com>

On Mon, 15 Dec 2014, Linus Walleij wrote:

> This device is only used from the device tree, and the startup()
> and remove() callbacks are not used anywhere in the kernel, so
> retire them and the pdata altogether.
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> MFD folks: this only considers GPIO but touches your include
> file, please ACK this so I can take it through the GPIO tree.
> ---
>  drivers/gpio/gpio-tc3589x.c | 15 ++-------------
>  include/linux/mfd/tc3589x.h | 12 ------------
>  2 files changed, 2 insertions(+), 25 deletions(-)

Looks fine.

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.=
c
> index abdcf58935f5..11aed2671065 100644
> --- a/drivers/gpio/gpio-tc3589x.c
> +++ b/drivers/gpio/gpio-tc3589x.c
> @@ -232,16 +232,13 @@ static irqreturn_t tc3589x_gpio_irq(int irq, vo=
id *dev)
>  static int tc3589x_gpio_probe(struct platform_device *pdev)
>  {
>  	struct tc3589x *tc3589x =3D dev_get_drvdata(pdev->dev.parent);
> -	struct tc3589x_gpio_platform_data *pdata;
>  	struct device_node *np =3D pdev->dev.of_node;
>  	struct tc3589x_gpio *tc3589x_gpio;
>  	int ret;
>  	int irq;
> =20
> -	pdata =3D tc3589x->pdata->gpio;
> -
> -	if (!(pdata || np)) {
> -		dev_err(&pdev->dev, "No platform data or Device Tree found\n");
> +	if (!np) {
> +		dev_err(&pdev->dev, "No Device Tree node found\n");
>  		return -EINVAL;
>  	}
> =20
> @@ -305,9 +302,6 @@ static int tc3589x_gpio_probe(struct platform_dev=
ice *pdev)
>  				     irq,
>  				     NULL);
> =20
> -	if (pdata && pdata->setup)
> -		pdata->setup(tc3589x, tc3589x_gpio->chip.base);
> -
>  	platform_set_drvdata(pdev, tc3589x_gpio);
> =20
>  	return 0;
> @@ -316,11 +310,6 @@ static int tc3589x_gpio_probe(struct platform_de=
vice *pdev)
>  static int tc3589x_gpio_remove(struct platform_device *pdev)
>  {
>  	struct tc3589x_gpio *tc3589x_gpio =3D platform_get_drvdata(pdev);
> -	struct tc3589x *tc3589x =3D tc3589x_gpio->tc3589x;
> -	struct tc3589x_gpio_platform_data *pdata =3D tc3589x->pdata->gpio;
> -
> -	if (pdata && pdata->remove)
> -		pdata->remove(tc3589x, tc3589x_gpio->chip.base);
> =20
>  	gpiochip_remove(&tc3589x_gpio->chip);
> =20
> diff --git a/include/linux/mfd/tc3589x.h b/include/linux/mfd/tc3589x.=
h
> index e1c12d84c26a..c203c9c56776 100644
> --- a/include/linux/mfd/tc3589x.h
> +++ b/include/linux/mfd/tc3589x.h
> @@ -163,24 +163,12 @@ struct tc3589x_keypad_platform_data {
>  };
> =20
>  /**
> - * struct tc3589x_gpio_platform_data - TC3589x GPIO platform data
> - * @setup: callback for board-specific initialization
> - * @remove: callback for board-specific teardown
> - */
> -struct tc3589x_gpio_platform_data {
> -	void (*setup)(struct tc3589x *tc3589x, unsigned gpio_base);
> -	void (*remove)(struct tc3589x *tc3589x, unsigned gpio_base);
> -};
> -
> -/**
>   * struct tc3589x_platform_data - TC3589x platform data
>   * @block: bitmask of blocks to enable (use TC3589x_BLOCK_*)
> - * @gpio: GPIO-specific platform data
>   * @keypad: keypad-specific platform data
>   */
>  struct tc3589x_platform_data {
>  	unsigned int block;
> -	struct tc3589x_gpio_platform_data *gpio;
>  	const struct tc3589x_keypad_platform_data *keypad;
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
