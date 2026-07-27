Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571363E2ABC;
	Mon, 27 Jul 2026 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138404; cv=none; b=IWnMIYfk0RAjaiy/J647mWr/qkoEx4wPgh4VfoAWDc78ifKZbew4YgzpBqP5NWQJEHu2RrpEduxwhJgScfLx4t3mQ45YGmnLkNgVaT5EfO2Y3bcZ6v5Cr5RMEYreC0tlVc9c898aVmbWjwsEDtNdgK3zWpA6gT83pW3Hh0trfwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138404; c=relaxed/simple;
	bh=UgZWfC+yAhLUVXRNm5qq0HANz2JnIwX+YP3EXxM8HrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tINJcfejWi1M0TcpicnFKP0nCJxtpQQA+Y5vJ0r8cnoqb74swfGkjE1d8+TN0epO3haereaYQyIFCty1LmGykNLopyvavia73CmtZFLS2n9og7qN01gZ1YGrIW/otlIrPPmh3VWCfPhxlEJawess2Cz1rlJx58X35LssIy5HYvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bia0mR1i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bia0mR1i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A551F00ACA;
	Mon, 27 Jul 2026 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138402;
	bh=nUU5RcEXjAmJ2/SyjDJhoIwk9S9Pp0S6+hdCM7CDcsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bia0mR1itz5OxQYNG/0tIN1+vnJ8dT5R1XybBLEohUY4mySxZBaOQuXbuFcbX7n0H
	 8Uxw3+F3ucdsa4KIfWrPI0bSgN1e41jkJAQoNJitdl7ckfNutncydKX+iniNG8mqW0
	 N90Jbsd2hV7m0NS9OmxJniK7/zgRLm83icok2U9Bcfsv6UOJSY9p9PQ+5pd6J23N/F
	 KavmAMMXfjcYQcBt/9hDYgcSm9xV5Gxca9lHk1YlCNV7+dAc4YzWCDmuw2VKKUl5CM
	 Gb9zFAOxxKt4G70C23wrlkOv/siAs5XehfFWfZSUTiLPICbJyS//QaxD+LNl2DlnA5
	 0OrnT+hmleGHw==
Date: Mon, 27 Jul 2026 09:46:40 +0200
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
Subject: Re: [PATCH v7 01/34] dt-bindings: pinctrl: airoha: en7581: fix
 misprint in i2s function name
Message-ID: <amcM4L8LMu0UID_g@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-2-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="29sDINoIy+yZrchw"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-2-mikhail.kshevetskiy@iopsys.eu>

--29sDINoIy+yZrchw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> i2s pin-function is missed, instead i2c pin-function defined twice. The
> second of them operates with i2s pin-group.
>=20
> The patch fixes the misprint. It also match actual pinctrl driver.

I guess you shold add a Fixes tag here.

Regards,
Lorenzo

>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.=
yaml
> index 21fd4f1ba78b0..0c5a7eb6d563e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -166,7 +166,7 @@ patternProperties:
>            - if:
>                properties:
>                  function:
> -                  const: i2c
> +                  const: i2s
>              then:
>                properties:
>                  groups:
> --=20
> 2.53.0
>=20

--29sDINoIy+yZrchw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcM4AAKCRA6cBh0uS2t
rAfwAQC73qPOnX7i6PBGFXOyWks8gimPvWJJzpH3mzTDrU9SxgD+LnV3B4lgdjRj
PzTRLyyWvRM69ourXgmlWbSawvX1Dgo=
=r+k4
-----END PGP SIGNATURE-----

--29sDINoIy+yZrchw--
