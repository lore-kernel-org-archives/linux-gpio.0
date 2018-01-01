From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] iio: Change ISA_BUS_API dependency to selection
Date: Mon, 1 Jan 2018 09:55:25 +0000
Message-ID: <20180101095525.0de5021a@archlinux>
References: <cover.1514578085.git.vilhelm.gray@gmail.com>
        <84517171cdb142f3f04b45de6ef8daf13442a866.1514578085.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <84517171cdb142f3f04b45de6ef8daf13442a866.1514578085.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, 29 Dec 2017 15:13:19 -0500
William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> The ISA_BUS_API Kconfig option enables the compilation of the ISA bus
> driver. The ISA bus driver does not perform any hardware interaction,
> and is instead just a thin layer of software abstraction to eliminate
> boilerplate code common to ISA-style device drivers. Since ISA_BUS_API
> has no dependencies and does not jeopardize the integrity of the system
> when enabled, drivers should select it when the ISA bus driver
> functionality is needed.
> 
> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
> Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iio/adc/Kconfig     | 3 ++-
>  drivers/iio/counter/Kconfig | 3 ++-
>  drivers/iio/dac/Kconfig     | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index ef86296b8b0d..7c00e5858693 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -658,7 +658,8 @@ config STM32_ADC
>  
>  config STX104
>  	tristate "Apex Embedded Systems STX104 driver"
> -	depends on PC104 && X86 && ISA_BUS_API
> +	depends on PC104 && X86
> +	select ISA_BUS_API
>  	select GPIOLIB
>  	help
>  	  Say yes here to build support for the Apex Embedded Systems STX104
> diff --git a/drivers/iio/counter/Kconfig b/drivers/iio/counter/Kconfig
> index 474e1ac4e7c0..bf1e559ad7cd 100644
> --- a/drivers/iio/counter/Kconfig
> +++ b/drivers/iio/counter/Kconfig
> @@ -7,7 +7,8 @@ menu "Counters"
>  
>  config 104_QUAD_8
>  	tristate "ACCES 104-QUAD-8 driver"
> -	depends on PC104 && X86 && ISA_BUS_API
> +	depends on PC104 && X86
> +	select ISA_BUS_API
>  	help
>  	  Say yes here to build support for the ACCES 104-QUAD-8 quadrature
>  	  encoder counter/interface device family (104-QUAD-8, 104-QUAD-4).
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 965d5c0d2468..76db0768e454 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -195,7 +195,8 @@ config AD7303
>  
>  config CIO_DAC
>  	tristate "Measurement Computing CIO-DAC IIO driver"
> -	depends on X86 && ISA_BUS_API
> +	depends on X86 && (ISA_BUS || PC104)
> +	select ISA_BUS_API
>  	help
>  	  Say yes here to build support for the Measurement Computing CIO-DAC
>  	  analog output device family (CIO-DAC16, CIO-DAC08, PC104-DAC06). The

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
