From: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH RFT 5/5] pinctrl: replace trivial implementations of
 gpio_chip request/free
Date: Thu, 1 Oct 2015 13:32:02 +0100
Message-ID: <20151001123202.GY3214@x1>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
 <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:55783 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753351AbbJAMcP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 1 Oct 2015 08:32:15 -0400
Content-Disposition: inline
In-Reply-To: <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>, Andrew

On Sun, 13 Sep 2015, Jonas Gorski wrote:

> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 14 ++------------

Acked-by: Lee Jones <lee@kernel.org>

>  drivers/pinctrl/intel/pinctrl-cherryview.c    | 14 ++------------
>  drivers/pinctrl/intel/pinctrl-intel.c         | 14 ++------------
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++------------
>  drivers/pinctrl/nomadik/pinctrl-abx500.c      | 18 ++----------------
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c     | 22 ++--------------------
>  drivers/pinctrl/pinctrl-adi2.c                | 14 ++------------
>  drivers/pinctrl/pinctrl-as3722.c              | 14 ++------------
>  drivers/pinctrl/pinctrl-at91.c                | 26 ++------------------------
>  drivers/pinctrl/pinctrl-coh901.c              | 22 ++--------------------
>  drivers/pinctrl/pinctrl-digicolor.c           | 14 ++------------
>  drivers/pinctrl/pinctrl-pistachio.c           | 14 ++------------
>  drivers/pinctrl/pinctrl-rockchip.c            | 14 ++------------
>  drivers/pinctrl/pinctrl-st.c                  | 14 ++------------
>  drivers/pinctrl/pinctrl-xway.c                | 18 ++----------------
>  drivers/pinctrl/qcom/pinctrl-msm.c            | 16 ++--------------
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      | 14 ++------------
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       | 14 ++------------
>  drivers/pinctrl/samsung/pinctrl-samsung.c     | 14 ++------------
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 14 ++------------
>  drivers/pinctrl/vt8500/pinctrl-wmt.c          | 14 ++------------
>  21 files changed, 42 insertions(+), 290 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 8efa235..a1ea565 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -330,16 +330,6 @@ static inline void bcm2835_pinctrl_fsel_set(
>  	bcm2835_gpio_wr(pc, FSEL_REG(pin), val);
>  }
>  
> -static int bcm2835_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void bcm2835_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int bcm2835_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>  {
>  	return pinctrl_gpio_direction_input(chip->base + offset);
> @@ -375,8 +365,8 @@ static int bcm2835_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>  static struct gpio_chip bcm2835_gpio_chip = {
>  	.label = MODULE_NAME,
>  	.owner = THIS_MODULE,
> -	.request = bcm2835_gpio_request,
> -	.free = bcm2835_gpio_free,
> +	.request = gpiochip_generic_request,
> +	.free = gpiochip_generic_free,
>  	.direction_input = bcm2835_gpio_direction_input,
>  	.direction_output = bcm2835_gpio_direction_output,
>  	.get = bcm2835_gpio_get,
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 2d5d3dd..4270bfa 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1149,16 +1149,6 @@ static struct pinctrl_desc chv_pinctrl_desc = {
>  	.owner = THIS_MODULE,
>  };
>  
> -static int chv_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void chv_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static unsigned chv_gpio_offset_to_pin(struct chv_pinctrl *pctrl,
>  				       unsigned offset)
>  {
> @@ -1238,8 +1228,8 @@ static int chv_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>  
>  static const struct gpio_chip chv_gpio_chip = {
>  	.owner = THIS_MODULE,
> -	.request = chv_gpio_request,
> -	.free = chv_gpio_free,
> +	.request = gpiochip_generic_request,
> +	.free = gpiochip_generic_free,
>  	.get_direction = chv_gpio_get_direction,
>  	.direction_input = chv_gpio_direction_input,
>  	.direction_output = chv_gpio_direction_output,
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index bb377c1..3371820 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -597,16 +597,6 @@ static const struct pinctrl_desc intel_pinctrl_desc = {
>  	.owner = THIS_MODULE,
>  };
>  
> -static int intel_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void intel_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int intel_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(chip);
> @@ -654,8 +644,8 @@ static int intel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>  
>  static const struct gpio_chip intel_gpio_chip = {
>  	.owner = THIS_MODULE,
> -	.request = intel_gpio_request,
> -	.free = intel_gpio_free,
> +	.request = gpiochip_generic_request,
> +	.free = gpiochip_generic_free,
>  	.direction_input = intel_gpio_direction_input,
>  	.direction_output = intel_gpio_direction_output,
>  	.get = intel_gpio_get,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 7726c6c..6e75a3f 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -723,16 +723,6 @@ static const struct pinmux_ops mtk_pmx_ops = {
>  	.gpio_set_direction	= mtk_pmx_gpio_set_direction,
>  };
>  
> -static int mtk_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void mtk_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int mtk_gpio_direction_input(struct gpio_chip *chip,
>  					unsigned offset)
>  {
> @@ -1005,8 +995,8 @@ static int mtk_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
>  
>  static struct gpio_chip mtk_gpio_chip = {
>  	.owner			= THIS_MODULE,
> -	.request		= mtk_gpio_request,
> -	.free			= mtk_gpio_free,
> +	.request		= gpiochip_generic_request,
> +	.free			= gpiochip_generic_free,
>  	.direction_input	= mtk_gpio_direction_input,
>  	.direction_output	= mtk_gpio_direction_output,
>  	.get			= mtk_gpio_get,
> diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
> index 97681fa..b59fbb4 100644
> --- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
> +++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
> @@ -654,25 +654,11 @@ static inline void abx500_gpio_dbg_show_one(struct seq_file *s,
>  #define abx500_gpio_dbg_show	NULL
>  #endif
>  
> -static int abx500_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -
> -	return pinctrl_request_gpio(gpio);
> -}
> -
> -static void abx500_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -
> -	pinctrl_free_gpio(gpio);
> -}
> -
>  static struct gpio_chip abx500gpio_chip = {
>  	.label			= "abx500-gpio",
>  	.owner			= THIS_MODULE,
> -	.request		= abx500_gpio_request,
> -	.free			= abx500_gpio_free,
> +	.request		= gpiochip_generic_request,
> +	.free			= gpiochip_generic_free,
>  	.direction_input	= abx500_gpio_direction_input,
>  	.get			= abx500_gpio_get,
>  	.direction_output	= abx500_gpio_direction_output,
> diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> index 352ede1..6a25bd8 100644
> --- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> +++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> @@ -884,24 +884,6 @@ static void nmk_gpio_latent_irq_handler(unsigned int irq, struct irq_desc *desc)
>  
>  /* I/O Functions */
>  
> -static int nmk_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	/*
> -	 * Map back to global GPIO space and request muxing, the direction
> -	 * parameter does not matter for this controller.
> -	 */
> -	int gpio = chip->base + offset;
> -
> -	return pinctrl_request_gpio(gpio);
> -}
> -
> -static void nmk_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -
> -	pinctrl_free_gpio(gpio);
> -}
> -
>  static int nmk_gpio_make_input(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct nmk_gpio_chip *nmk_chip =
> @@ -1267,8 +1249,8 @@ static int nmk_gpio_probe(struct platform_device *dev)
>  	spin_lock_init(&nmk_chip->lock);
>  
>  	chip = &nmk_chip->chip;
> -	chip->request = nmk_gpio_request;
> -	chip->free = nmk_gpio_free;
> +	chip->request = gpiochip_generic_request;
> +	chip->free = gpiochip_generic_free;
>  	chip->direction_input = nmk_gpio_make_input;
>  	chip->get = nmk_gpio_get_input;
>  	chip->direction_output = nmk_gpio_make_output;
> diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
> index a5976eb..3d9af69 100644
> --- a/drivers/pinctrl/pinctrl-adi2.c
> +++ b/drivers/pinctrl/pinctrl-adi2.c
> @@ -714,16 +714,6 @@ static struct pinctrl_desc adi_pinmux_desc = {
>  	.owner = THIS_MODULE,
>  };
>  
> -static int adi_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void adi_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int adi_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct gpio_port *port;
> @@ -995,8 +985,8 @@ static int adi_gpio_probe(struct platform_device *pdev)
>  	port->chip.get			= adi_gpio_get_value;
>  	port->chip.direction_output	= adi_gpio_direction_output;
>  	port->chip.set			= adi_gpio_set_value;
> -	port->chip.request		= adi_gpio_request;
> -	port->chip.free			= adi_gpio_free;
> +	port->chip.request		= gpiochip_generic_request,
> +	port->chip.free			= gpiochip_generic_free,
>  	port->chip.to_irq		= adi_gpio_to_irq;
>  	if (pdata->port_gpio_base > 0)
>  		port->chip.base		= pdata->port_gpio_base;
> diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
> index 4747e08..56af28b 100644
> --- a/drivers/pinctrl/pinctrl-as3722.c
> +++ b/drivers/pinctrl/pinctrl-as3722.c
> @@ -536,21 +536,11 @@ static int as3722_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>  	return as3722_irq_get_virq(as_pci->as3722, offset);
>  }
>  
> -static int as3722_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void as3722_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static const struct gpio_chip as3722_gpio_chip = {
>  	.label			= "as3722-gpio",
>  	.owner			= THIS_MODULE,
> -	.request		= as3722_gpio_request,
> -	.free			= as3722_gpio_free,
> +	.request		= gpiochip_generic_request,
> +	.free			= gpiochip_generic_free,
>  	.get			= as3722_gpio_get,
>  	.set			= as3722_gpio_set,
>  	.direction_input	= as3722_gpio_direction_input,
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index bae0012..5d8aede 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1277,28 +1277,6 @@ static int at91_pinctrl_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int at91_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	/*
> -	 * Map back to global GPIO space and request muxing, the direction
> -	 * parameter does not matter for this controller.
> -	 */
> -	int gpio = chip->base + offset;
> -	int bank = chip->base / chip->ngpio;
> -
> -	dev_dbg(chip->dev, "%s:%d pio%c%d(%d)\n", __func__, __LINE__,
> -		 'A' + bank, offset, gpio);
> -
> -	return pinctrl_request_gpio(gpio);
> -}
> -
> -static void at91_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -
> -	pinctrl_free_gpio(gpio);
> -}
> -
>  static int at91_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct at91_gpio_chip *at91_gpio = to_at91_gpio_chip(chip);
> @@ -1684,8 +1662,8 @@ static int at91_gpio_of_irq_setup(struct platform_device *pdev,
>  
>  /* This structure is replicated for each GPIO block allocated at probe time */
>  static struct gpio_chip at91_gpio_template = {
> -	.request		= at91_gpio_request,
> -	.free			= at91_gpio_free,
> +	.request		= gpiochip_generic_request,
> +	.free			= gpiochip_generic_free,
>  	.get_direction		= at91_gpio_get_direction,
>  	.direction_input	= at91_gpio_direction_input,
>  	.get			= at91_gpio_get,
> diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
> index 3731cc6..6db1788 100644
> --- a/drivers/pinctrl/pinctrl-coh901.c
> +++ b/drivers/pinctrl/pinctrl-coh901.c
> @@ -217,24 +217,6 @@ static inline struct u300_gpio *to_u300_gpio(struct gpio_chip *chip)
>  	return container_of(chip, struct u300_gpio, chip);
>  }
>  
> -static int u300_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	/*
> -	 * Map back to global GPIO space and request muxing, the direction
> -	 * parameter does not matter for this controller.
> -	 */
> -	int gpio = chip->base + offset;
> -
> -	return pinctrl_request_gpio(gpio);
> -}
> -
> -static void u300_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -
> -	pinctrl_free_gpio(gpio);
> -}
> -
>  static int u300_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct u300_gpio *gpio = to_u300_gpio(chip);
> @@ -417,8 +399,8 @@ int u300_gpio_config_set(struct gpio_chip *chip, unsigned offset,
>  static struct gpio_chip u300_gpio_chip = {
>  	.label			= "u300-gpio-chip",
>  	.owner			= THIS_MODULE,
> -	.request		= u300_gpio_request,
> -	.free			= u300_gpio_free,
> +	.request		= gpiochip_generic_request,
> +	.free			= gpiochip_generic_free,
>  	.get			= u300_gpio_get,
>  	.set			= u300_gpio_set,
>  	.direction_input	= u300_gpio_direction_input,
> diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
> index 461fffc..df885958 100644
> --- a/drivers/pinctrl/pinctrl-digicolor.c
> +++ b/drivers/pinctrl/pinctrl-digicolor.c
> @@ -169,16 +169,6 @@ static struct pinmux_ops dc_pmxops = {
>  	.gpio_request_enable	= dc_pmx_request_gpio,
>  };
>  
> -static int dc_gpio_request(struct gpio_chip *chip, unsigned gpio)
> -{
> -	return pinctrl_request_gpio(chip->base + gpio);
> -}
> -
> -static void dc_gpio_free(struct gpio_chip *chip, unsigned gpio)
> -{
> -	pinctrl_free_gpio(chip->base + gpio);
> -}
> -
>  static int dc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
>  {
>  	struct dc_pinmap *pmap = container_of(chip, struct dc_pinmap, chip);
> @@ -255,8 +245,8 @@ static int dc_gpiochip_add(struct dc_pinmap *pmap, struct device_node *np)
>  
>  	chip->label		= DRIVER_NAME;
>  	chip->dev		= pmap->dev;
> -	chip->request		= dc_gpio_request;
> -	chip->free		= dc_gpio_free;
> +	chip->request		= gpiochip_generic_request;
> +	chip->free		= gpiochip_generic_free;
>  	chip->direction_input	= dc_gpio_direction_input;
>  	chip->direction_output	= dc_gpio_direction_output;
>  	chip->get		= dc_gpio_get;
> diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
> index 3dc2ae1..a599b5c 100644
> --- a/drivers/pinctrl/pinctrl-pistachio.c
> +++ b/drivers/pinctrl/pinctrl-pistachio.c
> @@ -1171,16 +1171,6 @@ static struct pinctrl_desc pistachio_pinctrl_desc = {
>  	.confops = &pistachio_pinconf_ops,
>  };
>  
> -static int pistachio_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void pistachio_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct pistachio_gpio_bank *bank = gc_to_bank(chip);
> @@ -1334,8 +1324,8 @@ static void pistachio_gpio_irq_handler(unsigned int __irq,
>  		.npins = _npins,					\
>  		.gpio_chip = {						\
>  			.label = "GPIO" #_bank,				\
> -			.request = pistachio_gpio_request,		\
> -			.free = pistachio_gpio_free,			\
> +			.request = gpiochip_generic_request,		\
> +			.free = gpiochip_generic_free,			\
>  			.get_direction = pistachio_gpio_get_direction,	\
>  			.direction_input = pistachio_gpio_direction_input, \
>  			.direction_output = pistachio_gpio_direction_output, \
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index c5246c0..89a6ad8e 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1374,16 +1374,6 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
>   * GPIO handling
>   */
>  
> -static int rockchip_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void rockchip_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
>  {
>  	struct rockchip_pin_bank *bank = gc_to_pin_bank(gc);
> @@ -1461,8 +1451,8 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>  }
>  
>  static const struct gpio_chip rockchip_gpiolib_chip = {
> -	.request = rockchip_gpio_request,
> -	.free = rockchip_gpio_free,
> +	.request = gpiochip_generic_request,
> +	.free = gpiochip_generic_free,
>  	.set = rockchip_gpio_set,
>  	.get = rockchip_gpio_get,
>  	.direction_input = rockchip_gpio_direction_input,
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index f8338d2..fa49e31 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -742,16 +742,6 @@ static void st_gpio_direction(struct st_gpio_bank *bank,
>  	}
>  }
>  
> -static int st_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void st_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int st_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct st_gpio_bank *bank = gpio_chip_to_bank(chip);
> @@ -1490,8 +1480,8 @@ static void st_gpio_irqmux_handler(unsigned irq, struct irq_desc *desc)
>  }
>  
>  static struct gpio_chip st_gpio_template = {
> -	.request		= st_gpio_request,
> -	.free			= st_gpio_free,
> +	.request		= gpiochip_generic_request,
> +	.free			= gpiochip_generic_free,
>  	.get			= st_gpio_get,
>  	.set			= st_gpio_set,
>  	.direction_input	= st_gpio_direction_input,
> diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
> index 779950c..ae724bd 100644
> --- a/drivers/pinctrl/pinctrl-xway.c
> +++ b/drivers/pinctrl/pinctrl-xway.c
> @@ -682,28 +682,14 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
>  	return 0;
>  }
>  
> -static int xway_gpio_req(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -
> -	return pinctrl_request_gpio(gpio);
> -}
> -
> -static void xway_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -
> -	pinctrl_free_gpio(gpio);
> -}
> -
>  static struct gpio_chip xway_chip = {
>  	.label = "gpio-xway",
>  	.direction_input = xway_gpio_dir_in,
>  	.direction_output = xway_gpio_dir_out,
>  	.get = xway_gpio_get,
>  	.set = xway_gpio_set,
> -	.request = xway_gpio_req,
> -	.free = xway_gpio_free,
> +	.request = gpiochip_generic_request,
> +	.free = gpiochip_generic_free,
>  	.base = -1,
>  };
>  
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 492cdd5..1d3dcb4 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -458,18 +458,6 @@ static void msm_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>  	spin_unlock_irqrestore(&pctrl->lock, flags);
>  }
>  
> -static int msm_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -	return pinctrl_request_gpio(gpio);
> -}
> -
> -static void msm_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -	return pinctrl_free_gpio(gpio);
> -}
> -
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/seq_file.h>
>  
> @@ -527,8 +515,8 @@ static struct gpio_chip msm_gpio_template = {
>  	.direction_output = msm_gpio_direction_output,
>  	.get              = msm_gpio_get,
>  	.set              = msm_gpio_set,
> -	.request          = msm_gpio_request,
> -	.free             = msm_gpio_free,
> +	.request          = gpiochip_generic_request,
> +	.free             = gpiochip_generic_free,
>  	.dbg_show         = msm_gpio_dbg_show,
>  };
>  
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index bd1e245..6c42ca1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -546,16 +546,6 @@ static void pmic_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
>  	pmic_gpio_config_set(state->ctrl, pin, &config, 1);
>  }
>  
> -static int pmic_gpio_request(struct gpio_chip *chip, unsigned base)
> -{
> -	return pinctrl_request_gpio(chip->base + base);
> -}
> -
> -static void pmic_gpio_free(struct gpio_chip *chip, unsigned base)
> -{
> -	pinctrl_free_gpio(chip->base + base);
> -}
> -
>  static int pmic_gpio_of_xlate(struct gpio_chip *chip,
>  			      const struct of_phandle_args *gpio_desc,
>  			      u32 *flags)
> @@ -595,8 +585,8 @@ static const struct gpio_chip pmic_gpio_gpio_template = {
>  	.direction_output	= pmic_gpio_direction_output,
>  	.get			= pmic_gpio_get,
>  	.set			= pmic_gpio_set,
> -	.request		= pmic_gpio_request,
> -	.free			= pmic_gpio_free,
> +	.request		= gpiochip_generic_request,
> +	.free			= gpiochip_generic_free,
>  	.of_xlate		= pmic_gpio_of_xlate,
>  	.to_irq			= pmic_gpio_to_irq,
>  	.dbg_show		= pmic_gpio_dbg_show,
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> index e3be3ce..9ce0e30 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> @@ -604,16 +604,6 @@ static void pmic_mpp_set(struct gpio_chip *chip, unsigned pin, int value)
>  	pmic_mpp_config_set(state->ctrl, pin, &config, 1);
>  }
>  
> -static int pmic_mpp_request(struct gpio_chip *chip, unsigned base)
> -{
> -	return pinctrl_request_gpio(chip->base + base);
> -}
> -
> -static void pmic_mpp_free(struct gpio_chip *chip, unsigned base)
> -{
> -	pinctrl_free_gpio(chip->base + base);
> -}
> -
>  static int pmic_mpp_of_xlate(struct gpio_chip *chip,
>  			     const struct of_phandle_args *gpio_desc,
>  			     u32 *flags)
> @@ -653,8 +643,8 @@ static const struct gpio_chip pmic_mpp_gpio_template = {
>  	.direction_output	= pmic_mpp_direction_output,
>  	.get			= pmic_mpp_get,
>  	.set			= pmic_mpp_set,
> -	.request		= pmic_mpp_request,
> -	.free			= pmic_mpp_free,
> +	.request		= gpiochip_generic_request,
> +	.free			= gpiochip_generic_free,
>  	.of_xlate		= pmic_mpp_of_xlate,
>  	.to_irq			= pmic_mpp_to_irq,
>  	.dbg_show		= pmic_mpp_dbg_show,
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index c760bf4..3f622cc 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -888,19 +888,9 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
>  	return 0;
>  }
>  
> -static int samsung_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void samsung_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static const struct gpio_chip samsung_gpiolib_chip = {
> -	.request = samsung_gpio_request,
> -	.free = samsung_gpio_free,
> +	.request = gpiochip_generic_request,
> +	.free = gpiochip_generic_free,
>  	.set = samsung_gpio_set,
>  	.get = samsung_gpio_get,
>  	.direction_input = samsung_gpio_direction_input,
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index fb4669c0..c98ae05 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -446,16 +446,6 @@ static const struct pinmux_ops sunxi_pmx_ops = {
>  	.gpio_set_direction	= sunxi_pmx_gpio_set_direction,
>  };
>  
> -static int sunxi_pinctrl_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void sunxi_pinctrl_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
>  					unsigned offset)
>  {
> @@ -958,8 +948,8 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
>  
>  	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
>  	pctl->chip->owner = THIS_MODULE;
> -	pctl->chip->request = sunxi_pinctrl_gpio_request,
> -	pctl->chip->free = sunxi_pinctrl_gpio_free,
> +	pctl->chip->request = gpiochip_generic_request,
> +	pctl->chip->free = gpiochip_generic_free,
>  	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input,
>  	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output,
>  	pctl->chip->get = sunxi_pinctrl_gpio_get,
> diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
> index c15316b..fb22d3f 100644
> --- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
> +++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
> @@ -486,16 +486,6 @@ static struct pinctrl_desc wmt_desc = {
>  	.confops = &wmt_pinconf_ops,
>  };
>  
> -static int wmt_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	return pinctrl_request_gpio(chip->base + offset);
> -}
> -
> -static void wmt_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	pinctrl_free_gpio(chip->base + offset);
> -}
> -
>  static int wmt_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct wmt_pinctrl_data *data = dev_get_drvdata(chip->dev);
> @@ -560,8 +550,8 @@ static int wmt_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>  static struct gpio_chip wmt_gpio_chip = {
>  	.label = "gpio-wmt",
>  	.owner = THIS_MODULE,
> -	.request = wmt_gpio_request,
> -	.free = wmt_gpio_free,
> +	.request = gpiochip_generic_request,
> +	.free = gpiochip_generic_free,
>  	.get_direction = wmt_gpio_get_direction,
>  	.direction_input = wmt_gpio_direction_input,
>  	.direction_output = wmt_gpio_direction_output,
