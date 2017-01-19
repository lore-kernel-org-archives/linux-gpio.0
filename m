From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: libgpiod v0.1: C library and command-line tools for controlling GPIOs
Date: Thu, 19 Jan 2017 11:10:16 +0100
Message-ID: <CAMpxmJUFW6Sy=xd_qLPiwTk5CwQMWp-N1k6xxDwoZaz6qYeMcA@mail.gmail.com>
References: <CAMpxmJUHfo7FRzzx7MxdADyVMYZiSLEPCtCSDLkq540M1fZTkg@mail.gmail.com>
 <CACRpkdbq5aFZZfNN1UxjrxTzsHQBdkLcz9LCx3BSp-JoirXR6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbq5aFZZfNN1UxjrxTzsHQBdkLcz9LCx3BSp-JoirXR6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-gpio <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

2017-01-19 10:34 GMT+01:00 Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On Wed, Jan 18, 2017 at 4:48 PM, Bartosz Golaszewski
> <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>
>> I'd like to announce the first release of libgpiod. The project
>> consists of a C library and a set of command-line tools for
>> controlling GPIOs over the new character device interface.
>
> Nice!
>
> Have you thought about adding bindings for higher order
> languages etc that I think can make GPIO programming a bliss?
>

I have thought about soooo many things I could do, but the problem is
- as usual - time I can devote to this project. ;) Anyways: I'll
welcome any contribution, so if you'll happen to have some time to do
it, I'll surely include it.

> I created some for Control Groups at a point, using ctypes:
> https://sourceforge.net/p/cgfreak/code/ci/master/tree/pylibcgroup.py
>

FYI check out libsigrok - it generates python bindings from C++ using
swig - maybe this would be a good approach to decrease the amount of
work needed.

> The point is not that Python would be so great (some think
> so) more that this kind of stuff makes GPIOs so much more
> accessible, apart from good old C.
>

Yep, certainly agree. This is definitely a feature I'd like to have in
the future.

Best regards,
Bartosz Golaszewski
