From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 2/4] gpio: Allow PC/104 devices on X86_64
Date: Fri, 27 May 2016 11:17:24 -0700
Message-ID: <20160527181724.GB19472@roeck-us.net>
References: <cover.1464049539.git.vilhelm.gray@gmail.com>
 <3cafd2a47f785ea9d0c96365b64366289a1b0807.1464049539.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3cafd2a47f785ea9d0c96365b64366289a1b0807.1464049539.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 23, 2016 at 08:30:55PM -0400, William Breathitt Gray wrote:
> With the introduction of the ISA_BUS_API Kconfig option, ISA-style
> drivers may be built for X86_64 architectures. This patch changes the
> ISA Kconfig option dependency of the PC/104 drivers to ISA_BUS_API, thus
> allowing them to build for X86_64 as they are expected to.
> 
> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>  drivers/gpio/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 48da857..dc6da77 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -530,7 +530,7 @@ menu "Port-mapped I/O GPIO drivers"
>  
>  config GPIO_104_DIO_48E
>  	tristate "ACCES 104-DIO-48E GPIO support"
> -	depends on ISA
> +	depends on ISA_BUS_API
>  	select GPIOLIB_IRQCHIP
>  	help
>  	  Enables GPIO support for the ACCES 104-DIO-48E series (104-DIO-48E,
> @@ -540,7 +540,7 @@ config GPIO_104_DIO_48E
>  
>  config GPIO_104_IDIO_16
>  	tristate "ACCES 104-IDIO-16 GPIO support"
> -	depends on ISA
> +	depends on ISA_BUS_API
>  	select GPIOLIB_IRQCHIP
>  	help
>  	  Enables GPIO support for the ACCES 104-IDIO-16 family (104-IDIO-16,
> @@ -551,7 +551,7 @@ config GPIO_104_IDIO_16
>  
>  config GPIO_104_IDI_48
>  	tristate "ACCES 104-IDI-48 GPIO support"
> -	depends on ISA
> +	depends on ISA_BUS_API
>  	select GPIOLIB_IRQCHIP
>  	help
>  	  Enables GPIO support for the ACCES 104-IDI-48 family (104-IDI-48A,
> @@ -627,7 +627,7 @@ config GPIO_TS5500
>  
>  config GPIO_WS16C48
>  	tristate "WinSystems WS16C48 GPIO support"
> -	depends on ISA
> +	depends on ISA_BUS_API
>  	select GPIOLIB_IRQCHIP
>  	help
>  	  Enables GPIO support for the WinSystems WS16C48. The base port
> -- 
> 2.7.3
> 
