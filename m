From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [REGRESSION] gpio: pxa: change initcall level second attempt
Date: Wed, 27 Jan 2016 01:05:24 +0100
Message-ID: <1453853124.25762.5.camel@ziswiler.com>
References: <1453598314.3178.12.camel@ziswiler.com>
	 <87oac9ag32.fsf@belgarion.home> <87y4bc845m.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.perfora.net ([74.208.4.197]:49322 "EHLO mout.perfora.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751103AbcA0AFd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2016 19:05:33 -0500
In-Reply-To: <87y4bc845m.fsf@belgarion.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2016-01-26 at 21:41 +0100, Robert Jarzmik wrote:
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
>=20
> > > Have you seen this as well or do you know how exactly that should
> > > be
> > > worked around?
> > Hi Marcel,
> >=20
> > I haven't seen that before on my devicetree boards, I will try this
> > evening on
> > top of next-20160125.
> >=20
> > Could you activate the debug logs in drivers/of/irq.c please, and
> > send me
> > privately your boot dmesg ? And I'd like to see your board .dts
> > file and your
> > .config also, to compare with mine for the mioa701.
> >=20
> > I think in your dm9000 case we have this callstack :
> > =C2=A0- of_irq_get()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_irq_parse_one() =3D> fails, for an=
 unknown reason to me
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=3D> I would have expected it return 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=3D> the following irq_find_host() would
> > return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0-EPROBE_DEFER, that's what I'd expect
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0irq_create_of_mapping()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0irq_create_fwspec_mapping=
()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D> error me=
ssage
> >=20
> > What is probable is that gpio-pxa was not probed yet, and this
> > triggers the
> > error. What I don't understand is why you don't end up with
> > -EPROBE_DEFER,
> > that's why I'd like to have your logs.
>=20
> BTW, would you try also with the patch at the end of this mail
> applied ? Just to
> verify a wild guess.

Thanks, but unfortunately that did not change anything on the issue.

> Cheers.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
