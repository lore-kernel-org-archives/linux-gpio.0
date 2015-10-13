From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH RFC/RFT 2/2] pinctrl-cygnus-gpio: convert to use
 gpiochip_add_with_ranges
Date: Tue, 13 Oct 2015 13:34:10 -0700
Message-ID: <561D6AC2.4050007@broadcom.com>
References: <1444578499-17980-1-git-send-email-jogo@openwrt.org>
 <1444578499-17980-3-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:64879 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752515AbbJMUeR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2015 16:34:17 -0400
In-Reply-To: <1444578499-17980-3-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Pramod KUMAR <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

++ Broadcom engineers working on Cygnus GPIO driver

We will discuss this change on the other email thread, i.e., [PATCH
RFC/RFT 0/2]...

On 10/11/2015 8:48 AM, Jonas Gorski wrote:
> Convert the driver to make use of passing ranges to gpiochip_add, and
> drop the custom implemtation of gpio_ranges.
> Since gpiochip_add_with_ranges also supports conditional setting of
> request/free based on the existence of ranges, and pinmux_is_supported
> held the same information, we can drop the custom request/free calbacks
> at the same time and just use the generic implementations if needed.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c | 126 +++++++-----------------------
>  1 file changed, 27 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
> index 1ca7830..d24218f 100644
> --- a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
> @@ -75,8 +75,6 @@
>   * @lock: lock to protect access to I/O registers
>   * @gc: GPIO chip
>   * @num_banks: number of GPIO banks, each bank supports up to 32 GPIOs
> - * @pinmux_is_supported: flag to indicate this GPIO controller contains pins
> - * that can be individually muxed to GPIO
>   * @pctl: pointer to pinctrl_dev
>   * @pctldesc: pinctrl descriptor
>   */
> @@ -91,8 +89,6 @@ struct cygnus_gpio {
>  	struct gpio_chip gc;
>  	unsigned num_banks;
>  
> -	bool pinmux_is_supported;
> -
>  	struct pinctrl_dev *pctl;
>  	struct pinctrl_desc pctldesc;
>  };
> @@ -289,28 +285,6 @@ static struct irq_chip cygnus_gpio_irq_chip = {
>  /*
>   * Request the Cygnus IOMUX pinmux controller to mux individual pins to GPIO
>   */
> -static int cygnus_gpio_request(struct gpio_chip *gc, unsigned offset)
> -{
> -	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
> -	unsigned gpio = gc->base + offset;
> -
> -	/* not all Cygnus GPIO pins can be muxed individually */
> -	if (!chip->pinmux_is_supported)
> -		return 0;
> -
> -	return pinctrl_request_gpio(gpio);
> -}
> -
> -static void cygnus_gpio_free(struct gpio_chip *gc, unsigned offset)
> -{
> -	struct cygnus_gpio *chip = to_cygnus_gpio(gc);
> -	unsigned gpio = gc->base + offset;
> -
> -	if (!chip->pinmux_is_supported)
> -		return;
> -
> -	pinctrl_free_gpio(gpio);
> -}
>  
>  static int cygnus_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
>  {
> @@ -596,22 +570,12 @@ static const struct pinconf_ops cygnus_pconf_ops = {
>  	.pin_config_set = cygnus_pin_config_set,
>  };
>  
> -/*
> - * Map a GPIO in the local gpio_chip pin space to a pin in the Cygnus IOMUX
> - * pinctrl pin space
> - */
> -struct cygnus_gpio_pin_range {
> -	unsigned offset;
> -	unsigned pin_base;
> -	unsigned num_pins;
> -};
> -
> -#define CYGNUS_PINRANGE(o, p, n) { .offset = o, .pin_base = p, .num_pins = n }
> +#define CYGNUS_PINRANGE(o, p, n) { .base = o, .pin_base = p, .npins = n }
>  
>  /*
>   * Pin mapping table for mapping local GPIO pins to Cygnus IOMUX pinctrl pins
>   */
> -static const struct cygnus_gpio_pin_range cygnus_gpio_pintable[] = {
> +static const struct pinctrl_gpio_range cygnus_gpio_pintable[] = {
>  	CYGNUS_PINRANGE(0, 42, 1),
>  	CYGNUS_PINRANGE(1, 44, 3),
>  	CYGNUS_PINRANGE(4, 48, 1),
> @@ -666,58 +630,6 @@ static const struct cygnus_gpio_pin_range cygnus_gpio_pintable[] = {
>  };
>  
>  /*
> - * The Cygnus IOMUX controller mainly supports group based mux configuration,
> - * but certain pins can be muxed to GPIO individually. Only the ASIU GPIO
> - * controller can support this, so it's an optional configuration
> - *
> - * Return -ENODEV means no support and that's fine
> - */
> -static int cygnus_gpio_pinmux_add_range(struct cygnus_gpio *chip)
> -{
> -	struct device_node *node = chip->dev->of_node;
> -	struct device_node *pinmux_node;
> -	struct platform_device *pinmux_pdev;
> -	struct gpio_chip *gc = &chip->gc;
> -	int i, ret = 0;
> -
> -	/* parse DT to find the phandle to the pinmux controller */
> -	pinmux_node = of_parse_phandle(node, "pinmux", 0);
> -	if (!pinmux_node)
> -		return -ENODEV;
> -
> -	pinmux_pdev = of_find_device_by_node(pinmux_node);
> -	/* no longer need the pinmux node */
> -	of_node_put(pinmux_node);
> -	if (!pinmux_pdev) {
> -		dev_err(chip->dev, "failed to get pinmux device\n");
> -		return -EINVAL;
> -	}
> -
> -	/* now need to create the mapping between local GPIO and PINMUX pins */
> -	for (i = 0; i < ARRAY_SIZE(cygnus_gpio_pintable); i++) {
> -		ret = gpiochip_add_pin_range(gc, dev_name(&pinmux_pdev->dev),
> -					     cygnus_gpio_pintable[i].offset,
> -					     cygnus_gpio_pintable[i].pin_base,
> -					     cygnus_gpio_pintable[i].num_pins);
> -		if (ret) {
> -			dev_err(chip->dev, "unable to add GPIO pin range\n");
> -			goto err_put_device;
> -		}
> -	}
> -
> -	chip->pinmux_is_supported = true;
> -
> -	/* no need for pinmux_pdev device reference anymore */
> -	put_device(&pinmux_pdev->dev);
> -	return 0;
> -
> -err_put_device:
> -	put_device(&pinmux_pdev->dev);
> -	gpiochip_remove_pin_ranges(gc);
> -	return ret;
> -}
> -
> -/*
>   * Cygnus GPIO controller supports some PINCONF related configurations such as
>   * pull up, pull down, and drive strength, when the pin is configured to GPIO
>   *
> @@ -805,6 +717,10 @@ static int cygnus_gpio_probe(struct platform_device *pdev)
>  	int irq, ret;
>  	const struct of_device_id *match;
>  	const struct cygnus_gpio_data *gpio_data;
> +	struct device_node *pinmux_node;
> +	const char *pinctrl_name = NULL;
> +	const struct pinctrl_gpio_range *ranges = NULL;
> +	unsigned int nranges = 0;
>  
>  	match = of_match_device(cygnus_gpio_of_match, dev);
>  	if (!match)
> @@ -844,25 +760,37 @@ static int cygnus_gpio_probe(struct platform_device *pdev)
>  	gc->label = dev_name(dev);
>  	gc->dev = dev;
>  	gc->of_node = dev->of_node;
> -	gc->request = cygnus_gpio_request;
> -	gc->free = cygnus_gpio_free;
>  	gc->direction_input = cygnus_gpio_direction_input;
>  	gc->direction_output = cygnus_gpio_direction_output;
>  	gc->set = cygnus_gpio_set;
>  	gc->get = cygnus_gpio_get;
>  
> -	ret = gpiochip_add(gc);
> +	/* parse DT to find the phandle to the pinmux controller */
> +	pinmux_node = of_parse_phandle(dev->of_node, "pinmux", 0);
> +	if (pinmux_node) {
> +		struct platform_device *pinmux_pdev;
> +
> +		pinmux_pdev = of_find_device_by_node(pinmux_node);
> +		/* no longer need the pinmux node */
> +		of_node_put(pinmux_node);
> +		if (!pinmux_pdev) {
> +			dev_err(chip->dev, "failed to get pinmux device\n");
> +			return -EINVAL;
> +		}
> +
> +		pinctrl_name = dev_name(&pinmux_pdev->dev);
> +		ranges = cygnus_gpio_pintable;
> +		nranges = ARRAY_SIZE(cygnus_gpio_pintable);
> +
> +		put_device(&pinmux_pdev->dev);
> +	}
> +
> +	ret = gpiochip_add_with_ranges(gc, pinctrl_name, ranges, nranges);
>  	if (ret < 0) {
>  		dev_err(dev, "unable to add GPIO chip\n");
>  		return ret;
>  	}
>  
> -	ret = cygnus_gpio_pinmux_add_range(chip);
> -	if (ret && ret != -ENODEV) {
> -		dev_err(dev, "unable to add GPIO pin range\n");
> -		goto err_rm_gpiochip;
> -	}
> -
>  	ret = cygnus_gpio_register_pinconf(chip);
>  	if (ret) {
>  		dev_err(dev, "unable to register pinconf\n");
> 
