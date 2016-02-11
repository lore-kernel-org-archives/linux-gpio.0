From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Turn Baytrail support to tristate
Date: Thu, 11 Feb 2016 13:23:17 +0200
Message-ID: <20160211112317.GT16826@lahna.fi.intel.com>
References: <20160211120551.4d8224a4@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:49044 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751240AbcBKLXV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 11 Feb 2016 06:23:21 -0500
Content-Disposition: inline
In-Reply-To: <20160211120551.4d8224a4@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@intel.com>

On Thu, Feb 11, 2016 at 12:05:51PM +0100, Jean Delvare wrote:
> The pinctrl-baytrail driver builds just fine as a module so give
> users this option.

IIRC the reason why this is built-in is that there are all kind of ACPI
GPIO magic happening behind the scenes on Baytrail-T based machines
(such as Asus T100) and it does not work without the GPIO driver. Some
of the stuff is done pretty early too.

I'm adding Mathias the original author of the driver if he remembers
the details better.

> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/intel/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-4.5-rc3.orig/drivers/pinctrl/intel/Kconfig	2016-01-11 00:01:32.000000000 +0100
> +++ linux-4.5-rc3/drivers/pinctrl/intel/Kconfig	2016-02-11 10:55:54.817711599 +0100
> @@ -3,7 +3,7 @@
>  #
>  
>  config PINCTRL_BAYTRAIL
> -	bool "Intel Baytrail GPIO pin control"
> +	tristate "Intel Baytrail GPIO pin control"
>  	depends on GPIOLIB && ACPI
>  	select GPIOLIB_IRQCHIP
>  	help
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support
