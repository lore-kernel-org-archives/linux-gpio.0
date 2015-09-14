From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH RFT 2/5] gpio: replace trivial implementations of
 request/free with generic one
Date: Mon, 14 Sep 2015 16:37:04 +0200
Message-ID: <20150914163704.17dd3019@free-electrons.com>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
	<1442150498-31116-3-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:58626 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751751AbbINOhH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2015 10:37:07 -0400
In-Reply-To: <1442150498-31116-3-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>

Dear Jonas Gorski,

On Sun, 13 Sep 2015 15:21:35 +0200, Jonas Gorski wrote:

> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index b396bf3..dba8997 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -185,16 +185,6 @@ static void __iomem *mvebu_gpioreg_level_mask(struct mvebu_gpio_chip *mvchip)
>   * Functions implementing the gpio_chip methods
>   */
>  
> -static int mvebu_gpio_request(struct gpio_chip *chip, unsigned pin)
> -{
> -	return pinctrl_request_gpio(chip->base + pin);
> -}
> -
> -static void mvebu_gpio_free(struct gpio_chip *chip, unsigned pin)
> -{
> -	pinctrl_free_gpio(chip->base + pin);
> -}
> -
>  static void mvebu_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
>  {
>  	struct mvebu_gpio_chip *mvchip =
> @@ -709,8 +699,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
>  	mvchip->soc_variant = soc_variant;
>  	mvchip->chip.label = dev_name(&pdev->dev);
>  	mvchip->chip.dev = &pdev->dev;
> -	mvchip->chip.request = mvebu_gpio_request;
> -	mvchip->chip.free = mvebu_gpio_free;
> +	mvchip->chip.request = gpiochip_generic_request;
> +	mvchip->chip.free = gpiochip_generic_free;
>  	mvchip->chip.direction_input = mvebu_gpio_direction_input;
>  	mvchip->chip.get = mvebu_gpio_get;
>  	mvchip->chip.direction_output = mvebu_gpio_direction_output;

For the mvebu part:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
