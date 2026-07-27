Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889583DB65A;
	Mon, 27 Jul 2026 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139617; cv=none; b=PhVIWt/2QlsJWkLjbxlmX1BDCCcmrOSAAAuAPliF17YiSE7AAvGVBTWHRpO2d8yOp+hkiA82dblATKR5SxmGk+H35rrhWxro6Cyft4TOO3dydNKBbvgImjbzEszHwf679L2LCeOcd81KBOlSnrjf4OvdW6geC3LUAUeaxdG1geE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139617; c=relaxed/simple;
	bh=t50+HRKSJcTC/Xl525coT/pWrsQEGspwgzKt6qN+dhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krbO7w3MDyUy5V8XpvJwmYEaTI8qXbVm39xkKANa8tZxwr5pyiglWjwr0Jg4ivHFmapmNob02Di9rYA2gPIEctsVNT0DpGeFlPWf2sXUwVp1LkBqvn6cvVmw7lT0QL3A9AwdQa4pOcbyKTNTCeYQ3Zh0bxOPAj0K9SBlW9aawvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOFRCfAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOFRCfAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E771F000E9;
	Mon, 27 Jul 2026 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139616;
	bh=GPD9iXBq/Me9KYkjcOGxgVPjlp2Me+zbMwegGTYossI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QOFRCfADGhxgLOUijANCqlOkjkitt/u9FZzycDWUUJk6NlJ9cSS1dCSzxrI96W9DR
	 qXAgcyj34YDAYnayreQ2Q/ItbUGifihhnQsDiGbPdi+PC+tC1dx79UXuEJssy579+j
	 rsPRWJGTBLDc615veH4F8TYh4lz6TLclawAr/vwywyRWWJMDSBrEpZ4ukp0we/yw0c
	 NBntsN+0XWSeeOqthFIuym9is4OxnhwG41ybqgqO3bRROy4XXr4I/wRAe0zW88gnI8
	 kreNRi9FL6HrkY0HtPlq3Io6kad8sggRc6gVpHJTcAdLShykEz39jm7Z+3cUWTq5jP
	 wcOx44q+TDHxQ==
Date: Mon, 27 Jul 2026 10:06:53 +0200
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
Subject: Re: [PATCH v7 13/34] pinctrl: airoha: add set_direction() helper for
 gpio_chip
Message-ID: <amcRnbBXxOrp8kTh@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-14-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FKh4CvICy88s2Pjr"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-14-mikhail.kshevetskiy@iopsys.eu>

--FKh4CvICy88s2Pjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The patch creates set_direction() helper for gpio_chip abstraction.
> It also implements/reimplements some function using newly defined
> helper.
>=20
> This is cosmetic patch used to place gpio_chip specific code together.
> No functional changes.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 59 ++++++++++++++++---------
>  1 file changed, 38 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index b52eb39c55ff3..faad5d3ada31c 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2523,12 +2523,43 @@ static int airoha_gpio_get_direction(struct gpio_=
chip *chip, unsigned int gpio)
>  	return (val & mask) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
>  }
> =20
> +static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned in=
t gpio,
> +				     bool input)
> +{
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);
> +	u32 mask, index;
> +	int err, field_shift;
> +
> +	/* set output enable */
> +	mask =3D BIT(gpio % AIROHA_PIN_BANK_SIZE);
> +	index =3D gpio / AIROHA_PIN_BANK_SIZE;
> +	err =3D regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.out[index=
],
> +				 mask, !input ? mask : 0);
> +	if (err)
> +		return err;
> +
> +	/* set direction */
> +	field_shift =3D 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
> +	mask =3D GENMASK(field_shift + 1, field_shift);

same here, why using 2 bits as mask?

> +	index =3D gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
> +
> +	return regmap_update_bits(pinctrl->regmap,
> +				  pinctrl->gpiochip.dir[index],
> +				  mask, !input ? BIT(field_shift) : 0);
> +}
> +
> +static int airoha_gpio_direction_input(struct gpio_chip *chip,
> +				       unsigned int gpio)
> +{
> +	return airoha_gpio_set_direction(chip, gpio, true);
> +}
> +
>  static int airoha_gpio_direction_output(struct gpio_chip *chip,
>  					unsigned int gpio, int value)
>  {
>  	int err;
> =20
> -	err =3D pinctrl_gpio_direction_output(chip, gpio);
> +	err =3D airoha_gpio_set_direction(chip, gpio, false);
>  	if (err)
>  		return err;
> =20
> @@ -2667,7 +2698,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoh=
a_pinctrl *pinctrl,
>  	gc->label =3D dev_name(dev);
>  	gc->request =3D gpiochip_generic_request;
>  	gc->free =3D gpiochip_generic_free;
> -	gc->direction_input =3D pinctrl_gpio_direction_input;
> +	gc->direction_input =3D airoha_gpio_direction_input;
>  	gc->direction_output =3D airoha_gpio_direction_output;
>  	gc->get_direction =3D airoha_gpio_get_direction;
>  	gc->set =3D airoha_gpio_set;
> @@ -2750,27 +2781,13 @@ static int airoha_pinmux_set_direction(struct pin=
ctrl_dev *pctrl_dev,
>  					unsigned int p, bool input)
>  {
>  	struct airoha_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctrl_dev);
> -	u32 mask, index;
> -	int err, pin;
> +	int gpio;
> =20
> -	pin =3D airoha_convert_pin_to_reg_offset(pctrl_dev, range, p);
> -	if (pin < 0)
> -		return pin;
> -
> -	/* set output enable */
> -	mask =3D BIT(pin % AIROHA_PIN_BANK_SIZE);
> -	index =3D pin / AIROHA_PIN_BANK_SIZE;
> -	err =3D regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.out[index=
],
> -				 mask, !input ? mask : 0);
> -	if (err)
> -		return err;
> +	gpio =3D airoha_convert_pin_to_reg_offset(pctrl_dev, range, p);

same here, if you do not rename pin in gpio the patch will be simpler.

Regards,
Lorenzo

> +	if (gpio < 0)
> +		return gpio;
> =20
> -	/* set direction */
> -	mask =3D BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
> -	index =3D pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
> -	return regmap_update_bits(pinctrl->regmap,
> -				  pinctrl->gpiochip.dir[index], mask,
> -				  !input ? mask : 0);
> +	return airoha_gpio_set_direction(&pinctrl->gpiochip.chip, gpio, input);
>  }
> =20
>  static const struct pinmux_ops airoha_pmxops =3D {
> --=20
> 2.53.0
>=20

--FKh4CvICy88s2Pjr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcRnQAKCRA6cBh0uS2t
rF5EAQCijmE11DKyslLdDBJrY8oIQDp7OEcBmnfVIjuVQlFYAgD9FhlzFrcckkdm
sUsRhgXVF50epcJxDIoqObxTuHFOywU=
=160x
-----END PGP SIGNATURE-----

--FKh4CvICy88s2Pjr--
