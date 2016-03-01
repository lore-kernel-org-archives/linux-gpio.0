From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/8] drivers/pinctrl: sunxi/pinctrl-sunxi.c does not need
 module.h
Date: Mon, 29 Feb 2016 23:13:44 -0800
Message-ID: <20160301071344.GJ8418@lukather>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
 <1456778924-20730-2-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibvzjYYg+QDzMCy1"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:57299 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750823AbcCAHNs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2016 02:13:48 -0500
Content-Disposition: inline
In-Reply-To: <1456778924-20730-2-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--ibvzjYYg+QDzMCy1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 03:48:37PM -0500, Paul Gortmaker wrote:
> This file is not modular, nor is it using modular functions. The
> only thing close is the global THIS_MODULE which comes from export.h
> so lets replace it appropriately and cut back on the amount of
> header stuff we draw in by several thousand lines.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ibvzjYYg+QDzMCy1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW1UEoAAoJEBx+YmzsjxAg2R0P+wZV6J4pekSq/O+Y/Bv84LZf
dr0s6taTwy0dQjlF6zqTqWuYkLC8dHcm7MUMfky/dhYY38achceSA/9VgZ8uBqk+
6T2FZyvMOeQAVBZE5NR+bWwl1+evx6Gw5eR7QsmwtTo5/1JODFf88bLqO/79FwXd
V22hT6A7qhD8J2lKm/dW0lXgGq98Ow4fVU94V1JRC+ZVe5keunfSb1XvF12ahjVQ
PrVhy2sk/YD8OCtX5pq3nxaaUG7Pg8hbY5ChM0Zu4LmiOv7C9GkDUeCn22MPCLBd
mRbbFqazQqMT8quP8M0MZUncxGXTNdwOySnyzEkjVVCIoeDfE1Mo0dfFSXpCvVjh
BL5K3WR83CcRbNa5i30+s3GqlShG/SS9/hAdb3D+vEAD6t+nb9kHFbvTWPGAjEuK
wW0Ji5fvpEiF4YO43849BLWDk5a8PzxBKOE8rvFjw1cuzfJ0nvNNfNgGYGHf7I4g
rBSxTwCgAAKrozZ/Zot6V6tCE3qWpdp1Eu+Ix8eClhPliPcbhxk6/CIi7bzjzMvO
koPbeMcnfH02/Ao7OhER+IV7XRyivlTGlmI8LttjMcBRwWVu2T+B4YAWEkKIsJLX
X/lMc058g1+tYhtmdibCT336U0eRBkmvkph6tFL+qAIIbeb7fVIIJqIVKu4RnPIh
LaIPgoE5UJoSsvjX7Mq/
=iFvr
-----END PGP SIGNATURE-----

--ibvzjYYg+QDzMCy1--
