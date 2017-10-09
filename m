From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] pinctrl: meson: separate soc drivers
Date: Mon, 09 Oct 2017 15:11:01 +0200
Message-ID: <1507554661.16356.43.camel@baylibre.com>
References: <20171009101747.16940-1-jbrunet@baylibre.com>
         <20171009101747.16940-2-jbrunet@baylibre.com>
         <f695448c-eb6c-2503-4381-93386fd6176f@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:54071 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754530AbdJINLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2017 09:11:05 -0400
Received: by mail-wm0-f44.google.com with SMTP id q132so23327040wmd.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2017 06:11:04 -0700 (PDT)
In-Reply-To: <f695448c-eb6c-2503-4381-93386fd6176f@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

On Mon, 2017-10-09 at 13:35 +0200, Neil Armstrong wrote:
> On 09/10/2017 12:17, Jerome Brunet wrote:
> > When meson pinctrl is enabled, all meson platforms pinctrl drivers are
> > built in the kernel, with a significant amount of data.
> > 
> > This leads to situation where pinctrl drivers targeting an architecture
> > are also compiled and shipped on another one (ex: meson8 - ARM - compiled
> > and shipped on ARM64 builds). This is a waste of memory we can easily
> > avoid.
> > 
> > This change makes 4 pinctrl drivers (1 per SoC) out the original single
> > driver, allowing to compile and ship only the ones required.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/pinctrl/Kconfig                    | 11 +------
> >  drivers/pinctrl/meson/Kconfig              | 36 +++++++++++++++++++++
> >  drivers/pinctrl/meson/Makefile             |  8 +++--
> >  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 25 +++++++++++++--
> >  drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 25 +++++++++++++--
> >  drivers/pinctrl/meson/pinctrl-meson.c      | 51 ++-------------------------
> > ---
> >  drivers/pinctrl/meson/pinctrl-meson.h      | 11 ++-----
> >  drivers/pinctrl/meson/pinctrl-meson8.c     | 25 +++++++++++++--
> >  drivers/pinctrl/meson/pinctrl-meson8b.c    | 25 +++++++++++++--
> >  9 files changed, 140 insertions(+), 77 deletions(-)
> >  create mode 100644 drivers/pinctrl/meson/Kconfig
> > 
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 1778cf4f81c7..15b5b3b76ba9 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -167,16 +167,6 @@ config PINCTRL_MCP23S08
> >  	  This provides a GPIO interface supporting inputs and outputs.
> >  	  The I2C versions of the chips can be used as interrupt-
> > controller.
> >  
> > -config PINCTRL_MESON
> > -	bool
> > -	depends on OF
> > -	select PINMUX
> > -	select PINCONF
> > -	select GENERIC_PINCONF
> > -	select GPIOLIB
> > -	select OF_GPIO
> > -	select REGMAP_MMIO
> > -
> >  config PINCTRL_OXNAS
> >  	bool
> >  	depends on OF
> > @@ -368,6 +358,7 @@ source "drivers/pinctrl/uniphier/Kconfig"
> >  source "drivers/pinctrl/vt8500/Kconfig"
> >  source "drivers/pinctrl/mediatek/Kconfig"
> >  source "drivers/pinctrl/zte/Kconfig"
> > +source "drivers/pinctrl/meson/Kconfig"
> >  
> >  config PINCTRL_XWAY
> >  	bool
> > diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> > new file mode 100644
> > index 000000000000..15655bfd39b6
> > --- /dev/null
> > +++ b/drivers/pinctrl/meson/Kconfig
> > @@ -0,0 +1,36 @@
> > +menuconfig PINCTRL_MESON
> > +	bool "Amlogic SoC pinctrl drivers"
> > +	depends on ARCH_MESON || COMPILE_TEST
> > +	depends on OF
> > +	select PINMUX
> > +	select PINCONF
> > +	select GENERIC_PINCONF
> > +	select GPIOLIB
> > +	select OF_GPIO
> > +	select REGMAP_MMIO
> > +	select PINMUX
> > +	select GENERIC_PINCONF
> > +
> > +if PINCTRL_MESON
> > +
> > +config PINCTRL_MESON8
> > +	bool "Meson 8 SoC pinctrl driver"
> > +	depends on ARM
> > +	default y
> > +
> > +config PINCTRL_MESON8B
> > +	bool "Meson 8b SoC pinctrl driver"
> > +	depends on ARM
> > +	default y
> > +
> > +config PINCTRL_MESON_GXBB
> > +	bool "Meson gxbb SoC pinctrl driver"
> > +	depends on ARM64
> > +	default y
> > +
> > +config PINCTRL_MESON_GXL
> > +	bool "Meson gxl SoC pinctrl driver"
> > +	depends on ARM64
> > +	default y
> > +
> > +endif
> > diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
> > index 27c5b5126008..a6ef5ff4e9b1 100644
> > --- a/drivers/pinctrl/meson/Makefile
> > +++ b/drivers/pinctrl/meson/Makefile
> > @@ -1,3 +1,5 @@
> > -obj-y	+= pinctrl-meson8.o pinctrl-meson8b.o
> > -obj-y	+= pinctrl-meson-gxbb.o pinctrl-meson-gxl.o
> > -obj-y	+= pinctrl-meson.o
> > +obj-y += pinctrl-meson.o
> > +obj-$(CONFIG_PINCTRL_MESON8) += pinctrl-meson8.o
> > +obj-$(CONFIG_PINCTRL_MESON8B) += pinctrl-meson8b.o
> > +obj-$(CONFIG_PINCTRL_MESON_GXBB) += pinctrl-meson-gxbb.o
> > +obj-$(CONFIG_PINCTRL_MESON_GXL) += pinctrl-meson-gxl.o
> > diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> > b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> > index 1881d4a0eca2..a87bdb17414b 100644
> > --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> > +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> > @@ -824,7 +824,7 @@ static struct meson_bank meson_gxbb_aobus_banks[] = {
> >  	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  0,  0,
> > 16,  0,  0,  0, 16,  1,  0),
> >  };
> >  
> > -struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
> > +static struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
> >  	.name		= "periphs-banks",
> >  	.pins		= meson_gxbb_periphs_pins,
> >  	.groups		= meson_gxbb_periphs_groups,
> > @@ -836,7 +836,7 @@ struct meson_pinctrl_data
> > meson_gxbb_periphs_pinctrl_data = {
> >  	.num_banks	= ARRAY_SIZE(meson_gxbb_periphs_banks),
> >  };
> >  
> > -struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data = {
> > +static struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data = {
> >  	.name		= "aobus-banks",
> >  	.pins		= meson_gxbb_aobus_pins,
> >  	.groups		= meson_gxbb_aobus_groups,
> > @@ -847,3 +847,24 @@ struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data
> > = {
> >  	.num_funcs	= ARRAY_SIZE(meson_gxbb_aobus_functions),
> >  	.num_banks	= ARRAY_SIZE(meson_gxbb_aobus_banks),
> >  };
> > +
> > +static const struct of_device_id meson_gxbb_pinctrl_dt_match[] = {
> > +	{
> > +		.compatible = "amlogic,meson-gxbb-periphs-pinctrl",
> > +		.data = &meson_gxbb_periphs_pinctrl_data,
> > +	},
> > +	{
> > +		.compatible = "amlogic,meson-gxbb-aobus-pinctrl",
> > +		.data = &meson_gxbb_aobus_pinctrl_data,
> > +	},
> > +	{ },
> > +};
> > +
> > +static struct platform_driver meson_gxbb_pinctrl_driver = {
> > +	.probe		= meson_pinctrl_probe,
> > +	.driver = {
> > +		.name	= "meson-gxbb-pinctrl",
> > +		.of_match_table = meson_gxbb_pinctrl_dt_match,
> > +	},
> > +};
> > +builtin_platform_driver(meson_gxbb_pinctrl_driver);
> > diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> > b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> > index 3a14ecae9f31..088ac94f76b0 100644
> > --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> > +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> > @@ -809,7 +809,7 @@ static struct meson_bank meson_gxl_aobus_banks[] = {
> >  	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 9, 0,  0,  0, 16,  0,  0,  0,
> > 16,  1,  0),
> >  };
> >  
> > -struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
> > +static struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
> >  	.name		= "periphs-banks",
> >  	.pins		= meson_gxl_periphs_pins,
> >  	.groups		= meson_gxl_periphs_groups,
> > @@ -821,7 +821,7 @@ struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data
> > = {
> >  	.num_banks	= ARRAY_SIZE(meson_gxl_periphs_banks),
> >  };
> >  
> > -struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data = {
> > +static struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data = {
> >  	.name		= "aobus-banks",
> >  	.pins		= meson_gxl_aobus_pins,
> >  	.groups		= meson_gxl_aobus_groups,
> > @@ -832,3 +832,24 @@ struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data
> > = {
> >  	.num_funcs	= ARRAY_SIZE(meson_gxl_aobus_functions),
> >  	.num_banks	= ARRAY_SIZE(meson_gxl_aobus_banks),
> >  };
> > +
> > +static const struct of_device_id meson_gxl_pinctrl_dt_match[] = {
> > +	{
> > +		.compatible = "amlogic,meson-gxl-periphs-pinctrl",
> > +		.data = &meson_gxl_periphs_pinctrl_data,
> > +	},
> > +	{
> > +		.compatible = "amlogic,meson-gxl-aobus-pinctrl",
> > +		.data = &meson_gxl_aobus_pinctrl_data,
> > +	},
> > +	{ },
> > +};
> > +
> > +static struct platform_driver meson_gxl_pinctrl_driver = {
> > +	.probe		= meson_pinctrl_probe,
> > +	.driver = {
> > +		.name	= "meson-gxl-pinctrl",
> > +		.of_match_table = meson_gxl_pinctrl_dt_match,
> > +	},
> > +};
> > +builtin_platform_driver(meson_gxl_pinctrl_driver);
> > diff --git a/drivers/pinctrl/meson/pinctrl-meson.c
> > b/drivers/pinctrl/meson/pinctrl-meson.c
> > index 71bccb7acbf8..8fc1f1b45435 100644
> > --- a/drivers/pinctrl/meson/pinctrl-meson.c
> > +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> > @@ -481,42 +481,6 @@ static int meson_gpio_get(struct gpio_chip *chip,
> > unsigned gpio)
> >  	return !!(val & BIT(bit));
> >  }
> >  
> > -static const struct of_device_id meson_pinctrl_dt_match[] = {
> > -	{
> > -		.compatible = "amlogic,meson8-cbus-pinctrl",
> > -		.data = &meson8_cbus_pinctrl_data,
> > -	},
> > -	{
> > -		.compatible = "amlogic,meson8b-cbus-pinctrl",
> > -		.data = &meson8b_cbus_pinctrl_data,
> > -	},
> > -	{
> > -		.compatible = "amlogic,meson8-aobus-pinctrl",
> > -		.data = &meson8_aobus_pinctrl_data,
> > -	},
> > -	{
> > -		.compatible = "amlogic,meson8b-aobus-pinctrl",
> > -		.data = &meson8b_aobus_pinctrl_data,
> > -	},
> > -	{
> > -		.compatible = "amlogic,meson-gxbb-periphs-pinctrl",
> > -		.data = &meson_gxbb_periphs_pinctrl_data,
> > -	},
> > -	{
> > -		.compatible = "amlogic,meson-gxbb-aobus-pinctrl",
> > -		.data = &meson_gxbb_aobus_pinctrl_data,
> > -	},
> > -	{
> > -		.compatible = "amlogic,meson-gxl-periphs-pinctrl",
> > -		.data = &meson_gxl_periphs_pinctrl_data,
> > -	},
> > -	{
> > -		.compatible = "amlogic,meson-gxl-aobus-pinctrl",
> > -		.data = &meson_gxl_aobus_pinctrl_data,
> > -	},
> > -	{ },
> > -};
> > -
> >  static int meson_gpiolib_register(struct meson_pinctrl *pc)
> >  {
> >  	int ret;
> > @@ -624,7 +588,7 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl
> > *pc,
> >  	return 0;
> >  }
> >  
> > -static int meson_pinctrl_probe(struct platform_device *pdev)
> > +int meson_pinctrl_probe(struct platform_device *pdev)
> >  {
> >  	const struct of_device_id *match;
> >  	struct device *dev = &pdev->dev;
> > @@ -636,10 +600,10 @@ static int meson_pinctrl_probe(struct platform_device
> > *pdev)
> >  		return -ENOMEM;
> >  
> >  	pc->dev = dev;
> > -	match = of_match_node(meson_pinctrl_dt_match, pdev->dev.of_node);
> > +	match = of_match_node(dev->driver->of_match_table, dev->of_node);
> 
> 
> Minor comment, maybe you could use of_device_get_match_data(dev) here, it will
> be simpler.

Indeed, I missed this particular helper. Thx !

> 
> >  	pc->data = (struct meson_pinctrl_data *) match->data;
> >  
> > -	ret = meson_pinctrl_parse_dt(pc, pdev->dev.of_node);
> > +	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -659,12 +623,3 @@ static int meson_pinctrl_probe(struct platform_device
> > *pdev)
> >  
> >  	return meson_gpiolib_register(pc);
> >  }
> > -
> > -static struct platform_driver meson_pinctrl_driver = {
> > -	.probe		= meson_pinctrl_probe,
> > -	.driver = {
> > -		.name	= "meson-pinctrl",
> > -		.of_match_table = meson_pinctrl_dt_match,
> > -	},
> > -};
> > -builtin_platform_driver(meson_pinctrl_driver);
> > diff --git a/drivers/pinctrl/meson/pinctrl-meson.h
> > b/drivers/pinctrl/meson/pinctrl-meson.h
> > index 7ed0a80fd9dc..284157d43612 100644
> > --- a/drivers/pinctrl/meson/pinctrl-meson.h
> > +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> > @@ -13,6 +13,7 @@
> >  
> >  #include <linux/gpio.h>
> >  #include <linux/pinctrl/pinctrl.h>
> > +#include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/types.h>
> >  
> > @@ -165,11 +166,5 @@ struct meson_pinctrl {
> >  
> >  #define MESON_PIN(x) PINCTRL_PIN(x, #x)
> >  
> > -extern struct meson_pinctrl_data meson8_cbus_pinctrl_data;
> > -extern struct meson_pinctrl_data meson8_aobus_pinctrl_data;
> > -extern struct meson_pinctrl_data meson8b_cbus_pinctrl_data;
> > -extern struct meson_pinctrl_data meson8b_aobus_pinctrl_data;
> > -extern struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data;
> > -extern struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data;
> > -extern struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data;
> > -extern struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data;
> > +/* Common probe function */
> > +int meson_pinctrl_probe(struct platform_device *pdev);
> > diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c
> > b/drivers/pinctrl/meson/pinctrl-meson8.c
> > index fbf8ecd1c2b6..68b345fc105a 100644
> > --- a/drivers/pinctrl/meson/pinctrl-meson8.c
> > +++ b/drivers/pinctrl/meson/pinctrl-meson8.c
> > @@ -1044,7 +1044,7 @@ static struct meson_bank meson8_aobus_banks[] = {
> >  	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  0,  0,
> > 16,  0,  0,  0, 16,  1,  0),
> >  };
> >  
> > -struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
> > +static struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
> >  	.name		= "cbus-banks",
> >  	.pins		= meson8_cbus_pins,
> >  	.groups		= meson8_cbus_groups,
> > @@ -1056,7 +1056,7 @@ struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
> >  	.num_banks	= ARRAY_SIZE(meson8_cbus_banks),
> >  };
> >  
> > -struct meson_pinctrl_data meson8_aobus_pinctrl_data = {
> > +static struct meson_pinctrl_data meson8_aobus_pinctrl_data = {
> >  	.name		= "ao-bank",
> >  	.pins		= meson8_aobus_pins,
> >  	.groups		= meson8_aobus_groups,
> > @@ -1067,3 +1067,24 @@ struct meson_pinctrl_data meson8_aobus_pinctrl_data =
> > {
> >  	.num_funcs	= ARRAY_SIZE(meson8_aobus_functions),
> >  	.num_banks	= ARRAY_SIZE(meson8_aobus_banks),
> >  };
> > +
> > +static const struct of_device_id meson8_pinctrl_dt_match[] = {
> > +	{
> > +		.compatible = "amlogic,meson8-cbus-pinctrl",
> > +		.data = &meson8_cbus_pinctrl_data,
> > +	},
> > +	{
> > +		.compatible = "amlogic,meson8-aobus-pinctrl",
> > +		.data = &meson8_aobus_pinctrl_data,
> > +	},
> > +	{ },
> > +};
> > +
> > +static struct platform_driver meson8_pinctrl_driver = {
> > +	.probe		= meson_pinctrl_probe,
> > +	.driver = {
> > +		.name	= "meson8-pinctrl",
> > +		.of_match_table = meson8_pinctrl_dt_match,
> > +	},
> > +};
> > +builtin_platform_driver(meson8_pinctrl_driver);
> > diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c
> > b/drivers/pinctrl/meson/pinctrl-meson8b.c
> > index 7af296db48c8..4d61df09bc3f 100644
> > --- a/drivers/pinctrl/meson/pinctrl-meson8b.c
> > +++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
> > @@ -904,7 +904,7 @@ static struct meson_bank meson8b_aobus_banks[] = {
> >  	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  0,  0,
> > 16,  0,  0,  0, 16,  1,  0),
> >  };
> >  
> > -struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
> > +static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
> >  	.name		= "cbus-banks",
> >  	.pins		= meson8b_cbus_pins,
> >  	.groups		= meson8b_cbus_groups,
> > @@ -916,7 +916,7 @@ struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
> >  	.num_banks	= ARRAY_SIZE(meson8b_cbus_banks),
> >  };
> >  
> > -struct meson_pinctrl_data meson8b_aobus_pinctrl_data = {
> > +static struct meson_pinctrl_data meson8b_aobus_pinctrl_data = {
> >  	.name		= "aobus-banks",
> >  	.pins		= meson8b_aobus_pins,
> >  	.groups		= meson8b_aobus_groups,
> > @@ -927,3 +927,24 @@ struct meson_pinctrl_data meson8b_aobus_pinctrl_data =
> > {
> >  	.num_funcs	= ARRAY_SIZE(meson8b_aobus_functions),
> >  	.num_banks	= ARRAY_SIZE(meson8b_aobus_banks),
> >  };
> > +
> > +static const struct of_device_id meson8b_pinctrl_dt_match[] = {
> > +	{
> > +		.compatible = "amlogic,meson8b-cbus-pinctrl",
> > +		.data = &meson8b_cbus_pinctrl_data,
> > +	},
> > +	{
> > +		.compatible = "amlogic,meson8b-aobus-pinctrl",
> > +		.data = &meson8b_aobus_pinctrl_data,
> > +	},
> > +	{ },
> > +};
> > +
> > +static struct platform_driver meson8b_pinctrl_driver = {
> > +	.probe		= meson_pinctrl_probe,
> > +	.driver = {
> > +		.name	= "meson8b-pinctrl",
> > +		.of_match_table = meson8b_pinctrl_dt_match,
> > +	},
> > +};
> > +builtin_platform_driver(meson8b_pinctrl_driver);
> > 
> 
> Apart the comment on of_device_get_match_data() :
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

