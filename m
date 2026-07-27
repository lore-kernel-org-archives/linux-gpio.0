Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D753E075F;
	Mon, 27 Jul 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138434; cv=none; b=HLeMdzJ95BeJXYrKBoc1fmk1zCBzGSxi9VBovnDsQyFWIbLS2GxDq9y83yf2h/fNZqwyyHddY7HHJ4/QKewWgJIxko9uUtAiT+/D/nTEHjFgnb+8eqlIv07a6OKeX9kBusNCnTB3BkEYzE+WF0fXOW6wE2vH6z1nwtyIBwAftrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138434; c=relaxed/simple;
	bh=PdlIvC1ylkR5/yExKtaaF+hhPq9sq3DgmKSHYbc+ucI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3eGK5x5alaWJvPevJvDuDSMx7uGNH2BSUkvwmKYeWFmTkaFkzYiXUZR1G8nBqCSnI8aOdgkFXzZ+uvpj23eMzp2RxhYyvRXY39DJD9DRjuMTwfGxJgxtYkWWh8xKR51MovF9gnxszDAgexSwva4v/QsjfYgjRTXLkhJVHHoWHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdwsFLT7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdwsFLT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCED1F000E9;
	Mon, 27 Jul 2026 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138432;
	bh=yPyKb7BFsQjo4SS+XShKcyqwwsD2KQ/27NhoHTUy7eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MdwsFLT76HRon/wjSmQ9VlobV2YPXn86eDHf62h4wOlwTM0y9/1DGS7yZTMYJgC6k
	 CphyOlFHYW96+uRBLRgHaDfSx9+ouwWyGTVQe/vPo7BUR2hU4UUj8W4tDUTv51bykl
	 HSk6NnusiT4BvKxYOZkdc1QiArAQbPhlIO+4pC869USL0ciMo6UVJqFSASHNpzL3O8
	 ipsLNLh/xFUKGlZ9Qf7qPoHWzXEJfPyycX64sFIQSLS2jDhGPvYbKKVmr9Pgg0nMAA
	 ++3/We6U0EfPQe6GM9mDN34RJ6OTjEbcSuZ/6YfF8MxgK08fwEUd1i0QEHN+FX9DFg
	 l3OQxhV6d1czA==
Date: Mon, 27 Jul 2026 09:47:10 +0200
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
Subject: Re: [PATCH v7 02/34] dt-bindings: pinctrl: airoha: en7581: fix pwm
 pin-groups
Message-ID: <amcM_m1-6Yryrlaw@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-3-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="68hmevubpc3NW3MB"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-3-mikhail.kshevetskiy@iopsys.eu>

--68hmevubpc3NW3MB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> According to commit 08a5af468e613b ("pinctrl: airoha: fix pwm pin function
> for an7581 and an7583") there is no gpio47 pin-group, so device schema mu=
st
> be fixed.

same here, missing Fixes tag.

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
> index 0c5a7eb6d563e..12dd85b5b4105 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -208,7 +208,7 @@ patternProperties:
>                           gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
>                           gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
>                           gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> -                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
> +                         gpio42, gpio43, gpio44, gpio45, gpio46]
>            - if:
>                properties:
>                  function:
> --=20
> 2.53.0
>=20

--68hmevubpc3NW3MB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcM/gAKCRA6cBh0uS2t
rMYMAP9NbE0w4c3+D9LiCgsQAAjHepf9yd7vRp0bp/VwFb9DRQEAvS9IpGp7y6bB
tThVcEzcwcLpe8zNBsnv6g32z7Cv5g0=
=HFbe
-----END PGP SIGNATURE-----

--68hmevubpc3NW3MB--
