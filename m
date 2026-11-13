Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.167
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794563432;
	b=kNj6jntpksYLvqJ4Bld2SH18dYXQEIWy/ZBqWGHnY1t5uAA04zcLJJFNsiuWLGpghjAI
	 uX80SUfXyJ2oNqYxeAntaOamNAAlg/og1vkBBwHlYrxIm084P3jqyVHH+5/NJC9Q4/Cxu
	 pLmTjczo/bhbaco5bwA1BBh8TFuuUbdKYvy2k1jrViGuQTRVNBW38kkFAE+pWoEewCByl
	 w/AEncc/1MbWSK9vnV8X5NdDAOd/jkbpe8LGghA0VO7Geu35paGob8Ub2FGly1C2RfQ3U
	 /Kcwd3NVviWKnXcDEXYkTyi2gSabsxXu+C0XGL3mdDcOfybXXe0vqxg7qnYHnG3JZnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563432;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=tW4eeXsXjnmGZJOtHlplouD81cN5iaeDZhV051mWz2M=;
	b=FQkoxh15eHNfDj6XXM0WgxWktdCeRh4Q6Y+iK3SNqLSGXOG2odpnhSb5GOhI5vwOb5nc
	 VVWultxkJbQAra81gJtDkJ6vhH99Kpo26TuEDIqXS+PDrLfKg5NPdBoWuBa/YTU00DIPf
	 9aeOjMwCCGMXJ84n5lWATmzeryXaG0sSFG5KfRLrKdTJtrYlXxz4HAxg2pvXVnveBAtIm
	 Tx8/83lLe8LN0Xzr6epidfRH3MmVZJw2/dCrfuQ4fn6/cRIbmEAaW5LM+ox9q6PLI67r7
	 RjpuszHGcbygx+pK3kWjD7YhVyww2RK77mCz52WmSEGhZHtpnDUH9prShU3ETTnXgFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=DdIp4qXF;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=iTjQDWOB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.167
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9690B606A32E;
	Fri, 13 Nov 2026 09:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9690B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=DdIp4qXF;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=iTjQDWOB
ARC-Seal: i=1; a=rsa-sha256; t=1794563415; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MNF7DYehuyMuDTeXSFdXMueVlCGeq4n+BNNPwGyA1f0AjWoWe5ULYkWR3FI5UPu3o4
    d8wxNrgVrgk5ug1/qDWGYLsTpAHJd0eEZDtZwvGA4ZrXOg7pNpUTvMUzg1GcKQ8vNLuY
    bDsw2psa+qOl/+RxT8/tDe7Z5N3YJgpfmilecqwSVRfQMCAnxZLa5SfrfmS+b6OJTRud
    ChhqER1HzHp318jt+3UNTZ+s/upKVDhEmSLNQo6DAuKMUmvOfcnxumMV7uovnmmK9Gyu
    BZ8tTpvQoCndewrVeoQTjaqMo6UBi+wqcNLCgQgSaaz8GDwaQjB7qWzSFTC3730+dFMb
    ITBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794563415;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=tW4eeXsXjnmGZJOtHlplouD81cN5iaeDZhV051mWz2M=;
    b=sUBIVhgjRhdd8m2699duKHpC+o714SM022zdu1wqYQq++N8KRUmrpy282FG6saaF1h
    JSptTIeNOSCFAIfmAR0wi+zkaXTlzsvyVkhprPCXB1C0ch7EvgTuvLg/LHWqR2Ma+vmV
    cyL5N+M2gl7Sp5vIHQa2aQwfcTOy/DPkEA6jiCcGU0WADCNfzOexezcKHvJGv9iy9nNI
    Ap0s6EPEQCEikgJeSGjSDq/iCr4l0AR5a/cFPTl3SZvJcQeBxMEX9BuhHuRtKBgvZnOy
    Yf3GwuqIx2Bv+AwmrZZub8vFHqzN7pxdXytBbFicMxCt3sFKphvfR3DHM03v14d+YYrZ
    o4cQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794563415;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=tW4eeXsXjnmGZJOtHlplouD81cN5iaeDZhV051mWz2M=;
    b=DdIp4qXFjrFPwjWqEIOikV2t/4Usmnqd4QUCmRZ/CbTUoKi+YjeL2KbSDj7wOHDkCs
    XTCHR4bz0N1lJSd7eADxauuMAuaUKEwLv+Jc3sROE2J1vibJh3x28bD91B5Gou4kkBrZ
    suShQxnDFD3dDdr/S0Vof3JBeWNJ3HHRlsbUitovz+AkRcpVf0/WX7j1OAQpGsHHr3cU
    qscBlmu9VhrSKgKylkot/NIWAWY9QQ3JlrDWjXcxCz3h6IXpTpS/nvCLEqQzScY7CZLi
    0v25aQyypQiQMxS0BxEx2XDotyXgQdKuyVVoQBGFRIs60gyzxsPwvb1y18ov95yeQRiz
    zSCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794563415;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=tW4eeXsXjnmGZJOtHlplouD81cN5iaeDZhV051mWz2M=;
    b=iTjQDWOBYesGER4ITzXcxfFMgmQ31YLU18xmiqKG55MpLrrYHEHw9PsEjQ3cz06IPE
    k8YdQJAC8hSAQt2HKKDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2ZoHmMiNHYIZPrro6QPZGBqKLoYar6phQmxG"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AD9oEFm1
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 13 Nov 2026 10:50:14 +0100 (CET)
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
In-Reply-To: <3784202f7f6baa63b548af4c491805852e5835df.camel@crapouillou.net>
Date: Fri, 13 Nov 2026 10:49:43 +0100
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
Message-Id: <11E0E075-D267-4E50-906C-022D297A4988@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
 <1c495c7ac851aff2a798c82acf33bbb33da37953.1794557697.git.hns@goldelico.com>
 <3784202f7f6baa63b548af4c491805852e5835df.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Paul,

