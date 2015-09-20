From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH RFT 2/5] gpio: replace trivial implementations of
 request/free with generic one
Date: Sun, 20 Sep 2015 15:16:41 +0200
Message-ID: <CAGhQ9Vx-AQeQFkcoXwL+5Y8__-wGRvbM7vbgsB-fAjyf7Yv44Q@mail.gmail.com>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
	<1442150498-31116-3-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34202 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755263AbbITNQm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Sep 2015 09:16:42 -0400
Received: by iofb144 with SMTP id b144so10292835iof.1
        for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2015 06:16:41 -0700 (PDT)
In-Reply-To: <1442150498-31116-3-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abresti>

Hi Jonas,

On 13 September 2015 at 15:21, Jonas Gorski <jogo@openwrt.org> wrote:
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
>
> diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
> index eb68603..e39dcb0 100644
> --- a/drivers/gpio/gpio-lpc18xx.c
> +++ b/drivers/gpio/gpio-lpc18xx.c
> @@ -36,16 +36,6 @@ static inline struct lpc18xx_gpio_chip *to_lpc18xx_gpio(struct gpio_chip *chip)
>         return container_of(chip, struct lpc18xx_gpio_chip, gpio);
>  }
>
> -static int lpc18xx_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -       return pinctrl_request_gpio(offset);
> -}
> -
> -static void lpc18xx_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -       pinctrl_free_gpio(offset);
> -}
> -
>  static void lpc18xx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>  {
>         struct lpc18xx_gpio_chip *gc = to_lpc18xx_gpio(chip);
> @@ -95,8 +85,8 @@ static int lpc18xx_gpio_direction_output(struct gpio_chip *chip,
>
>  static struct gpio_chip lpc18xx_chip = {
>         .label                  = "lpc18xx/43xx-gpio",
> -       .request                = lpc18xx_gpio_request,
> -       .free                   = lpc18xx_gpio_free,
> +       .request                = gpiochip_generic_request,
> +       .free                   = gpiochip_generic_free,
>         .direction_input        = lpc18xx_gpio_direction_input,
>         .direction_output       = lpc18xx_gpio_direction_output,
>         .set                    = lpc18xx_gpio_set,

For lpc18xx part:
Acked-by: Joachim Eastwood <manabian@gmail.com>

regards,
Joachim Eastwood
