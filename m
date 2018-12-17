From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] gpio: mvebu: only fail on missing clk if pwm is actually to be used
Date: Mon, 17 Dec 2018 09:46:54 +0100
Message-ID: <875zvsk0ap.fsf@bootlin.com>
References: <20181217084313.15379-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181217084313.15379-1-u.kleine-koenig@pengutronix.de> ("Uwe
        =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Mon, 17 Dec 2018 09:43:13
 +0100")
Sender: stable-owner@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Ralph Sennhauser <ralph.sennhauser@gmail.com>, linux-gpio@vger.kernel.org, stable@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: linux-gpio@vger.kernel.org

Hi,
 
 On lun., déc. 17 2018, Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:

> The gpio IP on Armada 370 at offset 0x18180 has neither a clk nor pwm
> registers. So there is no need for a clk as the pwm isn't used anyhow.
> So only check for the clk in the presence of the pwm registers. This fixes
> a failure to probe the gpio driver for the above mentioned gpio device.
>
> Fixes: 757642f9a584 ("gpio: mvebu: Add limited PWM support")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


> ---
>  drivers/gpio/gpio-mvebu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 6e02148c208b..adc768f908f1 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -773,9 +773,6 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
>  				     "marvell,armada-370-gpio"))
>  		return 0;
>  
> -	if (IS_ERR(mvchip->clk))
> -		return PTR_ERR(mvchip->clk);
> -
>  	/*
>  	 * There are only two sets of PWM configuration registers for
>  	 * all the GPIO lines on those SoCs which this driver reserves
> @@ -786,6 +783,9 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
>  	if (!res)
>  		return 0;
>  
> +	if (IS_ERR(mvchip->clk))
> +		return PTR_ERR(mvchip->clk);
> +
>  	/*
>  	 * Use set A for lines of GPIO chip with id 0, B for GPIO chip
>  	 * with id 1. Don't allow further GPIO chips to be used for PWM.
> -- 
> 2.19.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
