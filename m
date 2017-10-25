From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 0/3] pinctrl: sunxi: Start to enforce the strict mode
Date: Wed, 25 Oct 2017 14:40:27 +0200
Message-ID: <20171025124027.oosswpymrwkvcvxx@flea>
References: <cover.3e8ef5cb08d0164375d7644df0548e5f39b0fe66.1507582414.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hvqm426gbm6gtooa"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:40715 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750923AbdJYMka (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Oct 2017 08:40:30 -0400
Content-Disposition: inline
In-Reply-To: <cover.3e8ef5cb08d0164375d7644df0548e5f39b0fe66.1507582414.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org


--hvqm426gbm6gtooa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Oct 09, 2017 at 10:53:36PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Here is an attempt to enable pinctrl's strict mode on our pinctrl drivers.
> Indeed, our controllers should have had that mode enabled since its
> introduction.
>=20
> However, there's a number of issues with old device trees that prevent fr=
om
> just enabling it for all the devices. There's basically two of them:
>=20
>   - Most of our old DTs have a pinctrl node for GPIOs, which will result =
in
>     an error when the driver is going to request the gpio because it would
>     already be requested automatically by pinctrl. We cannot break those.
>=20
>   - Some of these GPIOs also need to change their pin configuration to add
>     a bias or change the current output, and there isn't a migration path.
>=20
> Let's just keep the old behaviour for the old SoCs, and enforce it on the
> new one, and enabled it by default so that the situation at least doesn't
> get worse.
>=20
> This has been tested on an A83t (strict on) and an H3 (strict off) board.

Did you have some time to look at this?

The earlier we merge it the better, so ideally I'd really like to get
this into 4.15.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hvqm426gbm6gtooa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ8IY6AAoJEBx+YmzsjxAgVFQQAJ5unt+yoywNjA+qXV6U1QSi
KTFHQ51u1nAC+2Hb0j0l4+gs7PPe0p8ZBophmsKcv7kqIFFD3tOxOXs4Ib7Trx55
DMA/55WIwNu7eJUvvBuMI4vl4jZp6ppb8X4OzZh2Qh/z5u2QsgcYddI9omTAXHlz
pISskNL8eDJXnm81qN3JoGxlO3gkVNBgjcsc5yH97aGhydv52/j7j8X5Z9oS6Nzk
9ApOjVCXVYsF4LSrZ0bNi5O3Sv5yVFRucbwY/mCrHZduekx4XljZFnWayJXaa1mK
m4UPP70va6ZeaZ9Gf33xBykyqh1nJtaK+OuO4ORXe+k3e9R+iZjmKlsZ6cZBqqRE
VZ3h3fws9+WXhZFIE54bZkkWGfNDgDLJ5tfQL2VTYxdONdGIx9azSTdtmdgsjMSI
QJk8Wp704Sn5/8BmcQVicSRDqu6HF8Mrw/x1cZ57BOALwW1ZBzU6XcvdEnAJLITL
5hsWQfq/0VlgAqrdauWtxX6AnF5c8JCM97kWDWMHmCohfUDZn9VUe3EjLM3n3XI2
9k9ygQUdSiTz6Eas18siQ/whN511/jGjNqcy9hSFSqg69wuHD3utap+vtcZJdHt2
Z5cJwXqowpiUpeqwMwp2CeeFWb/GQC3tAnn8PWvVNwm/MMP4GhJeQhQ/wRW52X0B
GA+Vf8oa/WttGvSf+hGx
=R6+b
-----END PGP SIGNATURE-----

--hvqm426gbm6gtooa--
