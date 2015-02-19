From: folkert <folkert@vanheusden.com>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Thu, 19 Feb 2015 09:53:03 +0100
Message-ID: <20150219085303.GI21469@belle.intranet.vanheusden.com>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
 <20150130234552.GA20407@sysresccd>
 <20150131083300.GZ21469@belle.intranet.vanheusden.com>
 <CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
 <20150203090325.GA29693@deathray>
 <CACRpkdbGo1+v_aVJP7+pbbw2HnRdqrBwwPv=0fC87Ze5JveAnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from keetweej.vanheusden.com ([80.101.105.103]:37976 "EHLO
	keetweej.vanheusden.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752335AbbBSIxG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Feb 2015 03:53:06 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdbGo1+v_aVJP7+pbbw2HnRdqrBwwPv=0fC87Ze5JveAnw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Welling <mwelling@ieee.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

> >> >> Try using lseek before reading the data after the poll.
> >> >>
> >> >> EX.
> >> >>       if (fdset[0].revents & POLLPRI) {
> >> >>               lseek(fdset[0].fd, 0, SEEK_SET);
> >> >>               len =3D read(fdset[0].fd, buf, MAX_BUF);
> >> >>               .
> >> >>               .
> >> >>       }
> >> >>
> >> >> See if this helps.
> >> >
> >> > Yes, that fixed it!
> >>
> >> Still, shouldn't we consider this as a regression, especially if n=
ot
> >> using lseek worked for kernel 3.12 and before?
> >
> > Perhaps this is a side effect of the sysfs to kernfs change over to=
 happened in
> > 3.14.
> >
> > Looking at 'kernfs_fop_poll' my guess is that 'kernfs_get_active' i=
s returning NULL
> > immediately returning from the poll command and causing described b=
ehavior.
> >
> > http://lxr.free-electrons.com/source/fs/kernfs/file.c#L763
>=20
> I think this looks plausible.
> Folkert what do you say about this?

That looks indeed to be the current situation. It worked different
before though.

I also think that this interface is cumbersome. I did not measure it(!)
but I think adding this open/seek + read construction may add all kinds
of overhead. Especially since my use-case requires the lowest latency
possible. Not to forget that conversion of the measured value to ascii
and back.


=46olkert van Heusden

--=20
Multitail es una herramienta flexible que permite visualizar los "log
file" y seguir la ejecuci=F3n de comandos. Permite filtrar, a=F1adir
colores, combinar archivos, la visualizaci=F3n de diferencias (diff-
view), etc.  http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
