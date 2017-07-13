From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCH] gpio: altera-a10sr: constify gpio_chip structure
Date: Thu, 13 Jul 2017 12:41:26 -0500
Message-ID: <b9982b12-1836-8623-c4e0-c0f3c82361b0@linux.intel.com>
References: <20170711221538.GA8001@embeddedgus>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:6718 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751198AbdGMRiN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Jul 2017 13:38:13 -0400
In-Reply-To: <20170711221538.GA8001@embeddedgus>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/11/2017 05:15 PM, Gustavo A. R. Silva wrote:
> This structure is only used to copy into another structure, so declare
> it as const.

<snip>

> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
> ---
>   drivers/gpio/gpio-altera-a10sr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
> index 16a8951..6b11f13 100644
> --- a/drivers/gpio/gpio-altera-a10sr.c
> +++ b/drivers/gpio/gpio-altera-a10sr.c
> @@ -71,7 +71,7 @@ static int altr_a10sr_gpio_direction_output(struct gpio_chip *gc,
>   	return -EINVAL;
>   }
>   
> -static struct gpio_chip altr_a10sr_gc = {
> +static const struct gpio_chip altr_a10sr_gc = {
>   	.label = "altr_a10sr_gpio",
>   	.owner = THIS_MODULE,
>   	.get = altr_a10sr_gpio_get,
> 
Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>
