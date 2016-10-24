From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [RFC PATCH] gpio: of: fix GPIO drivers with multiple gpio_chip
 for a single node
Date: Mon, 24 Oct 2016 12:58:14 -0400
Message-ID: <1477328294.27514.6.camel@localhost>
References: <1477295033-6008-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477295033-6008-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, Axel Haslam <ahaslam@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Hi Masahiro,

On Mon, 2016-10-24 at 16:43 +0900, Masahiro Yamada wrote:
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

for the patch to work, the second compare of the return statement
should be updated:
	return chip->gpiodev->dev.of_node == gpiospec->np && 
	       chip->of_xlate(chip, gpiospec, NULL) >= 0;

the patch, with this return statement, is fixing the issue;
can you submit an updated version of your patch?

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
