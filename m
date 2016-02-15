From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Rework PFC GPIO support
Date: Mon, 15 Feb 2016 14:55:30 +0200
Message-ID: <5596419.W3vqRvx1Kq@avalon>
References: <20160215120438.24670.15402.sendpatchset@little-apple>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55922 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131AbcBOMzC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 07:55:02 -0500
In-Reply-To: <20160215120438.24670.15402.sendpatchset@little-apple>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, horms@verge.net.au, geert@glider.be

Hi Magnus,

Thank you for the patch.

On Monday 15 February 2016 21:04:38 Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> The sh-pfc Pinctrl driver is currently handling SoC-specific
> PFC hardware blocks on Arm64, Arm and SH architectures.
> 
> For older SoCs using SH cores and some 32-bit Arm SoCs the PFC
> hardware also provides GPIO functionality. On the majority of
> 32-bit Arm SoCs from Renesas and so far all Arm64 SoCs the GPIO
> feature is provided by separate hardware blocks.
> 
> So far GPIO support in the PFC driver has been compiled-in for
> the majority of the SoCs, but with this patch applied the SoCs
> with PFC support may select from one of the following:
>  - CONFIG_PINCTRL_SH_PFC - Used if PFC lacks GPIO hardware
>  - CONFIG_PINCTRL_SH_PFC_GPIO - Used if PFC includes GPIO support
> 
> This patch results in the following changes:
>  - The GPIO functionality is only compiled-in on relevant SoCs
>  - The number of lines of code is reduced
> 
> Build tested using the following configurations:
>  - r8a7795 -> CONFIG_PINCTRL_SH_PFC_GPIO=n -> Ok (Arm64)
>  - r8a7790 -> CONFIG_PINCTRL_SH_PFC_GPIO=n -> Ok (Arm)
>  - r8a7790 + r8a7740 -> CONFIG_PINCTRL_SH_PFC_GPIO=y -> Ok (Arm)
>  - r8a7740 -> CONFIG_PINCTRL_SH_PFC_GPIO=y -> Ok (Arm)
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  drivers/pinctrl/sh-pfc/Kconfig  |   54 ++++++++++++------------------------
>  drivers/pinctrl/sh-pfc/Makefile |   33 ++++++++++-------------
>  drivers/pinctrl/sh-pfc/core.c   |    4 +-
>  3 files changed, 37 insertions(+), 54 deletions(-)
> 
> --- 0001/drivers/pinctrl/sh-pfc/Kconfig
> +++ work/drivers/pinctrl/sh-pfc/Kconfig	2016-02-15 19:59:35.080513000 +0900
> @@ -5,7 +5,6 @@
>  if ARCH_SHMOBILE || SUPERH
> 
>  config PINCTRL_SH_PFC
> -	select GPIO_SH_PFC if ARCH_REQUIRE_GPIOLIB
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> @@ -13,12 +12,12 @@ config PINCTRL_SH_PFC
>  	help
>  	  This enables pin control drivers for SH and SH Mobile platforms
> 
> -config GPIO_SH_PFC
> -	bool "SuperH PFC GPIO support"
> -	depends on PINCTRL_SH_PFC && GPIOLIB
> +config PINCTRL_SH_PFC_GPIO
> +	select GPIOLIB
> +	select PINCTRL_SH_PFC
> +	def_bool n
>  	help
> -	  This enables support for GPIOs within the SoC's pin function
> -	  controller.
> +	  This enables pin control and GPIO drivers for SH/SH Mobile platforms
> 
>  config PINCTRL_PFC_EMEV2
>  	def_bool y
> @@ -28,12 +27,12 @@ config PINCTRL_PFC_EMEV2
>  config PINCTRL_PFC_R8A73A4
>  	def_bool y
>  	depends on ARCH_R8A73A4
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_R8A7740
>  	def_bool y
>  	depends on ARCH_R8A7740
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_R8A7778
>  	def_bool y
> @@ -73,79 +72,66 @@ config PINCTRL_PFC_R8A7795
>  config PINCTRL_PFC_SH7203
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7203
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH7264
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7264
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH7269
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7269
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH73A0
>  	def_bool y
>  	depends on ARCH_SH73A0
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
>  	select REGULATOR
> 
>  config PINCTRL_PFC_SH7720
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7720
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH7722
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7722
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH7723
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7723
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH7724
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7724
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH7734
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7734
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH7757
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7757
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH7785
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7785
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SH7786
>  	def_bool y
>  	depends on CPU_SUBTYPE_SH7786
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> +	select PINCTRL_SH_PFC_GPIO
> 
>  config PINCTRL_PFC_SHX3
>  	def_bool y
>  	depends on CPU_SUBTYPE_SHX3
> -	depends on GPIOLIB
> -	select PINCTRL_SH_PFC
> -
> +	select PINCTRL_SH_PFC_GPIO
>  endif
> --- 0001/drivers/pinctrl/sh-pfc/Makefile
> +++ work/drivers/pinctrl/sh-pfc/Makefile	2016-02-15 19:56:50.720513000 
+0900
> @@ -1,11 +1,8 @@
>  sh-pfc-objs			= core.o pinctrl.o
> -ifeq ($(CONFIG_GPIO_SH_PFC),y)
> -sh-pfc-objs			+= gpio.o
> -endif
>  obj-$(CONFIG_PINCTRL_SH_PFC)	+= sh-pfc.o
>  obj-$(CONFIG_PINCTRL_PFC_EMEV2)	+= pfc-emev2.o
> -obj-$(CONFIG_PINCTRL_PFC_R8A73A4)	+= pfc-r8a73a4.o
> -obj-$(CONFIG_PINCTRL_PFC_R8A7740)	+= pfc-r8a7740.o
> +obj-$(CONFIG_PINCTRL_PFC_R8A73A4)	+= pfc-r8a73a4.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_R8A7740)	+= pfc-r8a7740.o gpio.o

