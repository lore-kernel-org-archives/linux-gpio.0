Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563702;
	b=lGqeevrxDQejqhyrfkp93SSCNfJ1PrYvOy8/Z6N1hct9wf5QheyjFoNoWhZfpZVz+TKm
	 x3cnErfT0r3wRyV9ZW2hgAlp1xmyqYW4n/lh2vkH5R1+kYSdhUkTOkIdvW/Bf3PCdedA8
	 A6RawV988EptPc3mFfuhnfBK3L/BvottBKEAq7/2GS3JCLHXjkg7vEYZ6at4EvfGdagcl
	 M/MRZx/mVatj8wUXn3xtd24zuWtc8gvDoSslj7KTihqKfTzi8X1H9M8HU5trJtXXeRnG5
	 WLtrq80YUiA5SVET5Iy+DnkamMz4K6msosqD13uZ/1ceVQhH31+EQdbVdzhXt/DKQQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563702;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=EEyR2bGCUYr+0NrY+BEd02fYl4CxmdBJ7hukGwPKZSQ=;
	b=rr4zCH0ucvIqcWN+7A2nyW058i8f66Abrijaij6HCcBCB3chhY+Ql+3CSinx80pMLqQZ
	 v/rivQnmSv5R4JA58BUqeRpcSYyBM3MrM4E0DYoNhGRCFXxYUdMk7oF0sP7OrC1d6NTku
	 Ex+1rDWOh+PFD7HHu5r8teGdsXcoiNWUg7JVCHPVSR5JDz8ZmFuvQdgkjbJQ42Bt1maQH
	 zFJXf7eKDeqfyGs4jTNuIYvZqVckdNtCBb9RyfiJrYz/xv8HT5/6NpzL8XC+ZMsKblWxL
	 ianlNmWXtnkUzK3CVF3a1b4uVfB3RLF5Gzfe7gXpLZv7UUgALfjFHNrOHwr/AhSop3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB26860A263E;
	Fri, 13 Nov 2026 09:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB26860A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <d8e981be7badb4cb2476e58399010e533df40916.camel@crapouillou.net>
Subject: Re: [PATCH 2/3] pinctrl: ingenic: Add X2600 register and GPIO IRQ
 support
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski	 <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Fri, 13 Nov 2026 10:54:56 +0100
In-Reply-To: <11E0E075-D267-4E50-906C-022D297A4988@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
	 <1c495c7ac851aff2a798c82acf33bbb33da37953.1794557697.git.hns@goldelico.com>
	 <3784202f7f6baa63b548af4c491805852e5835df.camel@crapouillou.net>
	 <11E0E075-D267-4E50-906C-022D297A4988@goldelico.com>
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

Le vendredi 13 novembre 2026 =C3=A0 10:49 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
> Hi Paul,
>=20
> > Am 13.11.2026 um 10:37 schrieb Paul Cercueil <paul@crapouillou.net>:
> >=20
> > Hi Nikolaus,
> >=20
> > Le vendredi 13 novembre 2026 =C3=A0 09:14 +0100, H. Nikolaus Schaller a=
 =C3=A9crit :
> > > Add the X2600 SoC ID and adapt the GPIO register access functions
> > > to its register layout.
> > >=20
> > > Unlike earlier Ingenic SoCs, the X2600 uses a register bank
> > > spacing of 0x1000 and provides separate shadow registers and
> > > load registers for each GPIO port. It also uses a dedicated
> > > register for clearing GPIO interrupt flags.
> > >=20
> > > Update the GPIO interrupt configuration to account for hardware
> > > dual-edge detection on X1600, X2000 and X2600. These SoCs require
> > > PAT1 to be set when dual-edge detection is enabled, while X1000
> > > and X1830 continue to use software emulation.
> >=20
> > So at the same time you're fixing X1600/X2000 and adding support for X2=
600.
> > Looks to me like it should be splitted into two patches.
>=20
> Well, I have to look if it can be split.
>=20
> So far the driver for X1600/X2000 does not have dual-edge support by
> hardware (programming the EDG bit).
>=20
> But registers and programming model are the same. Therefore it is more
> or less a nice side-effect that x2600 adds functions to x1600/x2000.
>=20
> I.e. new code would be replacing some is_soc_or_above(jzgc->jzpc, ID_X260=
0)
> with is_soc_or_above(jzgc->jzpc, ID_X1600) to fix it for them.
>=20
> Or otherwise we have to split full x2600 support into two patches.
>=20
> Is this worth a separate patch or should we leave it as a comment in
> the commit message?

