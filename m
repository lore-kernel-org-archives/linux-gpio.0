From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] pinctrl: single: support GPIO for bits pinctrl
Date: Wed, 17 Jun 2015 00:17:40 -0700
Message-ID: <20150617071740.GL2712@atomide.com>
References: <1434506172-4401-1-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:58205 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753585AbbFQHRp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 17 Jun 2015 03:17:45 -0400
Content-Disposition: inline
In-Reply-To: <1434506172-4401-1-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: haojian.zhuang@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, shawn.guo@linaro.org, wan.zhijun@zte.com.cn, jason.liu@linaro.org

* Jun Nie <jun.nie@linaro.org> [150616 18:58]:
> Support GPIO for one register control multiple pins case
> with calculating register offset first, then bit offset.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-single.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index 13b45f2..bd69d9a 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -494,7 +494,7 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
>  	struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
>  	struct pcs_gpiofunc_range *frange = NULL;
>  	struct list_head *pos, *tmp;
> -	int mux_bytes = 0;
> +	int offset, mux_bytes = 0;
>  	unsigned data;
>  
>  	/* If function mask is null, return directly. */
> @@ -507,9 +507,23 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
>  			|| pin < frange->offset)
>  			continue;
>  		mux_bytes = pcs->width / BITS_PER_BYTE;
> -		data = pcs->read(pcs->base + pin * mux_bytes) & ~pcs->fmask;
> -		data |= frange->gpiofunc;
> -		pcs->write(data, pcs->base + pin * mux_bytes);
> +		if (pcs->bits_per_mux) {
> +			int pin_pos, byte_num, num_pins_in_register;
> +
> +			num_pins_in_register = pcs->width / pcs->bits_per_pin;
> +			byte_num = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
> +			offset = (byte_num / mux_bytes) * mux_bytes;
> +			pin_pos = pin % num_pins_in_register;
> +			pin_pos *= pcs->bits_per_pin;
> +			data = pcs->read(pcs->base + offset) &
> +				~(pcs->fmask << pin_pos);

Should you check the pcs->fmask here too in case some bits are reserved?

> +			data |= frange->gpiofunc << pin_pos;
> +		} else {
> +			offset = pin * mux_bytes;
> +			data = pcs->read(pcs->base + offset) & ~pcs->fmask;
> +			data |= frange->gpiofunc;
> +		}
> +		pcs->write(data, pcs->base + offset);
>  		break;
>  	}
>  	return 0;

Other than that looks OK to me, would be good to also wait for Haojian's
comments here.

Regards,

Tony
