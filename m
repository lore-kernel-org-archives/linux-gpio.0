Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792967378;
	b=UaTB+ZKrDgcCd+wfd62GlsxG5vXNEEWAhMhsXV9MnQbRimVomRlQr0GGTOrwzxBm+V6W
	 FBz3BJ+L0CsE1ff/lMd8N3riiA+uVov4fC0ztl6fUTWFI0ZquZkAUMzOQ2LQAWIO29TD+
	 I0OtYA2cNA8QrHPmvZeo3yhm64AbckN4RiMJxE8pyHm7rUwbGTwFfafqXpcdIEaXW+gYA
	 q0c1HcKeAqFzBMntoq/VH56G3LZU/Rr/jHY94c69B6JBTpO97dzPonZG0Pbz3NmjvaXtM
	 JtN6XpmvDn/CozTIKIPRrUAfT5YW82Dmgv9nfM2M/zNxrCoA++XkktIJt57lbRChomw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967378;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=HKzZ5g1XoN4a0BsqxURNktW8BE+WmbOapV1COb4TpIM=;
	b=GrHA9J2jD+q98/r4ca9repnDszCL7X/i9ejsO3y65jUXo7jdB5ZfcANa3x5A4RpEITcv
	 koQA56WDt62JxVYtrO3/IqnwwLCCVMePquXZ0/HZupKrLBwTyxLHlDeN3Ov8DBqmbtjgY
	 HE1oPM3l4k9+ykZt1tW5NlEt+ehrMc5lgY4UEB/0aQxN8agHYfl0+Spp+mlAt0a5zmmFG
	 lzI6dWbiMJBhise9wR3QCuk0rL9p+CkPCqp7m0CFTOeQz3sjXjhpdSFiN13NdttaNX8rC
	 v14QRICFMEr4Zj7qo75gYSjJLdjp3tfXhIy1AgaGVwrRdR3bZraq0eCJnf/QqY0twGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830FB606A31A;
	Sun, 25 Oct 2026 22:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <135116cece53ecfa827748bf6ab024e1ee0cddc8.camel@crapouillou.net>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: Add X1600 groups for each I2S
 system clock
From: Paul Cercueil <paul@crapouillou.net>
To: Olivier Louvignes <olivier@mgcrea.io>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 25 Oct 2026 23:29:30 +0100
In-Reply-To: <20261023204207.48277-1-olivier@mgcrea.io>
References: <20261023204207.48277-1-olivier@mgcrea.io>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Olivier,

Le vendredi 23 octobre 2026 =C3=A0 22:42 +0200, Olivier Louvignes a =C3=A9c=
rit=C2=A0:
> The X1600 has a system clock (MCLK) pin for each direction: PB22 for
> receive, PB26 for transmit. "i2s-sysclk" takes both, which a board
> that
> only plays cannot use when PB22 has another job. Add "i2s-sysclk-rx"
> and
> "i2s-sysclk-tx" for one each.
>=20
> Used on a HiBy R1, which only plays and has an interrupt input on
> PB22:
> its DAC takes MCLK from "i2s-sysclk-tx".
>=20
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 1aa6a6dc1209..28e7f1852054 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2411,6 +2411,8 @@ static int x1600_i2s_data_rx_pins[] =3D { 0x35,
> };
> =C2=A0static int x1600_i2s_clk_rx_pins[] =3D { 0x37, 0x38, };
> =C2=A0static int x1600_i2s_clk_tx_pins[] =3D { 0x3b, 0x3c, };
> =C2=A0static int x1600_i2s_sysclk_pins[] =3D { 0x36, 0x3a, };
> +static int x1600_i2s_sysclk_rx_pins[] =3D { 0x36, };
> +static int x1600_i2s_sysclk_tx_pins[] =3D { 0x3a, };
> =C2=A0
> =C2=A0static int x1600_cim_pins[] =3D {
> =C2=A0	0x14, 0x16, 0x15, 0x18, 0x13,
> @@ -2493,6 +2495,8 @@ static const struct group_desc x1600_groups[] =3D
> {
> =C2=A0	INGENIC_PIN_GROUP("i2s-clk-rx", x1600_i2s_clk_rx, 0),
> =C2=A0	INGENIC_PIN_GROUP("i2s-clk-tx", x1600_i2s_clk_tx, 0),
> =C2=A0	INGENIC_PIN_GROUP("i2s-sysclk", x1600_i2s_sysclk, 0),
> +	INGENIC_PIN_GROUP("i2s-sysclk-rx", x1600_i2s_sysclk_rx, 0),
> +	INGENIC_PIN_GROUP("i2s-sysclk-tx", x1600_i2s_sysclk_tx, 0),
> =C2=A0	INGENIC_PIN_GROUP("cim-data", x1600_cim, 2),
> =C2=A0	INGENIC_PIN_GROUP("slcd-8bit", x1600_slcd_8bit, 1),
> =C2=A0	INGENIC_PIN_GROUP("slcd-16bit", x1600_slcd_16bit, 1),
> @@ -2539,6 +2543,7 @@ static const char * const x1600_i2c1_groups[] =3D
> { "i2c1-data-b-15", "i2c1-data-b
> =C2=A0
> =C2=A0static const char * const x1600_i2s_groups[] =3D {
> =C2=A0	"i2s-data-tx", "i2s-data-rx", "i2s-clk-rx", "i2s-clk-tx",
> "i2s-sysclk",
> +	"i2s-sysclk-rx", "i2s-sysclk-tx",
> =C2=A0};
> =C2=A0
> =C2=A0static const char * const x1600_cim_groups[] =3D { "cim-data", };
>=20
> base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
