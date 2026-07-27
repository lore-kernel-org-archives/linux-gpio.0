Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A83F1AA2;
	Mon, 27 Jul 2026 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145581; cv=none; b=gVW1b+cQhx6rxIHaI96eGWKggNaAi934GtGGnqjDfPpb6S8G7OF0mhU2N4Z2/oC0j9o0gGBBQg84VYckQ+wR8L8HOi8fokDCmpafwO61/sqGJTAUQoPknHprBnaBafcf62L6dcEGi3FVaob027BwJ29MygglFc6y35gSjekb1xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145581; c=relaxed/simple;
	bh=6v/nZ9DR+Ovr5AEe71xmbm4VFYDIYJDwbTkYkOQj+qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNYzDLLc6H8wJhKxpMzF5UcWvidfCgkAsob8Rr+c232pXM/hglnCgUoLqzi51eRkgU3rvoy6o1ZqDJsOSzTJgBXee50q6xiaCvwkpKwsmV6scz2FO/MVbEQa9T5LwM4SWauF1CnNhfVnfQkhkDUx5yVWy/cM0pzHbunlTpCj+ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReBOT0iK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReBOT0iK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA451F000E9;
	Mon, 27 Jul 2026 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785145580;
	bh=FuTMUQfncog6oEeL4sOUF4Q0/WDrg0FJmGmDU/fm5Kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ReBOT0iK2nmQy71R6UmWb4fA7Q3xLwLpGCZ6QkA3OvPi1yglJY62O4LF6Oe+D/mRU
	 pmV32El8fXRB/fTdZPXIuFGRAgfagVvxK6ruOQ7a4mF6E4XTKNZx9Lg55qCRKtVO8u
	 Qgoytaize+B0mTHQZROUsf8rIljZqNKxUGDMnSESz5eJvMcJ90ZNwUDLBUcpTvCgV6
	 yn+pjWHNOJj84TNBcMpPt3vQh+3HVBJq3gld0XG7jEI4PbYpReXQ30nva+jtGr/KiF
	 luuot6CadMmn0VtRnxyo8Y0V5KQXyaCJ/dpBdJai5EN2eZpPcgRa56LhKYtUk5Wut3
	 Dpsg8KMHV5l8Q==
Date: Mon, 27 Jul 2026 11:46:17 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v7 12/34] pinctrl: airoha: add missed get_direction()
 function for gpio_chip
Message-ID: <amco6Tz_pBEUXAvN@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-13-mikhail.kshevetskiy@iopsys.eu>
 <amcRI3c0-1iWWX5M@lore-desk>
 <179fbc45-a43e-499f-bb54-58fee8c66df3@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="riew4lijXiwXJkHL"
Content-Disposition: inline
In-Reply-To: <179fbc45-a43e-499f-bb54-58fee8c66df3@iopsys.eu>

--riew4lijXiwXJkHL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 27, Mikhail Kshevetskiy wrote:
> On 7/27/26 11:04, Lorenzo Bianconi wrote:
> >> This patch adds missed get_direction() function for gpio_chip.
> >> Also it reimplements pinconf's get_direction() function using
> >> newly defined function.
> >>
> >> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> >> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> >> ---
> >>  drivers/pinctrl/airoha/pinctrl-airoha.c | 41 ++++++++++++++++++-------
> >>  1 file changed, 30 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl=
/airoha/pinctrl-airoha.c
> >> index 820b7b0443851..b52eb39c55ff3 100644
> >> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> >> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> >> @@ -2502,6 +2502,27 @@ static int airoha_gpio_get(struct gpio_chip *ch=
ip, unsigned int gpio)
> >>  	return err ? err : !!(val & BIT(pin));
> >>  }
> >> =20
> >> +static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned=
 int gpio)
> >> +{
> >> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);
> >> +	u32 mask, index, val;
> >> +	int err, field_shift;
> >> +
> >> +	field_shift =3D 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
> >> +	mask =3D GENMASK(field_shift + 1, field_shift);
> > before we where checking just BIT(field_shift) as mask, while now we are
> > checking two bits.=A0
> As I know upper bits treated as reserved. I think we should not use gpio
> operations if upper bit is not zero.
> What is your opinion?

I guess it is better to use a mask of just one bit here.

Regards,
Lorenzo

> > =A0
> >
> >> +	index =3D gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
> >> +
> >> +	err =3D regmap_read(pinctrl->regmap,
> >> +			  pinctrl->gpiochip.dir[index], &val);
> >> +	if (err)
> >> +		return err;
> >> +
> >> +	if ((val & mask) > BIT(field_shift))
> >> +		return -EINVAL;
> >> +
> >> +	return (val & mask) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_=
IN;
> > nit: unnecessary brackets.
> >
> >> +}
> >> +
> >>  static int airoha_gpio_direction_output(struct gpio_chip *chip,
> >>  					unsigned int gpio, int value)
> >>  {
> >> @@ -2648,6 +2669,7 @@ static int airoha_pinctrl_add_gpiochip(struct ai=
roha_pinctrl *pinctrl,
> >>  	gc->free =3D gpiochip_generic_free;
> >>  	gc->direction_input =3D pinctrl_gpio_direction_input;
> >>  	gc->direction_output =3D airoha_gpio_direction_output;
> >> +	gc->get_direction =3D airoha_gpio_get_direction;
> >>  	gc->set =3D airoha_gpio_set;
> >>  	gc->get =3D airoha_gpio_get;
> >>  	gc->base =3D -1;
> >> @@ -2855,21 +2877,18 @@ static int airoha_pinctrl_set_conf(struct airo=
ha_pinctrl *pinctrl,
> >>  static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev=
, u32 p)
> >>  {
> >>  	struct airoha_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctrl_dev=
);
> >> -	u32 val, mask;
> >> -	int err, pin;
> >> -	u8 index;
> >> +	int err, gpio;
> >> =20
> >> -	pin =3D airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
> >> -	if (pin < 0)
> >> -		return pin;
> >> +	gpio =3D airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
> > if you do not rename pin in gpio here the patch will be simpler.
> >
> > Regards,
> > Lorenzo
> >
> >> +	if (gpio < 0)
> >> +		return gpio;
> >> =20
> >> -	index =3D pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
> >> -	err =3D regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &=
val);
> >> -	if (err)
> >> +	err =3D airoha_gpio_get_direction(&pinctrl->gpiochip.chip, gpio);
> >> +	if (err < 0)
> >>  		return err;
> >> =20
> >> -	mask =3D BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
> >> -	return val & mask ? PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENAB=
LE;
> >> +	return err =3D=3D GPIO_LINE_DIRECTION_OUT ?
> >> +	       PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
> >>  }
> >> =20
> >>  static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
> >> --=20
> >> 2.53.0
> >>

--riew4lijXiwXJkHL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamco6QAKCRA6cBh0uS2t
rPNsAPoCaxEq+cONCBlBmmzNPjirzkrL5V/UGCkZSCpeh6ibhgEAoAw4yQBOmS3T
maQG7rrwfujQnLsjxTl8VA/gFk4PEAc=
=Bvvv
-----END PGP SIGNATURE-----

--riew4lijXiwXJkHL--
