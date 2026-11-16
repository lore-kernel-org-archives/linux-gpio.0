Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849491;
	b=G40UAFOqkDNBMMoe0v1bX+lDZszxusWm1QnY6BRpFtrHV7XMxncxKcIoBQGhYwFGheFG
	 lhgE2RwutzslH8ommIFdLETZsUb4m1eeMW8cPXt6BCTAjRXN7Ph+JSa2ug5Vh7ML112mh
	 +KlB5Fc8+nzJh59j+O2MM2LPWmNGrqdQQkHtrVsXnFd28sBfc4lKcItknjaUHRa8whAf8
	 d0PfLrKrVpwHZFMA0Eu13WJ5O1S3OfRWdlJfzqTBAIXtfHLBg1Gs0AnaM4WOBncuJVilZ
	 7kApNl+NKbfRW6oFp+lYeyGyiDSIFgSA+8PrP8X3uXrRXnGDM0gaey3iWPpkpC66PdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849491;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=rODjunh7aO/zGSrSGqd0aAbb/YHu8CyevY4fVPNBkas=;
	b=sIAEjgzilm2kf319IutBF2cPrZeM1EuLRf0ZRaaFmslW5IoMO7jhCkf+lxi1oSJmSbVN
	 L4q0t2NR/j5TdTl3gIv0aitNDXHRa3F6V1vzuellRe53cOkglmDpLK9VVVIudmNSffmKF
	 9FgYm51VMXiPDWzYy2iabBsjP30gpfhhhUscoq05oY7rqJfg0h3cVyIlKqtgqrOJY91Kq
	 lwnbUAJh39Th+DqlMvDLUEUJ6uznhlygJg5EiEdQjgURbaOrJWG/yddV+cdMi0/pV47Nz
	 tvz8ah1/zx8sIce9pOqFWgnnGbDaWYwgakKHYjLPnX7mi2QDKQIkqaRHhGvsfC1mrwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97E606A882;
	Mon, 16 Nov 2026 17:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B97E606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <9c4f9a15f5a95040ab6db74dba9f9b091705573f.camel@crapouillou.net>
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
Date: Mon, 16 Nov 2026 18:18:02 +0100
In-Reply-To: <A6F5AEAC-9D8C-4572-AD7D-500B83F37DE1@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
	 <1c495c7ac851aff2a798c82acf33bbb33da37953.1794557697.git.hns@goldelico.com>
	 <3784202f7f6baa63b548af4c491805852e5835df.camel@crapouillou.net>
	 <11E0E075-D267-4E50-906C-022D297A4988@goldelico.com>
	 <d8e981be7badb4cb2476e58399010e533df40916.camel@crapouillou.net>
	 <209B96BB-1458-442B-95B8-F0F6BA204E9B@goldelico.com>
	 <A6F5AEAC-9D8C-4572-AD7D-500B83F37DE1@goldelico.com>
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

Le vendredi 13 novembre 2026 =C3=A0 13:42 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
>=20
>=20
> > Am 13.11.2026 um 11:02 schrieb H. Nikolaus Schaller <hns@goldelico.com>=
:
> >=20
> >=20
> >=20
> > > Am 13.11.2026 um 10:54 schrieb Paul Cercueil <paul@crapouillou.net>:
> > >=20
> > > Le vendredi 13 novembre 2026 =C3=A0 10:49 +0100, H. Nikolaus Schaller=
 a =C3=A9crit :
