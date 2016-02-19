From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [patch] gpio-pisosr: Unlock on error in pisosr_gpio_refresh()
Date: Fri, 19 Feb 2016 15:57:07 -0600
Message-ID: <56C78FB3.30806@ti.com>
References: <20160219215330.GA18915@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20160219215330.GA18915@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 02/19/2016 03:53 PM, Dan Carpenter wrote:
> We should unlock before returning if spi_read() fails.
>
> Fixes: df6df93c8a73 ('gpio: Add driver for SPI serializers')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
> index 58ea08df..f9f1074 100644
> --- a/drivers/gpio/gpio-pisosr.c
> +++ b/drivers/gpio/gpio-pisosr.c
> @@ -53,12 +53,10 @@ static int pisosr_gpio_refresh(struct pisosr_gpio *gpio)
>   	}
>
>   	ret = spi_read(gpio->spi, gpio->buffer, gpio->buffer_size);
> -	if (ret)
> -		return ret;
>
>   	mutex_unlock(&gpio->lock);
>
> -	return 0;
> +	return ret;
>   }
>
>   static int pisosr_gpio_get_direction(struct gpio_chip *chip,
>

This must get flagged by some tool, looks like [0] beat you to it.

Thanks though,
Andrew

[0]http://www.spinics.net/lists/kernel/msg2191913.html
