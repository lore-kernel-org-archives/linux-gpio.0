From: "Han, Nandor (GE Healthcare)" <nandor.han@ge.com>
Subject: RE: [PATCH] gpio: xra1403: select REGMAP_SPI
Date: Tue, 30 May 2017 11:48:39 +0000
Message-ID: <AM5P101MB0226C24A1E490246EC77B064E6F00@AM5P101MB0226.NAMP101.PROD.OUTLOOK.COM>
References: <20170530111332.3829080-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-00176a03.pphosted.com ([67.231.157.48]:59128 "EHLO
        mx0a-00176a03.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751220AbdE3LtA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 May 2017 07:49:00 -0400
In-Reply-To: <20170530111332.3829080-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: 30 May 2017 14:13
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: Han, Nandor (GE Healthcare) <nandor.han@ge.com>; Arnd Bergmann <arnd@arndb.de>; linux-gpio@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: EXT: [PATCH] gpio: xra1403: select REGMAP_SPI
> 
> Without the regmap code, we get a link error:
> 
> drivers/gpio/built-in.o: In function `xra1403_probe':
> (.text+0x132e0): undefined reference to `__devm_regmap_init_spi'
> 
> Fixes: 5704520d7880 ("gpio: xra1403: Add EXAR XRA1403 SPI GPIO expander driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by:  Nandor Han <nandor.han@ge.com>

> ---
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 66d1f353ca73..238fc231081a 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1241,6 +1241,7 @@ config GPIO_PISOSR
> 
>  config GPIO_XRA1403
>  	tristate "EXAR XRA1403 16-bit GPIO expander"
> +	select REGMAP_SPI
>  	help
>  	  GPIO driver for EXAR XRA1403 16-bit SPI-based GPIO expander.
> 
> --
> 2.9.0

