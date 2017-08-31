From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio
 before querying its direction"
Date: Thu, 31 Aug 2017 12:08:19 +0200
Message-ID: <20170831100819.wzgvufjw6cpbzxui@flea.lan>
References: <20170830112424.7a3a7c36@windsurf.lan>
 <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
 <87ziah2m3f.fsf@free-electrons.com>
 <20170830161730.41919554@windsurf.lan>
 <CACRpkdbxdkHukALfYMrM7w=1KNJKLBhGebbkEpMb3C3+nCfWOA@mail.gmail.com>
 <20170831091812.6f7d417e@windsurf.lan>
 <CAMuHMdVGkTQ0vnOg5o+t1J9qe79ySm0R8aE4msyuNLoVGHLD6A@mail.gmail.com>
 <20170831092211.GP20805@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n6fcihpx2tqokuhc"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:44362 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750772AbdHaKIb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 06:08:31 -0400
Content-Disposition: inline
In-Reply-To: <20170831092211.GP20805@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>


--n6fcihpx2tqokuhc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2017 at 10:22:12AM +0100, Russell King - ARM Linux wrote:
> On Thu, Aug 31, 2017 at 09:30:54AM +0200, Geert Uytterhoeven wrote:
> > > Note that on my side, I've however not been convinced by this semanti=
c:
> > > I find it weird that when you request a GPIO, it gets automatically
> > > muxed as such, without an explicit pinctrl configuration in the DT.
> >=20
> > On lots of hardware, you first have to select between GPIO and "other
> > function".
> > For "other function", you have to select the actual function later.
> > In that case, switching to a GPIO can be done by flipping a single bit.
>=20
> What about hardware which you can configure for some alternate function
> but still monitor the pin via GPIO, even though it's not mux'd as GPIO.
>=20
> For instance, you may have a timer block which can capture on both
> edges of an external event signal, which needs the pin to be muxed for
> that function.  However, you need to read the state of the pin, and
> that is only available through GPIO.  Muxing the pin to be a GPIO just
> because someone requests the GPIO is, imho, ill thought-out and breaks
> some use cases.
>=20
> IMHO, the pinmux settings should always be specified in DT, and that's
> what we should be using everywhere, not doing broken backdoor games like
> "the gpio is being requested, it's obvious that we want this pin to be
> a gpio" - that really doesn't follow.

This doesn't really work anymore if you throw into the mix hardware
controllers that don't have muxing options for "a GPIO", but different
muxing options for input and output. For pins that could change
direction, you cannot just specify it in the DT anymore.

And that's leaving out the user-space interface issue.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--n6fcihpx2tqokuhc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZp+ATAAoJEBx+YmzsjxAgCJEQAK126TXE3KVym3ifQjDJGP0H
SumydzzVvHGSQGAZe6VDLIVylMZ9JG/qS8PNtmALefia5sZEpiHiwfitchYNrOWH
0Opx7VIVukctDUsYOK2NbeE+WQbXzBomVWhjTqDET1yOMwYEYyRoJxYGo2U8Neks
hnqhIbOMYAjzJR1X9Nen2cWBdG7MTpjF5wDl1z2E6Svov5Xp+t0kGWsVob5GqhUf
KPRPftFLVIPSSVc8yK+fJoYzs1pZLv0D+4xJXykx340CfYUJmTfYwXlyaafsiozt
3R+1X3C50IiX5mm/FFBtrQUqVHOzgi2FeH/lRy3IfTrF35EM6JgKzH5s/0GgM0hc
arCw7v5BZ2FVwuku0i4/3sJMs3IleWB++xbN827Y1f+3MG5DZArYZoKcMXYBEJyL
+bnkX3JzZ+lt46WC//7MWYfUYPUPq0TAykO+jOdlHt8abEa+XimhqlCJ2lMrNz3q
adoMq69YUoQKj10W6gRrBSjItooTrp6MlKdgvh+BgA4tl0DhO6WQkk9EMo8FzLI4
r9aCNbTfZQIaLvTSp58loRc1Y8JiaBp0VJYWFA21iy6QPhMt6P/nRjzWrQXh9Fjh
d9+SblV2vxpXAlTJiWZEaSEuBOpHU+7TqI7ShSVl8Zjitgt/PCZDAxkRA533j66o
XB3yFNwIZIXimjtCJ3L5
=eVWo
-----END PGP SIGNATURE-----

--n6fcihpx2tqokuhc--