Instead of duplicating gpio.o for every PFC entry that uses it, how about 
keeping it above and just using CONFIG_PINCTRL_SH_PFC_GPIO in the ifeq ?

>  obj-$(CONFIG_PINCTRL_PFC_R8A7778)	+= pfc-r8a7778.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7779)	+= pfc-r8a7779.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7790)	+= pfc-r8a7790.o
> @@ -13,16 +10,16 @@ obj-$(CONFIG_PINCTRL_PFC_R8A7791)	+= pfc
>  obj-$(CONFIG_PINCTRL_PFC_R8A7793)	+= pfc-r8a7791.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7794)	+= pfc-r8a7794.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7203)	+= pfc-sh7203.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7264)	+= pfc-sh7264.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7269)	+= pfc-sh7269.o
> -obj-$(CONFIG_PINCTRL_PFC_SH73A0)	+= pfc-sh73a0.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7720)	+= pfc-sh7720.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7722)	+= pfc-sh7722.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7723)	+= pfc-sh7723.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7724)	+= pfc-sh7724.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7734)	+= pfc-sh7734.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7757)	+= pfc-sh7757.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7785)	+= pfc-sh7785.o
> -obj-$(CONFIG_PINCTRL_PFC_SH7786)	+= pfc-sh7786.o
> -obj-$(CONFIG_PINCTRL_PFC_SHX3)		+= pfc-shx3.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7203)	+= pfc-sh7203.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7264)	+= pfc-sh7264.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7269)	+= pfc-sh7269.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH73A0)	+= pfc-sh73a0.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7720)	+= pfc-sh7720.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7722)	+= pfc-sh7722.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7723)	+= pfc-sh7723.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7724)	+= pfc-sh7724.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7734)	+= pfc-sh7734.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7757)	+= pfc-sh7757.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7785)	+= pfc-sh7785.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SH7786)	+= pfc-sh7786.o gpio.o
> +obj-$(CONFIG_PINCTRL_PFC_SHX3)		+= pfc-shx3.o gpio.o
> --- 0001/drivers/pinctrl/sh-pfc/core.c
> +++ work/drivers/pinctrl/sh-pfc/core.c	2016-02-15 19:51:47.570513000 +0900
> @@ -558,7 +558,7 @@ static int sh_pfc_probe(struct platform_
>  	if (unlikely(ret != 0))
>  		return ret;
> 
> -#ifdef CONFIG_GPIO_SH_PFC
> +#ifdef CONFIG_PINCTRL_SH_PFC_GPIO
>  	/*
>  	 * Then the GPIO chip
>  	 */
> @@ -584,7 +584,7 @@ static int sh_pfc_remove(struct platform
>  {
>  	struct sh_pfc *pfc = platform_get_drvdata(pdev);
> 
> -#ifdef CONFIG_GPIO_SH_PFC
> +#ifdef CONFIG_PINCTRL_SH_PFC_GPIO
>  	sh_pfc_unregister_gpiochip(pfc);
>  #endif
>  	sh_pfc_unregister_pinctrl(pfc);

-- 
Regards,

Laurent Pinchart

