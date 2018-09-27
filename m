From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 2/3] pinctrl: mcp23s08: fix irq and irqchip setup order
Date: Thu, 27 Sep 2018 21:05:01 +0800
Message-ID: <d28987f1-aa03-99cb-1b57-5d0e3d018030@electromag.com.au>
References: <20180925145616.12610-1-m.felsch@pengutronix.de>
 <20180925145616.12610-3-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180925145616.12610-3-m.felsch@pengutronix.de>
Content-Language: en-AU
Sender: stable-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, stable@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

G'day Marco,


On 25/09/2018 10:56 PM, Marco Felsch wrote:
> Since 'commit 02e389e63e35 ("pinctrl: mcp23s08: fix irq setup order")' the
> irq request isn't the last devm_* allocation. Without a deeper look at
> the irq and testing this isn't a good solution. Since this driver relies
> on the devm mechanism, requesting a interrupt should be the last thing
> to avoid memory corruptions during unbinding.
> 
> 'Commit 02e389e63e35 ("pinctrl: mcp23s08: fix irq setup order")' fixed the
> order for the interrupt-controller use case only. The
> mcp23s08_irq_setup() must be split into two to fix it for the
> interrupt-controller use case and to register the irq at last. So the
> irq will be freed first during unbind.
> 

I'm no expert on the irq's, but after a bit of reading the patch makes sense to me.
I've got one question below.

> Cc: stable@vger.kernel.org
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Fixes: 82039d244f87 ("pinctrl: mcp23s08: add pinconf support")
> Fixes: 02e389e63e35 ("pinctrl: mcp23s08: fix irq setup order")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>   drivers/pinctrl/pinctrl-mcp23s08.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
> index 472746931ea8..367b648be7c7 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -636,6 +636,14 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
>   		return err;
>   	}
>   
> +	return 0;
> +}
> +
> +static int mcp23s08_irqchip_setup(struct mcp23s08 *mcp)
> +{
> +	struct gpio_chip *chip = &mcp->chip;
> +	int err;
> +
>   	err =  gpiochip_irqchip_add_nested(chip,
>   					   &mcp23s08_irq_chip,
>   					   0,
> @@ -908,8 +916,8 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>   			goto fail;
>   	}
>   
> -	if (mcp->irq && mcp->irq_controller) {
> -		ret = mcp23s08_irq_setup(mcp);
> +	if (mcp->irq_controller) {
> +		ret = mcp23s08_irqchip_setup(mcp);
The condition check changes, which may make sense to someone more knowledgeable.,
but gpiochip_set_nested_irqchip in mcp23s08_irqchip_setup references mcp->irq as well
so I'm a little confused.
>   		if (ret)
>   			goto fail;
>   	}
> @@ -941,6 +949,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>   		goto fail;
>   	}
>   
> +	if (mcp->irq)
> +		ret = mcp23s08_irq_setup(mcp);
> +
Is there any point if it's not a irq_controller?


>   fail:
>   	if (ret < 0)
>   		dev_dbg(dev, "can't setup chip %d, --> %d\n", addr, ret);
> 

Otherwise LGTM.

-- 
Regards
Phil Reid
