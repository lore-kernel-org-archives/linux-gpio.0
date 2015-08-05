From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH 2/2] gpio/mxc: implement reading output gpio value
Date: Wed, 5 Aug 2015 12:46:03 -0700
Message-ID: <20150805194602.GB1230@localhost.localdomain>
References: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
 <1438795388-22743-3-git-send-email-edubezval@gmail.com>
 <CAOMZO5C3mh+vYV_ZHA8hAq2UwY_TcO5sZxqLQDyNvs0VuVvJAg@mail.gmail.com>
 <20150805180215.GA4161@localhost.localdomain>
 <CAOMZO5DPYL43QNwYRiGJ_rd2eqm64wg+zACK6viWbC_aFH=qsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5DPYL43QNwYRiGJ_rd2eqm64wg+zACK6viWbC_aFH=qsQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ulises Brindis <ubrindis56@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: linux-gpio@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2015 at 03:11:40PM -0300, Fabio Estevam wrote:
> Hi Eduardo,
>=20
> On Wed, Aug 5, 2015 at 3:02 PM, Eduardo Valentin <edubezval@gmail.com> wr=
ote:
> >
> > Hello Fabio,
> >
> > On Wed, Aug 05, 2015 at 02:43:05PM -0300, Fabio Estevam wrote:
> >> Hi Eduardo,
> >>
> >> On Wed, Aug 5, 2015 at 2:23 PM, Eduardo Valentin <edubezval@gmail.com>=
 wrote:
> >> > In current implementation, reading the value of an output gpio
> >> > always return 0. The reason is because when a gpio is configured
> >>
> >> Have you tried setting the SION bit for the pad?
> >
> > No, I haven't. From the bit description, it looks like it does a
> > different thing of what we would achieve with this patch. The SION bit
> > is a overwrite to the pad configuration. That is, the pin will be INPUT
> > always.
> >
> > We don't want to force it to be input. We simply want to be able to read
> > the value of an output GPIO. That is achievable by reading a different
> > register. In case the GPIO is configured as output, the GPIO block
> > documentation states its value can be read from GPIO_PSR.
> > This approach works fine, as the GPIO will be output and we can still
> > read its value.
>=20
> Setting the SION bit allows you to do exactly that. Please see:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/271774.ht=
ml

OK. Then, what is the recommendation? Do we set this by default in the
driver code or this is left for DTS pinmux configuration?

To me seams like a bug in the gpio driver still, as the possibility to
read the value of an output gpio is missing/inconsistent.

>=20
> Regards,
>=20
> Fabio Estevam

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJVwmf2AAoJEMLUO4d9pOJWcxIH/1b2KL17810sZfXS0PTSfTcv
Z3RWvrm2Yc3Z66aD5hXFSXiAGVt5UzY285DBY7T/vJLIoKDv9J5TrZrZ4YSYUFBo
Us0e/zL+DyLC4QlDyiRno8ajWd3GzGVcLoHVwI3dr+2NPfs3UXYIB/+4VWjQoeda
0ac8sHAeUxiwJJXRusitPvrGx/YSC0d8upwhRsoEcdwKCYBTnrLrI22VUG3DsrAY
EVo1uWKCFEzQ7bBDDgZytx1ogJ5XKKVgj09MbKUL+UGNia+jScqCGFFlLSmE5WKG
5yWG4gjaeYzKjxfakET3qZZ9PxIeJ57skxvqdI9o5N6zMOhpk4aynm/w0ra+JME=
=XDAm
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
