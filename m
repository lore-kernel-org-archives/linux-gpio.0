Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396579;
	b=o6V+gqKaguoMowPCVtVWUyrJ9qxl2yA1/5Va+FfRNGkX1bY6y3D//vLMU5OVAdZTDV1k
	 2GSdc4p9tf7lwZt5ezAWBlKpqqj/2MtwfE4aK7TkMQYFByb3bAB0cT6cXF3jQLkzUG3X3
	 MZtxvj2BfLlXvS/dn9uYrJmNf26AVEgAh/olwdU5JrA47Otm4cgQZo2SBmtnDdSjXEuHl
	 5KNH3mBD3vh1CXD7PSbuG9f90e70oVmnf75PlBiEQZ+BNtAjoJrb3pltW78bqK3w4dLTH
	 +J4EHQcNwoY1dmk40ET+AkinjxR+tEw7DwjR2jsvL0o+33g7BucsA1PxA/V3P+XMTQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396579;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nB1flizO6uB7iFQMRV+Ko/XwuLe+88pnNTnOA5soo+4=;
	b=cAkiMW4cTrchWgHH21D2LiQsibKnj3yS1l50Ejphqb4hJu9NHBjn3hyqzuPTljRs35rf
	 usF9pSRdfqyt5RqSXh4fpzCiNtTkWMmGGb8K1a0vsHvfZyQM7g41VkQejk/pgrhjXu375
	 hoCgVtxpjxQoIKOI/G24rbHqbXdHVyGTH7dkw985J/VtlarwD61UVwTU7E4XHFEEaAvIB
	 m0NMo/BKYl7Xtu3LUtiAmy10arQKRrTMi/OU2eSEG4hJ6jwRW8hA6SzISoyQzIuZWnCQL
	 ShjO6ZexBdrlRhFAtcIVecgdM8unGPPVna+Q6DsWDYeNmcPNsLV8XcnP6k8PiLf5PMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zr3nySW5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15195606A31C;
	Wed, 11 Nov 2026 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zr3nySW5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368781F00A05;
	Wed, 11 Nov 2026 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794396578;
	bh=nB1flizO6uB7iFQMRV+Ko/XwuLe+88pnNTnOA5soo+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zr3nySW59a+Dg0cCtBbxm31VtBek5LH8Au8VdWiweBNt9mLGGDAyMwFVhClskAM2s
	 N8DyNG8L3N944lERbZsuts/GfyxZxjydKVa1O33ORPvSwo2VJiYjKzwbDIq7P/MzXH
	 4tNvSiQvS+jlXPMt+vepqCAiBt/sz8vZKHDmBFs+KrBGH3lx8o38PbIPYmlaoyuFS/
	 BwEFPBgGzkvhjoKXG+zI7VpnBGM+8LahX5XbYTf3r2XREjbNYo7fao0igHRR6p87Yg
	 58buqCkC7qy962NY7yKUT4KpI5U93yWBc1pWvWt6HEa6uAn+WlB3djrKHXN4xTBS+q
	 oSmryLscNI30g==
Date: Wed, 11 Nov 2026 12:29:36 +0100
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
Subject: Re: [PATCH 6/7] pinctrl: airoha: move the GPIO register offsets to
 the common header
Message-ID: <avRRoCRYZnhx1dnk@lore-desk>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-7-john@phrozen.org>
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
	protocol="application/pgp-signature"; boundary="EoDU/m3tfAAmliEx"
Content-Disposition: inline
In-Reply-To: <20261110173941.301478-7-john@phrozen.org>

--EoDU/m3tfAAmliEx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The GPIO register offsets are private to pinctrl-airoha.c, which builds
> the shared 64 pin register table from them. A SoC with more GPIO banks
> needs its own table, built from the same offsets and its own for the
> extra banks.
>=20
> Move the offsets to airoha-common.h so the SoC drivers can use them.
>=20
> No functional change.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/pinctrl/airoha/airoha-common.h  | 20 ++++++++++++++++++++
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 20 --------------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/air=
oha/airoha-common.h
> index adfce89493f0..dc9b897ea77c 100644
> --- a/drivers/pinctrl/airoha/airoha-common.h
> +++ b/drivers/pinctrl/airoha/airoha-common.h
> @@ -34,6 +34,26 @@
>  #include "../pinconf.h"
>  #include "../pinmux.h"
> =20
> +/* GPIOs */
> +#define REG_GPIO_CTRL				0x0000
> +#define REG_GPIO_DATA				0x0004
> +#define REG_GPIO_INT				0x0008
> +#define REG_GPIO_INT_EDGE			0x000c
> +#define REG_GPIO_INT_LEVEL			0x0010
> +#define REG_GPIO_OE				0x0014
> +#define REG_GPIO_CTRL1				0x0020
> +#define REG_GPIO_CTRL2				0x0060
> +#define REG_GPIO_CTRL3				0x0064
> +#define REG_GPIO_DATA1				0x0070
> +#define REG_GPIO_OE1				0x0078
> +#define REG_GPIO_INT1				0x007c
> +#define REG_GPIO_INT_EDGE1			0x0080
> +#define REG_GPIO_INT_EDGE2			0x0084
> +#define REG_GPIO_INT_EDGE3			0x0088
> +#define REG_GPIO_INT_LEVEL1			0x008c
> +#define REG_GPIO_INT_LEVEL2			0x0090
> +#define REG_GPIO_INT_LEVEL3			0x0094
> +
>  #define AIROHA_NUM_PINS				64
>  #define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
>  #define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index a805f542bc7b..8f901f251c00 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -7,26 +7,6 @@
> =20
>  #include "airoha-common.h"
> =20
> -/* GPIOs */
> -#define REG_GPIO_CTRL				0x0000
> -#define REG_GPIO_DATA				0x0004
> -#define REG_GPIO_INT				0x0008
> -#define REG_GPIO_INT_EDGE			0x000c
> -#define REG_GPIO_INT_LEVEL			0x0010
> -#define REG_GPIO_OE				0x0014
> -#define REG_GPIO_CTRL1				0x0020
> -#define REG_GPIO_CTRL2				0x0060
> -#define REG_GPIO_CTRL3				0x0064
> -#define REG_GPIO_DATA1				0x0070
> -#define REG_GPIO_OE1				0x0078
> -#define REG_GPIO_INT1				0x007c
> -#define REG_GPIO_INT_EDGE1			0x0080
> -#define REG_GPIO_INT_EDGE2			0x0084
> -#define REG_GPIO_INT_EDGE3			0x0088
> -#define REG_GPIO_INT_LEVEL1			0x008c
> -#define REG_GPIO_INT_LEVEL2			0x0090
> -#define REG_GPIO_INT_LEVEL3			0x0094
> -
>  #define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
>  	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
>  				(pin), (val))
> --=20
> 2.34.1
>=20

--EoDU/m3tfAAmliEx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavRRoAAKCRA6cBh0uS2t
rNtIAP9YA+4HYdVSVijK5Kt60x1yVJSHf4hv44tps1dOQDZXmwD/eewSFReRqe8v
dLDBFNkJ2t1DiU6CZEhLsdPNd4eK7w8=
=gyZ2
-----END PGP SIGNATURE-----

--EoDU/m3tfAAmliEx--
