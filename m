Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C251FF7C5;
	Mon, 27 Jul 2026 07:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138712; cv=none; b=FkQ1s0FA1CjNyHwRBE4YD7Zux3toy8LrWggTc4gLhttXx4Cu9dU5lf011WcOcVekaeQusfJ3+JdXS8v+yELJFr2FfWQlkh8GwHpenoup6F9EuAyG/iFEGIBZ07RT20rV6xLgeyd9yI5iCDjWJ4p2BX091mGsadJR3/EWsChHriE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138712; c=relaxed/simple;
	bh=qRjkuGCy8dbLNrtuBAOQRAWIOMcRFgCtfnRwSgilL14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4s94x4dqGwWrnfd8eGZH+f4AtMj1/fVeFj54YvQ6YV37VkdaEUTSRAb9fsUWXgyqJerR8FoPEnNVIDRhbueKz/vv8HTPJgTG9MhtyVWSPTeYjSp8EqohsXUaeNSb8sx9ExYxRJGI2PF3qps576tsQ2LDyS5tk89h7xi9X1o2bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeXGQOnd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeXGQOnd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371541F000E9;
	Mon, 27 Jul 2026 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138710;
	bh=+IxRovoq9XtBcShXWzQQeNdxeVmm7PUQrI7CzJo6AvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JeXGQOndaGtZtfRsO98QQAdmabnizC20VUXNi/trbR3OmAiplUt34RJWHamm24VsZ
	 5c310sgJUKTqBOwac57TBBAYzccEcfAivtEEvouOJwCCQqeViGlvGouGWUwQ4vGGGn
	 AWUdq82T+P85BI7hWE+8KmesJmWSKGuLWSTX617c0+F49oCMHS/m34M49oXaczGj0H
	 C/r8yMRnjz2CYl8tht2zLUcXn3TfG5N7/jQ4w8PY3bgHEqHfLb5YdGGdup7k0iAmUq
	 BNFgvDk6tSbYiOv4IfrTYxr6g6a1nmGk7zC6hp+BTEoioUt7A27NkIan1HnMXaI3mq
	 muSUrXC8wDVjg==
Date: Mon, 27 Jul 2026 09:51:48 +0200
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
Subject: Re: [PATCH v7 07/34] dt-bindings: pinctrl: airoha: an7583: remove
 i2c pin function
Message-ID: <amcOFF1SC7ZLsfTu@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-8-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="07ipRKdS5zCt5UWQ"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-8-mikhail.kshevetskiy@iopsys.eu>

--07ipRKdS5zCt5UWQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In the AN7583 case there are no mux bits to enable i2c buses, so remove i=
2c
> pin function from device tree binding schema.

missing Fixes tag.

Regards,
Lorenzo

>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml
> index f52802a3ad79d..8d8ec6adb97d1 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -60,7 +60,7 @@ patternProperties:
>            function:
>              description:
>                A string containing the name of the function to mux to the=
 group.
> -            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
> +            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
>                     pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
>                     phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
>                     phy3_led1, phy4_led1]
> @@ -117,14 +117,6 @@ patternProperties:
>                      enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
>                             uart4, uart5]
>                    maxItems: 2
> -          - if:
> -              properties:
> -                function:
> -                  const: i2c
> -            then:
> -              properties:
> -                groups:
> -                  enum: [i2c1]
>            - if:
>                properties:
>                  function:
> --=20
> 2.53.0
>=20

--07ipRKdS5zCt5UWQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcOFAAKCRA6cBh0uS2t
rBj/AQC/aEM3dF5r71ZSTacRwitCCucAqnr9FQPMRIw1iXwS9QD/RKdIaGDpezBF
xfWzoz8y+EXxL4L/vG7+5EJdx8jiEA8=
=+2wr
-----END PGP SIGNATURE-----

--07ipRKdS5zCt5UWQ--
