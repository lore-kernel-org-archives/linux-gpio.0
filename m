From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: dwapb: enable for Quark
Date: Mon, 09 Mar 2015 17:28:33 +0200
Message-ID: <1425914913.14897.235.camel@linux.intel.com>
References: <1425575153-19453-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:22909 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752787AbbCIP2h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 11:28:37 -0400
In-Reply-To: <1425575153-19453-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Raymond Tan <raymond.tan@intel.com>, "Ong, Boon Leong" <boon.leong.ong@intel.com>

On Thu, 2015-03-05 at 19:05 +0200, Andy Shevchenko wrote:
> The Intel Quark SoC contains the DW GPIO on board. While fixing the build error
> the commit 1972c97db5b0 (gpio: dwapb: fix compile errors) disables the
> possibility to build the driver on X86, i.e. Intel Quark.
> 
> The patch reenables it for Intel Quark as well.
> 
> Since we have Intel Quark SoC introduced in 4.0-rc1 I would like to make this
> fix available there as well, though the actual MFD driver [1] is not yet
> applied.

An update: the patch was applied by Lee. So, it would be nice to have
this one applied at least for future 4.1-rc1 if no objections.

> 
> [1] https://lkml.org/lkml/2015/2/1/217
> 
> Fixes: 1972c97db5b0 (gpio: dwapb: fix compile errors)
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Changelog v2:
> - fix typo of parens location
>  drivers/gpio/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c1e2ca3..6ba5464 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -148,8 +148,7 @@ config GPIO_GENERIC_PLATFORM
>  
>  config GPIO_DWAPB
>  	tristate "Synopsys DesignWare APB GPIO driver"
> -	depends on ARM
> -	depends on OF_GPIO
> +	depends on (ARM && OF_GPIO) || X86_INTEL_QUARK
>  	select GPIO_GENERIC
>  	select GENERIC_IRQ_CHIP
>  	help


-- 
Andy Shevchenko <andriy.shevchenko@intel.com>
Intel Finland Oy

