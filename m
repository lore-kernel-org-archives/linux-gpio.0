From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] USB: ftdi_sio: add GPIO support
Date: Sat, 30 May 2015 21:29:20 +0100
Message-ID: <CACxGe6uskWcBU0MhO=EupU=2VKmDhX01-_LDJ-n91XAnRYiqbw@mail.gmail.com>
References: <1402320115-13171-1-git-send-email-x-linux@infra-silbe.de>
 <CACRpkdbiob-2d4sTmj8bZxo5GVZ0TvF5CT_W94BDsSNiEfB7kQ@mail.gmail.com>
 <20140613183157.GA24644@kroah.com> <CACRpkdYRm1gE5ai05TK17T3bVHKSVEkXeL5Qci8G=Lpt+UYsug@mail.gmail.com>
 <20140707173142.GB8693@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140707173142.GB8693-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Silbe <x-linux-XAdK+dDVA0n/cwiKa4OQEw@public.gmane.org>, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 7, 2014 at 6:31 PM, Greg Kroah-Hartman
<gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Mon, Jul 07, 2014 at 12:44:28PM +0200, Linus Walleij wrote:
>> On Fri, Jun 13, 2014 at 8:31 PM, Greg Kroah-Hartman
>> <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
>> > On Fri, Jun 13, 2014 at 09:25:07AM +0200, Linus Walleij wrote:
>>
>> >> But I also want to bring the device model into question: normally
>> >> when a mother device spawns children across different subsystems
>> >> we model them as MFD devices (drivers/mfd) that instantiate
>> >> children for the different subsystems. So you could spawn a
>> >> serial and a GPIO device from a USB-based hub device there.
>> >>
>> >> I do not know if that is really apropriate in this case. It seems the
>> >> device is first and foremost FTDI.
>> >>
>> >> But it could still spawn a child platform device for the GPIO stuff
>> >> so that this can live as a separate driver under drivers/gpio/gpio-ftdi.c
>> >> or similar.
>> >>
>> >> You could then use something like:
>> >>
>> >> struct platform_device *gdev;
>> >
>> > Ick, no, it's a USB device, do not abuse the platform_device code any
>> > more than it currently is (note, I HATE the platform device code,
>> > someday I'll delete it entirely...  Well, I can dream...)
>>
>> Haha yeah :-)
>>
>> However is the MFD cell approach acceptable?
>
> Yes it is.

Going back to this old conversation... Actually, I disagree. There is
absolutely no need to go the MFD approach for this driver. That just
adds layers of abstraction for no purpose. GPIOLIB is an interface,
and it is completely fine for a driver to hook up to the GPIOLIB
interface at the same time as exposing a serial port. MFD doesn't buy
the driver anything useful here.

g.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
