From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RESEND PATCH] pinctrl: rockchip: add support the get_direction
Date: Mon, 14 Mar 2016 23:36:55 +0100
Message-ID: <2329775.GrlpyGFbsF@diego>
References: <1457935279-7881-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38339 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753917AbcCNWg7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2016 18:36:59 -0400
In-Reply-To: <1457935279-7881-1-git-send-email-wxt@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: linus.walleij@linaro.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Caesar,

Am Montag, 14. M=E4rz 2016, 14:01:19 schrieb Caesar Wang:
> This patch adds the get_direction to support the gpio
> interface.
>=20
> The gpio direction is not used on rockchip platform when use the gpio
> debugfs.
>=20
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
>=20
> So, we should add this patch to support it.
>=20
> Reported-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
>=20
> ---
>=20
> Changes in RESEND:
> - Remove the change-id
>=20
>  drivers/pinctrl/pinctrl-rockchip.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index bf032b9..f22a186 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1208,6 +1208,18 @@ static int rockchip_pmx_set(struct pinctrl_dev
> *pctldev, unsigned selector, return 0;
>  }
>=20
> +static int rockchip_gpio_get_direction(struct gpio_chip *chip, unsig=
ned
> offset) +{
> +	struct rockchip_pin_bank *bank =3D gpiochip_get_data(chip);
> +	int pin;
> +	u32 data;
> +
> +	pin =3D offset - chip->base;
> +	data =3D readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
> +
> +	return !!(data & BIT(pin));

TRM (at least rk3288 and rk3036) says for the SWPORT_DDR register:
(data & BIT(pin)) =3D 0 =3D input
(data & BIT(pin)) =3D 1 =3D output

struct gpio_chip docs [0] says:
@get_direction: returns 0=3Dout, 1=3Din,


So shouldn't that be
	return !(data & BIT(pin));
with only one "!" instead of two?
Or as happens sometimes, am I just blind? :-)


Thanks
Heiko

[0] http://lxr.free-electrons.com/source/include/linux/gpio/driver.h#L3=
3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
