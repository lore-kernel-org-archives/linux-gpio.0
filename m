Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794573801;
	b=PR6g6zf+UhdKXWE28kNtQhk66689HENQEd9o3sEa1A1I4c5hWE1I9RCnwgpsAnCk4LhC
	 4SC/j8Lh077Er2IIdxcpuynlKYpnk40VpOoj0bHPaVdgn7+thv6KdcmImz2Z5shqqNdBq
	 grGmLQQwH6SPTG2KXsyt1BQUdyG17kC98nLp/Qn68zRV6K0kGNPSe28ZOG4xpShe9MpRF
	 tIWIhZx2OJqkrVGlumlGC6F9o5IHWqA7lXuZJpxRuapIijop474EKnZ7gKE3I+YwYROrc
	 EOh5BdMXB7wsLcndrfg2jHyiNVJDCHzRwUzSgsXOeUfpu94zoPagn/Dgd5moN07nBzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573801;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=l/ecaUE2TqaQ94uOcIsuUrNAhgSRo0la3KrlU9BCwFU=;
	b=Wr3SDVqjguHMz7XW/I3rsYJ0zU6qOlgOYTBaRBj6SGP3OaaFoOdwPLi/aLuSjCJrDCvl
	 R4t4Dvcort6w9SggCA9FoPhQyM6mGTkD3874bhzpVB8fhUChlzdHC5TvNINA83XtMUqrY
	 fOkcAbjjS4wwxi+VFXoVICzEIXUtcLbblD54/81zcD5eMbeIRmejUW+SnvjL25JG4MdL+
	 MSn+gDSi2H24O3RciBycMEvdU1eDR92OuoamjLmke/qvpJt+u3tmT/ab5aCeoR3JGPbdZ
	 CMsvg/8XsOCp0BPSSxJKfDptlcoJIa/ZZPS/G+pUNxIY53FsTBJHP233ufOFAlVg+Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CBTtvJur;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=EVBY+1oI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A82606A331;
	Fri, 13 Nov 2026 12:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A82606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CBTtvJur;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=EVBY+1oI
