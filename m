From: Alban <albeu@free.fr>
Subject: Re: [PATCH] gpio: ath79: Check valid gpio count for both DT and
 non-DT cases
Date: Sat, 20 Feb 2016 19:11:41 +0100
Message-ID: <20160220191141.395a64c5@tock>
References: <1455932887.31674.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:34622 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759151AbcBTSLw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 20 Feb 2016 13:11:52 -0500
In-Reply-To: <1455932887.31674.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Aban Bedel <albeu@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Sat, 20 Feb 2016 09:48:07 +0800
Axel Lin <axel.lin@ingics.com> wrote:

> Move the code checking valid gpio count to cover both DT and non-DT cases.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Aban Bedel <albeu@free.fr>

> ---
>  drivers/gpio/gpio-ath79.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
> index 018ea9d..c4f4cdd 100644
> --- a/drivers/gpio/gpio-ath79.c
> +++ b/drivers/gpio/gpio-ath79.c
> @@ -240,10 +240,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev, "ngpios property is not valid\n");
>  			return err;
>  		}
> -		if (ath79_gpio_count >= 32) {
> -			dev_err(&pdev->dev, "ngpios must be less than 32\n");
> -			return -EINVAL;
> -		}
>  		oe_inverted = of_device_is_compatible(np, "qca,ar9340-gpio");
>  	} else if (pdata) {
>  		ath79_gpio_count = pdata->ngpios;
> @@ -253,6 +249,11 @@ static int ath79_gpio_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	if (ath79_gpio_count >= 32) {
> +		dev_err(&pdev->dev, "ngpios must be less than 32\n");
> +		return -EINVAL;
> +	}
> +
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	ctrl->base = devm_ioremap_nocache(
>  		&pdev->dev, res->start, resource_size(res));