> > > > Hi Paul,
> > > >=20
> > > > > Am 13.11.2026 um 10:37 schrieb Paul Cercueil <paul@crapouillou.ne=
t>:
> > > > >=20
> > > > > Hi Nikolaus,
> > > > >=20
> > > > > Le vendredi 13 novembre 2026 =C3=A0 09:14 +0100, H. Nikolaus Scha=
ller a
> > > > > =C3=A9crit :
> > > > > > Add the X2600 SoC ID and adapt the GPIO register access functio=
ns
> > > > > > to its register layout.
> > > > > >=20
> > > > > > Unlike earlier Ingenic SoCs, the X2600 uses a register bank
> > > > > > spacing of 0x1000 and provides separate shadow registers and
> > > > > > load registers for each GPIO port. It also uses a dedicated
> > > > > > register for clearing GPIO interrupt flags.
> > > > > >=20
> > > > > > Update the GPIO interrupt configuration to account for hardware
> > > > > > dual-edge detection on X1600, X2000 and X2600. These SoCs requi=
re
> > > > > > PAT1 to be set when dual-edge detection is enabled, while X1000
> > > > > > and X1830 continue to use software emulation.
> > > > >=20
> > > > > So at the same time you're fixing X1600/X2000 and adding support =
for
> > > > > X2600.
> > > > > Looks to me like it should be splitted into two patches.
> > > >=20
> > > > Well, I have to look if it can be split.
> > > >=20
> > > > So far the driver for X1600/X2000 does not have dual-edge support b=
y
> > > > hardware (programming the EDG bit).
> > > >=20
> > > > But registers and programming model are the same. Therefore it is m=
ore
> > > > or less a nice side-effect that x2600 adds functions to x1600/x2000=
.
> > > >=20
> > > > I.e. new code would be replacing some is_soc_or_above(jzgc->jzpc,
> > > > ID_X2600)
> > > > with is_soc_or_above(jzgc->jzpc, ID_X1600) to fix it for them.
> > > >=20
> > > > Or otherwise we have to split full x2600 support into two patches.
> > > >=20
> > > > Is this worth a separate patch or should we leave it as a comment i=
n
> > > > the commit message?
> > >=20
> > > My idea was that you'd first swap X1600/X1830, then add support for
> > > hardware
> > > dual-edge support if >=3D X1600, and finally add X2600 support.
> >=20
> > Ah, ok. Fine with that. Will do for V2.
>=20
> I have checked that a little more deeply, but analysis of the driver show=
s
> that the
> pinctrl register set evolution was perhaps
>=20
> X1000 -> X1830 -> X2000 =3D X2100 -> X1600 -> X2600
>=20
> (for X1830 and X2000 I do not know the exact sequence).
>=20
> So we should IMHO sort the X1600 behind X2000=3DX2100.
>=20
> But if we do either of the swapping options, we have to introduce new
> is_soc_or_above() conditions and exclusion of others.
>=20
> So I looked into the revision history of the programming manuals:
>=20
> X1000/E Release Date: Dec. 26, 2016
> X1830	Release Date: Mar. 16, 2020
> X1600	Release Date: Aug. 06, 2021
> X2000	Release Date: Oct. 15, 2021
> X2600	First Release May.2023
>=20
> And Google AI claims:
>=20
> Here are the release dates for the Ingenic X-Series processors:
> =C2=A0=C2=A0=C2=A0 =E2=80=A2 Ingenic X1000: July 2015. The processor was =
officially unveiled by
> Ingenic in mid-2015.
> =C2=A0=C2=A0=C2=A0 =E2=80=A2 Ingenic X1830: January 2020. Initial announc=
ements and early
> developments for this chip appeared at the beginning of 2020.
> =C2=A0=C2=A0=C2=A0 =E2=80=A2 Ingenic X2000: January 2020. The processor a=
nd the Halley5 development
> board launched in January, followed by the official datasheet in July 202=
0.
> =C2=A0=C2=A0=C2=A0 =E2=80=A2 Ingenic X1600: December 2021. Ingenic publis=
hed the official datasheet
> for this processor on December 2, 2021.
> =C2=A0=C2=A0=C2=A0 =E2=80=A2 Ingenic X2600: January 2023. Early SDKs and =
manuals were released in
> January, followed by the Halley7 development kit in the summer of 2023.
>=20
> But that is not necessarily the same as the date the SoC architecture
> and IP building blocks were chosen years before announcement and finished
> silicon. Especially as the X2000 usually seems to be more similar to the
> X1830 than the X1600.
>=20
> In general, it turns out that there is probably not a single linear histo=
ry
> and
> only features added. It looks more like like branch&merge...
>=20
> Therefore, there are always subtle changes and it seems to be impossible =
to
> follow
> the is_soc_or_above() without exceptions.
>=20
> Therefore I would suggest to keep it in the order as currently upstream a=
nd do
> not swap anything. Neverheless we could add dual-edge support if >=3D X16=
00
> (which
> covers x2000) and make x1830 an exception.
>=20
> Or we should introduce a new macro like is_soc(jzgc->jzpc, ID_X1830) to m=
ake
> the exceptions more readable:
>=20
> 	is_soc_or_above(jzgc->jzpc, ID_X1600) && !is_soc(jzgc->jzpc,
> ID_X1830)

