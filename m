From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH v3] gpio: driver for Xtensa GPIO32
Date: Thu, 12 Dec 2013 10:15:58 -0800
Message-ID: <20131212181558.GA12555@psi-dev26.jf.intel.com>
References: <36330381d07aed97fa587a6600ddee5f0be16da5.1386839921.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:40640 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751825Ab3LLSLg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 12 Dec 2013 13:11:36 -0500
Content-Disposition: inline
In-Reply-To: <36330381d07aed97fa587a6600ddee5f0be16da5.1386839921.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-xtensa@linux-xtensa.org

Hi Baruch,

On Thu, Dec 12, 2013 at 11:18:41AM +0200, Baruch Siach wrote:
> GPIO32 is a standard optional extension to the Xtensa architecture core that
> provides preconfigured output and input ports for intra SoC signaling. The
> GPIO32 option is implemented as 32bit Tensilica Instruction Extension (TIE)
> output state called EXPSTATE, and 32bit input wire called IMPWIRE. This
> driver treats input and output states as two distinct devices.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v3:
>    * Use BUG() in xtensa_impwire_set_value() to indicate that it should never
>      be called (Linus Walleij)
> 
> v2:
>    * Address the comments of Linus Walleij:
>       - Add a few comments
>       - Expand commit log message
>       - Use the BIT() macro for bit offsets
>       - Rewrite CPENABLE handling as static inlines
>       - Use device_initcall()
> 
>    * Depend on !SMP for reason explained in the comments (Marc Gauthier)
> 
>    * Use XCHAL_CP_ID_XTIOP to enable/disable GPIO32 only
> ---
>  drivers/gpio/Kconfig       |   8 +++
>  drivers/gpio/Makefile      |   1 +
>  drivers/gpio/gpio-xtensa.c | 163 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 172 insertions(+)
>  create mode 100644 drivers/gpio/gpio-xtensa.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 0f04444..67f5ce6 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -281,6 +281,14 @@ config GPIO_XILINX
>  	help
>  	  Say yes here to support the Xilinx FPGA GPIO device
>  
> +config GPIO_XTENSA
> +	bool "Xtensa GPIO32 support"
> +	depends on XTENSA
> +	depends on !SMP
> +	help
> +	  Say yes here to support the Xtensa internal GPIO32 IMPWIRE (input)
> +	  and EXPSTATE (output) ports
> +
>  config GPIO_VR41XX
>  	tristate "NEC VR4100 series General-purpose I/O Uint support"
>  	depends on CPU_VR41XX
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 7971e36..23b9c72 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -95,3 +95,4 @@ obj-$(CONFIG_GPIO_WM831X)	+= gpio-wm831x.o
>  obj-$(CONFIG_GPIO_WM8350)	+= gpio-wm8350.o
>  obj-$(CONFIG_GPIO_WM8994)	+= gpio-wm8994.o
>  obj-$(CONFIG_GPIO_XILINX)	+= gpio-xilinx.o
> +obj-$(CONFIG_GPIO_XTENSA)	+= gpio-xtensa.o
> diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c

[snip]

> +static int __init xtensa_gpio_init(void)
> +{
> +	struct platform_device *pdev;
> +
> +	pdev = platform_device_register_simple("xtensa-gpio", 0, NULL, 0);

Is it what you really want to do? It means this driver will probe
regardless it really should or not.

Br, David Cohen

> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
> +
> +	return platform_driver_register(&xtensa_gpio_driver);
> +}
> +device_initcall(xtensa_gpio_init);
> +
> +MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
> +MODULE_DESCRIPTION("Xtensa LX4 GPIO32 driver");
> +MODULE_LICENSE("GPL");
> -- 
> 1.8.5.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
