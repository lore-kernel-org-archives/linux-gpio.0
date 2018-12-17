From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v2] regmap: regmap-irq/gpio-max77620: add level-irq
 support
Date: Mon, 17 Dec 2018 18:07:22 +0000
Message-ID: <20181217180722.GG27909@sirena.org.uk>
References: <20181211140555.GA5872@localhost.localdomain>
 <20181213182026.GX10669@sirena.org.uk>
 <20181217084248.GC2477@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c7hkjup166d4FzgN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217084248.GC2477@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mazziesaccount@gmail.com, gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, vladimir_zapolskiy@mentor.com
List-Id: linux-gpio@vger.kernel.org


--c7hkjup166d4FzgN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2018 at 10:42:48AM +0200, Matti Vaittinen wrote:
> On Thu, Dec 13, 2018 at 06:20:26PM +0000, Mark Brown wrote:

> > I can't remember and can't find any record of any discussion of it which
> > is odd, might've been on IRC or something.  Let's just remove it and see
> > what breaks, since we generally provide the type along with the request
> > for the interrupt I'm not sure how often the default actually gets used=
=2E =20
> > Possibly safer as a second patch though in case there is a good reason
> > that I missed so we can easily revert it.

> So how do you see this - should the regmap_add_irq_chip read the current
> type setting information from HW and populate the cached type values
> based on the current HW configuration? (I think that would be corect
> thing to do).

Yes.

> >  It
> > does look safe to me but it's possible I missed something.  Equally it
> > only seems to be some quite old Tegra systems using the max77620 so
> > perhaps mainline usage of affected devices is limited anyway...

> Right. This makes me wonder if there is some other preferred approach on
> this... How other drivers are doing the type configurations? Why they
> are not using regmap-irq? Am I missing something? But what comes to
> changing the regmap-irq type-setting this is definitely a good news =3D)

I suspect a lot of devices lack configurability or have never actually
done anything where configurability would matter - probably the biggest
use of regmap-irq is interrupts internal to a chip where there's no real
need for that, and even where there are GPIOs I'd be surprised if many
of them were actually used as interrupts rather than dumb outputs or
something given that most embedded systems have an abundance of GPIOs
directly on the SoC which are much better.

--c7hkjup166d4FzgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwX5dkACgkQJNaLcl1U
h9Ajawf/bLgkFNQNov++KKeaj9gMIgTH7cuGQY+aj84B/u4u5iIiKAxPCz/2eCHb
ga4j13Obe9XmECOgDJSY9tNoaKj1n2GK0He/aH6NhHqhH4heBzJIFPXkLVnush3v
kPEiaShENPZ0vcI0nWNYLcRZvPyJ3PcWjow2KtHSWvhkWz7Up3e5tcHO46UUYkp8
QXrP04KPaL3vNw7rJ3givqBt7NFR6912FrkgBE+oTPFjsKXhtxyOSNNWhoMyA0Cu
YQmEJxUKtVaAXyEwlRjpE10nV+fbY6Bu3wyOgJ83EYnpwNgCuVeYFYIcLc5Z5rCr
c8965kc6UrnaHP1dJ+WdEOPr9ldGzg==
=E7ya
-----END PGP SIGNATURE-----

--c7hkjup166d4FzgN--
