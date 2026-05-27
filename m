Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9113CFF6C;
	Wed, 27 May 2026 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869337; cv=none; b=YaamVSUQZodBQwsygef4K1WKeywIcEMs5uTxH8lz4eFoQ8L6vnzr/9lCNctYd1eh4K/YsML0cXs2z58chwpQibvYhhtBk1AY7VnstkcZ+0dldp4ufPLIdg5YxkjabuzSDa8iwf8uY4TatjgFnFWXaJR2GQw53qSKxAHk3F+xYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869337; c=relaxed/simple;
	bh=sT6vr2tV7pQ3YriBWCUwxRT255L7NxnyNB2kjgm/too=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2Kig0ggW+51z+sN6Bwt25jPNtlnTElpC6t+D8MYEG7bRBe22b/4AHiA2qhWyU2FiqZJGGy3kb7si3AJf7y2TGqQHmhoPwOv+F7bt+4IzOJcdKnXwZI0voe8m+VGD6TVxyf5iHtzZhPCHoYIo/gvRuq/2lgp3rJT+cHGqBrdPPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 01A9137002E2;
	Wed, 27 May 2026 08:08:46 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4D515B40915; Wed, 27 May 2026 08:08:45 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [37.167.96.158])
	by laika.paulk.fr (Postfix) with ESMTPSA id 4760AB4090E;
	Wed, 27 May 2026 08:08:42 +0000 (UTC)
Date: Wed, 27 May 2026 10:08:38 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] pinctrl: sunxi: Implement function_is_gpio
Message-ID: <ahamhtes_HAh-fhr@shepard>
References: <20260517171405.3697469-1-paulk@sys-base.io>
 <20260525233808.20e75a21@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xXnRIhy8Zq17CPb5"
Content-Disposition: inline
In-Reply-To: <20260525233808.20e75a21@ryzen.lan>


--xXnRIhy8Zq17CPb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon 25 May 26, 23:38, Andre Przywara wrote:
> On Sun, 17 May 2026 19:14:05 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>=20
> Hi Paul,
>=20
> > The function_is_gpio pinmux op allows the core to find out whether a
> > GPIO can be safely requested from a pinctrl property and requested as a
> > GPIO at the same time.
> >=20
> > This is especially useful to request a GPIO with a particular drive
> > strength, which would otherwise not be possible.
>=20
> That looks a easy enough solution, but:
>=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index d3042e0c9712..6162f2d86723 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -821,6 +821,17 @@ static int sunxi_pmx_get_func_groups(struct pinctr=
l_dev *pctldev,
> >  	return 0;
> >  }
> > =20
> > +static bool sunxi_pmx_function_is_gpio(struct pinctrl_dev *pctldev,
> > +				       unsigned function)
> > +{
> > +	struct sunxi_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> > +
> > +	if (!strncmp(pctl->functions[function].name, "gpio", 4))
>=20
> I wonder if this condition is a bit too relaxed? There could be
> some (theoretical) function just starting with gpio, but not being mux
> 0 or 1.

Yes maybe this is a bit too relaxed.

> So should we check for gpio_in or gpio_out, explicitly? Or at
> least use (strcmp(name, "gpio_", 5)? Or maybe even better for the mux
> value directly? Is "function" an indicator of this, or does this rely
> on the two GPIO functions being always listed first, at least so far?

I considered mathcing the function to the mux index, but we can't really re=
ly
on Allwinner keeping GPIO to mux 0/1 either so I think the string comparison
is still the best approach.

But I am totally fine with having an explicit check against
"gpio_in" || "gpio_out".

And to answer your question it's not safe to use the function as mux value,
even though the values are the same in practice. The muxval field of
struct sunxi_desc_function should be used instead and that can be looked up=
 by
sunxi_pinctrl_desc_find_function_by_name.

All the best,

Paul

> And what about the IRQ function? Isn't that some GPIO as well, or does
> that not count for the purpose of the function_is_gpio() callback?
>=20
> Cheers,
> Andre
>=20
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  static void sunxi_pmx_set(struct pinctrl_dev *pctldev,
> >  				 unsigned pin,
> >  				 u8 config)
> > @@ -952,6 +963,7 @@ static const struct pinmux_ops sunxi_pmx_ops =3D {
> >  	.get_functions_count	=3D sunxi_pmx_get_funcs_cnt,
> >  	.get_function_name	=3D sunxi_pmx_get_func_name,
> >  	.get_function_groups	=3D sunxi_pmx_get_func_groups,
> > +	.function_is_gpio	=3D sunxi_pmx_function_is_gpio,
> >  	.set_mux		=3D sunxi_pmx_set_mux,
> >  	.gpio_set_direction	=3D sunxi_pmx_gpio_set_direction,
> >  	.request		=3D sunxi_pmx_request,
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--xXnRIhy8Zq17CPb5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoWpoYACgkQhP3B6o/u
lQxDYQ//RPAy0EjHEhhuvtJsBrWAL0jzTj3G1QNSUISrPzn58Ei3wMu0P4sYUUOH
BY/qY5O6aShsgzwNRfI4iqJpS6Tcf7i6WMvErll+wksZGlO13XEwIshoOA5GNiD3
qNiYjGxY9eXFgDeEZbWJOu/vNvC33H/bRkfsMzBcJHLhTEOOZYdS9P+m7HG3okTd
Q3X4uFWoA5eUTxJqo0MbCuyBHYKFroBWFzE6ixtSxZhHRA4Mn7aMiOg0nkD92sPt
y6mMKxaMakpWSnU30wwZwa6tUVxUS4pJgu+EZl0HQ/FZU1ORww2ApQ+QGdqD6ceF
Ny2Ls0FAN9FpPdb2V/6L9HkWjn2VLl+3sLU7EIfLIEXThdXev+QeFbqorNKLV6rr
k9J1Bbg83BBfDVs4kLVQDFxO0z9d8P9PgeZwcpbmJBW+L3tUyvrwrnZS9462o5WY
ot5xC7o3sJWpVOdlfUxu0A9yeRMFtywauQXioz5SEdTVM0/kHIc7FYeicjjmgJiW
hnBxwIsQtfYX0tkcl5b5MJpr2N/rrW0FqJnxWgxMacnSMIpv9zedsBhnFq5NtoPP
R5JWZtV1xuJKReTIbjSRrW141OCqVjFly3LMZFUEY9INWtgSIxZlSZBe9rkyX2xQ
iJZfGcvAG3LDVcbKOhzmbQs51wxl1T8LqY5QIleaeP0LMZKzJPw=
=RJQy
-----END PGP SIGNATURE-----

--xXnRIhy8Zq17CPb5--
