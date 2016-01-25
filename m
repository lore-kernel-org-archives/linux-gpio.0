From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [REGRESSION] gpio: pxa: change initcall level second attempt
Date: Mon, 25 Jan 2016 15:28:33 +0100
Message-ID: <87oac9ag32.fsf@belgarion.home>
References: <1453598314.3178.12.camel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Marcel Ziswiler <marcel@ziswiler.com> writes:

> Hi Robert
>
> I tried latest=C2=A0next-20160122 on Colibri PXA270 with a previously
> working device tree and got the following DM9000 Ethernet driver issu=
e:
>
> [=C2=A0=C2=A0=C2=A0=C2=A01.062495] dm9000 8000000.ethernet: insuffici=
ent resources
> [=C2=A0=C2=A0=C2=A0=C2=A01.068439] dm9000 8000000.ethernet: not found=
 (-2).
> [=C2=A0=C2=A0=C2=A0=C2=A01.073451] dm9000: probe of 8000000.ethernet =
failed with error -2
>
> Digging deeper I debugged it to a missing interrupt ressource. A
> subsequent git bisect blamed your patch changing the initcall level a=
nd
> indeed just reverting that made it all work again.
>
> I then also noticed the following message upon boot in the failing ca=
se
> which is probably related:
>
> [=C2=A0=C2=A0=C2=A0=C2=A00.175995] irq: no irq domain found for /pxab=
us/gpio@40e00000 !
>
> Have you seen this as well or do you know how exactly that should be
> worked around?
Hi Marcel,

I haven't seen that before on my devicetree boards, I will try this eve=
ning on
top of next-20160125.

Could you activate the debug logs in drivers/of/irq.c please, and send =
me
privately your boot dmesg ? And I'd like to see your board .dts file an=
d your
=2Econfig also, to compare with mine for the mioa701.

I think in your dm9000 case we have this callstack :
 - of_irq_get()
     of_irq_parse_one() =3D> fails, for an unknown reason to me
                        =3D> I would have expected it return 0
                        =3D> the following irq_find_host() would return
                           -EPROBE_DEFER, that's what I'd expect
     irq_create_of_mapping()
       irq_create_fwspec_mapping()
         =3D> error message

What is probable is that gpio-pxa was not probed yet, and this triggers=
 the
error. What I don't understand is why you don't end up with -EPROBE_DEF=
ER,
that's why I'd like to have your logs.

Cheers.

--=20
Robert
