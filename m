From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [bug report] pinctrl: sunxi: Deal with configless pins
Date: Thu, 17 Nov 2016 21:24:04 +0100
Message-ID: <20161117202404.5fp5uk4zwmctpqpj@lukather>
References: <20161116123123.GA31631@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sge75attevsgepho"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:50407 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbcKQUYG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2016 15:24:06 -0500
Content-Disposition: inline
In-Reply-To: <20161116123123.GA31631@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org


--sge75attevsgepho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Nov 16, 2016 at 03:31:24PM +0300, Dan Carpenter wrote:
> Hello Maxime Ripard,
>=20
> The patch e11dee2e98f8: "pinctrl: sunxi: Deal with configless pins"
> from Oct 20, 2016, leads to the following static checker warning:
>=20
> 	drivers/pinctrl/sunxi/pinctrl-sunxi.c:397 sunxi_pctrl_dt_node_to_map()
> 	warn: variable dereferenced before check 'map' (see line 323)
>=20
> drivers/pinctrl/sunxi/pinctrl-sunxi.c
>    394          *num_maps =3D i;
>    395 =20
>    396          /*
>    397           * We know have the number of maps we need, we can resize=
 our
>    398           * map array
>    399           */
>    400          *map =3D krealloc(*map, i * sizeof(struct pinctrl_map), G=
FP_KERNEL);
>    401          if (!map)
>=20
> This should obviously be "if (*map) " here.

Erm, yes, totally.

>=20
>    402                  return -ENOMEM;
>    403 =20
>    404          return 0;
>    405 =20
>    406  err_free_map:
>    407          kfree(map);
>=20
> I would send a patch, but I wasn't sure about this.  Should this be
> kfree(*map);?

Yes, that one too.

> I don't have my cross function DB built for ARM so I
> don't know how this is called...  Maybe set *map to NULL as well before
> returning?

And that would be even better yes :)

Will you send a patch?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sge75attevsgepho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLhHfAAoJEBx+YmzsjxAgOA4QAIPKO+uZVL3X27g8WmC+Z/2o
tSpxk/BqBH/pabu6S+HATedT7BjWm0jW92jSsK/ikdTDihExhYUVlpXf+vDmhR/B
u4SxQs1ZWPu5Z+vpU7mrf8Ay3jgbvqu08jOkIrVOthg+euB5FshU0XOqOoxsN+YU
f6LDu1fDbNB6wnbP1jmKYFA2dltjAg69xamqn3A5UUuYQVacEaQW6HeF0MYD1iYX
X6bejbEj/SHd3BS5PriQ/QXX+H2CyT6rYwXdD4mpKJ3TnZhoIsschEj5iL3wBXK7
Jj4WACKXesMItk/nmMPZJPo2Py8RS8MTBb1C8sw5K/CahxAv36oMUA22b5nUo0kl
n9GTFVXidE3gGDBfrdEDzau2yJA5ce2oBL2pq0aWjwKLyTieRqLTyq8UMxjyGFtD
UJfpabB6bvgaxuNf3ZnzDQOzmWIpnQ7urvakstlmqRZlVcIyEhu0YFvbyBdorY9i
tq0biv3s2XNmQJxYzUX7xDCmAoXAdStM1bIt0Er7lhzSCpsLCqtWvkUHzl9i1IYY
6QxQfQcCvRoBeIbx96lBjYaJV1fXv3b1whhenYQfe6PX9X52Bm1a6dU0ykplYEuB
A3f1pmHtBZ2+R3ZjZjmDvXV3vJeO50y6yOlxBIidLL3OVXYN+sYu2ibTzj6lVN9v
JTBJtlkuUrt7xK0h64FW
=a0pr
-----END PGP SIGNATURE-----

--sge75attevsgepho--
