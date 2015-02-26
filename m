From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] pinctrl: at91: move lock/unlock_as_irq calls into
 request/release resources methods
Date: Thu, 26 Feb 2015 14:12:01 +0100
Message-ID: <20150226141201.670e6e18@bbrezillon>
References: <1423419822-6258-1-git-send-email-boris.brezillon@free-electrons.com>
	<BC36A77B-9986-495E-8F86-C80E9D0F0C63@jcrosoft.com>
	<95765FA2-E9BF-4A66-B46D-2491869B0A14@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:43929 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932078AbbBZNME convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Feb 2015 08:12:04 -0500
In-Reply-To: <95765FA2-E9BF-4A66-B46D-2491869B0A14@jcrosoft.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas FERRE <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>

On Fri, 20 Feb 2015 15:50:36 +0800
Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> wrote:

>=20
> > On Feb 9, 2015, at 10:50 PM, Jean-Christophe PLAGNIOL-VILLARD <plag=
nioj@jcrosoft.com> wrote:
> >=20
> >=20
> >> On Feb 9, 2015, at 2:23 AM, Boris Brezillon <boris.brezillon@free-=
electrons.com> wrote:
> >>=20
> >> The gpiochip_lock_as_irq call can fail and return an error, while =
the
> >> irq_startup is not expected to fail (returns an unsigned int which=
 is not
> >> checked by irq core code).
> >>=20
> >> irq_request/release_resources functions have been created to addre=
ss this
> >> problem.
> >>=20
> >> Move gpiochip_lock/unlock_as_irq calls into
> >> irq_request/release_resources functions to prevent using a gpio as=
 an irq
> >> if the gpiochip_lock_as_irq call failed.
> >>=20
> >> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com=
>
> >> =E2=80=94
> >=20
> > I=E2=80=99m travelling will take a look end of the week
>=20
> just get back from travelling will take a look after Chinese new year
> as all my hw are at the office

Ping



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