My idea was that you'd first swap X1600/X1830, then add support for hardwar=
e
dual-edge support if >=3D X1600, and finally add X2600 support.

> > > The corrected interrupt configuration has been tested on X1600,
> > > X2000, and X2600, including GPIO dual-edge interrupts by a
> > > gpio-button.
> > >=20
> > > Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> > > ---
> > > drivers/pinctrl/pinctrl-ingenic.c | 71 +++++++++++++++++++++++++-----=
-
> > > 1 file changed, 58 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinc=
trl-
> > > ingenic.c
> > > index a62532c49fb60..90c734c74d267 100644
> > > --- a/drivers/pinctrl/pinctrl-ingenic.c
> > > +++ b/drivers/pinctrl/pinctrl-ingenic.c
> > > @@ -70,6 +70,10 @@
> > > #define X2000_GPIO_SR 0xd0
> > > #define X2000_GPIO_SMT 0xe0
> > >=20
> > > +#define X2600_GPIO_FLAG_CLR 0x58 /* write only */
> > > +#define X2600_GPIO_SHADOW_OFFSET 0x800
> > > +#define X2600_GPIO_PAGLD (X2600_GPIO_SHADOW_OFFSET +
> > > 0xf0)
> > > +
> > > #define REG_SET(x) ((x) + 0x4)
> > > #define REG_CLEAR(x) ((x) + 0x8)
> > >=20
> > > @@ -114,6 +118,7 @@ enum jz_version {
> > > =C2=A0ID_X1830,
> > > =C2=A0ID_X2000,
> > > =C2=A0ID_X2100,
> > > + ID_X2600,
> > > };
> > >=20
> > > struct ingenic_chip_info {
> > > @@ -164,7 +169,8 @@ static const unsigned long enabled_socs =3D
> > > =C2=A0IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
> > > =C2=A0IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
> > > =C2=A0IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
> > > - IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
> > > + IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100 |
> > > + IS_ENABLED(CONFIG_MACH_X2600) << ID_X2600;
> > >=20
> > > static bool
> > > is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum jz_version
> > > version)
> > > @@ -3545,15 +3551,21 @@ static void ingenic_gpio_shadow_set_bit(struc=
t
> > > ingenic_gpio_chip *jzgc,
> > > =C2=A0else
> > > =C2=A0reg =3D REG_CLEAR(reg);
> > >=20
> > > - regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
> > > - jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
> > > + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> > > + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
> > > X2600_GPIO_SHADOW_OFFSET + reg,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(offset));
> > > + else
> > > + regmap_write(jzgc->jzpc->map, REG_PZ_BASE(jzgc->jzpc->info-
> > > > reg_offset) + reg,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(offset));
> > > }
> > >=20
> > > static void ingenic_gpio_shadow_set_bit_load(struct ingenic_gpio_chip
> > > *jzgc)
> > > {
> > > - regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(
> > > - jzgc->jzpc->info->reg_offset),
> > > - jzgc->gc.base / PINS_PER_GPIO_CHIP);
> > > + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> > > + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
> > > X2600_GPIO_PAGLD, 1);
> > > + else
> > > + regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(jzgc->jzpc->info-
> > > > reg_offset),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jzgc->gc.base / PINS_PER_GPIO_CHIP);
> > > }
> > >=20
> > > static void jz4730_gpio_set_bits(struct ingenic_gpio_chip *jzgc,
> > > @@ -3618,6 +3630,12 @@ static void irq_set_type(struct ingenic_gpio_c=
hip
> > > *jzgc,
> > > =C2=A0break;
> > > =C2=A0}
> > >=20
> > > + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 (is_soc_or_above(jzgc->jzpc, ID_X2000) ||
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (is_soc_or_above(jzgc->jzpc, ID_X1600=
) &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !is_soc_or_above(jzgc->jzpc, ID=
_X1830))))
> >=20
> > I remember you saying (in another patchset) that the X1830 was older th=
an
> > the
> > X1600, if that's the case the IDs for X1600 and X1830 should be swapped=
. I
> > believe this patch would then become much simpler.
>=20
> Indeed. So I can swap the ID's in V2.

I just checked in the programming manuals and indeed it seems to be the cas=
e.
Weird! I had no idea.

Cheers,
-Paul

