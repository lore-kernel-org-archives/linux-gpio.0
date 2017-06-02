From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] pinctrl: sunxi: constify irq_domain_ops
Date: Fri, 2 Jun 2017 14:08:17 +0200
Message-ID: <20170602120817.cekrag2imtbcnbqk@flea.lan>
References: <20170602112958.3882-1-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jzj66axxhn4ebezy"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:39897 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdFBMIT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2017 08:08:19 -0400
Content-Disposition: inline
In-Reply-To: <20170602112958.3882-1-tklauser@distanz.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


--jzj66axxhn4ebezy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2017 at 01:29:58PM +0200, Tobias Klauser wrote:
> struct irq_domain_ops is not modified, so it can be made const.
>=20
> Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jzj66axxhn4ebezy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZMVUxAAoJEBx+YmzsjxAgLMYP/A1OVmFY4gvu+ZYpJyyA7e8+
leePQB37FqxZ5NB5TD8B3oFyemQdWxCJBxbSnKvcLmToBh3gbQ8UOkqQWJLkwP4J
LfIW51aJetkg3ECWHcozYCnXOvtTejEGPiWt11h3cws2PV36wHAZEbI6e4HD9MJL
rSXWIy9hd0AEW1CFCEUcceWZKRSeggKfrJXaQ3jSogOq3TIcYDd6tsRqWcF8GJ0H
O4g2y8I9COikIovtOoYOIiuZIYa+vg16Usf4rxFuzRlcAYLVCofB9TZF6u8k0GLc
io4QWNkQXCmkSaQqkkib53gKe0GsbtCBMaLlEN6OzDIcRW/wzpnOLPUwUdtdwKvc
jnoMF0XBxd7pT8k3izzNT0NdD3HqXWtfdJsITdSDY0j4i7o9HOIxi4IdMTITHBTr
P+V56rVoJidltGQh8fXdc71NAA5pclLuLnJsjFLCDP7P/npiSZeVwmlHe8OOEZ/j
uZn0kd9UuE+tZH1qvJ5W/BTfscNbF3KKqEXFFUx3abx7KpAEhHaPTFYPEDk6lOeb
Byt7hDHBUdui+eTMxkupmPbIJK8r7X/h/bdi9fNDTS1+8ti144Tc2+MrWly5pkMm
eMQhF/Nt175HFx6vlxK7o/pf960/5B8yXTfNUMLNx2TBItMbi37z7YAHrBY0BE0G
Aebym7hFYW1YWKoxUJWA
=DnQ1
-----END PGP SIGNATURE-----

--jzj66axxhn4ebezy--