I believe making ID_X1830 < ID_X1600 would simplify dual-edge support since
you'd only need to check is_soc_or_above(jzpc, ID_X1600).

Then you can handle X1830 being the odd one using your proposed is_soc(),
e.g.

if (is_soc(ID_X1830)) {
   ...
} else if (is_soc_or_above(ID_X1600)) {
   // Actually also covers X1600 and X2000+ but not X1830
}

Or even:

if (is_soc_or_above(ID_X2000)) {
   ...
} else if (is_soc(ID_X1830)) {
   ...
} else if (is_soc_or_above(ID_X1600)) {
}

I'll send you a patch in private to illustrate it.

Cheers,
-Paul

> > > > > > The corrected interrupt configuration has been tested on X1600,
> > > > > > X2000, and X2600, including GPIO dual-edge interrupts by a
> > > > > > gpio-button.
> > > > > >=20
> > > > > > Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> > > > > > ---
> > > > > > drivers/pinctrl/pinctrl-ingenic.c | 71 ++++++++++++++++++++++++=
+----
> > > > > > --
> > > > > > 1 file changed, 58 insertions(+), 13 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> > > > > > b/drivers/pinctrl/pinctrl-
> > > > > > ingenic.c
> > > > > > index a62532c49fb60..90c734c74d267 100644
> > > > > > --- a/drivers/pinctrl/pinctrl-ingenic.c
> > > > > > +++ b/drivers/pinctrl/pinctrl-ingenic.c
> > > > > > @@ -70,6 +70,10 @@
> > > > > > #define X2000_GPIO_SR 0xd0
> > > > > > #define X2000_GPIO_SMT 0xe0
> > > > > >=20
> > > > > > +#define X2600_GPIO_FLAG_CLR 0x58 /* write only */
> > > > > > +#define X2600_GPIO_SHADOW_OFFSET 0x800
> > > > > > +#define X2600_GPIO_PAGLD (X2600_GPIO_SHADOW_OFFSET +
> > > > > > 0xf0)
> > > > > > +
> > > > > > #define REG_SET(x) ((x) + 0x4)
> > > > > > #define REG_CLEAR(x) ((x) + 0x8)
> > > > > >=20
> > > > > > @@ -114,6 +118,7 @@ enum jz_version {
> > > > > > ID_X1830,
> > > > > > ID_X2000,
> > > > > > ID_X2100,
> > > > > > + ID_X2600,
> > > > > > };
> > > > > >=20
> > > > > > struct ingenic_chip_info {
> > > > > > @@ -164,7 +169,8 @@ static const unsigned long enabled_socs =3D
> > > > > > IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
> > > > > > IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
> > > > > > IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
> > > > > > - IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
> > > > > > + IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100 |
> > > > > > + IS_ENABLED(CONFIG_MACH_X2600) << ID_X2600;
> > > > > >=20
> > > > > > static bool
> > > > > > is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum jz_ver=
sion
> > > > > > version)
> > > > > > @@ -3545,15 +3551,21 @@ static void
> > > > > > ingenic_gpio_shadow_set_bit(struct
> > > > > > ingenic_gpio_chip *jzgc,
> > > > > > else
> > > > > > reg =3D REG_CLEAR(reg);
> > > > > >=20
> > > > > > - regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
> > > > > > - jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
> > > > > > + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> > > > > > + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
> > > > > > X2600_GPIO_SHADOW_OFFSET + reg,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(offset));
> > > > > > + else
> > > > > > + regmap_write(jzgc->jzpc->map, REG_PZ_BASE(jzgc->jzpc->info-
> > > > > > > reg_offset) + reg,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(offset));
> > > > > > }
> > > > > >=20
> > > > > > static void ingenic_gpio_shadow_set_bit_load(struct
> > > > > > ingenic_gpio_chip
> > > > > > *jzgc)
> > > > > > {
> > > > > > - regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(
> > > > > > - jzgc->jzpc->info->reg_offset),
> > > > > > - jzgc->gc.base / PINS_PER_GPIO_CHIP);
> > > > > > + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> > > > > > + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
> > > > > > X2600_GPIO_PAGLD, 1);
> > > > > > + else
> > > > > > + regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(jzgc->jzpc->info-
> > > > > > > reg_offset),
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jzgc->gc.base / PINS_PER_GPIO_C=
HIP);
> > > > > > }
> > > > > >=20
> > > > > > static void jz4730_gpio_set_bits(struct ingenic_gpio_chip *jzgc=
,
> > > > > > @@ -3618,6 +3630,12 @@ static void irq_set_type(struct
> > > > > > ingenic_gpio_chip
> > > > > > *jzgc,
> > > > > > break;
> > > > > > }
> > > > > >=20
> > > > > > + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 (is_soc_or_above(jzgc->jzpc, ID_X2000=
) ||
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (is_soc_or_above(jzgc->jzpc, ID=
_X1600) &&
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !is_soc_or_above(jzgc->jz=
pc, ID_X1830))))
> > > > >=20
> > > > > I remember you saying (in another patchset) that the X1830 was ol=
der
> > > > > than
> > > > > the
> > > > > X1600, if that's the case the IDs for X1600 and X1830 should be
> > > > > swapped. I
> > > > > believe this patch would then become much simpler.
> > > >=20
> > > > Indeed. So I can swap the ID's in V2.
> > >=20
> > > I just checked in the programming manuals and indeed it seems to be t=
he
> > > case.
> > > Weird! I had no idea.
> > >=20
> > > Cheers,
> > > -Paul
> > >=20
> > > > > > + val2 =3D true;
> > > > > > +
> > > > > > if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
> > > > > > reg1 =3D JZ4770_GPIO_PAT1;
> > > > > > reg2 =3D JZ4770_GPIO_PAT0;
> > > > > > @@ -3640,6 +3658,9 @@ static void irq_set_type(struct
> > > > > > ingenic_gpio_chip
> > > > > > *jzgc,
> > > > > > ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
> > > > > > ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
> > > > > > ingenic_gpio_shadow_set_bit_load(jzgc);
> > > > > > +
> > > > > > + if (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
> > > > > > !is_soc_or_above(jzgc->jzpc, ID_X1830))
> > > > > > + ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset,
> > > > > > val3);
> > > > > > } else {
> > > > > > ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
> > > > > > ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
> > > > > > @@ -3714,7 +3735,8 @@ static void ingenic_gpio_irq_ack(struct
> > > > > > irq_data
> > > > > > *irqd)
> > > > > > bool high;
> > > > > >=20
> > > > > > if ((irqd_get_trigger_type(irqd) =3D=3D IRQ_TYPE_EDGE_BOTH) &&
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0 !is_soc_or_above(jzgc->jzpc, ID_X2000=
)) {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 (!is_soc_or_above(jzgc->jzpc, ID_X160=
0) ||
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 (is_soc_or_above(jzgc->jzpc, ID_X1830=
) &&
> > > > > > !is_soc_or_above(jzgc-
> > > > > > > jzpc, ID_X2000)))) {
> > > > > > /*
> > > > > > =C2=A0* Switch to an interrupt for the opposite edge to the one
> > > > > > that
> > > > > > =C2=A0* triggered the interrupt being ACKed.
> > > > > > @@ -3726,7 +3748,9 @@ static void ingenic_gpio_irq_ack(struct
> > > > > > irq_data
> > > > > > *irqd)
> > > > > > irq_set_type(jzgc, irq, IRQ_TYPE_LEVEL_HIGH);
> > > > > > }
> > > > > >=20
> > > > > > - if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
> > > > > > + if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> > > > > > + regmap_write(jzgc->jzpc->map, jzgc->reg_base +
> > > > > > X2600_GPIO_FLAG_CLR, BIT(irq));
> > > > > > + else if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
> > > > > > ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
> > > > > > else if (is_soc_or_above(jzgc->jzpc, ID_JZ4740))
> > > > > > ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
> > > > > > @@ -3754,7 +3778,9 @@ static int ingenic_gpio_irq_set_type(stru=
ct
> > > > > > irq_data
> > > > > > *irqd, unsigned int type)
> > > > > > irq_set_handler_locked(irqd, handle_bad_irq);
> > > > > > }
> > > > > >=20
> > > > > > - if ((type =3D=3D IRQ_TYPE_EDGE_BOTH) && !is_soc_or_above(jzgc=
->jzpc,
> > > > > > ID_X2000)) {
> > > > > > + if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 (!is_soc_or_above(jzgc->jzpc, ID_X160=
0) ||
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 (is_soc_or_above(jzgc->jzpc, ID_X1830=
) &&
> > > > > > !is_soc_or_above(jzgc-
> > > > > > > jzpc, ID_X2000)))) {
> > > > > > /*
> > > > > > =C2=A0* The hardware does not support interrupts on both edges.
> > > > > > The
> > > > > > =C2=A0* best we can do is to set up a single-edge interrupt and
> > > > > > then
> > > > > > @@ -3849,16 +3875,35 @@ static inline void
> > > > > > ingenic_shadow_config_pin(struct
> > > > > > ingenic_pinctrl *jzpc,
> > > > > > unsigned int pin, u8 reg, bool set)
> > > > > > {
> > > > > > unsigned int idx =3D pin % PINS_PER_GPIO_CHIP;
> > > > > > + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> > > > > >=20
> > > > > > - regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
> > > > > > - (set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
> > > > > > + if (set)
> > > > > > + reg =3D REG_SET(reg);
> > > > > > + else
> > > > > > + reg =3D REG_CLEAR(reg);
> > > > > > +
> > > > > > + if (is_soc_or_above(jzpc, ID_X2600)) {
> > > > > > + u32 target_reg =3D (offt * jzpc->info->reg_offset) +
> > > > > > X2600_GPIO_SHADOW_OFFSET + reg;
> > > > > > +
> > > > > > + regmap_write(jzpc->map, target_reg, BIT(idx));
> > > > > > + } else {
> > > > > > + regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
> > > > > > reg, BIT(idx));
> > > > > > + }
> > > > > > }
> > > > > >=20
> > > > > > static inline void ingenic_shadow_config_pin_load(struct
> > > > > > ingenic_pinctrl
> > > > > > *jzpc,
> > > > > > unsigned int pin)
> > > > > > {
> > > > > > - regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset)=
,
> > > > > > - pin / PINS_PER_GPIO_CHIP);
> > > > > > + unsigned int offt =3D pin / PINS_PER_GPIO_CHIP;
> > > > > > +
> > > > > > + if (is_soc_or_above(jzpc, ID_X2600)) {
> > > > > > + u32 target_load_reg =3D (offt * jzpc->info->reg_offset) +
> > > > > > X2600_GPIO_PAGLD;
> > > > > > +
> > > > > > + regmap_write(jzpc->map, target_load_reg, 1);
> > > > > > + } else {
> > > > > > + regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info-
> > > > > > > reg_offset),
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin / PINS_PER_GPIO_CHIP);
> > > > > > + }
> > > > > > }
> > > > > >=20
> > > > > > static inline void jz4730_config_pin_function(struct ingenic_pi=
nctrl
> > > > > > *jzpc,
> >=20
> >=20