ARC-Seal: i=1; a=rsa-sha256; t=1794573796; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YHYsh1RMf6eK7o5DjJFMF2gVL6FpM0+ay6I/424Yuki2FxYGwjRhYCCuJOXWpgekZg
    lUCilE2OrE4OH6r2OmD/zBurlGC3IMvKj259bPlm+UQsGt99ekaBoa4lEC8KrMD/2WnY
    KNE85rt+7NecCekFpJcs2n/kF5oOgkoOcagSWX2glLU24FMvjB4v0tfVEXKzb89yQtLi
    kmQWkqTEO1rqAoYJlo2/7+SUBEOMhTp0vonMXUGqULc3BlcspSObYn/0VIDY6X+N0aZa
    zW7wqodr/44cfuxqZlzXSUqYQhBrSMoDE0pGHA5YZG21Qs2tdQcMOLysrmhbBmJtCsFB
    yqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794573796;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=l/ecaUE2TqaQ94uOcIsuUrNAhgSRo0la3KrlU9BCwFU=;
    b=sGuZcsBAr/EmU4HTUwk1F18s+5/WlGLJlrjboNmodAIV65tvPc7Nno6aiQy5vvuqKX
    A6zjihX+3ljOVb7nQPQPbYIrgz+ob0jwR8RjRJk0OZhJMzSOv/Emu/tJ9uM5jMh0uTX5
    NIFCk5vnzkF0mNn62JtGXh2AwkMpuzA6oDzqnhGAPS4saozS21o+iHrM40b69s47fV20
    fpM+Js5TxO/+BwTsacL2cbpkR5C1fcTOPUweCOuqYbwH5ysM17zTOcP6FFyhn1cfc5vu
    SRJUxsJ3lmYVOGh5Sog0tJq4WWaVSZmyGo1pTGlgVAMfeKt38JeZXkbnvnby8LtmonfH
    amqA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794573796;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=l/ecaUE2TqaQ94uOcIsuUrNAhgSRo0la3KrlU9BCwFU=;
    b=CBTtvJurGO2blvdSMZcgZpy2YUspecwzfEWy25C99ZEhW8JHiYWQ/uIGko515YtZ8r
    Tx8k425VzN7f2q6EB6IymRa/wBOILpdkf9u5sfUUYDPFg1sXM6EuL6sFEdZmNc4V6lph
    vGt8IUur9vOG3bmCXtuVtoo2gW3SpGTkwQg8T1QRrbRQEkxL60D7TxlRS+SxOPRJr1hq
    ysPOZXTDwlZIjR9t6NZqPhYkJcjmTZhZUhrC0tZQBe+jQLOmkVoDTDnj1pDnaKiL+NJt
    k6swNjKQ3vRtIBqkZwGz0dM6tJGUoKX1v45WaZmuPJV1qVxKl76DvW19d8L/1kOgJG1g
    Fh6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794573796;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=l/ecaUE2TqaQ94uOcIsuUrNAhgSRo0la3KrlU9BCwFU=;
    b=EVBY+1oITZ6/wcIIe67zBEmHmGbsZgkbDby69Bdtb7xWXqKXYvdT8BlZ3rgmiSyTnB
    C9BbQirYwUNxzgEcpGBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2ZoHmMiNHYIZPrro6QPZGBqKLoYar6phQmxG"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ADChFGf9
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 13 Nov 2026 13:43:15 +0100 (CET)
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
In-Reply-To: <209B96BB-1458-442B-95B8-F0F6BA204E9B@goldelico.com>
Date: Fri, 13 Nov 2026 13:42:45 +0100
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
Message-Id: <A6F5AEAC-9D8C-4572-AD7D-500B83F37DE1@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
 <1c495c7ac851aff2a798c82acf33bbb33da37953.1794557697.git.hns@goldelico.com>
 <3784202f7f6baa63b548af4c491805852e5835df.camel@crapouillou.net>
 <11E0E075-D267-4E50-906C-022D297A4988@goldelico.com>
 <d8e981be7badb4cb2476e58399010e533df40916.camel@crapouillou.net>
 <209B96BB-1458-442B-95B8-F0F6BA204E9B@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)



> Am 13.11.2026 um 11:02 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>=20
>> Am 13.11.2026 um 10:54 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>> Le vendredi 13 novembre 2026 =C3=A0 10:49 +0100, H. Nikolaus Schaller =
a =C3=A9crit :
>>> Hi Paul,
>>>=20
>>>> Am 13.11.2026 um 10:37 schrieb Paul Cercueil =
<paul@crapouillou.net>:
>>>>=20
>>>> Hi Nikolaus,
>>>>=20
>>>> Le vendredi 13 novembre 2026 =C3=A0 09:14 +0100, H. Nikolaus =
Schaller a =C3=A9crit :
>>>>> Add the X2600 SoC ID and adapt the GPIO register access functions
>>>>> to its register layout.
>>>>>=20
>>>>> Unlike earlier Ingenic SoCs, the X2600 uses a register bank
>>>>> spacing of 0x1000 and provides separate shadow registers and
>>>>> load registers for each GPIO port. It also uses a dedicated
>>>>> register for clearing GPIO interrupt flags.
>>>>>=20
>>>>> Update the GPIO interrupt configuration to account for hardware
>>>>> dual-edge detection on X1600, X2000 and X2600. These SoCs require
>>>>> PAT1 to be set when dual-edge detection is enabled, while X1000
>>>>> and X1830 continue to use software emulation.
>>>>=20
>>>> So at the same time you're fixing X1600/X2000 and adding support =
for X2600.
>>>> Looks to me like it should be splitted into two patches.
>>>=20
>>> Well, I have to look if it can be split.
>>>=20
>>> So far the driver for X1600/X2000 does not have dual-edge support by
>>> hardware (programming the EDG bit).
>>>=20
>>> But registers and programming model are the same. Therefore it is =
more
>>> or less a nice side-effect that x2600 adds functions to x1600/x2000.
>>>=20
>>> I.e. new code would be replacing some is_soc_or_above(jzgc->jzpc, =
ID_X2600)
>>> with is_soc_or_above(jzgc->jzpc, ID_X1600) to fix it for them.
>>>=20
>>> Or otherwise we have to split full x2600 support into two patches.
>>>=20
>>> Is this worth a separate patch or should we leave it as a comment in
>>> the commit message?
>>=20
>> My idea was that you'd first swap X1600/X1830, then add support for =
hardware
>> dual-edge support if >=3D X1600, and finally add X2600 support.
>=20
> Ah, ok. Fine with that. Will do for V2.

