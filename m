From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] gpio: only enable kona driver on BCM_MOBILE or for
 compile testing
Date: Fri, 28 Feb 2014 11:27:46 +0100
Message-ID: <20140228102746.GN6865@pengutronix.de>
References: <1392990146-18916-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CAPdLdqkq06AuLr8a8x9aY8BmHHbcNsL5tmQrH4j8bEom_HS-kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:43103 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751451AbaB1K1y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2014 05:27:54 -0500
Content-Disposition: inline
In-Reply-To: <CAPdLdqkq06AuLr8a8x9aY8BmHHbcNsL5tmQrH4j8bEom_HS-kA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Markus Mayer <mmayer@broadcom.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>, kernel@pengutronix.de

Hello Markus,

On Thu, Feb 27, 2014 at 02:20:17PM -0800, Markus Mayer wrote:
> On 21 February 2014 05:42, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > I'm not sure if and how "Kona" fits into the bcm281xx namespace, bu=
t
> > reading through the commit logs of the changes touching
> > drivers/gpio/gpio-bcm-kona.c so far suggests it does. In this case =
I'd
> > consider it a good idea to mention "bcm281xx" in the help text of
> > GPIO_BCM_KONA.
>=20
> Naming these components has been quite a challenge for our upstreamin=
g
> effort. Some things are not very obvious unless you know he chip or
> were involved in those discussions.
>=20
> "Kona" can be thought of as an architecture or a family of chips.
> bcm281xx is one member of that family. There are others. I submitted
> bcm21664 to arm-linux just a few minutes ago. bcm21664 also uses
> gpio-bcm-kona.c.
>=20
> Mentioning the SoCs in the help text is a good idea, but we'll likely
> have to come up with a central location where all supported members o=
f
> the Kona family are listed, so they aren't scattered all over
> different sub-systems (Kona watchdog, Kona GPIO, Kona timer, etc.) If
> we don't have a central location, we'll be certain to forget updating
> one of the help texts eventually, and it would become inconsistent.
=46ine for me, but note that this was only a side node and is orthogona=
l
to the patch I sent. So if you want to ack it ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
