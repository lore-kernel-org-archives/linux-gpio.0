From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] tools/gpio: switch to tools buildsystem
Date: Sun, 19 Jun 2016 16:52:26 +0300
Message-ID: <1466344346.30123.165.camel@linux.intel.com>
References: <1466263488-94457-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <CAAVeFu+81cpK9-kAZhfyhhZc1AkegxaeCQ7omxDoRctSyboyFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:41914 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750861AbcFSNw3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 19 Jun 2016 09:52:29 -0400
In-Reply-To: <CAAVeFu+81cpK9-kAZhfyhhZc1AkegxaeCQ7omxDoRctSyboyFg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Sun, 2016-06-19 at 22:07 +0900, Alexandre Courbot wrote:
> On Sun, Jun 19, 2016 at 12:24 AM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > Current environment is not allowed to easily build the tools.
> > Move to tools buildsystem to allow user build gpio tools using only
> > existing
> > kernel sources. Besides that support O=3D/path/to/build/dir option.
>=20
> Very good idea. I just have a few issues with the current patchset:
>=20
> 1) I think patch 1 and 2 should be merged, otherwise we would have on=
e
> commit where the GPIO tools are not available anymore

No objection!

> 2) When trying to cross-compile the tools, I am hitting the following
> error:
>=20
> =C2=A0 arm-linux-gnueabihf-gcc -Wp,-MD,./.lsgpio.o.d,-MT,lsgpio.o -O2=
 -Wall
> -g -D_GNU_SOURCE -Iinclude -D"BUILD_STR(s)=3D#s"=C2=A0=C2=A0=C2=A0-c =
-o lsgpio.o
> lsgpio.c
> =C2=A0 arm-linux-gnueabihf-gcc -Wp,-MD,./.gpio-utils.o.d,-MT,gpio-uti=
ls.o
> -O2 -Wall -g -D_GNU_SOURCE -Iinclude -D"BUILD_STR(s)=3D#s"=C2=A0=C2=A0=
=C2=A0-c -o
> gpio-utils.o gpio-utils.c
> =C2=A0=C2=A0=C2=A0ld -r -o lsgpio-in.o=C2=A0=C2=A0lsgpio.o gpio-utils=
=2Eo
> lsgpio.o: error adding symbols: File in wrong format
>=20
> Looks like the host linker is invoked instead of the target one.

Can you try to add

LD =3D $(CROSS_COMPILE)ld

into Makefile and re-run?

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
