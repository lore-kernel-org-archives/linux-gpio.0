Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F93335575;
	Mon, 27 Jul 2026 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141255; cv=none; b=RtH5k4H0JWQ3QhYUgfVKvWCYz9XamOa54MESDDuHQE6sW2zuvs2vpZzdDKAl+qxOjOwrYmqcmOCVj0LrdoVpfvI4JZoWUGxpMQSGSLAxxTPqrFgJcKMAt5RrF6QYhviW27aTi7B0FGgpTegxrKr9+E2JI5abVrN1LvAeqPkzb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141255; c=relaxed/simple;
	bh=p3lNlBP6Sr+VPz93pN3gXphI084YUx0NUUlkHabHRmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0Xkd2ihI2B6cLoW2zonvkASmSD5D9/cuJkagoXZefVaO7GV7cZ5mBrDcFOsaLaMmAma4m/EyPArmCDLML7RftpEWNWt+e30vdQutYN4lZqPwIvPvh4glkk10L7pEFprvpxgixV18YaASidewzfz6lFromQh2Qt5kciyc1BSNVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1pm4pcj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1pm4pcj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7031F1F000E9;
	Mon, 27 Jul 2026 08:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141254;
	bh=Lp5idYoo5HKNzHclYuJOpAZglxJbH2EMsHoo2Uhpc0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1pm4pcjgTIKnC77MPF/SNbyyCQLcjkPLUxTvSoWyDV89caDhgo0+xc1MyD1/z/SP
	 H/5iUi/qA7hWFjt4bqEwbDfuf1h8CDJeDab4qs/7lugrHfAk9NK4iT8c4oGxYGM8rD
	 lMoEbgYbtY1jrMQ9l0N3+kuC6CLwqwCTElXqxsvKjWSCpSIG4sHXY7vENygcyk1cx3
	 EJ8zZR0ealaf70YDCzsaRtu+2I4OeuH8WLnzh+kDFx7NvXu39y7dAQdTsS0aX9S8fl
	 l0sreFhk1AvyTnTYoTMQNoep6Uljh/ehIAIsD647bj2ejQ8S1sV/LU0P62N1sXXD3l
	 h+j2LKv0Q4/AA==
Date: Mon, 27 Jul 2026 10:34:11 +0200
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
Subject: Re: [PATCH v7 16/34] pinctrl: airoha: add missed IRQ resource helpers
Message-ID: <amcYA-tt4BziTjfW@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-17-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UFrN0mJLqKNpHxUR"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-17-mikhail.kshevetskiy@iopsys.eu>

--UFrN0mJLqKNpHxUR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Without hooking .irq_request_resources, gpiolib cannot set
> GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
> userspace or another driver to reconfigure an active IRQ pin as an output
>=20
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index f85941ccea560..d218a1f01648b 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2676,6 +2676,7 @@ static const struct irq_chip airoha_gpio_irq_chip =
=3D {
>  	.irq_mask_ack =3D airoha_irq_mask,
>  	.irq_set_type =3D airoha_irq_type,
>  	.flags =3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
> =20
>  static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
> --=20
> 2.53.0
>=20

--UFrN0mJLqKNpHxUR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcYAwAKCRA6cBh0uS2t
rPaEAP4p1fD3RPtbM1JEPT32QqUOEtELuFm/RjAredm8P4rzUwEAq7d2OKZgqxWm
k44l5LoEQqxt7PUXpQCB40sgQUkeGw4=
=dlSW
-----END PGP SIGNATURE-----

--UFrN0mJLqKNpHxUR--
