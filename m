From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH] gpio: of: fix GPIO drivers with multiple gpio_chip
 for a single node
Date: Tue, 25 Oct 2016 01:07:13 +0300
Message-ID: <cf3a1a54-659b-9629-e119-c9bcdd1ed636@mleia.com>
References: <1477295033-6008-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:37157 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750813AbcJXWHP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Oct 2016 18:07:15 -0400
In-Reply-To: <1477295033-6008-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

Hi Masahiro,

On 24.10.2016 10:43, Masahiro Yamada wrote:
> Sylvain Lemieux reports the LPC32xx GPIO driver is broken since
> commit 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and
> struct gg_data").  Probably, gpio-etraxfs.c and gpio-davinci.c are
> broken as well.
> 
> Those drivers register multiple gpio_chip that are associated to a
> single OF node, and their own .of_xlate() checks if the passed
> gpio_chip is valid.
> 
> Now, the problem is of_find_gpiochip_by_node() returns the first
> gpio_chip found to match the given node.  So, .of_xlate() fails,
> except for the first GPIO bank.
> 
> Reverting the commit could be a solution, but I do not want to go
> back to the mess of struct gg_data.  Another solution here is to
> take the match by a node pointer and the success of .of_xlate().
> It is a bit clumsy to call .of_xlate twice; for gpio_chip matching
> and for really getting the gpio_desc index.  Perhaps, the long-term
> goal might be to convert drivers to single chip registration, but
> this commit will solve the problem until then.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reported-by: <slemieux.tyco@gmail.com>

Fixes: 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and struct gg_data")

> ---
> 
>  drivers/gpio/gpiolib-of.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index ecad3f0..f996596 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -26,14 +26,18 @@
>  
>  #include "gpiolib.h"
>  
> -static int of_gpiochip_match_node(struct gpio_chip *chip, void *data)
> +static int of_gpiochip_match_node_and_xlate(struct gpio_chip *chip, void *data)
>  {
> -	return chip->gpiodev->dev.of_node == data;
> +	struct of_phandle_args *gpiospec = data;
> +
> +	return chip->gpiodev->dev.of_node == gpiospec->np &&
> +					!chip->of_xlate(chip, gpiospec, NULL);

That's an awful but hopefully safe hack to support 3-4 broken GPIO
drivers, however it should work with a correction given by Sylvain.

Here I would recommend to expand the statement, so it will be easier
to simplify it in future:

  if (chip->gpiodev->dev.of_node != gpiospec->np)
          return 0;

  if (chip->of_xlate(chip, gpiospec, NULL) < 0)
          return 0;

  return 1;

As far as I can say it should work correctly with of_gpio_simple_xlate(),
brcmstb_gpio_of_xlate(), lpc32xx_of_xlate(), davinci_gpio_of_xlate(),
pxa_gpio_of_xlate() and etraxfs_gpio_of_xlate() flavours.

>  }
>  
> -static struct gpio_chip *of_find_gpiochip_by_node(struct device_node *np)
> +static struct gpio_chip *of_find_gpiochip_by_xlate(
> +					struct of_phandle_args *gpiospec)
>  {
> -	return gpiochip_find(np, of_gpiochip_match_node);
> +	return gpiochip_find(gpiospec, of_gpiochip_match_node_and_xlate);
>  }
>  
>  static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
> @@ -79,7 +83,7 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
>  		return ERR_PTR(ret);
>  	}
>  
> -	chip = of_find_gpiochip_by_node(gpiospec.np);
> +	chip = of_find_gpiochip_by_xlate(&gpiospec);
>  	if (!chip) {
>  		desc = ERR_PTR(-EPROBE_DEFER);
>  		goto out;
> 

--
With best wishes,
Vladimir
