From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 11/17] gpio: rcar: remove unnecessary OOM messages
Date: Wed, 30 Apr 2014 03:04:13 +0200
Message-ID: <2988408.L3OI7rTPAj@avalon>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com> <003c01cf6386$bec85040$3c58f0c0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:44064 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256AbaD3BD5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 21:03:57 -0400
In-Reply-To: <003c01cf6386$bec85040$3c58f0c0$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Magnus Damm' <damm@opensource.se>

Hi Jingoo,

Thank you for the patch.

On Tuesday 29 April 2014 17:40:59 Jingoo Han wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpio/gpio-rcar.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index bfcfeee..0c9f803 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -363,7 +363,6 @@ static int gpio_rcar_probe(struct platform_device *pdev)
> 
>  	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
>  	if (!p) {
> -		dev_err(dev, "failed to allocate driver data\n");
>  		ret = -ENOMEM;
>  		goto err0;
>  	}

-- 
Regards,

Laurent Pinchart

