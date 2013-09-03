From: Daniel Santos <danielfsantos-fOdFMYwuEsI@public.gmane.org>
Subject: Re: RESEND: Generating interrupts from a USB device driver?
Date: Mon, 02 Sep 2013 20:40:47 -0500
Message-ID: <52253E1F.6000101@att.net>
References: <52251562.5000208@att.net> <20130902230738.GA22494@kroah.com>
Reply-To: Daniel Santos <daniel.santos-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130902230738.GA22494-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-spi <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On 09/02/2013 06:07 PM, Greg KH wrote:
> On Mon, Sep 02, 2013 at 05:46:58PM -0500, Daniel Santos wrote:
>> Hello guys.  I didn't get a response the last time so hopefully with
>> 3.11 out I'll get one this time.
>>
>> I need to be able to generate interrupts from a USB device driver while
>> servicing the complete() function of an interrupt URB.
> No you don't :)
>
>> While I realize that this may seem strange, the purpose is for a USB
>> to SPI/GPIO bridge chip (the MCP2210). When something happens on the
>> remote device where a chip is expecting it's interrupt out pin to
>> trigger an interrupt on some local (to the board) microcontroller, the
>> MCP2210 instead receives that signal and communicates it to the host
>> the next time it's queried. This is the interrupt that I need to, in
>> effect propagate locally. Since my spi_master and gpio_chip are all
>> functioning now, this is the last step to get one of my spi protocol
>> drivers working correctly.
> Just pass the data up the spi stack in your interrupt endpoint handler.
> No need to try to create a "real" interrupt.  There are other USB SPI
> drivers that should give you the idea of how to do it.
Thanks for your response! I haven't been able to find these drivers, can 
you please point me to one? I guess I don't know the "spi stack" well 
enough to know how to propagate that notification up to the driver for 
the spi device (let alone that it was called a "stack" :)

Thanks!!
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
