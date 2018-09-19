From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 4/5] gpio: davinci: Remove unneeded GPIO macro
Date: Wed, 19 Sep 2018 10:32:31 +0530
Message-ID: <699a7da7-1a4f-427a-b89e-aa082f77102a@ti.com>
References: <20180831191326.25106-1-afd@ti.com>
 <20180831191326.25106-4-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831191326.25106-4-afd@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org



On Saturday 01 September 2018 12:43 AM, Andrew F. Davis wrote:
> This macro does nothing and has only one user, remove it.

Tested for gpio interrupts on k2g and da850-lcdk

Tested-by: Keerthy <j-keerthy@ti.com>
Acked-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  arch/arm/mach-davinci/board-neuros-osd2.c  | 8 ++++----
>  include/linux/platform_data/gpio-davinci.h | 5 -----
>  2 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-davinci/board-neuros-osd2.c b/arch/arm/mach-davinci/board-neuros-osd2.c
> index 353f9e5a1454..efdaa27241c5 100644
> --- a/arch/arm/mach-davinci/board-neuros-osd2.c
> +++ b/arch/arm/mach-davinci/board-neuros-osd2.c
> @@ -130,10 +130,10 @@ static struct platform_device davinci_fb_device = {
>  };
>  
>  static const struct gpio_led ntosd2_leds[] = {
> -	{ .name = "led1_green", .gpio = GPIO(10), },
> -	{ .name = "led1_red",   .gpio = GPIO(11), },
> -	{ .name = "led2_green", .gpio = GPIO(12), },
> -	{ .name = "led2_red",   .gpio = GPIO(13), },
> +	{ .name = "led1_green", .gpio = 10, },
> +	{ .name = "led1_red",   .gpio = 11, },
> +	{ .name = "led2_green", .gpio = 12, },
> +	{ .name = "led2_red",   .gpio = 13, },
>  };
>  
>  static struct gpio_led_platform_data ntosd2_leds_data = {
> diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
> index b8e4957e7568..47695b342883 100644
> --- a/include/linux/platform_data/gpio-davinci.h
> +++ b/include/linux/platform_data/gpio-davinci.h
> @@ -45,11 +45,6 @@ struct davinci_gpio_controller {
>  	int			irqs[MAX_INT_PER_BANK];
>  };
>  
> -/*
> - * basic gpio routines
> - */
> -#define	GPIO(X)		(X)	/* 0 <= X <= (DAVINCI_N_GPIO - 1) */
> -
>  /* Convert GPIO signal to GPIO pin number */
>  #define GPIO_TO_PIN(bank, gpio)	(16 * (bank) + (gpio))
>  
> 
