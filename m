From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: "Virtual" Interrupts -- Need help please
Date: Mon, 09 Sep 2013 16:21:43 +0200
Message-ID: <522DD977.2040504@ahsoftware.de>
References: <522BC27A.5080303@att.net> <522BCA33.6000701@roeck-us.net> <522D0D37.3050500@att.net> <522D17EC.3050908@roeck-us.net> <20130909110257.GU29403@sirena.org.uk> <522DAE69.4050608@ahsoftware.de> <20130909134558.GY29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130909134558.GY29403-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Daniel Santos <daniel.santos-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>, linux-gpio <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-spi <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Am 09.09.2013 15:45, schrieb Mark Brown:
> On Mon, Sep 09, 2013 at 01:18:01PM +0200, Alexander Holler wrote:
>> Am 09.09.2013 13:02, schrieb Mark Brown:
> 
>>> makes your mail very hard to read.  It looks like your mailer has also
>>> reflowed Daniel's mail.
> 
>> That's just wrong. Mail readers should wrap lines, not senders. And
>> readers can do this since some decades.
> 
> There's a specific way for senders to request that if it's desired, set
> format=flowed in the MIME type to tell the recipient that the formatting
> isn't important.
> 
>> The reason is obvious: No sender knows the line width the receiver
>> can display. So, for example, if the sender hard breaks lines every
>> 80 chars, a reader with a device which just displays 60 characters
>> at max. will see every second line with at most 20 characters. I
>> assume you can guess how such does look like. Furthermore there are
>> still a lot of people which do like to read mails with line length
>> as long their display is possible to show, and hard breaking lines
>> on the receiver side does make such impossible.
> 
>> So the correct behaviour is to not hard break lines on the sender
>> side and leave that to the reader on the receiving side, as only the
>> receiving side knows the line width.
> 
> This doesn't work well with lots of content (like patches) commonly
> handled in technical contexts - the line breaks actually mean something
> and it's hard fo the mail client to figure out what is going on unless
> someone tells it.

I wonder what all the hard line breaks you added to your mail do mean?

Hard line breaks in paragraphs, as you've requested, doesn't mean
anything. They just make eamils extremly ugly, e.g. your one is
displayed here with a whole lot of unused white space because I'm not
using a CGA screen. And people who do read your mail on a phone with
less than 80 or 75 chars will see it as even more ugly.

And imho it just works if hard line breaks are used where they belong
too, the code or to end paragraphs or otherwise where they have a
meaning, but not just always after 75 or 80 chars.

Regards,

Alexander Holler
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
