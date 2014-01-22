From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH] gpio: mcp23s08: depend on OF_GPIO
Date: Wed, 22 Jan 2014 16:05:07 +0100
Message-ID: <4701386.ZaUECGUEut@lem-wkst-02>
References: <1390205344-15194-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from [85.220.129.33] ([85.220.129.33]:39114 "EHLO smtp2.goneo.de"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1754455AbaAVPFe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 22 Jan 2014 10:05:34 -0500
In-Reply-To: <1390205344-15194-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

Hi Linus,

I saw some trouble happening as Linus Torvalds pulled my interrupt commit in. 
Sorry for causing this mess.
You tried to fix my mistake with this patch. After I read Torvalds mail, I 
realized that mcp23s08 driver now depends on OF_GPIO. I wonder if your patch 
was the best way to fix this. I think a better way would be to not explicitly 
depend on OF_GPIO rather than disabling interrupt functionality if OF_GPIO is 
not selected. What I am a bit concerned about is, that we locked out non-OF 
users from being able to use this driver from now on.
I seems since Linus Torvalds now pulled our patches and fixed them up, it is a 
bit too late, but should we do another patch third patch, that reenables the 
non-OF usage of the driver ? What do you think ?

Regards,
Lars

On Wednesday 22 January 2014 09:09:04, Linus Walleij wrote:
> The MCP drivers fails to compile on trial builds due to missing
> Kconfig dependency on OF_GPIO. Fix it.
> 
> Cc: Lars Poeschel <poeschel@lemonage.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 2d49784109b5..d5bd9eece408 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -717,7 +717,7 @@ config GPIO_MAX7301
> 
>  config GPIO_MCP23S08
>  	tristate "Microchip MCP23xxx I/O expander"
> -	depends on (SPI_MASTER && !I2C) || I2C
> +	depends on (SPI_MASTER && !I2C) || I2C && OF_GPIO
>  	help
>  	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
>  	  I/O expanders.

