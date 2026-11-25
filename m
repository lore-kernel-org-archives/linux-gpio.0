Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617075;
	b=oBOiF4z0zgeZPHFGaORFaPYTiTKE4ZPLoJ4Cwb4MzvBN/WInolv8HF13XtrkJDtgsEoV
	 3ctJCNjGtu5Ibm01fEe900ZGjzIFcP6QJNEaTS+aajJaRh+1exRmBQkCaU1flFKfkTn9O
	 SSG8mm1i17X3SNDR1BXW030SD1RaZPhl4TwXh2IX/Km+sV1OyEP2V43OLFJKKTrzjMtRS
	 R/pXiom7YtP3e+NvqQ2t7NDtPYGX9U4QzIZTI8yAM5YNGL46TdZrRso8iE+MzYiUlX+36
	 8ktnxfmDA5W7vGNBg+3CnOw7ALkKp6Tvs4+RP+zWCy6UtLqzyEv4INQkP/W1vvRpidQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617075;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=WQtcyjw8JKqkZs2d3/wdzyAux+9tJnOBG0boZP5/AkE=;
	b=Msp7sBFL8dHj12fPN9o/czjD7Lsi8y24WuJSZa7cnfmbIgYCLZlAQopYipswXGZNkuDE
	 XayulepjxLQeFHU45zCkiYaEEIOfCyNwB+/wCeG/H4gCUE0iX83d0cUYiMnMHyeDnnPfg
	 WwrshCh3hCk9nCQXtU2ZTbgOeNi/MhXwkMsAR0PbZC61LfE/KI1ybAdd3DpLbeSWc/Ca7
	 uBPyDeBoZ8mEenl23KcIBM9JB4XlUqEeV+N7hFcjIgz07ReJFabxoVBNh/Mbxo/IoRB75
	 Oci+i9sJzVBryjlw9wiLEAh4eBpAnEFSR5CiFcI8GhsD+NpMxULd7Rq4iTwIuJxAuUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7D606A31E;
	Wed, 25 Nov 2026 14:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA7D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <3d36729dd0879cbf3a50d9e019ab50add419aafc.camel@crapouillou.net>
Subject: Re: [PATCH v5 4/7] pinctrl: ingenic: Add X2600 register and GPIO
 IRQ support
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Wed, 25 Nov 2026 15:31:02 +0100
In-Reply-To: <3bc16a8db9bd914856d8c167734ac74d8bc7fd75.1795589383.git.hns@goldelico.com>
References: <cover.1795589383.git.hns@goldelico.com>
	 <3bc16a8db9bd914856d8c167734ac74d8bc7fd75.1795589383.git.hns@goldelico.com>
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

Le mercredi 25 novembre 2026 =C3=A0 07:49 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
> Support the X2600 GPIO register layout with a 0x1000 bank stride,
> per-port shadow registers and load registers. The GPIO interrupt
> acknowledgement uses the existing JZ4770 flag-clear register path.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Changes V5:
> =C2=A0=C2=A0=C2=A0 - Separate shadow-register base address calculation fr=
om
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET/CLEAR register selection and consolida=
te the regmap_write()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 calls in ingenic_shadow_config_pin() and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ingenic_gpio_shadow_set_bit(), as suggeste=
d by Paul Cercueil.
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 Changes V4:
> =C2=A0=C2=A0=C2=A0 - Simplify the GPIO port index used for the legacy glo=
bal shadow-load
> register.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (suggested by Paul Cercueil)
>=20
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 51 +++++++++++++++++++++++-----=
---
> =C2=A01 file changed, 38 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-
> ingenic.c
> index 7f65f3abf05f5..2d494227d9dbb 100644
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
> @@ -3544,20 +3549,25 @@ static void ingenic_gpio_set_bit(struct
> ingenic_gpio_chip *jzgc,
> =C2=A0static void ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip *j=
zgc,
> =C2=A0		u8 reg, u8 offset, bool set)
> =C2=A0{
> -	if (set)
> -		reg =3D REG_SET(reg);
> +	u32 reg_base;
> +
> +	if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> +		reg_base =3D jzgc->reg_base + X2600_GPIO_SHADOW_OFFSET;
> =C2=A0	else
> -		reg =3D REG_CLEAR(reg);
> +		reg_base =3D REG_PZ_BASE(jzgc->jzpc->info->reg_offset);
> +
> +	reg =3D set ? REG_SET(reg) : REG_CLEAR(reg);
> =C2=A0
> -	regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
> -			jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
> +	regmap_write(jzgc->jzpc->map, reg_base + reg, BIT(offset));
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
> @@ -3852,16 +3862,31 @@ static inline void ingenic_shadow_config_pin(stru=
ct
> ingenic_pinctrl *jzpc,
> =C2=A0		unsigned int pin, u8 reg, bool set)
> =C2=A0{
> =C2=A0	unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
> +	unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> +	u32 reg_base;
> =C2=A0
> -	regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
> -			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
> +	if (is_soc_or_above(jzpc, ID_X2600))
> +		reg_base =3D (offt * jzpc->info->reg_offset) +
> X2600_GPIO_SHADOW_OFFSET;
> +	else
> +		reg_base =3D REG_PZ_BASE(jzpc->info->reg_offset);
> +
> +	reg =3D set ? REG_SET(reg) : REG_CLEAR(reg);
> +
> +	regmap_write(jzpc->map, reg_base + reg, BIT(idx));
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
> >reg_offset), offt);
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0static inline void jz4730_config_pin_function(struct ingenic_pinctr=
l *jzpc,
