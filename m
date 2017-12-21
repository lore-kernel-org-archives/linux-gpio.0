From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add SATA pins, groups, and
 functions
Date: Thu, 21 Dec 2017 12:52:37 +0100
Message-ID: <20171221115237.vy42lxqo2igygbg2@ninjato>
References: <20171220215922.22473-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWC9B9YtDzHJ21zLrzMx8JJxUC5q9LRz3c-Kv2y6M+Y9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ulmomr2qqykx76rw"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWC9B9YtDzHJ21zLrzMx8JJxUC5q9LRz3c-Kv2y6M+Y9A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-gpio@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--ulmomr2qqykx76rw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in sh-pfc-for-v4.16.

Thanks for the fast review!

>=20
> > Note: To repeat the test you must:
> > a) switch pin7 from SW12 to OFF
>=20
> Funny how the relation of MD12 to SATA is mentioned only in the Salvator-=
XS
> hardware manual, but not in the R-Car Gen3 User's Manual? Or did I miss i=
t?

I just followed the XS manual, to be honest.

> > b) set an external GPIO to 0 by using these commands:
> >         i2cset -y 4 0x20 3 0x7f (set pin to output)
> >         i2cset -y 4 0x20 1 0x7f (set pin to 0)
>=20
> Time to add the PCA9654 to the DTS, so users can use a gpio-hog instead?

Yes, I'll send some patches (with questions) in a minute. Just wanted to
check if this one is OK.

See you in a minute ;)

   Wolfram


--ulmomr2qqykx76rw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlo7oIEACgkQFA3kzBSg
KbayyhAAmSQUUHQwhCPlN1jryXmvWsXP+9//hTfSHHplckoxqIQnrMSxgNT5EBPJ
JzA+rH+Wka49rXhdnkVD7+l+gIqPoJ8j5IQdEQzGqlV5FBhDM0w+ZEjfGyWKXyRL
Z1ImP7KlxvxM+nVY85iR2/AJNH6R+nznLhxNtGWtRhi5NlZU+s5e1GdO+/HMrygK
H6I/9BQF0rBNC7AZJ/QvvK8scNgmcaBKNMAi2uty5WNIiPCCVpurweZ/6M1EQbBE
rCK2x8NgCYtm+yq9Lur5baI4Mhkj/WwCP+OYGcTW5MS+0fe71G0fyKs5Kdf7B/Ab
xZ53sgAJpSKM1QQq3A2dSnCHeTttRiatK0oEiduVAZxy5Ne//EG/eEnCZ/wnqWXh
pR34CSrAfv3t0FGswTHeWnbHGHJdOqvs8rYxInYTPWhIE468Rq+MZ4fo+UYLfC9l
eT62oRfT/HEcmhUd/t4jtg1McbpSo+jCaMhSI93W/BD5cyIfXaUWdM4dEWk0Uon7
wcxM1odXi3QLK6hhU8l4AL8jJu5m05GIRc37OOa5VjG2bXdrXJ+nF9tPc9cH7p2Y
jNhyZRuU5kNrAQ+/hjEqE2S5AOGReuCxrxdp+HWqkGmKS9DlIP9C85nIV6TyIQQ4
AkXVrVFvI4UJ73Hy2MyvN7xKPXQ9sdcvQvcj/+1h3CNrS1D/8Ic=
=rB3P
-----END PGP SIGNATURE-----

--ulmomr2qqykx76rw--
