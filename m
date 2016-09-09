From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/3] pinctrl: sh-pfc: r8a7791: Implement voltage
 switching for SDHI
Date: Fri, 9 Sep 2016 14:30:43 +0200
Message-ID: <20160909123043.GD1318@katana>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
 <1473334608-24638-3-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVNW=hVrmHrbPZW1GpeaaDZOz-4x0cv9qjU9D5p9CLBTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVNW=hVrmHrbPZW1GpeaaDZOz-4x0cv9qjU9D5p9CLBTQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms+renesas@verge.net.au>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2016 at 09:52:20AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
>=20
> On Thu, Sep 8, 2016 at 1:36 PM, Simon Horman <horms+renesas@verge.net.au>=
 wrote:
> > All the SHDIs can operate with either 3.3V or 1.8V signals, depending
> > on negotiation with the card.
> >
> > Based on work by Wolfram Sang for the r8a7790.
> >
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>=20
> If you correct the copy-and-pasted comment below, you can add my
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> > + * All pins assigned to GPIO bank 3 can be used for SD interfaces in
>=20
> Pins 0-23 assigned to GPIO bank 6...

I agree.


--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0qtyAAoJEBQN5MwUoCm2fuoP+wWV0rAhR2siZVRFsE64fL2p
DmXa0laddHYL97JeRBptJxqi+jWNalxWCLC8PVOtKgDsfWFG1OVgEfwZrWTYewFx
PsXGQdifNaI5/lTXDfII56HaVylkVINoqGYaoa/1V6RlT9tSHxTQxbanUMcmS+os
Xl2CKK4D2Gr3oUkx1kQOsWDVl6t7mAAb+oTiLd9AMLOLUkHswZtmUOmLgzD2dDLZ
Dp4b58wrcMSmS6iQqgWhRXSicvx4mKrLAYsHg3joNMUWmReJqDmv1MXHiMZpRSvG
vd+PGwFktAYvaTQftXtbTdFmzdageABCiaiU2Ey3f+7Xo8ny/oCv+44e+i5p5fv7
eR4shkv43THldYzuVmHvhTTJ4dQnUL5kRRZlqL59vJRqzNx9AkOMxOOkfZjf5x9Q
BQOieozi1ubu4BclS7AaRvbKs0tNc7DjB1y3nlzHoNhs/EmOt3cNulUyijIW1Own
ERh1/I+MxwJ6Rnogqwd3KzWq+Shby35cecP7hfkLIhkICoC1DE+gvc+nhhWrJ40H
AghZssPclNbt/AsoLBbRQHHuTnZBRJ96SltNHoLAv0cVtsF1IF9sV0TYiH3Pa7Nz
Wm58b+RGRqqL+PTfFkMYtgZ4yVj6TTinQSxfwxvDPoKtCeeOpPZUE8O4zKEWwm57
8Cg8sLv9HsPu1QKCuS2V
=EaeM
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
