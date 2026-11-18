Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993832;
	b=izX9a0NT62JY6CKJMZgnZJQ2pZU0ZA5w1Nll6hJY8YMUD3eqb0Qe6s/TTRvQqG+0TcQw
	 7fUHVFGZ/xbzOXSyjB6QHwt7xM0qWZog2UnyOwMOsQ7N6pxlaC3sCfPER0vnzJyo4ZETf
	 CAFAPfx9xSgHyY9GgxZYXKoMYzGUzhQwvbVdb19gMhswRLAZH0JMfrG4/Y5NDSkOs8dAC
	 mYhTz8w58RTPIor/AFAkHuhLXVQ8TI8oh/1eOHtq+O+9m4X4n/sZb7sd/6gEzkGSJzRIK
	 TsFCUMwybYsvdIFkOapKayyuWECX0wGC3Sgn01LE6peglPq8IZRy0QkiAzPolGHX0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993832;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=2UlbSEc0hZRJ/ZmyoonhcuH+SMR/HtmRC3vztHtDCYQ=;
	b=TOgE+cYT52yzONSyu1Gs1Dqp2ywlN2K/T8eN5gN5CjcUF4MJZc3rex02Zw4PUrWo8fAJ
	 aai7dP/0pYHTdyduFa4AFVaUGuvfaEx7nVZvbUtGxDAZMOMSV9kAxe+FJ4ZT0yx8tNjrp
	 je+oorQmKG22W1G444AYFS320Rlu4fS8pFBNeAagSWkiHCzL/nUyHpIVhx+4sArbvz012
	 1w47CG4MgJkA8oZjuqa7Xp7wi0WTo3R1W9Znxa7jU8a4bSK+lXyMLgSj5+GAig6iFH5J/
	 T5YrLsNWpxiDnkQKMBn1JwzZc+4BnANNeRTiHHvqDDc40R6Be3n+wIoEApNmxQ6jJng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BC6606A31C;
	Wed, 18 Nov 2026 09:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <3fb43f9b95a00bddb6ee2f6cd9a7491a5a499362.camel@crapouillou.net>
Subject: Re: [PATCH v3 4/7] pinctrl: ingenic: Add X2600 register and GPIO
 IRQ support
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Wed, 18 Nov 2026 10:23:46 +0100
In-Reply-To: <ccaaca07b0b6764ce65ad746bfeb9efd362c3bde.1794987700.git.hns@goldelico.com>
References: <cover.1794987700.git.hns@goldelico.com>
	 <ccaaca07b0b6764ce65ad746bfeb9efd362c3bde.1794987700.git.hns@goldelico.com>
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

Hi Nikolaus,

Le mercredi 18 novembre 2026 =C3=A0 08:41 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
> Support the X2600 GPIO register layout with a 0x1000 bank stride,
> per-port shadow registers and load registers. The GPIO interrupt
> acknowledgement uses the existing JZ4770 flag-clear register path.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---

Please add a changelog per patch right here, otherwise it's a bit hard to f=
ollow
what changed...

> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 50 ++++++++++++++++++++++++----=
---
> =C2=A01 file changed, 40 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-
> ingenic.c
> index dc5d38c16e18d..4f1b096a3ac8e 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -70,6 +70,9 @@
> =C2=A0#define X2000_GPIO_SR				0xd0
> =C2=A0#define X2000_GPIO_SMT				0xe0
> =C2=A0
> +#define X2600_GPIO_SHADOW_OFFSET		0x800
> +#define X2600_GPIO_PAGLD			(X2600_GPIO_SHADOW_OFFSET +
> 0xf0)
> +
> =C2=A0#define REG_SET(x)					((x) + 0x4)
> =C2=A0#define REG_CLEAR(x)				((x) + 0x8)
> =C2=A0
> @@ -114,6 +117,7 @@ enum jz_version {
> =C2=A0	ID_X1600,
> =C2=A0	ID_X2000,
> =C2=A0	ID_X2100,
> +	ID_X2600,
> =C2=A0};
> =C2=A0
> =C2=A0struct ingenic_chip_info {
> @@ -164,7 +168,8 @@ static const unsigned long enabled_socs =3D
> =C2=A0	IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
> =C2=A0	IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
> =C2=A0	IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
> -	IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
> +	IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100 |
> +	IS_ENABLED(CONFIG_MACH_X2600) << ID_X2600;
> =C2=A0
> =C2=A0static bool
> =C2=A0is_soc(const struct ingenic_pinctrl *jzpc, enum jz_version version)
> @@ -3549,15 +3554,21 @@ static void ingenic_gpio_shadow_set_bit(struct
> ingenic_gpio_chip *jzgc,
> =C2=A0	else
> =C2=A0		reg =3D REG_CLEAR(reg);
> =C2=A0
> -	regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
> -			jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
> +	if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> +		regmap_write(jzgc->jzpc->map, jzgc->reg_base +
> X2600_GPIO_SHADOW_OFFSET + reg,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 BIT(offset));
> +	else
> +		regmap_write(jzgc->jzpc->map, REG_PZ_BASE(jzgc->jzpc->info-
> >reg_offset) + reg,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 BIT(offset));
> =C2=A0}
> =C2=A0
> =C2=A0static void ingenic_gpio_shadow_set_bit_load(struct ingenic_gpio_ch=
ip *jzgc)
> =C2=A0{
> -	regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(
> -			jzgc->jzpc->info->reg_offset),
> -			jzgc->gc.base / PINS_PER_GPIO_CHIP);
> +	if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> +		regmap_write(jzgc->jzpc->map, jzgc->reg_base +
> X2600_GPIO_PAGLD, 1);
> +	else
> +		regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(jzgc->jzpc->info-
> >reg_offset),
> +			=C2=A0=C2=A0=C2=A0=C2=A0 jzgc->gc.base / PINS_PER_GPIO_CHIP);
> =C2=A0}
> =C2=A0
> =C2=A0static void jz4730_gpio_set_bits(struct ingenic_gpio_chip *jzgc,
> @@ -3856,16 +3867,35 @@ static inline void ingenic_shadow_config_pin(stru=
ct
> ingenic_pinctrl *jzpc,
> =C2=A0		unsigned int pin, u8 reg, bool set)
> =C2=A0{
> =C2=A0	unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
> +	unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> +
> +	if (set)
> +		reg =3D REG_SET(reg);
> +	else
> +		reg =3D REG_CLEAR(reg);
> =C2=A0
> -	regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
> -			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
> +	if (is_soc_or_above(jzpc, ID_X2600)) {
> +		u32 target_reg =3D (offt * jzpc->info->reg_offset) +
> X2600_GPIO_SHADOW_OFFSET + reg;
> +
> +		regmap_write(jzpc->map, target_reg, BIT(idx));
> +	} else {
> +		regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
> reg, BIT(idx));
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0static inline void ingenic_shadow_config_pin_load(struct ingenic_pi=
nctrl
> *jzpc,
> =C2=A0		unsigned int pin)
> =C2=A0{
> -	regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset),
> -			pin / PINS_PER_GPIO_CHIP);
> +	unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> +
> +	if (is_soc_or_above(jzpc, ID_X2600)) {
> +		u32 target_load_reg =3D (offt * jzpc->info->reg_offset) +
> X2600_GPIO_PAGLD;
> +
> +		regmap_write(jzpc->map, target_load_reg, 1);
> +	} else {
> +		regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info-
> >reg_offset),
> +			=C2=A0=C2=A0=C2=A0=C2=A0 pin / PINS_PER_GPIO_CHIP);

Just reuse "offt" here.

Cheers,
-Paul
