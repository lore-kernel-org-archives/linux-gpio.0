From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 3/3] pinctrl: sh-pfc: r8a7794: Implement voltage
 switching for SDHI
Date: Fri, 9 Sep 2016 14:30:06 +0200
Message-ID: <20160909123005.GC1318@katana>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
 <1473334608-24638-4-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdW4=89ro4E2zLRs6fPZk3fPfkHmowNybO107nkJtZqGbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:52599 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752603AbcIIMaL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Sep 2016 08:30:11 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdW4=89ro4E2zLRs6fPZk3fPfkHmowNybO107nkJtZqGbw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms+renesas@verge.net.au>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin=
, u32 *pocctrl)
> > +{
> > +       if (pin < RCAR_GP_PIN(6, 0) || pin > RCAR_GP_PIN(6, 23))
> > +               return -EINVAL;
> > +
> > +       *pocctrl =3D 0xe606006c;
> > +
> > +       /* GP6_16-23 -> bits 31-24 of pocctrl
> > +        * GP6_06    -> bit  23    of pocctrl
> > +        * GP6_00-05 -> bits 22-17 of pocctrl
> > +        * GP6_07    -> bit  16    of pocctrl
> > +        * GP6_14    -> bit  15    of pocctrl
> > +        * GP6_08-13 -> bits 14-09 of pocctrl
> > +        * GP6_15    -> bit  08    of pocctrl
> > +        */
> > +       if (pin =3D=3D RCAR_GP_PIN(6, 6) || pin =3D=3D RCAR_GP_PIN(6, 1=
4))
> > +               return 31 - 2 - (pin & 0x1f);
> > +       else if (pin =3D=3D RCAR_GP_PIN(6, 7) || pin =3D=3D RCAR_GP_PIN=
(6, 15))
> > +               return 31 - 8 - (pin & 0x1f);
> > +       else if (pin < RCAR_GP_PIN(6, 14))
> > +               return 31 - 9 - (pin & 0x1f);
> > +       else
> > +               return 31 + 16 - (pin & 0x1f);
>=20
> While your code is correct, I think it's easier for the casual reader to =
use
> a plain switch () statement, and let the optimizer handle the rest.

Both is fine with me:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0qtNAAoJEBQN5MwUoCm2xCQP/0zZ520lJqBQ2qPH/5HJS557
XJYqDGXBjc9ynGz60+gb30T52zuxuGxXN/H44H0I95rWWHMlyXbXqwQa30wuN/jr
O9yg3x6nE/EzVyJvThjopZ7KpkV4QeAzW8c1I/QBLhKMAptW2ZYR4dygBEvxfhRi
H5ektrIXmh5xegp2SIAKOazLLaMeHAed35Oxq246djBKpDJlCRiwneR63iKhq4FA
1qvmgWtArgt1jPy99cwnrxTUKsA+QhVr+kjHgGCXBRM55AepewsPFrMxc/XinlKa
HdEZSVF1+xvpoPGk5P4umJbN/b7JDcZPak2uDWv721M0yKEnAc4/R1l5UPY1fTnW
19J+661Yib7O9RAQWasqNdmITUOhw1fp9zjZpWuWiE4FdP7xKo1mNzhUnP5TF0Yl
2iiXK/uYEtPBLZupVmq9IdD3B+jxEcAebieW80vs4UIfYlxhS7CFWygrZVn389Jt
kljVJQsiLfMo0g+LP8Pe48AZF787LcRyTIhrLbwVUtZCr8M0Je1qVIYMXbZZy6r3
3yGXKz5bLtY6Mu2Q0zg/+QZbuo0r58pXS1MJD94WtMXpnzMczVLWk/pe0j/nARo6
QGOeBq7tDA7xq1548ql0DZftO2oMeVzFtTX3jOc1uEuOkSTP/ysIX2LgUP1vl+0O
XmjG6kHZ4+HnjLMXNzSu
=Q/sb
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
