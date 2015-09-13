From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH RFT 5/5] pinctrl: replace trivial implementations of gpio_chip request/free
Date: Sun, 13 Sep 2015 21:20:53 +0200
Message-ID: <5410791.Yv1bkX123z@diego>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org> <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:59450 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753550AbbIMTVE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 13 Sep 2015 15:21:04 -0400
In-Reply-To: <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@>

Hi Jonas,

Am Sonntag, 13. September 2015, 15:21:38 schrieb Jonas Gorski:
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index c5246c0..89a6ad8e 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1374,16 +1374,6 @@ static int rockchip_pinctrl_register(struct
> platform_device *pdev, * GPIO handling
>   */
>  
> -static int rockchip_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -       return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void rockchip_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -       pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int
> value) {
>         struct rockchip_pin_bank *bank = gc_to_pin_bank(gc);
> @@ -1461,8 +1451,8 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc,
> unsigned offset) }
>  
>  static const struct gpio_chip rockchip_gpiolib_chip = {
> -       .request = rockchip_gpio_request,
> -       .free = rockchip_gpio_free,
> +       .request = gpiochip_generic_request,
> +       .free = gpiochip_generic_free,
>         .set = rockchip_gpio_set,
>         .get = rockchip_gpio_get,
>         .direction_input = rockchip_gpio_direction_input,

for the Rockchip part

Acked-by: Heiko Stuebner <heiko@sntech.de>
