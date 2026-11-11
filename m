Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396476;
	b=4MZiAcgoBItuZ3YZf4WSO8/Z++dVfnqyzi7oVbQFWKSWzeLcBMfr7t61+Z/1Fd2CMICZ
	 janESsD1RSvg1Hn3dG3kOzQevPPbX6VcRA0fFpa6ARQdb5HCRe8GxRWHH62BUtlMxZC0U
	 VOoA99ffbfGaA9/if9tlozayaGk2ZAlA0BoguqKOzzg+Jfkej735lRNIbLyMV7eH2iqM+
	 YxW+OrcitwUwkcp7xzVkh6wZzJowOkG3rxORSCuH4naGfjdX2EHFVyhaUJCOxb0Kf3rwn
	 qtTl4wVQCnQype80+RotExJ+fUKIBJEWQ0SnHiSkCRpaIoudI7O8AVDMkObfF9YGwaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396476;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CisNle0adgNt9jEGJ2fMfUGTiG/LllD/flOCUw5zy2k=;
	b=O3Vg5+63hXDKVC9gVvUMKD9vh2pl0aeejb6beRoXy0IB/uX9ZnXVaD3CuqsvJfSTEq8r
	 XkBHeu3YMsu9niwQtF3umhDL7SWNwyplJMM9eEVis5/J6sPtYlHAfec0wr03jOlmCknRG
	 tWWCqgEbHw9Ck5GHalsGWqAiSunXJTRmRCPn5Llp6X+Fyy7djfLf/lyCajoSOX8cFviB/
	 XFkr7FEMVQ/urkZXIjCFWZ0p2HvlsLfneKCgNKXPIsNe2Hw/gREi6nwu2Xbn/Iewfya8u
	 6im7FGIpksM2CaDDPUOJziaf9LV9B+s2qd7culuqKBS16Arjkcbqf4I3oHKnIq7cltA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDEP7fNU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB6606A326;
	Wed, 11 Nov 2026 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDEP7fNU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B781F00A05;
	Wed, 11 Nov 2026 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794396475;
	bh=CisNle0adgNt9jEGJ2fMfUGTiG/LllD/flOCUw5zy2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cDEP7fNUn48bZ8kLQC59leIB1HUlPzXU9x0z/rVshW/4/IhNLfGz0LFz2MKWLZtjN
	 Rhaa1BTvjS0PZGC7S1aBu2zPXF4bFZ4kTkFy5YwKhNUAGlgxv47qLbbLVYuawmWSW3
	 SgYu6TaGkK05kRQlHnMl3TMNMuyUTuq9ZYzHGWU96aKggH9wcUg86GY43Z40a4yMWt
	 Z2uOBZ+3qYE3Ygkydpzp/Y4jFA5vQIGwvPdzbBxEctfRgYK6HANvJqzExjUQYpvy2e
	 y+gKSjVR87W1lenne2SB9R/VbDZe6UB0VabfdZ/TAv89evqIFAiZDAZREl01XnVR1X
	 xXesPLbn/i0rg==
Date: Wed, 11 Nov 2026 12:27:53 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH 3/7] pinctrl: airoha: make the chip SCU optional
Message-ID: <avRROTmy9oFLwJCS@lore-desk>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-4-john@phrozen.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A3sZ98eitumN/6Hf"
Content-Disposition: inline
In-Reply-To: <20261110173941.301478-4-john@phrozen.org>

--A3sZ98eitumN/6Hf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> A SoC that muxes every pin through the IOMUX block and describes no
> pin configuration has no use for the chip SCU. Skip the lookup when
> the match data names no chip SCU compatible, instead of handing a
> NULL compatible to syscon_regmap_lookup_by_compatible().
>=20
> No functional change for the existing SoCs, which all name one.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index f9ae4020b764..9116d3ded258 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -833,6 +833,22 @@ static const struct pinctrl_ops airoha_pctlops =3D {
>  	.dt_free_map =3D pinconf_generic_dt_free_map,
>  };
> =20
> +static struct regmap *
> +airoha_pinctrl_chip_scu(struct device *dev,
> +			const struct airoha_pinctrl_match_data *data)
> +{
> +	struct regmap *map;
> +
> +	if (!data->chip_scu_compatible)
> +		return NULL;

should you move this check after the first lookup?

Regards,
Lorenzo

> +
> +	map =3D syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu"=
);
> +	if (!IS_ERR_OR_NULL(map))
> +		return map;
> +
> +	return syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> +}
> +
>  int airoha_pinctrl_probe(struct platform_device *pdev)
>  {
>  	const struct airoha_pinctrl_match_data *data;
> @@ -853,12 +869,9 @@ int airoha_pinctrl_probe(struct platform_device *pde=
v)
>  	if (IS_ERR(pinctrl->regmap))
>  		return PTR_ERR(pinctrl->regmap);
> =20
> -	map =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip=
-scu");
> -	if (IS_ERR_OR_NULL(map)) {
> -		map =3D syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> -		if (IS_ERR(map))
> -			return PTR_ERR(map);
> -	}
> +	map =3D airoha_pinctrl_chip_scu(dev, data);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> =20
>  	pinctrl->chip_scu =3D map;
> =20
> --=20
> 2.34.1
>=20

--A3sZ98eitumN/6Hf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavRROQAKCRA6cBh0uS2t
rKZKAP4hQfDss2hwRFv5+/p8aTHT0BSzjyISfuDUraz+Z6e5wQD/REqJy29vBUtC
g8T6MzxN+vmO2e/FtddtNey+mQe36wU=
=dBSt
-----END PGP SIGNATURE-----

--A3sZ98eitumN/6Hf--
