From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/4] iio: stx104: Allow build for X86_64
Date: Fri, 27 May 2016 15:54:00 -0400
Message-ID: <20160527195400.GA12494@sophia>
References: <cover.1464049539.git.vilhelm.gray@gmail.com>
 <e2165535dff3cfc30e82b5e3b4b4ccf9860ebf9f.1464049539.git.vilhelm.gray@gmail.com>
 <20160527182057.GC19472@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160527182057.GC19472-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 27, 2016 at 11:20:57AM -0700, Guenter Roeck wrote:
>On Mon, May 23, 2016 at 08:31:07PM -0400, William Breathitt Gray wrote:
>> With the introduction of the ISA_BUS_API Kconfig option, ISA-style
>> drivers may be built for X86_64 architectures. This patch changes the
>> ISA Kconfig option dependency of the Apex Embedded Systems STX104 DAC
>> driver to ISA_BUS_API, thus allowing it to build for X86_64 as it is
>> expected to.
>> 
>> Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
>> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
>> Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
>> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/iio/dac/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
>> index e63b957..315442f 100644
>> --- a/drivers/iio/dac/Kconfig
>> +++ b/drivers/iio/dac/Kconfig
>> @@ -247,7 +247,7 @@ config MCP4922
>>  
>>  config STX104
>>  	tristate "Apex Embedded Systems STX104 DAC driver"
>> -	depends on X86 && ISA
>> +	depends on ISA_BUS_API
>
>Assuming the dropped dependency on X86 is intentional:
>
>Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Thanks for the review Guenter: losing the X86 dependency was not
intentional; it looks like I forgot to adjust this when I made
ISA_BUS_API available to all architectures. I'll submit version 5 with
the explicit X86 dependency back in place for CONFIG_STX104 and
CONFIG_EBC_C384_WDT.

William Breathitt Gray
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
