From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/3] pinctrl: sunxi: Disable strict mode for old pinctrl
 drivers
Date: Mon, 9 Oct 2017 10:45:28 +0200
Message-ID: <20171009084528.mooy74urkifioqhi@flea.lan>
References: <cover.7a61d0bb31530def29efd8b4286d8c0afdaab347.1507236823.git-series.maxime.ripard@free-electrons.com>
 <b09cdfbf4c7546f299031c2923b9f8fcef881e3d.1507236823.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v656TCA3yqGP=Jb36weFUvQryC=AMi5TxP_tMbz8w-ajdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5vd5irqu3nrxxnls"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:48794 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbdJIIpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2017 04:45:31 -0400
Content-Disposition: inline
In-Reply-To: <CAGb2v656TCA3yqGP=Jb36weFUvQryC=AMi5TxP_tMbz8w-ajdg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


--5vd5irqu3nrxxnls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 06, 2017 at 08:34:07AM +0000, Chen-Yu Tsai wrote:
> On Fri, Oct 6, 2017 at 4:54 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Old pinctrl drivers will need to disable strict mode for various reason=
s,
> > among which:
> >   - Some DT will still have a pinctrl group for each GPIO used, which w=
ill
> >     be rejected by pin_request. While we could remove those nodes, we s=
till
> >     have to deal with old DTs.
> >   - Some GPIOs on these boards need to have their pin configuration cha=
nged
> >     (for bias or current), and there's no clear migration path
> >
> > Let's disable the strict mode on those SoCs so that there's no breakage.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c | 1 +
> >  drivers/pinctrl/sunxi/pinctrl-sun5i.c     | 1 +
> >  drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c | 1 +
> >  drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c | 1 +
> >  drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c | 1 +
> >  drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c  | 3 ++-
> >  drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c | 1 +
>=20
> You should also set it for the R_PIO drivers.  IIRC you removed some
> entries for them in your other patchset.

I'll look into the R_PIO that can be switched on, but we won't be able
to enable that flag on the one where we removed nodes.

That would break the old DTs.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5vd5irqu3nrxxnls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ2zcoAAoJEBx+YmzsjxAgIbIP/1RQh8nwSIQHOgPPV/YN2o6o
1yGssTG5wDRt8Q27ioj6FOmjNUFJg7kYyXQTI7OSQBFzb0qucH4jzQjlJLPHGpk1
9lqqz8JPvhHMMtVZCjfHjGcBvN3NzMblmpJqxuBG+lI9bvj3mGgqy7UHocsMdBIS
Xm/g+BncX/32phU00zBm2+wDHo/I/XInu2RbnaQlXYYc4MR2p8e6IE1CmBYFT6w7
dy7z2W/k5CbU5RuQ1edMR6vjAIl1Yjf4J6PXh0d1+retJhfiTzUfiDjysE/Uem9z
r919pWQxDFBDlz9IPdxIE/IjCvp9ss3ieRxT0E26rBLBLgIFjCY+G97W22mVYEnS
J2vNxIqySjns7MzNM1lPujvDUtKxnoiZlPE+ci8kYx2ZWIcfFp+f3xN0m54DVrQA
BU3EN5OThKDhRUuUvOoqNkzN2p/FXISdM1unHZmMSdtJ2a8kjzQHZMslCzkhtEhg
6TykdUvT7zhGPkJLoIT6qNQob+KNjkyV98A8doOMTGIwqXx2daDts/1LeQQoTrv3
SkhusQKBzwp9DBgZGzYWxSl/7k3Cmm85Xonrti/ZPdtqq7MSzocbIJnCQ7ExM+FP
Qx8kuUKb0MAJ3V4Fb13eWJaCc7wcAmJGua08NzG8EUqsOuTqjTTvB8wmx5zbQFzX
btJtqUwBJC5/ZyIRKqSG
=U+A5
-----END PGP SIGNATURE-----

--5vd5irqu3nrxxnls--
