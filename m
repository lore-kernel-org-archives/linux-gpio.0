Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794564203;
	b=Nqkt1PHp+SUsbTKSQeQ8+vcR1432sG/hGKwQGjkWRrP5ndUqf8W8K4tGPWdKkbKvbBAn
	 hh+PioZUOZi6tB1y+755meusa0m2AVcjCD+w/1zz+zt4G7DdJHOHu/rilMr5b4vfRbZ96
	 0kO7oxLmDP4Vl0T7vB1y4Xx2fICNelo4EWNhRjLNQQ1LhCk9UQK9i8mOY8Zr9auTmM7S/
	 xvxdEr/yYK2dOsL8p7cR97Fr+NqIjOI5Btt7dGS41aWdkIrAeD7EKc2Qcu/Y+XKopfT2K
	 ZRVBOJ8byLem/3ni+gJsH+fQyMNRmNCpu7IKKjIEl6j1O8zDvnuebujuoZbeb0+v6eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564203;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=jn7aSqmX7Bdz/eneT4RXbR5rgE989xqw1xr9DvTT8pE=;
	b=tirvJXq/cT4SiC6PPBpt5utall0F1IpiCgofogoylJm1ysEO1Kpiz6KET0PeeKaQL6Db
	 aKuM5ZqsUuwo1KL1k+p2OZRCteeIYCq28ktVHipxD4DLgA1givMWt+jTMxw+vgjWmaR6G
	 szVTS8VlQiJsk4MhfYpQ3kIjjnTIeOuC5Oe7UqENVVhZ6uW47V/i4nmtKaLsWpx1v6mc1
	 DoLsIFPcp33ubCREJTedK0pd+rMhNAhTlH8KDdAbwMp11d1n0J3HwNhQC6SjXTQ3DYkQF
	 94oRh9GZ1i7MVm7v9o65t1RM73UJNDW+qrzjK65vFyUZ32xoR8fHonf19by0rj7Ewgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=J4u44Z76;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=1sDEaCr8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2C7606A333;
	Fri, 13 Nov 2026 10:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2C7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=J4u44Z76;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=1sDEaCr8
ARC-Seal: i=1; a=rsa-sha256; t=1794564192; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sA9GokYDfj7V0DBdFvM3MI3W6Nd4EPmv7P4XdUdU7B7/VSgKbT+TloZ/2VvWkj9F8q
    gSBSb5RowCdeOm5uMk5+G4JmDx6dUuLfXXcutwwANkEd4T1CwE1W+RroFAAu6mECbHQ0
    LTnGxaVT0uAZL3oiQDcdon6FHb+XlBdg4i58SIwf861HI0TFpPbO8flUo6ZhXu6rHlLa
    nffmM2Sad/HfvakX/NNIaFZg1P08Jq8y5rVknHAcw0ghXQ5/B4ECrTZvB04cosg43gCm
    GSAbsVjz0HZbIh2JkXmoWXiKwhO27GAN0ZjzetFLfM9Dmgy2TTS1teG48Fmt3GLIhTSr
    UayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794564192;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jn7aSqmX7Bdz/eneT4RXbR5rgE989xqw1xr9DvTT8pE=;
    b=BoLrDPIs664b1e6sK/NgDUlAiUXmHHvPbuA2Nc6iaVH+/NEkWFjal0ahHFyaSbNlbO
    x6Q/nHfLIE9CHNEOhXS4IML+RyMXbDh3+6o7TjyjMzOpl4Gp8GJ4ZN3YbDsCYTRQAtjA
    Obp9yIZVdyo3B3MHJJyaqictJQyqBFJbA7ryViocJd3IRIRTMe/YYmMzcBfEu/QJp4Fb
    tEXGhYwlXh/9kq2t0KY+6Yp58NTGJgPdsKLB7kV/Qigx+sphyLu69Pud4hJ6Y10dJlYn
    r26tKr7UZIzIkUCDvhtkDlvfFJclBcKqmLSzgYptGDChG00QcQFWLiuojQPWSQIvjP6X
    ba/g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794564192;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jn7aSqmX7Bdz/eneT4RXbR5rgE989xqw1xr9DvTT8pE=;
    b=J4u44Z76fHLT0pc18llafTSWZ6DXvfHsiY8mJKjBJrl+wQ2DduKhaUGfRDB+eUxsdN
    d+XQnbt2VZQdWAi+xTuta8mzPP9lbLvqvtxRMpb7oLZCSMSTGWBnkE+Iy+PvWZk3mtGo
    YSXetWauph6+y75U9zeXpJ+nVC0djuVR6cGLHPT891dlA80C2DQnipwC5RMrJ/YFxr3e
    G3yycWGlNnO6hcPfVT/Al/O6JbIys53qIQV1vgbgR3HU+gnbhT8rC8QgB/M3oSWJynOx
    /U/cRVS4yapqPzEBVxsd+ckre35fH/R1paHDAbAHjrN5lXgoddcj22Z5UkCem1e43B3Z
    e/Ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794564192;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jn7aSqmX7Bdz/eneT4RXbR5rgE989xqw1xr9DvTT8pE=;
    b=1sDEaCr8BlPCaV7BGBQhpyufNw8SfqUoFqYvakUxGMmSrZ0VKpqFFUQ9Q+KhgmcxFK
    llasZHxCv3jhS2xgbUBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2ZoHmMiNHYIZPrro6QPZGBqKLoYar6phQmxG"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ADA3BFpd
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 13 Nov 2026 11:03:11 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH 2/3] pinctrl: ingenic: Add X2600 register and GPIO IRQ
 support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <d8e981be7badb4cb2476e58399010e533df40916.camel@crapouillou.net>
