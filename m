From: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH] gpio: ep93xx: fix test for end of loop
Date: Thu, 6 Sep 2018 14:50:44 +0100
Message-ID: <21c6b967-f4b5-db68-89b4-a9caa4e76fda@canonical.com>
References: <20180906133348.brzvqt53nzukn7n2@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906133348.brzvqt53nzukn7n2@kili.mountain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 06/09/18 14:33, Dan Carpenter wrote:
> The problem is that if port == ARRAY_SIZE() and "gc == &epg->gc[port]"
> then that should be treated as invalid.
> 
> Fixes: fd935fc421e7 ("gpio: ep93xx: Do not pingpong irq numbers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 68a416fc3141..b0699f57ddf5 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -80,7 +80,7 @@ static int ep93xx_gpio_port(struct gpio_chip *gc)
>  		port++;
>  
>  	/* This should not happen but is there as a last safeguard */
> -	if (gc != &epg->gc[port]) {
> +	if (port == ARRAY_SIZE(epg->gc)) {
>  		pr_crit("can't find the GPIO port\n");
>  		return 0;
>  	}
> 

Good catch! I overlooked that one.
