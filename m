From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH]  gpio: Add run-time dependencies to R-Car driver
Date: Mon, 26 May 2014 09:54:48 +0900
Message-ID: <20140526005448.GE31096@verge.net.au>
References: <20140523134214.0f29c9e0@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36519 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751325AbaEZAyy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 May 2014 20:54:54 -0400
Content-Disposition: inline
In-Reply-To: <20140523134214.0f29c9e0@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-gpio@vger.kernel.org, Magnus Damm <damm@opensource.se>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, May 23, 2014 at 01:42:14PM +0200, Jean Delvare wrote:
> The Renesas R-Car GPIO driver is only useful on shmobile unless build
> testing.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Magnus Damm <damm@opensource.se>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> ---
> Simon, is it correct? I couldn't remove the dependency on ARM because
> the driver uses set_irq_flags which is arm-specific.

Assuming that set_irq_flags is arm-specific then yes, I think this is
correct.

Acked-by: Simon Horman <horms+renesas@verge.net.au>

> 
>  drivers/gpio/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-3.15-rc6.orig/drivers/gpio/Kconfig	2014-05-23 12:00:02.262995319 +0200
> +++ linux-3.15-rc6/drivers/gpio/Kconfig	2014-05-23 13:29:01.773035079 +0200
> @@ -259,7 +259,7 @@ config GPIO_PXA
>  
>  config GPIO_RCAR
>  	tristate "Renesas R-Car GPIO"
> -	depends on ARM
> +	depends on ARM && (ARCH_SHMOBILE || COMPILE_TEST)
>  	help
>  	  Say yes here to support GPIO on Renesas R-Car SoCs.
>  
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support
> 