I have checked that a little more deeply, but analysis of the driver =
shows that the
pinctrl register set evolution was perhaps

X1000 -> X1830 -> X2000 =3D X2100 -> X1600 -> X2600

(for X1830 and X2000 I do not know the exact sequence).

So we should IMHO sort the X1600 behind X2000=3DX2100.

But if we do either of the swapping options, we have to introduce new
is_soc_or_above() conditions and exclusion of others.

So I looked into the revision history of the programming manuals:

X1000/E Release Date: Dec. 26, 2016
X1830	Release Date: Mar. 16, 2020
X1600	Release Date: Aug. 06, 2021
X2000	Release Date: Oct. 15, 2021
X2600	First Release May.2023

And Google AI claims:

Here are the release dates for the Ingenic X-Series processors:
    =E2=80=A2 Ingenic X1000: July 2015. The processor was officially =
unveiled by Ingenic in mid-2015.
    =E2=80=A2 Ingenic X1830: January 2020. Initial announcements and =
early developments for this chip appeared at the beginning of 2020.
    =E2=80=A2 Ingenic X2000: January 2020. The processor and the Halley5 =
development board launched in January, followed by the official =
datasheet in July 2020.
    =E2=80=A2 Ingenic X1600: December 2021. Ingenic published the =
official datasheet for this processor on December 2, 2021.
    =E2=80=A2 Ingenic X2600: January 2023. Early SDKs and manuals were =
released in January, followed by the Halley7 development kit in the =
summer of 2023.

But that is not necessarily the same as the date the SoC architecture
and IP building blocks were chosen years before announcement and =
finished
silicon. Especially as the X2000 usually seems to be more similar to the
X1830 than the X1600.

In general, it turns out that there is probably not a single linear =
history and
only features added. It looks more like like branch&merge...

Therefore, there are always subtle changes and it seems to be impossible =
to follow
the is_soc_or_above() without exceptions.

Therefore I would suggest to keep it in the order as currently upstream =
and do
not swap anything. Neverheless we could add dual-edge support if >=3D =
X1600 (which
covers x2000) and make x1830 an exception.

Or we should introduce a new macro like is_soc(jzgc->jzpc, ID_X1830) to =
make
the exceptions more readable:

	is_soc_or_above(jzgc->jzpc, ID_X1600) && !is_soc(jzgc->jzpc, =
ID_X1830)

BR and thanks,
Nikolaus



