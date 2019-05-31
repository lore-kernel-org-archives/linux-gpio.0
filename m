From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH -next] x86: apuv2: Make two symbols static
Date: Fri, 31 May 2019 14:27:28 +0200
Message-ID: <abbb799c-07d1-1c8e-dac0-259678f53a20@metux.net>
References: <20190529143844.23084-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529143844.23084-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, info@metux.net, dvhart@infradead.org, andy@infradead.org, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 29.05.19 16:38, YueHaibing wrote:
> Fix sparse warnings:
> 
> drivers/platform/x86/pcengines-apuv2.c:80:27: warning: symbol 'gpios_led_table' was not declared. Should it be static?
> drivers/platform/x86/pcengines-apuv2.c:113:27: warning: symbol 'gpios_key_table' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/platform/x86/pcengines-apuv2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index c1ca931e1fab..b0d3110ae378 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -77,7 +77,7 @@ static const struct gpio_led_platform_data apu2_leds_pdata = {
>  	.leds		= apu2_leds,
>  };
>  
> -struct gpiod_lookup_table gpios_led_table = {
> +static struct gpiod_lookup_table gpios_led_table = {
>  	.dev_id = "leds-gpio",
>  	.table = {
>  		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_LED1,
> @@ -110,7 +110,7 @@ static const struct gpio_keys_platform_data apu2_keys_pdata = {
>  	.name		= "apu2-keys",
>  };
>  
> -struct gpiod_lookup_table gpios_key_table = {
> +static struct gpiod_lookup_table gpios_key_table = {
>  	.dev_id = "gpio-keys-polled",
>  	.table = {
>  		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_MODESW,
> 

thanks.


Acked-By: Enrico Weigelt, metux IT consult <info@metux.net>


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
