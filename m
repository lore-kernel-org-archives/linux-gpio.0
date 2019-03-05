From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 3/3] x86: apuv2: select LEDS_CLASS
Date: Tue, 5 Mar 2019 01:03:14 +0100
Message-ID: <24c191e1-f607-1320-2474-3db92383e383@metux.net>
References: <20190304201930.1622839-1-arnd@arndb.de>
 <20190304201930.1622839-3-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304201930.1622839-3-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Linus Walleij <linusw@kernel.org>, Enrico Weigelt <info@metux.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 04.03.19 21:19, Arnd Bergmann wrote:
> LEDS_GPIO can only be selected when LEDS_CLASS is already enabled:
> 
> WARNING: unmet direct dependencies detected for LEDS_GPIO
>   Depends on [m]: NEW_LEDS [=y] && LEDS_CLASS [=m] && (GPIOLIB [=y] || COMPILE_TEST [=y])
>   Selected by [y]:
>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT_KEYBOARD [=y]
> 
> Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4d65d37b0c86..d64529352a9c 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1308,6 +1308,7 @@ config PCENGINES_APU2
>  	depends on INPUT && INPUT_KEYBOARD
>  	select GPIO_AMD_FCH
>  	select KEYBOARD_GPIO_POLLED
> +	select LEDS_CLASS
>  	select LEDS_GPIO
>  	help
>  	  This driver provides support for the front button and LEDs on
> 

ACK. Just was about to post the same :)

Reviewed-by: Enrico Weigelt, metux It consult <info@metux.net>


thx.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