> Am 13.11.2026 um 10:37 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le vendredi 13 novembre 2026 =C3=A0 09:14 +0100, H. Nikolaus Schaller =
a =C3=A9crit :
>> Add the X2600 SoC ID and adapt the GPIO register access functions
>> to its register layout.
>>=20
>> Unlike earlier Ingenic SoCs, the X2600 uses a register bank
>> spacing of 0x1000 and provides separate shadow registers and
>> load registers for each GPIO port. It also uses a dedicated
>> register for clearing GPIO interrupt flags.
>>=20
>> Update the GPIO interrupt configuration to account for hardware
>> dual-edge detection on X1600, X2000 and X2600. These SoCs require
>> PAT1 to be set when dual-edge detection is enabled, while X1000
>> and X1830 continue to use software emulation.
>=20
> So at the same time you're fixing X1600/X2000 and adding support for =
X2600.
> Looks to me like it should be splitted into two patches.

Well, I have to look if it can be split.

So far the driver for X1600/X2000 does not have dual-edge support by
hardware (programming the EDG bit).

But registers and programming model are the same. Therefore it is more
or less a nice side-effect that x2600 adds functions to x1600/x2000.

I.e. new code would be replacing some is_soc_or_above(jzgc->jzpc, =
ID_X2600)
with is_soc_or_above(jzgc->jzpc, ID_X1600) to fix it for them.

Or otherwise we have to split full x2600 support into two patches.

Is this worth a separate patch or should we leave it as a comment in
the commit message?

>=20
>>=20
>> The corrected interrupt configuration has been tested on X1600,
>> X2000, and X2600, including GPIO dual-edge interrupts by a
>> gpio-button.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/pinctrl/pinctrl-ingenic.c | 71 =
+++++++++++++++++++++++++------
>> 1 file changed, 58 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-
>> ingenic.c
>> index a62532c49fb60..90c734c74d267 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -70,6 +70,10 @@
>> #define X2000_GPIO_SR 0xd0
>> #define X2000_GPIO_SMT 0xe0
>>=20
>> +#define X2600_GPIO_FLAG_CLR 0x58 /* write only */
>> +#define X2600_GPIO_SHADOW_OFFSET 0x800
>> +#define X2600_GPIO_PAGLD (X2600_GPIO_SHADOW_OFFSET +
>> 0xf0)
>> +
>> #define REG_SET(x) ((x) + 0x4)
>> #define REG_CLEAR(x) ((x) + 0x8)
>>=20
>> @@ -114,6 +118,7 @@ enum jz_version {
>>  ID_X1830,
>>  ID_X2000,
>>  ID_X2100,
>> + ID_X2600,
>> };
>>=20
>> struct ingenic_chip_info {
>> @@ -164,7 +169,8 @@ static const unsigned long enabled_socs =3D
>>  IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
>>  IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
>>  IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
>> - IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
>> + IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100 |
>> + IS_ENABLED(CONFIG_MACH_X2600) << ID_X2600;
>>=20
>> static bool
>> is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum jz_version =
version)
>> @@ -3545,15 +3551,21 @@ static void =
ingenic_gpio_shadow_set_bit(struct
>> ingenic_gpio_chip *jzgc,
>>  else
>>  reg =3D REG_CLEAR(reg);
>>=20
>> - regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
>> - jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>> X2600_GPIO_SHADOW_OFFSET + reg,
>> +      BIT(offset));
>> + else
>> + regmap_write(jzgc->jzpc->map, REG_PZ_BASE(jzgc->jzpc->info-
>>> reg_offset) + reg,
>> +      BIT(offset));
>> }
>>=20
>> static void ingenic_gpio_shadow_set_bit_load(struct ingenic_gpio_chip =
*jzgc)
>> {
>> - regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(
>> - jzgc->jzpc->info->reg_offset),
>> - jzgc->gc.base / PINS_PER_GPIO_CHIP);
>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>> X2600_GPIO_PAGLD, 1);
>> + else
>> + regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(jzgc->jzpc->info-
>>> reg_offset),
>> +      jzgc->gc.base / PINS_PER_GPIO_CHIP);
>> }
>>=20
>> static void jz4730_gpio_set_bits(struct ingenic_gpio_chip *jzgc,
>> @@ -3618,6 +3630,12 @@ static void irq_set_type(struct =
ingenic_gpio_chip
>> *jzgc,
>>  break;
>>  }
>>=20
>> + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
>> +     (is_soc_or_above(jzgc->jzpc, ID_X2000) ||
>> +      (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
>> +       !is_soc_or_above(jzgc->jzpc, ID_X1830))))
>=20
> I remember you saying (in another patchset) that the X1830 was older =
than the
> X1600, if that's the case the IDs for X1600 and X1830 should be =
swapped. I
> believe this patch would then become much simpler.

