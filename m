From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 28/50] pinctrl: ssbi-mpp: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 10:00:59 -0800
Message-ID: <20160224180059.GA4736@lukather>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-29-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:46551 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751866AbcBXSBU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2016 13:01:20 -0500
Content-Disposition: inline
In-Reply-To: <1456319775-3216-29-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 06:45:53PM +0530, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration and clean
> the error path.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWze/bAAoJEBx+YmzsjxAgPHEP/3zywwx907mjHbGIY4mhst96
mS2tqDCupr7DjUy5eEqvOk0XucUZYlkSmq2fivAGBl9QJFs3XhG0zfrPDZNZcdFa
8eg2bpS/Bou59298FRWjz1Ip2mGEfs3y+iGM4ByQMLK4NnU3m0rk24xywHAVTU7F
dXM3V8FnRooATYZkz+AMQe4MB3NQQSiUHT6QDrQosSsDwrEYrFjhCCxcKAIgxd0Z
tFM08onO+tarcF2L1/0WTm22vatgaRRNh20J7S/HLjo9kIknKFs8O2PjrmPLaQCs
vVJp9qzBLX3E1VMXEQu8XqBa2qU7fARnjZf2mem0Zb5R35uXN1D505KkxPWAjTTy
OAYdGPweP8ivxqJgX3DjGqhhIn2oe9VxY0uVUGqZYATnNJ4n7LiRDwVpmAoCUPcE
7UdGsO0KsqvD4hpdpj5WN/Eds0tIXKeLvqVR4+FZO7BDkDukGWWFmla7WAvbRf3a
sjm7+nxTPCYX9XHsou93iCOdzF4hucl3i3Ok4fpoGG4EStJBScfKNai8kIeWvLUw
+6YLZ19TqZhdMrlMpV/loZ9QSQ7mxyY7vmUSacyVGmYYAfENLyBwAmye+0Ttx/zn
NH/hCBnjilR7zNOiXVqnIv5ctCC22g2uyo+EyxskVRap8ZEnXcfEw0szeD5lsumR
g4detaKlMUrkbl7v9g20
=8ajl
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
