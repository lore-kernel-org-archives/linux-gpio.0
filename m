From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/6] pinctrl: rockchip: add support for rk1108
Date: Thu, 03 Nov 2016 16:55:45 +0100
Message-ID: <3450255.c5nv6dGt3I@diego>
References: <1478175975-11779-1-git-send-email-andy.yan@rock-chips.com> <1478176470-11956-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:47704 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754769AbcKCP4K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Nov 2016 11:56:10 -0400
In-Reply-To: <1478176470-11956-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: david.wu@rock-chips.com, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Am Donnerstag, 3. November 2016, 20:34:30 schrieb Andy Yan:
> Add basic support for rk1108 soc
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

nice when support for a new soc is that easy in a driver :-)

There are two small issues below and with those fixed
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> 
>  drivers/pinctrl/pinctrl-rockchip.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)

missing devicetree binding update for the new compatible

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index 49bf7dc..9f324b1 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c

[...]

> +static struct rockchip_pin_ctrl rk1108_pin_ctrl = {
> +	.pin_banks		= rk1108_pin_banks,
> +	.nr_banks		= ARRAY_SIZE(rk1108_pin_banks),
> +	.label			= "RK1108-GPIO",
> +	.type			= RK1108,
> +	.grf_mux_offset		= 0x10,
> +	.pmu_mux_offset		= 0x0,
> +	.pull_calc_reg          = rk3288_calc_pull_reg_and_bit,

this last line has spaces instead of tabs between .pull_calc_reg and the "="


Heiko
