From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: [PATCH] pinctrl: rockchip: add support the get_direction
Date: Mon, 14 Mar 2016 13:57:26 +0800
Message-ID: <56E652C6.7030503@rock-chips.com>
References: <1457934266-29862-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from regular2.263xmail.com ([211.157.152.4]:35266 "EHLO
	regular2.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752211AbcCNF5v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2016 01:57:51 -0400
In-Reply-To: <1457934266-29862-1-git-send-email-wxt@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, heiko@sntech.de
Cc: linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org



=D4=DA 2016=C4=EA03=D4=C214=C8=D5 13:44, Caesar Wang =D0=B4=B5=C0:
> This patch adds the get_direction to support the gpio
> interface.
>
> the gpio direction is not used on rockchip platform when use the gpio
> debugfs.
>
> Tested on kylin board. (RK3036 SoCs)
> The repro steps:
> $/sys/class/gpio/
> echo 53 > export
> $/sys/class/gpio/gpio53# cat direction
> in
> In general, the gpio53 should be out value, but the direction is the
> default value 'in',  since the get_direction didn't supported in rock=
chip
> pinctrl.
>
> So, we should add this patch to support it.
>
> Change-Id: I237c2e85ac7680b3d0de15bbbb923985b4827def

Resend it since the change id, sorry for the noise.

> Reported-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> ---
>   drivers/pinctrl/pinctrl-rockchip.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pin=
ctrl-rockchip.c
> index bf032b9..f22a186 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1208,6 +1208,18 @@ static int rockchip_pmx_set(struct pinctrl_dev=
 *pctldev, unsigned selector,
>   	return 0;
>   }
>  =20
> +static int rockchip_gpio_get_direction(struct gpio_chip *chip, unsig=
ned offset)
> +{
> +	struct rockchip_pin_bank *bank =3D gpiochip_get_data(chip);
> +	int pin;
> +	u32 data;
> +
> +	pin =3D offset - chip->base;
> +	data =3D readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
> +
> +	return !!(data & BIT(pin));
> +}
> +
>   /*
>    * The calls to gpio_direction_output() and gpio_direction_input()
>    * leads to this function call (via the pinctrl_gpio_direction_{inp=
ut|output}()
> @@ -1741,6 +1753,7 @@ static const struct gpio_chip rockchip_gpiolib_=
chip =3D {
>   	.free =3D gpiochip_generic_free,
>   	.set =3D rockchip_gpio_set,
>   	.get =3D rockchip_gpio_get,
> +	.get_direction	=3D rockchip_gpio_get_direction,
>   	.direction_input =3D rockchip_gpio_direction_input,
>   	.direction_output =3D rockchip_gpio_direction_output,
>   	.to_irq =3D rockchip_gpio_to_irq,

--=20
caesar wang | software engineer | wxt@rock-chip.com


--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
