Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792967498;
	b=r28xxW2mO4kx86d50jJtBsLMjcNa+AvRgb5y4tFp9ojQc1rIeVx+DA3+viFM24eknZq/
	 ojn7Cf0qDHHt0lKHoFbkl0IGqOQGtyvp8Bume/CIz8GBT5ZqS+xOqRD7wXLqa9saFwBjV
	 IXHTw+xZuxoqdnAaXEZueqQQf2HcIhbLdQ5YL7Cb2AuI9FLmpaLbpfqqPcLS4wVffYnlI
	 iYXruybVbqTCNhZxImfYM5GI9GYTyMkLSjex+nuRQaBa86YBWyHizm6NSt9CCs3XZ/oUS
	 BbeWmBLQub2WmlahWhLYHU8wrlJQoLLmfjcN4ClJdA7FfZCy3hg9EU8XnUSL3i/atpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967498;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=kvsFufnN8TCy3hzIcRjlITrtPYeicM3sDfMk6fgP6A8=;
	b=oiDROsF9nmo/JFW2CxRjYTHTx0Isyv2sgfp45kvjdDTTAaHtdxtvZAKivuj3EMoCllkt
	 oK/d34eoq320yW48Cx+I3tAQd1G5bnBINVPtvPAd0AWpnLGBSjqHO2i5EqQIpOstMee9H
	 qEZD7flZCnLRqXjhRMLNQS6CfIpsIP9P3EVEmhL6GXQJwtzSg7tkhQMXbdw44lwdP5srt
	 u69r4m1IHPhRr5m7QgQPvmjP/2OVPzvyLPBS6KPBHkgZKZ4sA6HsIE5GGE50kd4A7efLI
	 Ix6T4RYp4VlcCeYxgUtbMn24adfcrYWMZW4z9BELOxMvCLezXyG5AxyBsw6PH/xcWRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD0606A31A;
	Sun, 25 Oct 2026 22:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BD0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <6bb2bc39075c38e352be9b71b0683796c893f000.camel@crapouillou.net>
Subject: Re: [PATCH 2/2] pinctrl: ingenic: Add an X1600 group for 18-bit RGB
 on the top lines
From: Paul Cercueil <paul@crapouillou.net>
To: Olivier Louvignes <olivier@mgcrea.io>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 25 Oct 2026 23:31:32 +0100
In-Reply-To: <20261023204207.48277-2-olivier@mgcrea.io>
References: <20261023204207.48277-1-olivier@mgcrea.io>
	 <20261023204207.48277-2-olivier@mgcrea.io>
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
> Boards that wire an 18-bit panel to the six most significant lines of
> each colour leave PA0, PA1, PA8, PA9, PA16 and PA17 free for other
> uses,
> which the cumulative lcd-16bit and lcd-18bit groups would take. Add
> "lcd-18bit-msb" for that wiring.
>=20
> Used on a HiBy R1, which drives its panel this way and uses PA0, PA1,
> PA16 and PA17 as GPIOs.
>=20
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Ugh, what a weird setup...

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 14 +++++++++++++-
> =C2=A01 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 28e7f1852054..8c424db27fd5 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2442,6 +2442,17 @@ static int x1600_lcd_24bit_pins[] =3D {
> =C2=A0	0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
> =C2=A0};
> =C2=A0
> +/*
> + * 18-bit RGB on the six most significant lines of each colour of
> the 24-bit
> + * bus, with the clock, data enable and syncs.
> + */
> +static int x1600_lcd_18bit_msb_pins[] =3D {
> +	0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> +	0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
> +	0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
> +	0x18, 0x19, 0x1a, 0x1b,
> +};
> +
> =C2=A0static int x1600_pwm_pwm0_pins[] =3D { 0x40, };
> =C2=A0static int x1600_pwm_pwm1_pins[] =3D { 0x41, };
> =C2=A0static int x1600_pwm_pwm2_pins[] =3D { 0x42, };
> @@ -2503,6 +2514,7 @@ static const struct group_desc x1600_groups[] =3D
> {
> =C2=A0	INGENIC_PIN_GROUP("lcd-16bit", x1600_lcd_16bit, 0),
> =C2=A0	INGENIC_PIN_GROUP("lcd-18bit", x1600_lcd_18bit, 0),
> =C2=A0	INGENIC_PIN_GROUP("lcd-24bit", x1600_lcd_24bit, 0),
> +	INGENIC_PIN_GROUP("lcd-18bit-msb", x1600_lcd_18bit_msb, 0),
> =C2=A0	INGENIC_PIN_GROUP("pwm0", x1600_pwm_pwm0, 0),
> =C2=A0	INGENIC_PIN_GROUP("pwm1", x1600_pwm_pwm1, 0),
> =C2=A0	INGENIC_PIN_GROUP("pwm2", x1600_pwm_pwm2, 0),
> @@ -2549,7 +2561,7 @@ static const char * const x1600_i2s_groups[] =3D
> {
> =C2=A0static const char * const x1600_cim_groups[] =3D { "cim-data", };
> =C2=A0
> =C2=A0static const char * const x1600_lcd_groups[] =3D { "slcd-8bit", "sl=
cd-
> 16bit",
> -	"lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-no-pins",
> +	"lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-18bit-msb",
> "lcd-no-pins",
> =C2=A0};
> =C2=A0
> =C2=A0static const char * const x1600_pwm0_groups[] =3D { "pwm0", };
