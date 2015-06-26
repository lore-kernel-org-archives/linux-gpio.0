From: Tien Hock Loh <thloh@altera.com>
Subject: Re: [PATCH 1/2] gpio: altera: use of_mm_gpiochip_remove() to fix
 memory leak
Date: Thu, 25 Jun 2015 20:17:11 -0700
Message-ID: <1435288631.22927.3.camel@ubuntu>
References: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1on0061.outbound.protection.outlook.com ([157.56.110.61]:3904
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751677AbbFZDvn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2015 23:51:43 -0400
In-Reply-To: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

Acked-by: Tien Hock Loh <thloh@altera.com>

On Wed, 2015-06-17 at 20:59 +0900, Masahiro Yamada wrote:
> This driver calls of_mm_gpiochip_add() to add a memory mapped gpio
> chip.  So, of_mm_gpiochip_remove() should be used when removing it.
> 
> The direct call of gpiochip_remove() misses unmapping the register
> and freeing the label.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/gpio/gpio-altera.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
> index 449fb46..c653c83 100644
> --- a/drivers/gpio/gpio-altera.c
> +++ b/drivers/gpio/gpio-altera.c
> @@ -337,7 +337,7 @@ static int altera_gpio_remove(struct platform_device *pdev)
>  {
>  	struct altera_gpio_chip *altera_gc = platform_get_drvdata(pdev);
>  
> -	gpiochip_remove(&altera_gc->mmchip.gc);
> +	of_mm_gpiochip_remove(&altera_gc->mmchip);
>  
>  	return -EIO;
>  }