Date: Fri, 13 Nov 2026 11:02:40 +0100
Cc: Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <209B96BB-1458-442B-95B8-F0F6BA204E9B@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
 <1c495c7ac851aff2a798c82acf33bbb33da37953.1794557697.git.hns@goldelico.com>
 <3784202f7f6baa63b548af4c491805852e5835df.camel@crapouillou.net>
 <11E0E075-D267-4E50-906C-022D297A4988@goldelico.com>
 <d8e981be7badb4cb2476e58399010e533df40916.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)



> Am 13.11.2026 um 10:54 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Le vendredi 13 novembre 2026 =C3=A0 10:49 +0100, H. Nikolaus Schaller =
a =C3=A9crit :
>> Hi Paul,
>>=20
>>> Am 13.11.2026 um 10:37 schrieb Paul Cercueil <paul@crapouillou.net>:
>>>=20
>>> Hi Nikolaus,
>>>=20
>>> Le vendredi 13 novembre 2026 =C3=A0 09:14 +0100, H. Nikolaus =
Schaller a =C3=A9crit :
>>>> Add the X2600 SoC ID and adapt the GPIO register access functions
>>>> to its register layout.
>>>>=20
>>>> Unlike earlier Ingenic SoCs, the X2600 uses a register bank
>>>> spacing of 0x1000 and provides separate shadow registers and
>>>> load registers for each GPIO port. It also uses a dedicated
>>>> register for clearing GPIO interrupt flags.
>>>>=20
>>>> Update the GPIO interrupt configuration to account for hardware
>>>> dual-edge detection on X1600, X2000 and X2600. These SoCs require
>>>> PAT1 to be set when dual-edge detection is enabled, while X1000
>>>> and X1830 continue to use software emulation.
>>>=20
>>> So at the same time you're fixing X1600/X2000 and adding support for =
X2600.
>>> Looks to me like it should be splitted into two patches.
>>=20
>> Well, I have to look if it can be split.
>>=20
>> So far the driver for X1600/X2000 does not have dual-edge support by
>> hardware (programming the EDG bit).
>>=20
>> But registers and programming model are the same. Therefore it is =
more
>> or less a nice side-effect that x2600 adds functions to x1600/x2000.
>>=20
>> I.e. new code would be replacing some is_soc_or_above(jzgc->jzpc, =
ID_X2600)
>> with is_soc_or_above(jzgc->jzpc, ID_X1600) to fix it for them.
>>=20
>> Or otherwise we have to split full x2600 support into two patches.
>>=20
>> Is this worth a separate patch or should we leave it as a comment in
>> the commit message?
>=20
> My idea was that you'd first swap X1600/X1830, then add support for =
hardware
> dual-edge support if >=3D X1600, and finally add X2600 support.

Ah, ok. Fine with that. Will do for V2.

BR and thanks,
Nikolaus

