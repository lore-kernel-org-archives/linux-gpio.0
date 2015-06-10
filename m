From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] GPIO / ACPI: export
 acpi_gpiochip_request(free)_interrupts for module use
Date: Wed, 10 Jun 2015 10:33:31 +0100
Message-ID: <20150610093331.GD14071@sirena.org.uk>
References: <1433927527-9980-1-git-send-email-hanjun.guo@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fNM8tsUwH0E3hRem"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51725 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933443AbbFJJdk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 05:33:40 -0400
Content-Disposition: inline
In-Reply-To: <1433927527-9980-1-git-send-email-hanjun.guo@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hanjun Guo <hanjun.guo@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Y Vo <yvo@apm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


--fNM8tsUwH0E3hRem
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2015 at 05:12:07PM +0800, Hanjun Guo wrote:
> acpi_gpiochip_request(free)_interrupts can be used for modules,
> so export them. This also fixs a compile error when xgene-sb
> configured as kernel module.

Reviwed-by: Mark Brown <broonie@kernel.org>

--fNM8tsUwH0E3hRem
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVeARqAAoJECTWi3JdVIfQQWoH/2S5K5vqeBiky1rOgHV5WaX3
vMRdxHIuXWxzXo7hoWuUAa0u0kNOQ3xsQIndvjDWuMuykz+W6r0AFQfZJcL5NQ1I
5ZsuLpmgWf+yhXhcHRYN1n/V0/3wamo1JHYAnReXW36kDVMwEC+HknYuFgTZCwOm
E+g1t7URclprJugqSniGoWpRuDzZOizSlNMssKunxzJwWLm5NeRiCh2MSGDIGT3E
Fv6HuU5vctX0IXKa9BTl97lcomaBGs0Y2nLo/cd0J1ua5cKbRd21wf0VbL+0Zjn2
YCkLMbXu2y2AvanOZrJM7LQK+B9ZO7NFPHHd9BX4ePUPE26WR9PEWo7M3klj/6k=
=/k5E
-----END PGP SIGNATURE-----

--fNM8tsUwH0E3hRem--
