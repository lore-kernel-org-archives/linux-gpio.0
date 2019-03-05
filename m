From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drivers: x86: pcengines-apuv2: fix dependencies
Date: Mon, 4 Mar 2019 16:34:09 -0800
Message-ID: <14e2b3bd-b3cd-54f2-e8c6-73c81e89e456@infradead.org>
References: <1551745499-6687-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551745499-6687-1-git-send-email-info@metux.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, andy.shevchenko@gmail.com, arnd@arndb.de
List-Id: linux-gpio@vger.kernel.org

On 3/4/19 4:24 PM, Enrico Weigelt, metux IT consult wrote:
> pcengines-apuv2 board driver needs to explicitly select LEDS_CLASS,
> INPUT, INPUT_KEYBOARD, so these are automatically defined correctly
> (eg. LEDS_CLASS=y if PCENGINES_APU2=y)
> 
> Cc: linux-gpio@vger.kernel.org
> Cc: linus.walleij@linaro.org
> Cc: andy.shevchenko@gmail.com
> Cc: arnd@arndb.de
> Cc: rdunlap@infradead.org
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: arnd@arndb.de
> Reported-by: rdunlap@infradead.org
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/platform/x86/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 851ea92..7d53380 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1307,7 +1307,10 @@ config PCENGINES_APU2
>  	tristate "PC Engines APUv2/3 front button and LEDs driver"
>  	select GPIO_AMD_FCH
>  	select KEYBOARD_GPIO_POLLED
> +	select LEDS_CLASS
>  	select LEDS_GPIO
> +	select INPUT

Nak.  We don't select entire subsystems.  You should do:

	depends on INPUT
	select INPUT_KEYBOARD

> +	select INPUT_KEYBOARD


>  	help
>  	  This driver provides support for the front button and LEDs on
>  	  PC Engines APUv2/APUv3 board.
> 


-- 
~Randy
