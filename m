From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH -next] gpio: of: add missing of_node_put() in
 of_gpiochip_scan_gpios()
Date: Sat, 29 Oct 2016 21:14:54 +0300
Message-ID: <effbe05c-264e-5176-e37f-c27bafd1d7cf@mentor.com>
References: <1477757632-26746-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:43143 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752883AbcJ2SPC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Oct 2016 14:15:02 -0400
In-Reply-To: <1477757632-26746-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

On 10/29/2016 07:13 PM, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> When terminating for_each_available_child_of_node() iteration
> with break or return, of_node_put() should be used to prevent
> stale device node references from being left behind.
>
> This is detected by Coccinelle semantic patch.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

> ---
>  drivers/gpio/gpiolib-of.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index b46be18..92b185f 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -251,8 +251,10 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
>  			continue;
>
>  		ret = gpiod_hog(desc, name, lflags, dflags);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			of_node_put(np);
>  			return ret;
> +		}
>  	}
>
>  	return 0;
>
--
With best wishes,
Vladimir
