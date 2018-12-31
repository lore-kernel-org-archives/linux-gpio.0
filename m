From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] regmap: regmap-irq/gpio-max77620: add level-irq
 support
Date: Mon, 31 Dec 2018 19:11:27 +0000
Message-ID: <20181231191127.GL1846@sirena.org.uk>
References: <20181218115931.GA21253@localhost.localdomain>
 <CAMuHMdUbXeuemACL+GGx0HFjn2oKUb2UbDUKJedzCrm8JDfNaA@mail.gmail.com>
 <20181227073531.GA2461@localhost.localdomain>
 <20181227075648.GB2461@localhost.localdomain>
 <20181228080533.GC2461@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eWbcAUUbgrfSEG1c"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181228080533.GC2461@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, mazziesaccount@gmail.com, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Greg KH <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--eWbcAUUbgrfSEG1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 28, 2018 at 10:05:33AM +0200, Matti Vaittinen wrote:

> Last night - just when I was about to get some sleep - it stroke me. I
> think the correct thing to do would be leaving the irq_set_type to NULL
> for those IRQ chips which do not support type setting. If we do that,
> then the irq core will take care of situations where user requests type
> setting but the chip does not support it. Which means the regmap-irq
> would be no different from any other irq chip where type setting is not
> supported.

Yes, this is the best fix - let the framework handle things properly.
We'll need a second set of operations and to select which to use based
on having type information but that's fine.

> So at the cost of removing "const" from regmap_irq_chip we could do:

...

> Mark, Geert, what do you think? (And maybe same for the .irq_set_wake -
> but I did omit this as I have never looked at the wake functionality
> before).

We need a separate struct as otherwise if there's multiple devices with
regmap irq_chip implementations then they'll collide with each other but
otherwise I like this approach (or we could copy the irq_chip struct
when registering and then modify which is going to scale a bit better -
you're probably right that we need to do the same thing for the wake
configuration.  I'll still look at applying your patch as a temporary
fix though.

--eWbcAUUbgrfSEG1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwqad4ACgkQJNaLcl1U
h9Bc0Af8DMJruSFgiVs/MWljDlBa743YhF8i6QW5jYRmLkU6Rm6iD5FJAJ8sGXag
R/h/8Z8o9HoZn62qHkinaOvZa/hg4at63kwp6riLnIsJFS1uCSacwBpCNTf1LvyW
Zv5Cd4WVW+ldiaVEWJPcV23UWqjHWdSMEtYG2/FUycSoTMZNzHLiZc27euQ3Izi1
bGQEAGJU/5koBsDa2eoLkbmFg58Kc5HBcmw0wPgLnRX5/8LcXMrrh7dF8bypLJDG
K7+WrkyFLgDBGZ8QHdzVUUHUj7+W5o2xkB5/yTedou/e0dr2jtgcrfHSvMitCePa
eGKlmA0VqMLTsEhp+wvK55Iy0lmAjg==
=U4/g
-----END PGP SIGNATURE-----

--eWbcAUUbgrfSEG1c--
