From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 04/10] iio: stx104: Change STX104 dependency to ISA_BUS
Date: Thu, 7 Apr 2016 17:45:03 -0700
Message-ID: <20160408004503.GB10211@roeck-us.net>
References: <cover.1460040201.git.vilhelm.gray@gmail.com>
 <783be62acf68b35f3fe4785a2cedfe017624688b.1460040201.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <783be62acf68b35f3fe4785a2cedfe017624688b.1460040201.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 07, 2016 at 10:47:25AM -0400, William Breathitt Gray wrote:
> The Apex Embedded Systems STX104 may be used on 64-bit X86 systems. This
> patch allows the Apex Embedded Systems STX104 DAC driver to be compiled
> for both 32-bit and 64-bit X86 systems.
> 
> Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/iio/dac/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index a995139..df4b55d 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -210,7 +210,7 @@ config MCP4922
>  
>  config STX104
>  	tristate "Apex Embedded Systems STX104 DAC driver"
> -	depends on ISA
> +	depends on X86 && ISA_BUS

This means for this and other similar drivers that the driver is no longer
supported on architectures which support ISA but not the newly introduced
ISA_BUS. Affected architectures are alpha, arm, m32r, m68k, mips, powerpc,
and parisc.

A typical example is SCSI_AHA1542, which is no longer supported on those
architectures. It builds, but isa_register_driver() will be a dummy and fail.
Actually, this is true for _all_ drivers calling isa_register_driver().

I hope this is understood and doesn't cause any problems.

Thanks,
Guenter

>  	help
>  	  Say yes here to build support for the 2-channel DAC on the Apex
>  	  Embedded Systems STX104 integrated analog PC/104 card. The base port
> -- 
> 2.7.3
> 