Indeed. So I can swap the ID's in V2.

BR and thanks,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>> + val2 =3D true;
>> +
>>  if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
>>  reg1 =3D JZ4770_GPIO_PAT1;
>>  reg2 =3D JZ4770_GPIO_PAT0;
>> @@ -3640,6 +3658,9 @@ static void irq_set_type(struct =
ingenic_gpio_chip *jzgc,
>>  ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
>>  ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
>>  ingenic_gpio_shadow_set_bit_load(jzgc);
>> +
>> + if (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
>> !is_soc_or_above(jzgc->jzpc, ID_X1830))
>> + ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset,
>> val3);
>>  } else {
>>  ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
>>  ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
>> @@ -3714,7 +3735,8 @@ static void ingenic_gpio_irq_ack(struct =
irq_data *irqd)
>>  bool high;
>>=20
>>  if ((irqd_get_trigger_type(irqd) =3D=3D IRQ_TYPE_EDGE_BOTH) &&
>> -     !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
>> +     (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
>> +     (is_soc_or_above(jzgc->jzpc, ID_X1830) && =
!is_soc_or_above(jzgc-
>>> jzpc, ID_X2000)))) {
>>  /*
>>   * Switch to an interrupt for the opposite edge to the one
>> that
>>   * triggered the interrupt being ACKed.
>> @@ -3726,7 +3748,9 @@ static void ingenic_gpio_irq_ack(struct =
irq_data *irqd)
>>  irq_set_type(jzgc, irq, IRQ_TYPE_LEVEL_HIGH);
>>  }
>>=20
>> - if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>> X2600_GPIO_FLAG_CLR, BIT(irq));
>> + else if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
>>  ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
>>  else if (is_soc_or_above(jzgc->jzpc, ID_JZ4740))
>>  ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
>> @@ -3754,7 +3778,9 @@ static int ingenic_gpio_irq_set_type(struct =
irq_data
>> *irqd, unsigned int type)
>>  irq_set_handler_locked(irqd, handle_bad_irq);
>>  }
>>=20
>> - if ((type =3D=3D IRQ_TYPE_EDGE_BOTH) && =
!is_soc_or_above(jzgc->jzpc,
>> ID_X2000)) {
>> + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
>> +     (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
>> +     (is_soc_or_above(jzgc->jzpc, ID_X1830) && =
!is_soc_or_above(jzgc-
>>> jzpc, ID_X2000)))) {
>>  /*
>>   * The hardware does not support interrupts on both edges.
>> The
>>   * best we can do is to set up a single-edge interrupt and
>> then
>> @@ -3849,16 +3875,35 @@ static inline void =
ingenic_shadow_config_pin(struct
>> ingenic_pinctrl *jzpc,
>>  unsigned int pin, u8 reg, bool set)
>> {
>>  unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
>> + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
>>=20
>> - regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
>> - (set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
>> + if (set)
>> + reg =3D REG_SET(reg);
>> + else
>> + reg =3D REG_CLEAR(reg);
>> +
>> + if (is_soc_or_above(jzpc, ID_X2600)) {
>> + u32 target_reg =3D (offt * jzpc->info->reg_offset) +
>> X2600_GPIO_SHADOW_OFFSET + reg;
>> +
>> + regmap_write(jzpc->map, target_reg, BIT(idx));
>> + } else {
>> + regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
>> reg, BIT(idx));
>> + }
>> }
>>=20
>> static inline void ingenic_shadow_config_pin_load(struct =
ingenic_pinctrl
>> *jzpc,
>>  unsigned int pin)
>> {
>> - regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset),
>> - pin / PINS_PER_GPIO_CHIP);
>> + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
>> +
>> + if (is_soc_or_above(jzpc, ID_X2600)) {
>> + u32 target_load_reg =3D (offt * jzpc->info->reg_offset) +
>> X2600_GPIO_PAGLD;
>> +
>> + regmap_write(jzpc->map, target_load_reg, 1);
>> + } else {
>> + regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info-
>>> reg_offset),
>> +      pin / PINS_PER_GPIO_CHIP);
>> + }
>> }
>>=20
>> static inline void jz4730_config_pin_function(struct ingenic_pinctrl =
*jzpc,


