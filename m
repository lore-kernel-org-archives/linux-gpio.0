Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081932;
	b=ofKqc7URwkH9zfZ6wrGxazy93XValJmcoD3Igu6Zif60mkbpVBPfAnVpf2QwIiUSMldv
	 g4f0Jw5cKHnvRqd4K6mo1l8LDUN4GzSM38BrGvReRWTKfLXzhJUSu1pXy8Hl/eaGYrsPg
	 tEBid5APR3T4XiLAAkZf7pswF/188qW8N/lKXoId35i8pflVJxQDXxXQvid9FoIZkn4Lm
	 jJmk8kOIp3ULgL82kSSvyCR0Xli4oxOfvoRZrnl5MuS5juhA0m4U8RxrZk6FeTob+REeA
	 u22Uh8aigmoNY5PfLeNZKP7//yWSNnUahUBLNXeE/jFTJ9hNveG5SwKwIV7Gk3AlERA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081932;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=stwHyaWb06LlCw7QPG7769i7x2vVtJvVtgpgY08W2BM=;
	b=4Gt4EbTe5KwcK9BiW3fIIAHm2ppaaH4qFNHuYaD8Mi8BRKaGEXDwg9WxtDfN6UJPiEDV
	 XKeTPwbq7cOUwerTVCQoANNstFKL6zyIeeu1PYnAr1e8ECyOLERWCvXHaMfMJbB/D+7EQ
	 9SRmhOzSaPPMbL1tuNwzBFcCbeR1nAX5p2sha6OuVxWJ0QG0u3IEtsKgq5+7p0gUUpTZb
	 d8gh+SKhWCJJbM6IK9LVYRJ3zpnDtQY1sII1CAVE0ffdaRxw7+7Sd7WwkqhvDMGaTYb3Z
	 3gA3UfwLL4Ej3jZpOIMMFUeA3xnw2oY/clC/iIBJ9wtx6lmJYcAISGUC91gyFcMYidQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA10606A335;
	Thu, 19 Nov 2026 09:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA10606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <d24f63f3baf1488269b092af6147717510372e61.camel@crapouillou.net>
Subject: Re: [PATCH v4 4/7] pinctrl: ingenic: Add X2600 register and GPIO
 IRQ support
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Thu, 19 Nov 2026 10:52:06 +0100
In-Reply-To: <57c9892c8e1c34308c18ef07bc007dc9506d6e04.1795022736.git.hns@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
	 <57c9892c8e1c34308c18ef07bc007dc9506d6e04.1795022736.git.hns@goldelico.com>
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

Le mercredi 18 novembre 2026 =C3=A0 18:25 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
> Support the X2600 GPIO register layout with a 0x1000 bank stride,
> per-port shadow registers and load registers. The GPIO interrupt
> acknowledgement uses the existing JZ4770 flag-clear register path.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

I'm close to ACK this but I think the patchset overall needs a v5 (for a fe=
w
things I see in the following patches) so I added one small nit below.

I only reviewed the first half of the v3 yesterday, and didn't get to revie=
w the
second half that you already had sent the v4 :)

> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Changes V4:
> =C2=A0=C2=A0=C2=A0 - Simplify the GPIO port index used for the legacy glo=
bal shadow-load
> register.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (suggested by Paul Cercueil)
>=20
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 49 ++++++++++++++++++++++++----=
---
> =C2=A01 file changed, 39 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-
> ingenic.c
> index 7f65f3abf05f5..981789e468ac5 100644
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
> @@ -3852,16 +3863,34 @@ static inline void ingenic_shadow_config_pin(stru=
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

I'd write

if (is_soc_or_above(jzpc, ID_X2600))
    reg_base =3D (offt * jzpc->info->reg_offset) + X2600_GPIO_SHADOW_OFFSET=
;
else
    reg_base =3D REG_PZ_BASE(jzpc->info->reg_offset);

reg =3D set ? REG_SET(reg) : REG_CLEAR(reg);

regmap_write(jzpc->map, reg_base + reg, BIT(idx));

Cheers,
-Paul

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
> >reg_offset), offt);
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0static inline void jz4730_config_pin_function(struct ingenic_pinctr=
l *jzpc,
