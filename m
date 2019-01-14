From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 1/2] gpio: hlwd: Add basic IRQ support
Date: Mon, 14 Jan 2019 19:38:32 +0100
Message-ID: <20190114183832.GC22334@latitude>
References: <20190113135844.13109-1-j.neuschaefer@gmx.net>
 <20190113135844.13109-2-j.neuschaefer@gmx.net>
 <CACRpkdYyMwu+hFQF4PUSb8N8zo3QEFt5=curhsdTFP1FCtGpNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYyMwu+hFQF4PUSb8N8zo3QEFt5=curhsdTFP1FCtGpNw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 14, 2019 at 11:20:49AM +0100, Linus Walleij wrote:
> Hi Jonathan,
>=20
> thanks for the patch! It is looking very good.
> Some minor comments:
>=20
> On Sun, Jan 13, 2019 at 3:00 PM Jonathan Neusch=C3=A4fer
[...]
> > +       spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
> > +       pending =3D hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTFLAG);
> > +       pending &=3D hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTMASK=
);
>=20
> Please just access IO directly instead through the helper.
> ioread32be()/iowrite32be() I suppose?

Ok.  Yes, 32-bit big endian is correct.

[...]
> > +       hlwd->irqc.name =3D "GPIO";
>=20
> What about using something device-unique?
>=20
> hlwd->irqc.name =3D dev_name(&pdev->dev);
>=20
> for example?

Good idea, especially considering that the Wii U (the successor of the
Wii) has two of these GPIO controllers.

> otherwise it looks fine!

Cool, I'll send a v2 with these two points addressed.



Thanks,
Jonathan Neusch=C3=A4fer

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAlw81x8ACgkQCDBEmo7z
X9v8VQ//RWS8DkzWf3ymr3emRhbyPFiKaoZLgeFMZ4O66xHNeSmlTsS0kKe0kqRE
BTNtPodF3OeJyf5xH0shvWSZ5r+3rdxeOEVaRf2/MfCJIA0KHiCU3siflmzHTcL9
U8Ik+xeqew/x5klPefxg+mhnuYV0nygDjdZL0YvoYsQaPItNozXLr3h5pft6hfOz
hUhl7TKg/kLN7/hri2QM9SUzFnrc5TXgUGXcWq3ExEaY9As15i+hwhK16rXokQnU
gN/qbaCgzgpgg+Gpt3WBJMVfZNvMaiZYscnplA6OlFu/aFHP1VBSj0acidWD2HpP
eWygJXGM/OnBpLwjSrin+46rul43Bv2/8AdyGJWnMOPiPbkuJzSmyLXZkW9UG/Iy
1OpZ8Yn4bNuQ8jcoOYFaMvRaUUjRUfXkC2drECBF0MwzkK/mUEVqS/Io7FusIVo3
aIS35Mv0wd35bX4dvviszNVIrz9F5vOwfH/Ho5NYZ3V9+iV8eZF35pRonRe3SyPe
Ul8w11e2/Dhm7jS4OebveghSEopmewCRQ2VkOaW2vdQywg87IS7KdWR2o47JILS7
t8P7csw+jRP/5ORCMQPbZeODMH2pLI0AZofklnIc0ShjN9UhHLLcdwlAeTFxA405
7ve9tPxRfR/fQkUDGoGsBF2DAA8y7bvOokLp9/NS8BhcHywnX6I=
=yBbl
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
