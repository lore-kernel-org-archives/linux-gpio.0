From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH] gpio: pisosr: Use devm_gpiod_get_optional for
 gpio->load_gpio
Date: Mon, 22 Feb 2016 09:43:45 -0600
Message-ID: <56CB2CB1.3080201@ti.com>
References: <1456143411.23008.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:34453 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752844AbcBVPns (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2016 10:43:48 -0500
In-Reply-To: <1456143411.23008.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On 02/22/2016 06:16 AM, Axel Lin wrote:
> gpio->load_gpio is optional, so use devm_gpiod_get_optional instead.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>   drivers/gpio/gpio-pisosr.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
> index f9f1074..8b8bf8f 100644
> --- a/drivers/gpio/gpio-pisosr.c
> +++ b/drivers/gpio/gpio-pisosr.c
> @@ -125,15 +125,12 @@ static int pisosr_gpio_probe(struct spi_device *spi)
>   	if (!gpio->buffer)
>   		return -ENOMEM;
>
> -	gpio->load_gpio = devm_gpiod_get(dev, "load", GPIOD_OUT_LOW);
> +	gpio->load_gpio = devm_gpiod_get_optional(dev, "load", GPIOD_OUT_LOW);
>   	if (IS_ERR(gpio->load_gpio)) {
>   		ret = PTR_ERR(gpio->load_gpio);
> -		if (ret != -ENOENT && ret != -ENOSYS) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "Unable to allocate load GPIO\n");
> -			return ret;
> -		}
> -		gpio->load_gpio = NULL;
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Unable to allocate load GPIO\n");
> +		return ret;
>   	}
>
>   	mutex_init(&gpio->lock);
>

How does this work when the GPIO subsystem is disabled? It looks like
we get will get -ENOSYS and fail probe. The issue is then that
devm_gpiod_get_optional returns an error when it cant get the optional
GPIO in that case, when it should probably just return NULL, I would
think all the optional functions should.
