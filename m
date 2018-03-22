From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] pinctrl: ocelot: fix gpio direction
Date: Thu, 22 Mar 2018 16:29:17 +0100
Message-ID: <87muz0w2lu.fsf@bootlin.com>
References: <20180322123500.2379-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180322123500.2379-1-alexandre.belloni@bootlin.com> (Alexandre
        Belloni's message of "Thu, 22 Mar 2018 13:35:00 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Alexandre,
 
 On jeu., mars 22 2018, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Bits have to be cleared in DEVCPU_GCB:GPIO:GPIO_OE for input and set for
> output. ocelot_gpio_set_direction() got it wrong and this went unnoticed
> when the driver was reworked.
>
> Reported-by: Gregory Clement <gregory.clement@bootlin.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  drivers/pinctrl/pinctrl-ocelot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
> index a9423238471e..b5b3547fdcb2 100644
> --- a/drivers/pinctrl/pinctrl-ocelot.c
> +++ b/drivers/pinctrl/pinctrl-ocelot.c
> @@ -252,7 +252,7 @@ static int ocelot_gpio_set_direction(struct pinctrl_dev *pctldev,
>  	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
>  
>  	regmap_update_bits(info->map, OCELOT_GPIO_OE, BIT(pin),
> -			   input ? BIT(pin) : 0);
> +			   input ? 0 : BIT(pin));
>  
>  	return 0;
>  }
> -- 
> 2.16.2
>

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
