From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] pinctrl: sunxi: set pin function as input
 on export
Date: Mon, 8 Feb 2016 18:20:31 +0100
Message-ID: <20160208172031.GJ31506@lukather>
References: <1454942242-25690-1-git-send-email-krzysztof.adamski@tieto.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Do4IU1xF/9sod/r6"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBYM44O2QKGQEB5NK3JI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454942242-25690-1-git-send-email-krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

--Do4IU1xF/9sod/r6
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Mon, Feb 08, 2016 at 03:37:22PM +0100, Krzysztof Adamski wrote:
> Default function of a pin in sunxi SoCs is "disabled". By default gpios
> exported by sysfs are set as input and indeed, when reading "direction"
> file you will get "in". The "value" pin won't return proper value,
> though, confusing user of this interface.
> 
> This patch sets direction of a GPIO as input when exporting it.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 7a2465f..905a9fb 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -452,6 +452,16 @@ static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
>  	return pinctrl_gpio_direction_input(chip->base + offset);
>  }
>  
> +int sunxi_pinctrl_gpio_request(struct gpio_chip *chip, unsigned offset)
> +{
> +	int ret = pinctrl_gpio_direction_input(chip->base + offset);
> +
> +	if (ret)
> +		return ret;
> +
> +	return pinctrl_request_gpio(chip->base + offset);
> +}
> +
>  static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> @@ -946,7 +956,7 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
>  
>  	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
>  	pctl->chip->owner = THIS_MODULE;
> -	pctl->chip->request = gpiochip_generic_request,
> +	pctl->chip->request = sunxi_pinctrl_gpio_request,
>  	pctl->chip->free = gpiochip_generic_free,
>  	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input,
>  	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output,
> -- 
> 2.4.2
> 

It seems to me that it's something that should be enforced in the
core, there's nothing sunxi specific here.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Do4IU1xF/9sod/r6--
