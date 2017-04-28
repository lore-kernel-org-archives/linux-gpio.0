From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCHv2 0/6] mcp23s08 pinconf support
Date: Fri, 28 Apr 2017 10:43:44 +0200
Message-ID: <20170428084344.exegdfcfblbx3k5w@earth>
References: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
 <CACRpkdZVQJ+KvoKVzfMjGeaPMJ4MT+uf3HSr5JixBx5MgJ8xeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="incxbsyxnrhb4flw"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51769 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938014AbdD1Ins (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 04:43:48 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZVQJ+KvoKVzfMjGeaPMJ4MT+uf3HSr5JixBx5MgJ8xeQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--incxbsyxnrhb4flw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 28, 2017 at 10:22:24AM +0200, Linus Walleij wrote:
> On Thu, Apr 27, 2017 at 4:19 PM, Sebastian Reichel
> <sebastian.reichel@collabora.co.uk> wrote:
>=20
> > Back in January I sent patches adding pinconf support
> > for configuring mcp23s08's pull-ups. Apart from my
> > custom Raspberry Pi setup the pull-up support is also
> > needed by Toby Churchill SL50.
> >
> > Changes since PATCHv1:
> >  * Add patch moving mcp23s08 from gpio/ to pinctrl/
> >  * Add patches updating config references in arch/
> >  * Add patch removing pdata support for pullup config
>=20
> I like this and I would like to queue it early in the v4.13
> development cycle.

Thanks.

> > I see the following merge strategies:
> >
> >  a) Ignore limited bisectability and merge all
> >     patches through their own subsystem. Compilation
> >         should always succeed, but the blackfin boards
> >         will be without mcp23s08 support with only one of
> >         patch 1 and 2 being applied.
> >  b) - Squash patch 1 & 2
> >     - Queue that patch into gpio/pinctrl
> >         - Provide immutable-branch for blackfin & arm
> >         - Blackfin & ARM can pull immutable-branch & apply defconfig pa=
tch
> >         - gpio/pinctrl can queue patch 5 & 6
> >  c) The same as b), but squash patch 1-4 to guarantee
> >     bisectability for defconfig.
>=20
> Can't I just get ACKs from the blackfin and ARM SoC maintainers
> for their subsystems, merge it all into pinctrl and GPIO and provide them
> an immutable branch from pinctrl to pull in if they need it?
>
> I will anyway need to have an immutable branch between pinctrl
> and GPIO for this.
>=20
> I expect ARM and blackfin can optimistically ignore my branch unless
> they get merge conflicts.

Yes, that should also work.

-- Sebastian

--incxbsyxnrhb4flw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlkDALoACgkQ2O7X88g7
+ppzaw//b6fXA8x7NH+7Ldb5/1RnICLTOi4VV0lQwQcoiXF05GPd0cA1zpd9IA0J
dnwkGNDTdt6cXDpypciYJU0PBNLdyazFWI15hMTPymaT//RExjnj7RYzboOv1OTT
PqeAzQjOup9OPseUFUz5QnOLvTIlbw7i2Tdm1tVay4n3u+p0Z0NtXqPCxMFwZ5bZ
BnUS6k9kjsV3pGRd7CiqMEg1aOTloKm2yqhD6XQyXh75xMzi8WGMUkWKUBHJuFHQ
0ogsyDikvrDGYp1x7viA7Uu3qXtUknieVBXew4f+PQcbGbDXNpKwRQMbSpqCFjoH
kcwExeF4iCTWXoZBUI+0cb+YR2O50APJPhPhQ8ZWjCJ+vtYmQnxGKfilbOG5jJ7R
TL1bTDbFeYA/dNoCa8P+a6evXm1IEEPIbVcp+LD+4eyhxjjSGxh/S8WMRgAdK1ZZ
KinGC8NOBZLQYVwIO7922nDmSarXAcX0n4Z7iMEwQ0vQm/NJxFFtaTqjprxxKGY8
v98Wbv/gP7dM/ex3ExMcDenuyUOQakyrvvzodB4WLJikE7eWY3VXNbaV6QogZgZ3
SzPly2+ukYfkmopZbx5Yzn6H46+B9rLehcMwKiIiwurr59BDZ8/dNHfO1pd+aO4N
8vAN7WjzJqgKntEEsQZHj5kkqxiVXWO0zT7wN3S18f5phhlDFHw=
=meZo
-----END PGP SIGNATURE-----

--incxbsyxnrhb4flw--
