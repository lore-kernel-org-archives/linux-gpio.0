From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] USB: ftdi_sio: add GPIO support
Date: Fri, 3 Jul 2015 23:13:54 +0100
Message-ID: <CACxGe6v6+v+NA8UmOb0P7ohAUHmQgXtFHJFBammk5SDrrf8jsA@mail.gmail.com>
References: <1402320115-13171-1-git-send-email-x-linux@infra-silbe.de>
 <CACRpkdbiob-2d4sTmj8bZxo5GVZ0TvF5CT_W94BDsSNiEfB7kQ@mail.gmail.com>
 <20140613183157.GA24644@kroah.com> <CACRpkdYRm1gE5ai05TK17T3bVHKSVEkXeL5Qci8G=Lpt+UYsug@mail.gmail.com>
 <20140707173142.GB8693@kroah.com> <CACxGe6uskWcBU0MhO=EupU=2VKmDhX01-_LDJ-n91XAnRYiqbw@mail.gmail.com>
 <CACRpkdbDAWq42pkwTfi98invy0ov=XD8WzfX0dwnjeRXVpQ8Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbDAWq42pkwTfi98invy0ov=XD8WzfX0dwnjeRXVpQ8Ow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sascha Silbe <x-linux-XAdK+dDVA0n/cwiKa4OQEw@public.gmane.org>, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 2, 2015 at 2:18 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sat, May 30, 2015 at 10:29 PM, Grant Likely
> <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> On Mon, Jul 7, 2014 at 6:31 PM, Greg Kroah-Hartman
>> <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
>
>>>> However is the MFD cell approach acceptable?
>>>
>>> Yes it is.
>>
>> Going back to this old conversation... Actually, I disagree. There is
>> absolutely no need to go the MFD approach for this driver. That just
>> adds layers of abstraction for no purpose. GPIOLIB is an interface,
>> and it is completely fine for a driver to hook up to the GPIOLIB
>> interface at the same time as exposing a serial port. MFD doesn't buy
>> the driver anything useful here.
>
> What is buys is centralizing code into the proper drivers/gpio
> folder of the kernel. So more of a maintenance point than a
> mechanics/performance point.
>
> We do have GPIO drivers scattered all over the kernel so one
> more or less wouldn't matter so much...

Yeah, I would say that's a non-reason. When it comes to a single
device, it is far better in my opinion to have the entire driver
located together rather than splitting it up into parts so that each
part lives with it's subsystem. We've got tools for find users of
interfaces, whereas spliting a driver up can make maintenance a lot
more complicated.

g.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
