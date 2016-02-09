From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 1/5] clk: sunxi: Add apb0 gates for H3
Date: Tue, 9 Feb 2016 18:11:01 +0100
Message-ID: <20160209171101.GS31506@lukather>
References: <1454542430-16572-1-git-send-email-k@japko.eu>
 <1454542430-16572-2-git-send-email-k@japko.eu>
 <20160204154752.4df7808be3364a98c496c030@free.fr>
 <20160205111152.GA31506@lukather>
 <20160206112605.4005784d1d0962c8adfe58a0@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uX7BrQs69PbBafpd"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:39199 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932193AbcBIRLD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2016 12:11:03 -0500
Content-Disposition: inline
In-Reply-To: <20160206112605.4005784d1d0962c8adfe58a0@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Krzysztof Adamski <k@japko.eu>, inus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Fabian Frederick <fabf@skynet.be>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com


--uX7BrQs69PbBafpd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 06, 2016 at 11:26:05AM +0100, Jean-Francois Moine wrote:
> On Fri, 5 Feb 2016 12:11:52 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > However, I'd like to keep per-soc and per-clocks compatibles in the
> > DT, in case we need to protect a clock in the future.
>=20
> What do you mean by "protect a clock"?

Prevent it from shutting down.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--uX7BrQs69PbBafpd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWuh2lAAoJEBx+YmzsjxAgy/oQAJag/VCpMK9xw3DPesan7cTi
G0QlllSMHBMq1JYjuQaImj003x8wvVJ+7W59wulAOto5gJkIoC+fv7Xby0NUCGga
SxloZxQqB0hThM/Y4okJ2nHKeTb/Ts3dJ4Efts2vZQtkCU1dTWSZ6CCz+6r0WZAi
W3cAbG52XQy6/+S8E73G4j0k+Lvy83gzJ3TR/tC7fFcMJCx0N+MuDvFZeYTQiBNn
e0j7c1rpJb2JNs3eMZrynUXCawLqoTSOVrpKHrHznsLBZGfmYgWmbqTbet6oTuw9
cviuAL1sFtNDXgBza6+0FVZy3vbHOca3i70N963DoldkmMXOAKGdo6BQs6KLuYmC
lepxA54APpvyP6LmVHwOn+Ce+FX2KjQVewlucY9brrnmVQ8lYIWN7jgMnqemkQmI
twcbZlJ+igXJEt5IzLg+HHgMGMxm0foUslllqL0prFnKEn/ozl3ppMgVjmDCnkmN
0B+hiD9o92G5h+qWxDVOKVR62rQcQchQm5C5J1C0u+RIgnF1GqlFdlI3iCxQLfNx
dmhAKt1YzbVgmucOkMEQpgczREH+5m7zMSyY4QNXqGruv6s+yGbOPyhTZ6E2p/Sh
l3sxng5wRhr4weLXiT/DPMIdE7Ek1YhJZPG522KgmXRWNzi4K2Lp1xBvNDI47mNy
JwaqEGXh4TUIk2zBN9NH
=T3FH
-----END PGP SIGNATURE-----

--uX7BrQs69PbBafpd--