> > > + val2 =3D true;
> > > +
> > > =C2=A0if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
> > > =C2=A0reg1 =3D JZ4770_GPIO_PAT1;
> > > =C2=A0reg2 =3D JZ4770_GPIO_PAT0;
> > > @@ -3640,6 +3658,9 @@ static void irq_set_type(struct ingenic_gpio_ch=
ip
> > > *jzgc,
> > > =C2=A0ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
> > > =C2=A0ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
> > > =C2=A0ingenic_gpio_shadow_set_bit_load(jzgc);
> > > +
> > > + if (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
> > > !is_soc_or_above(jzgc->jzpc, ID_X1830))
> > > + ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset,
> > > val3);
> > > =C2=A0} else {
> > > =C2=A0ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
> > > =C2=A0ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
> > > @@ -3714,7 +3735,8 @@ static void ingenic_gpio_irq_ack(struct irq_dat=
a
> > > *irqd)
> > > =C2=A0bool high;
> > >=20
> > > =C2=A0if ((irqd_get_trigger_type(irqd) =3D=3D IRQ_TYPE_EDGE_BOTH) &&
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 (is_soc_or_above(jzgc->jzpc, ID_X1830) && !=
is_soc_or_above(jzgc-
> > > > jzpc, ID_X2000)))) {
> > > =C2=A0/*
> > > =C2=A0 * Switch to an interrupt for the opposite edge to the one
> > > that
> > > =C2=A0 * triggered the interrupt being ACKed.
> > > @@ -3726,7 +3748,9 @@ static void ingenic_gpio_irq_ack(struct irq_dat=
a
> > > *irqd)
> > > =C2=A0irq_set_type(jzgc, irq, IRQ_TYPE_LEVEL_HIGH);
> > > =C2=A0}
> > >=20
> > > - if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
> > > + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> > > + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
> > > X2600_GPIO_FLAG_CLR, BIT(irq));
> > > + else if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
> > > =C2=A0ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
> > > =C2=A0else if (is_soc_or_above(jzgc->jzpc, ID_JZ4740))
> > > =C2=A0ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
> > > @@ -3754,7 +3778,9 @@ static int ingenic_gpio_irq_set_type(struct irq=
_data
> > > *irqd, unsigned int type)
> > > =C2=A0irq_set_handler_locked(irqd, handle_bad_irq);
> > > =C2=A0}
> > >=20
> > > - if ((type =3D=3D IRQ_TYPE_EDGE_BOTH) && !is_soc_or_above(jzgc->jzpc=
,
> > > ID_X2000)) {
> > > + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 (is_soc_or_above(jzgc->jzpc, ID_X1830) && !=
is_soc_or_above(jzgc-
> > > > jzpc, ID_X2000)))) {
> > > =C2=A0/*
> > > =C2=A0 * The hardware does not support interrupts on both edges.
> > > The
> > > =C2=A0 * best we can do is to set up a single-edge interrupt and
> > > then
> > > @@ -3849,16 +3875,35 @@ static inline void
> > > ingenic_shadow_config_pin(struct
> > > ingenic_pinctrl *jzpc,
> > > =C2=A0unsigned int pin, u8 reg, bool set)
> > > {
> > > =C2=A0unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
> > > + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> > >=20
> > > - regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
> > > - (set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
> > > + if (set)
> > > + reg =3D REG_SET(reg);
> > > + else
> > > + reg =3D REG_CLEAR(reg);
> > > +
> > > + if (is_soc_or_above(jzpc, ID_X2600)) {
> > > + u32 target_reg =3D (offt * jzpc->info->reg_offset) +
> > > X2600_GPIO_SHADOW_OFFSET + reg;
> > > +
> > > + regmap_write(jzpc->map, target_reg, BIT(idx));
> > > + } else {
> > > + regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
> > > reg, BIT(idx));
> > > + }
> > > }
> > >=20
> > > static inline void ingenic_shadow_config_pin_load(struct ingenic_pinc=
trl
> > > *jzpc,
> > > =C2=A0unsigned int pin)
> > > {
> > > - regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset),
> > > - pin / PINS_PER_GPIO_CHIP);
> > > + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> > > +
> > > + if (is_soc_or_above(jzpc, ID_X2600)) {
> > > + u32 target_load_reg =3D (offt * jzpc->info->reg_offset) +
> > > X2600_GPIO_PAGLD;
> > > +
> > > + regmap_write(jzpc->map, target_load_reg, 1);
> > > + } else {
> > > + regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info-
> > > > reg_offset),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin / PINS_PER_GPIO_CHIP);
> > > + }
> > > }
> > >=20
> > > static inline void jz4730_config_pin_function(struct ingenic_pinctrl
> > > *jzpc,
>=20
