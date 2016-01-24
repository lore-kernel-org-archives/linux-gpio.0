From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [REGRESSION] gpio: pxa: change initcall level second attempt
Date: Sun, 24 Jan 2016 02:18:34 +0100
Message-ID: <1453598314.3178.12.camel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Robert

I tried latest=C2=A0next-20160122 on Colibri PXA270 with a previously
working device tree and got the following DM9000 Ethernet driver issue:

[=C2=A0=C2=A0=C2=A0=C2=A01.062495] dm9000 8000000.ethernet: insufficien=
t resources
[=C2=A0=C2=A0=C2=A0=C2=A01.068439] dm9000 8000000.ethernet: not found (=
-2).
[=C2=A0=C2=A0=C2=A0=C2=A01.073451] dm9000: probe of 8000000.ethernet fa=
iled with error -2

Digging deeper I debugged it to a missing interrupt ressource. A
subsequent git bisect blamed your patch changing the initcall level and
indeed just reverting that made it all work again.

I then also noticed the following message upon boot in the failing case
which is probably related:

[=C2=A0=C2=A0=C2=A0=C2=A00.175995] irq: no irq domain found for /pxabus=
/gpio@40e00000 !

Have you seen this as well or do you know how exactly that should be
worked around?

Cheers

Marcel
