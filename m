From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] regmap: regmap-irq/gpio-max77620: add level-irq
 support
Date: Wed, 19 Dec 2018 17:52:31 +0000
Message-ID: <20181219175231.GL8130@sirena.org.uk>
References: <20181218115931.GA21253@localhost.localdomain>
 <201812182306.X3vcHVlL%fengguang.wu@intel.com>
 <20181219064842.GG2477@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pz0BBB9QxoYXlT+x"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181219064842.GG2477@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, mazziesaccount@gmail.com, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, vladimir_zapolskiy@mentor.com
List-Id: linux-gpio@vger.kernel.org


--Pz0BBB9QxoYXlT+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 19, 2018 at 08:48:42AM +0200, Matti Vaittinen wrote:

> I forgot that the block of code the commit "regmap: regmap-irq: Remove
> default irq type setting from core" removes do use the old type specifiers
> whcih this patch changes. So even though this patch applies cleanly on tree
> which does not include "regmap: regmap-irq: Remove default irq type setting
> from core" - it does not mean there is no dependency. This was my brain fart.
> There is dependency. "regmap: regmap-irq: Remove default irq type setting
> from core" should be applied prior this patch.

> Should I combine these two patches as a series (and resend them) or what is
> the correct way to note the dependency?

It's fine as-is.

--Pz0BBB9QxoYXlT+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwahV4ACgkQJNaLcl1U
h9D8UQf/cKSwLpyU1OuYNzL4TbE68AmUX4jP5VnxUYC16AJJCUWPw7sg1ma3q+t+
FakAuzWg0fIXBGwHRYC/0co74Tgr0OoLfBIpO9q4uFtDiwGRdXRxWIuSEk1P4asl
+21K64niITSAByGQAPEG7xLWM79JzSmA0Ub+Ndz/yOTrfGOUe1zaTDEj5nD+w/TH
NLF6X5POoL4lGhJvbfej9lpVB9OK0eg1iodDv3hnCCVbkrI7H3y+MLeW6NkSEEy7
TGkhaDxfE9OBXEqTpBDzEqBiIAhI3s0fjenwjs2IzdC07kJo2todfpRs9q82XjrW
Bf23ULk8V3GJJztiOLt+jXV+7giAXQ==
=WOgy
-----END PGP SIGNATURE-----

--Pz0BBB9QxoYXlT+x--
