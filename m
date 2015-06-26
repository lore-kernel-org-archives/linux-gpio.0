From: Tien Hock Loh <thloh@altera.com>
Subject: Re: [PATCH 2/2] gpio: altera: fix return value of
 altera_gpio_remove()
Date: Thu, 25 Jun 2015 20:16:31 -0700
Message-ID: <1435288591.22927.2.camel@ubuntu>
References: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
	 <1434542383-21314-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bon0097.outbound.protection.outlook.com ([157.56.111.97]:31040
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751877AbbFZDQp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2015 23:16:45 -0400
In-Reply-To: <1434542383-21314-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: thloh.linux@gmail.com, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

Acked-by: Tien Hock Loh <thloh@altera.com>

On Wed, 2015-06-17 at 20:59 +0900, Masahiro Yamada wrote:
> The remove callback never succeeds, which seems odd.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> I wonder why nobody has pointed this out before me.
> I am suspecting -EIO might be intentional.
> I hope some Altera guys will give me comments.
> 
> 
>  drivers/gpio/gpio-altera.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
> index c653c83..5861550 100644
> --- a/drivers/gpio/gpio-altera.c
> +++ b/drivers/gpio/gpio-altera.c
> @@ -339,7 +339,7 @@ static int altera_gpio_remove(struct platform_device *pdev)
>  
>  	of_mm_gpiochip_remove(&altera_gc->mmchip);
>  
> -	return -EIO;
> +	return 0;
>  }
>  
>  static const struct of_device_id altera_gpio_of_match[] = {

