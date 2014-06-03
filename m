From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH 1/2] gpio: lpc32xx: Make of_device_id array const
Date: Tue, 03 Jun 2014 14:11:49 +0200
Message-ID: <538DBB85.4030201@antcom.de>
References: <002301cf7f24$9beec360$d3cc4a20$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from antcom.de ([46.38.233.243]:35868 "EHLO chuck.antcom.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754104AbaFCMVS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 3 Jun 2014 08:21:18 -0400
In-Reply-To: <002301cf7f24$9beec360$d3cc4a20$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On 06/03/2014 02:09 PM, Jingoo Han wrote:
> Make of_device_id array const, because all OF functions handle
> it as const.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/gpio/gpio-lpc32xx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
> index 225344d..b9b9799 100644
> --- a/drivers/gpio/gpio-lpc32xx.c
> +++ b/drivers/gpio/gpio-lpc32xx.c
> @@ -560,7 +560,7 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
>  }
>  
>  #ifdef CONFIG_OF
> -static struct of_device_id lpc32xx_gpio_of_match[] = {
> +static const struct of_device_id lpc32xx_gpio_of_match[] = {
>  	{ .compatible = "nxp,lpc3220-gpio", },
>  	{ },
>  };
> 

Acked-By: Roland Stigge <stigge@antcom.de>
