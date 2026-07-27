Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8543E4504;
	Mon, 27 Jul 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141432; cv=none; b=BY4f7fxohFVRPLlk/l+KU+sEmprddvqs4TLQxmcb7vtIcJSDK+2Cw+zto7jGEY3sviHcp1IMCPZol3dxVq8VhWtgVpMwt0tm+2/hb9rOw3Fn55+y6kcghjvasVs8O+mCT7D+xmCshdxQ99L6mkkc7etpDYLC3o7VZRIQODo+PdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141432; c=relaxed/simple;
	bh=PeBvDNLJdrKMDSXJ0bqbUcZsLDgiONnCOofN36atHdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJCzW+Q+YDY7PDPp8Dh2UuHyEl/YppI2coyhvWck6w9vLEnUqWwhkzslMDnOfPInDKbZdof2r+gP6l59NsisB0KTM3rVkAAgreCRC54Pjn05OutYRH/FLU9ZczzSi7LYYjwXcckWMvZojmW2/Q34tpbZTYN6yuTjprb7pYvRFRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5tW9RBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5tW9RBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894BE1F000E9;
	Mon, 27 Jul 2026 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141431;
	bh=2ymQ69O58SmJxjBh9J1WtzowD3z4z2UMVP2Lc1OmFgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k5tW9RBoshz389tVyBaXpXv+kl3+U/hYfpzdIG1n61TfM76XDpxuaywmU0+MkreLW
	 nnhvZ/2f6HguyzQOHRnT+wMPgNwiiu+IIsb2GjNnD7xAdnuYEgxdIB/GkT2djlIED6
	 NLJ4/wyugxC7xQpcgjqF5OBNkdkgXMpLyTZdqfATC5e2c9sZG208CxdrJBY6qQyxap
	 sd+xIU27dfM9EaNIHhC517PCnt2jm8cUhCrZXDM5nDrWVTuIsSrDsUrqOnQvf9rUxu
	 CrS45cC8GthF6nTLkdZnBvkZPA9jKwmlD6NRBo2teg8nDDi1pLNPMSFWgVc5uSudf1
	 C6jrWj38QrU/g==
Date: Mon, 27 Jul 2026 10:37:08 +0200
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
Subject: Re: [PATCH v7 15/34] pinctrl: airoha: fix IRQ mask/unmask code
Message-ID: <amcYtIpIjyYclv4r@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-16-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mtbYkPphZS9xxI2V"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-16-mikhail.kshevetskiy@iopsys.eu>

--mtbYkPphZS9xxI2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> When using IRQCHIP_IMMUTABLE, airoha_irq_unmask() must manually call
> gpiochip_enable_irq() and airoha_irq_mask() must call
> gpiochip_disable_irq(). Without these calls, gpiolib never sets the
> GPIOD_FLAG_IRQ_IS_ENABLED bit. Because this bit is missing,
> gpiod_direction_output() will not realize the pin is actively used
> as an interrupt.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 6cf4ed5976fb0..f85941ccea560 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2580,6 +2580,7 @@ static void airoha_irq_unmask(struct irq_data *data)
>  	if (WARN_ON_ONCE(data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type)))
>  		return;
> =20
> +	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
>  	switch (gpiochip->irq_type[data->hwirq]) {
>  	case IRQ_TYPE_LEVEL_LOW:
>  		val =3D val << 1;
> @@ -2614,6 +2615,7 @@ static void airoha_irq_mask(struct irq_data *data)
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
> +	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
>  }
> =20
>  static int airoha_irq_type(struct irq_data *data, unsigned int type)
> --=20
> 2.53.0
>=20

--mtbYkPphZS9xxI2V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcYtAAKCRA6cBh0uS2t
rDh8AQDf2K0ZyIVFOfiaFcb2upEDJTym5mn75+5yfuBUwIbDwQEAy6+xBXdeFA9a
ODNHJGawn7QD/t8bsT580S0tfTCaUAE=
=Yt6b
-----END PGP SIGNATURE-----

--mtbYkPphZS9xxI2V--