>=20
>>>> The corrected interrupt configuration has been tested on X1600,
>>>> X2000, and X2600, including GPIO dual-edge interrupts by a
>>>> gpio-button.
>>>>=20
>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> ---
>>>> drivers/pinctrl/pinctrl-ingenic.c | 71 =
+++++++++++++++++++++++++------
>>>> 1 file changed, 58 insertions(+), 13 deletions(-)
>>>>=20
>>>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-
>>>> ingenic.c
>>>> index a62532c49fb60..90c734c74d267 100644
>>>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>>>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>>>> @@ -70,6 +70,10 @@
>>>> #define X2000_GPIO_SR 0xd0
>>>> #define X2000_GPIO_SMT 0xe0
>>>>=20
>>>> +#define X2600_GPIO_FLAG_CLR 0x58 /* write only */
>>>> +#define X2600_GPIO_SHADOW_OFFSET 0x800
>>>> +#define X2600_GPIO_PAGLD (X2600_GPIO_SHADOW_OFFSET +
>>>> 0xf0)
>>>> +
>>>> #define REG_SET(x) ((x) + 0x4)
>>>> #define REG_CLEAR(x) ((x) + 0x8)
>>>>=20
>>>> @@ -114,6 +118,7 @@ enum jz_version {
>>>>  ID_X1830,
>>>>  ID_X2000,
>>>>  ID_X2100,
>>>> + ID_X2600,
>>>> };
>>>>=20
>>>> struct ingenic_chip_info {
>>>> @@ -164,7 +169,8 @@ static const unsigned long enabled_socs =3D
>>>>  IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
>>>>  IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
>>>>  IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
>>>> - IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
>>>> + IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100 |
>>>> + IS_ENABLED(CONFIG_MACH_X2600) << ID_X2600;
>>>>=20
>>>> static bool
>>>> is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum jz_version
>>>> version)
>>>> @@ -3545,15 +3551,21 @@ static void =
ingenic_gpio_shadow_set_bit(struct
>>>> ingenic_gpio_chip *jzgc,
>>>>  else
>>>>  reg =3D REG_CLEAR(reg);
>>>>=20
>>>> - regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
>>>> - jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
>>>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>>>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>>>> X2600_GPIO_SHADOW_OFFSET + reg,
>>>> +      BIT(offset));
>>>> + else
>>>> + regmap_write(jzgc->jzpc->map, REG_PZ_BASE(jzgc->jzpc->info-
>>>>> reg_offset) + reg,
>>>> +      BIT(offset));
>>>> }
>>>>=20
>>>> static void ingenic_gpio_shadow_set_bit_load(struct =
ingenic_gpio_chip
>>>> *jzgc)
>>>> {
>>>> - regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(
>>>> - jzgc->jzpc->info->reg_offset),
>>>> - jzgc->gc.base / PINS_PER_GPIO_CHIP);
>>>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>>>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>>>> X2600_GPIO_PAGLD, 1);
>>>> + else
>>>> + regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(jzgc->jzpc->info-
>>>>> reg_offset),
>>>> +      jzgc->gc.base / PINS_PER_GPIO_CHIP);
>>>> }
>>>>=20
>>>> static void jz4730_gpio_set_bits(struct ingenic_gpio_chip *jzgc,
>>>> @@ -3618,6 +3630,12 @@ static void irq_set_type(struct =
ingenic_gpio_chip
>>>> *jzgc,
>>>>  break;
>>>>  }
>>>>=20
>>>> + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
>>>> +     (is_soc_or_above(jzgc->jzpc, ID_X2000) ||
>>>> +      (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
>>>> +       !is_soc_or_above(jzgc->jzpc, ID_X1830))))
>>>=20
>>> I remember you saying (in another patchset) that the X1830 was older =
than
>>> the
>>> X1600, if that's the case the IDs for X1600 and X1830 should be =
swapped. I
>>> believe this patch would then become much simpler.
>>=20
>> Indeed. So I can swap the ID's in V2.
>=20
> I just checked in the programming manuals and indeed it seems to be =
the case.
> Weird! I had no idea.
>=20
> Cheers,
> -Paul
>=20
>>>> + val2 =3D true;
>>>> +
>>>>  if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
>>>>  reg1 =3D JZ4770_GPIO_PAT1;
>>>>  reg2 =3D JZ4770_GPIO_PAT0;
>>>> @@ -3640,6 +3658,9 @@ static void irq_set_type(struct =
ingenic_gpio_chip
>>>> *jzgc,
>>>>  ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
>>>>  ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
>>>>  ingenic_gpio_shadow_set_bit_load(jzgc);
>>>> +
>>>> + if (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
>>>> !is_soc_or_above(jzgc->jzpc, ID_X1830))
>>>> + ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset,
>>>> val3);
>>>>  } else {
>>>>  ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
>>>>  ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
>>>> @@ -3714,7 +3735,8 @@ static void ingenic_gpio_irq_ack(struct =
irq_data
>>>> *irqd)
>>>>  bool high;
>>>>=20
>>>>  if ((irqd_get_trigger_type(irqd) =3D=3D IRQ_TYPE_EDGE_BOTH) &&
>>>> -     !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
>>>> +     (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
>>>> +     (is_soc_or_above(jzgc->jzpc, ID_X1830) && =
!is_soc_or_above(jzgc-
>>>>> jzpc, ID_X2000)))) {
>>>>  /*
>>>>   * Switch to an interrupt for the opposite edge to the one
>>>> that
>>>>   * triggered the interrupt being ACKed.
>>>> @@ -3726,7 +3748,9 @@ static void ingenic_gpio_irq_ack(struct =
irq_data
>>>> *irqd)
>>>>  irq_set_type(jzgc, irq, IRQ_TYPE_LEVEL_HIGH);
>>>>  }
>>>>=20
>>>> - if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
>>>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>>>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>>>> X2600_GPIO_FLAG_CLR, BIT(irq));
>>>> + else if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
>>>>  ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
>>>>  else if (is_soc_or_above(jzgc->jzpc, ID_JZ4740))
>>>>  ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
>>>> @@ -3754,7 +3778,9 @@ static int ingenic_gpio_irq_set_type(struct =
irq_data
>>>> *irqd, unsigned int type)
>>>>  irq_set_handler_locked(irqd, handle_bad_irq);
>>>>  }
>>>>=20
>>>> - if ((type =3D=3D IRQ_TYPE_EDGE_BOTH) && =
!is_soc_or_above(jzgc->jzpc,
>>>> ID_X2000)) {
>>>> + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
>>>> +     (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
>>>> +     (is_soc_or_above(jzgc->jzpc, ID_X1830) && =
!is_soc_or_above(jzgc-
>>>>> jzpc, ID_X2000)))) {
>>>>  /*
>>>>   * The hardware does not support interrupts on both edges.
>>>> The
>>>>   * best we can do is to set up a single-edge interrupt and
>>>> then
>>>> @@ -3849,16 +3875,35 @@ static inline void
>>>> ingenic_shadow_config_pin(struct
>>>> ingenic_pinctrl *jzpc,
>>>>  unsigned int pin, u8 reg, bool set)
>>>> {
>>>>  unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
>>>> + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
>>>>=20
>>>> - regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
>>>> - (set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
>>>> + if (set)
>>>> + reg =3D REG_SET(reg);
>>>> + else
>>>> + reg =3D REG_CLEAR(reg);
>>>> +
>>>> + if (is_soc_or_above(jzpc, ID_X2600)) {
>>>> + u32 target_reg =3D (offt * jzpc->info->reg_offset) +
>>>> X2600_GPIO_SHADOW_OFFSET + reg;
>>>> +
>>>> + regmap_write(jzpc->map, target_reg, BIT(idx));
>>>> + } else {
>>>> + regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
>>>> reg, BIT(idx));
>>>> + }
>>>> }
>>>>=20
>>>> static inline void ingenic_shadow_config_pin_load(struct =
ingenic_pinctrl
>>>> *jzpc,
>>>>  unsigned int pin)
>>>> {
>>>> - regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset),
>>>> - pin / PINS_PER_GPIO_CHIP);
>>>> + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
>>>> +
>>>> + if (is_soc_or_above(jzpc, ID_X2600)) {
>>>> + u32 target_load_reg =3D (offt * jzpc->info->reg_offset) +
>>>> X2600_GPIO_PAGLD;
>>>> +
>>>> + regmap_write(jzpc->map, target_load_reg, 1);
>>>> + } else {
>>>> + regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info-
>>>>> reg_offset),
>>>> +      pin / PINS_PER_GPIO_CHIP);
>>>> + }
>>>> }
>>>>=20
>>>> static inline void jz4730_config_pin_function(struct =
ingenic_pinctrl
>>>> *jzpc,