>=20
> BR and thanks,
> Nikolaus
>=20
>>=20
>>>>> The corrected interrupt configuration has been tested on X1600,
>>>>> X2000, and X2600, including GPIO dual-edge interrupts by a
>>>>> gpio-button.
>>>>>=20
>>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>> ---
>>>>> drivers/pinctrl/pinctrl-ingenic.c | 71 =
+++++++++++++++++++++++++------
>>>>> 1 file changed, 58 insertions(+), 13 deletions(-)
>>>>>=20
>>>>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-
>>>>> ingenic.c
>>>>> index a62532c49fb60..90c734c74d267 100644
>>>>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>>>>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>>>>> @@ -70,6 +70,10 @@
>>>>> #define X2000_GPIO_SR 0xd0
>>>>> #define X2000_GPIO_SMT 0xe0
>>>>>=20
>>>>> +#define X2600_GPIO_FLAG_CLR 0x58 /* write only */
>>>>> +#define X2600_GPIO_SHADOW_OFFSET 0x800
>>>>> +#define X2600_GPIO_PAGLD (X2600_GPIO_SHADOW_OFFSET +
>>>>> 0xf0)
>>>>> +
>>>>> #define REG_SET(x) ((x) + 0x4)
>>>>> #define REG_CLEAR(x) ((x) + 0x8)
>>>>>=20
>>>>> @@ -114,6 +118,7 @@ enum jz_version {
>>>>> ID_X1830,
>>>>> ID_X2000,
>>>>> ID_X2100,
>>>>> + ID_X2600,
>>>>> };
>>>>>=20
>>>>> struct ingenic_chip_info {
>>>>> @@ -164,7 +169,8 @@ static const unsigned long enabled_socs =3D
>>>>> IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
>>>>> IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
>>>>> IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
>>>>> - IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
>>>>> + IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100 |
>>>>> + IS_ENABLED(CONFIG_MACH_X2600) << ID_X2600;
>>>>>=20
>>>>> static bool
>>>>> is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum =
jz_version
>>>>> version)
>>>>> @@ -3545,15 +3551,21 @@ static void =
ingenic_gpio_shadow_set_bit(struct
>>>>> ingenic_gpio_chip *jzgc,
>>>>> else
>>>>> reg =3D REG_CLEAR(reg);
>>>>>=20
>>>>> - regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
>>>>> - jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
>>>>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>>>>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>>>>> X2600_GPIO_SHADOW_OFFSET + reg,
>>>>> +      BIT(offset));
>>>>> + else
>>>>> + regmap_write(jzgc->jzpc->map, REG_PZ_BASE(jzgc->jzpc->info-
>>>>>> reg_offset) + reg,
>>>>> +      BIT(offset));
>>>>> }
>>>>>=20
>>>>> static void ingenic_gpio_shadow_set_bit_load(struct =
ingenic_gpio_chip
>>>>> *jzgc)
>>>>> {
>>>>> - regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(
>>>>> - jzgc->jzpc->info->reg_offset),
>>>>> - jzgc->gc.base / PINS_PER_GPIO_CHIP);
>>>>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>>>>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>>>>> X2600_GPIO_PAGLD, 1);
>>>>> + else
>>>>> + regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(jzgc->jzpc->info-
>>>>>> reg_offset),
>>>>> +      jzgc->gc.base / PINS_PER_GPIO_CHIP);
>>>>> }
>>>>>=20
>>>>> static void jz4730_gpio_set_bits(struct ingenic_gpio_chip *jzgc,
>>>>> @@ -3618,6 +3630,12 @@ static void irq_set_type(struct =
ingenic_gpio_chip
>>>>> *jzgc,
>>>>> break;
>>>>> }
>>>>>=20
>>>>> + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
>>>>> +     (is_soc_or_above(jzgc->jzpc, ID_X2000) ||
>>>>> +      (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
>>>>> +       !is_soc_or_above(jzgc->jzpc, ID_X1830))))
>>>>=20
>>>> I remember you saying (in another patchset) that the X1830 was =
older than
>>>> the
>>>> X1600, if that's the case the IDs for X1600 and X1830 should be =
swapped. I
>>>> believe this patch would then become much simpler.
>>>=20
>>> Indeed. So I can swap the ID's in V2.
>>=20
>> I just checked in the programming manuals and indeed it seems to be =
the case.
>> Weird! I had no idea.
>>=20
>> Cheers,
>> -Paul
>>=20
>>>>> + val2 =3D true;
>>>>> +
>>>>> if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
>>>>> reg1 =3D JZ4770_GPIO_PAT1;
>>>>> reg2 =3D JZ4770_GPIO_PAT0;
>>>>> @@ -3640,6 +3658,9 @@ static void irq_set_type(struct =
ingenic_gpio_chip
>>>>> *jzgc,
>>>>> ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
>>>>> ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
>>>>> ingenic_gpio_shadow_set_bit_load(jzgc);
>>>>> +
>>>>> + if (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
>>>>> !is_soc_or_above(jzgc->jzpc, ID_X1830))
>>>>> + ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset,
>>>>> val3);
>>>>> } else {
>>>>> ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
>>>>> ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
>>>>> @@ -3714,7 +3735,8 @@ static void ingenic_gpio_irq_ack(struct =
irq_data
>>>>> *irqd)
>>>>> bool high;
>>>>>=20
>>>>> if ((irqd_get_trigger_type(irqd) =3D=3D IRQ_TYPE_EDGE_BOTH) &&
>>>>> -     !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
>>>>> +     (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
>>>>> +     (is_soc_or_above(jzgc->jzpc, ID_X1830) && =
!is_soc_or_above(jzgc-
>>>>>> jzpc, ID_X2000)))) {
>>>>> /*
>>>>>  * Switch to an interrupt for the opposite edge to the one
>>>>> that
>>>>>  * triggered the interrupt being ACKed.
>>>>> @@ -3726,7 +3748,9 @@ static void ingenic_gpio_irq_ack(struct =
irq_data
>>>>> *irqd)
>>>>> irq_set_type(jzgc, irq, IRQ_TYPE_LEVEL_HIGH);
>>>>> }
>>>>>=20
>>>>> - if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
>>>>> + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
>>>>> + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
>>>>> X2600_GPIO_FLAG_CLR, BIT(irq));
>>>>> + else if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
>>>>> ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
>>>>> else if (is_soc_or_above(jzgc->jzpc, ID_JZ4740))
>>>>> ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
>>>>> @@ -3754,7 +3778,9 @@ static int ingenic_gpio_irq_set_type(struct =
irq_data
>>>>> *irqd, unsigned int type)
>>>>> irq_set_handler_locked(irqd, handle_bad_irq);
>>>>> }
>>>>>=20
>>>>> - if ((type =3D=3D IRQ_TYPE_EDGE_BOTH) && =
!is_soc_or_above(jzgc->jzpc,
>>>>> ID_X2000)) {
>>>>> + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
>>>>> +     (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
>>>>> +     (is_soc_or_above(jzgc->jzpc, ID_X1830) && =
!is_soc_or_above(jzgc-
>>>>>> jzpc, ID_X2000)))) {
>>>>> /*
>>>>>  * The hardware does not support interrupts on both edges.
>>>>> The
>>>>>  * best we can do is to set up a single-edge interrupt and
>>>>> then
>>>>> @@ -3849,16 +3875,35 @@ static inline void
>>>>> ingenic_shadow_config_pin(struct
>>>>> ingenic_pinctrl *jzpc,
>>>>> unsigned int pin, u8 reg, bool set)
>>>>> {
>>>>> unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
>>>>> + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
>>>>>=20
>>>>> - regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
>>>>> - (set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
>>>>> + if (set)
>>>>> + reg =3D REG_SET(reg);
>>>>> + else
>>>>> + reg =3D REG_CLEAR(reg);
>>>>> +
>>>>> + if (is_soc_or_above(jzpc, ID_X2600)) {
>>>>> + u32 target_reg =3D (offt * jzpc->info->reg_offset) +
>>>>> X2600_GPIO_SHADOW_OFFSET + reg;
>>>>> +
>>>>> + regmap_write(jzpc->map, target_reg, BIT(idx));
>>>>> + } else {
>>>>> + regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
>>>>> reg, BIT(idx));
>>>>> + }
>>>>> }
>>>>>=20
>>>>> static inline void ingenic_shadow_config_pin_load(struct =
ingenic_pinctrl
>>>>> *jzpc,
>>>>> unsigned int pin)
>>>>> {
>>>>> - regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset),
>>>>> - pin / PINS_PER_GPIO_CHIP);
>>>>> + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
>>>>> +
>>>>> + if (is_soc_or_above(jzpc, ID_X2600)) {
>>>>> + u32 target_load_reg =3D (offt * jzpc->info->reg_offset) +
>>>>> X2600_GPIO_PAGLD;
>>>>> +
>>>>> + regmap_write(jzpc->map, target_load_reg, 1);
>>>>> + } else {
>>>>> + regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info-
>>>>>> reg_offset),
>>>>> +      pin / PINS_PER_GPIO_CHIP);
>>>>> + }
>>>>> }
>>>>>=20
>>>>> static inline void jz4730_config_pin_function(struct =
ingenic_pinctrl
>>>>> *jzpc,
>=20
>=20

