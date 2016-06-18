From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v5 2/4] gpio: Allow PC/104 devices on X86_64
Date: Fri, 17 Jun 2016 19:36:07 -0700
Message-ID: <20160618023607.GA7390@kroah.com>
References: <cover.1464380034.git.vilhelm.gray@gmail.com>
 <61880bededb77bbc3ea3422e48ce717d2a2ff489.1464380034.git.vilhelm.gray@gmail.com>
 <CACRpkdaOzZ1DvEUKtomBU=GH1kYfjKJjUfM-=45PhdzZA=dPgg@mail.gmail.com>
 <20160531112251.GA5674@sophia>
 <20160531152541.GB13304@kroah.com>
 <057d8c0b-074c-609a-35da-5a01f07b6d31@leemhuis.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <057d8c0b-074c-609a-35da-5a01f07b6d31-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thorsten Leemhuis <regressions-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>
Cc: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 17, 2016 at 12:47:14PM +0200, Thorsten Leemhuis wrote:
> On 31.05.2016 17:25, Greg KH wrote:
> > On Tue, May 31, 2016 at 07:23:06AM -0400, William Breathitt Gray wr=
ote:
> >> On Tue, May 31, 2016 at 10:41:49AM +0200, Linus Walleij wrote:
> >>> On Sat, May 28, 2016 at 12:08 AM, William Breathitt Gray
> >>> <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>>> With the introduction of the ISA_BUS_API Kconfig option, ISA-sty=
le
> >>>> drivers may be built for X86_64 architectures. This patch change=
s the
> >>>> ISA Kconfig option dependency of the PC/104 drivers to ISA_BUS_A=
PI, thus
> >>>> allowing them to build for X86_64 as they are expected to.
> > [=E2=80=A6]
> >> Greg K-H,
> >>
> >> Would you be able to pick up this entire patchset via driver-core;=
 I
> >> figure that tree is the most appropriate to receive any core ISA b=
us
> >> driver changes (unless you see a more fitting path to take).
> > [=E2=80=A6]
> > Yes, I can take this through the driver core tree as that's where t=
he
> > original series came from...
>=20
> Was this series merged or did it fell through the cracks? I currently
> assume the latter, as I can't see it in neither mainline nor linux-ne=
xt
> (but maybe I'm missing something). Just wondering, because I have thi=
s
> issue on my regression list for 4.7.
>=20
> For the whole context see:
> http://thread.gmane.org/gmane.linux.kernel.gpio/17016/
>=20
> Sincerely, your regression tracker for Linux 4.7 (http://bit.ly/28JRm=
Jo)

I don't think this is a regression, I was going to queue these up for
4.8-rc1.  As it is now, 4.7-rc is working just fine in this regards,
right?

Or am I missing something?

thanks,

greg k-h
