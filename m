From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH RFT 2/5] gpio: replace trivial implementations of
 request/free with generic one
Date: Mon, 14 Sep 2015 20:32:15 -0700
Message-ID: <8c58ff686349d7c027b8d82db3ca440a@agner.ch>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
 <1442150498-31116-3-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:43504 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751532AbbIODcs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2015 23:32:48 -0400
In-Reply-To: <1442150498-31116-3-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>, Andrew

On 2015-09-13 06:21, Jonas Gorski wrote:
> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  drivers/gpio/gpio-lpc18xx.c    | 14 ++------------
>  drivers/gpio/gpio-moxart.c     | 14 ++------------
>  drivers/gpio/gpio-mvebu.c      | 14 ++------------
>  drivers/gpio/gpio-tb10x.c      | 14 ++------------
>  drivers/gpio/gpio-tz1090-pdc.c | 14 ++------------
>  drivers/gpio/gpio-vf610.c      | 14 ++------------
>  6 files changed, 12 insertions(+), 72 deletions(-)
<snip>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 3d5714d..cf39fb2 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -77,16 +77,6 @@ static inline u32 vf610_gpio_readl(void __iomem *reg)
>  	return readl_relaxed(reg);
>  }
>  
> -static int vf610_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void vf610_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int vf610_gpio_get(struct gpio_chip *gc, unsigned int gpio)
>  {
>  	struct vf610_gpio_port *port =
> @@ -255,8 +245,8 @@ static int vf610_gpio_probe(struct platform_device *pdev)
>  	gc->ngpio = VF610_GPIO_PER_PORT;
>  	gc->base = of_alias_get_id(np, "gpio") * VF610_GPIO_PER_PORT;
>  
> -	gc->request = vf610_gpio_request;
> -	gc->free = vf610_gpio_free;
> +	gc->request = gpiochip_generic_request;
> +	gc->free = gpiochip_generic_free;
>  	gc->direction_input = vf610_gpio_direction_input;
>  	gc->get = vf610_gpio_get;
>  	gc->direction_output = vf610_gpio_direction_output;

For the vf610 changes,
Acked-by: Stefan Agner <stefan@agner.ch>

--
Stefan
