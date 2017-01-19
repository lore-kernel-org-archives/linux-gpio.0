From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: Re: libgpiod v0.1: C library and command-line tools for controlling GPIOs
Date: Thu, 19 Jan 2017 15:30:13 +0100
Message-ID: <3293536.XfDnNLEWhh@ws-stein>
References: <CAMpxmJUHfo7FRzzx7MxdADyVMYZiSLEPCtCSDLkq540M1fZTkg@mail.gmail.com> <4449310.gRYbpx7f9x@ws-stein> <CAMpxmJUAKOqcBQ=p9Y=wrFk7Ms=dVGCRDWhmiijuUMQ2-MAHug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMpxmJUAKOqcBQ=p9Y=wrFk7Ms=dVGCRDWhmiijuUMQ2-MAHug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-gpio <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Thursday 19 January 2017 15:12:43, Bartosz Golaszewski wrote:
> 2017-01-19 15:05 GMT+01:00 Alexander Stein
> 
> <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>:
> > Hi,
> > 
> > On Wednesday 18 January 2017 16:48:08, Bartosz Golaszewski wrote:
> >> I'd like to announce the first release of libgpiod. The project
> >> consists of a C library and a set of command-line tools for
> >> controlling GPIOs over the new character device interface.
> >> 
> >> The tools support reading & setting values, keeping the lines
> >> exported, finding GPIO lines by name, monitoring events etc.
> >> 
> >> The source code can be found at: https://github.com/brgl/libgpiod
> > 
> > Cool thing. thanks! One bug found:
> > https://github.com/brgl/libgpiod/blob/master/src/tools/gpiomon.c#L31
> > 
> > shortopts is missing 's' so the following occurs:
> >> gpiomon -l -r -s --num-events=1 gpiochip2 1
> >> gpiomon: invalid option -- 's'
> >> gpiomon: try gpiomon --help
> >> 
> >> gpiomon -l -r --silent --num-events=1 gpiochip2 1
> > 
> > works as expected
> 
> Thanks, fixed in git.

Thanks, also for defines of GPIOHANDLE_REQUEST_INPUT and friends you actually 
need kernel headers >=4.8. README.md says >=4.7

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010
