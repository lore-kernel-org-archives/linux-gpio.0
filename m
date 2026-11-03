Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742133;
	b=wuyzmjlZArwgrXIZCewJCqEJSLPIa3vy4gAOp87o1MoJmMuRqBye5IefU79NyVMpB1JL
	 Wb33fRVsBiJDxKWObUAF/HcQbhPQWtRRqmF+2hC0Q0tIK9QPQaHC8I8gjgjdhl16iS7sZ
	 2rakO54vN/4F93E47/FJN1NOLY4wzgcm+fF06M0xgPx+NGsb8ne2imD82oCPzQqPhu6RB
	 ccjqAdblt5zTzV/BSTA5kft6zyLa1Lq74yfa2YP7YYRhI0rVY3kH4g5Uctfy6abDdjyFs
	 o4S12YLjZQqVV5MsITSxTI6Z1N+WcU42zg0/n83SUGR8896Aun+w5cv0lQs01ZACY9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742133;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bCnu9fAte19N3TQ+TF69luK0oIJmG5VMG28ngg+iJc0=;
	b=aGiJZe66uP4rLPup85jTW+RKx5+YKh3e3gSWPCmFpHNsOQWoKvuIcUTzhGui9mZYwCoi
	 FxFqL0d88Cw0OtQ4eCn2oM7zFYYCYts98gDpY7bWeT0hAmzePy5ZrGNKxV56Dobsygukn
	 cLnEArQH5fxeOJw7d0HbYWWfAH5tRdxzSeREd9w8gYfAuWsyJ4MrqBlr6DeTuz/DyRFIl
	 zDYTa4eP22EU5D5Bg+tmQq5fKFqi3cklcO/Q4Vc00kFR5QOfDQySsSvK2rOsqsfCELhKA
	 SDM1ao7se+Xh+h8eeqXAHuitckH0lpprfYAToqpoWJTcdDj8hvnx6gmLRmRTwtw76Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XpcWDnPd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E8606A31B;
	Tue,  3 Nov 2026 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XpcWDnPd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B181F000C1;
	Tue,  3 Nov 2026 21:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742133;
	bh=bCnu9fAte19N3TQ+TF69luK0oIJmG5VMG28ngg+iJc0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=XpcWDnPdMjVCr+gMPRMVfJpllO5Tc9Ili2u3gekaggSZPxX2uTTR/SDauhPvWSjJP
	 YIzmP/qLWcNDKWSXPJ3AD3/lLZiGEmZ3Bhs9tvpeH4IQqiG0tWrUI1YPan4kjGY54I
	 Gr005161sGSyFiwP/G0T8UP6UdUuMrAZCudTfu7JyViXYK5+tD+nmOu+DDel4SGPSa
	 KZJYpS2QelZrjlAECsrxMBZFRZnB249M2+xmzL2CjmS8nneA7YsQqXUl0LcGAodtP6
	 CtRNMRyQwkCGKu1paXT5CKrUlBPf1miEgkU1ENYm9Yhy6w8nxC7iUoBR1vSf/RNtBP
	 z12TjOu7uLd0A==
Message-ID: <sashiko-outbox-196067@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] pinctrl: sunxi: Fix out-of-bounds irq_bank index
 when first bank has no IRQs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261103213002.1673560-2-lee@kernel.org>
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-2-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 21:42:12 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: sunxi: off-by-one IRQ bank mapping in prepare_function_ta=
ble()
--

commit c76ce1661381ff598e234c433e51d5307fae79a4
Author: Lee Jones <lee@kernel.org>

pinctrl: sunxi: Fix out-of-bounds irq_bank index when first bank has no IRQs

This commit initializes irq_bank and last_bank to -1 in
prepare_function_table() and only updates last_bank on IRQ-capable banks so
that irq_bank starts at 0 even when bank 0 (PA) has no pins or interrupts.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/s=
unxi/pinctrl-sunxi-dt.c
> index 8bcd566593ae8..79ca1a7c48374 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -208,8 +208,8 @@ static int prepare_function_table(struct device *dev,=
 struct device_node *pnode,
>  	 * Assign the function's memory and fill in GPIOs, IRQ and a sentinel.
>  	 * The extra functions will be filled in later.
>  	 */
> -	irq_bank =3D 0;
> -	last_bank =3D 0;
> +	irq_bank =3D -1;
> +	last_bank =3D -1;
>  	for (i =3D 0; i < npins; i++) {
>  		struct sunxi_desc_pin *pin =3D &pins[i];
>  		int bank =3D (pin->pin.number - pin_base) / PINS_PER_BANK;
> @@ -222,17 +222,16 @@ static int prepare_function_table(struct device *de=
v, struct device_node *pnode,
>  		func[1].muxval =3D 1;
> =20
>  		if (irq_mux) {
> -			if (bank > last_bank)
> +			if (bank > last_bank) {
>  				irq_bank++;
> +				last_bank =3D bank;
> +			}
>  			func[lastfunc].muxval =3D irq_mux;
>  			func[lastfunc].irqbank =3D irq_bank;
>  			func[lastfunc].irqnum =3D pin->pin.number % PINS_PER_BANK;
>  			func[lastfunc].name =3D "irq";
>  		}
> =20
> -		if (bank > last_bank)
> -			last_bank =3D bank;

[Severity: High]
Won't assigning irqbank starting at 0 for Port B shift the hardware IRQ
register offsets and GIC interrupt mappings off by one bank on Allwinner A5=
23
and A733?

On Allwinner A523 and A733, Port A (bank 0) has 0 pins, while Ports B throu=
gh
K (banks 1 through 10) implement pins and interrupts. With this change,
sunxi_pinctrl_dt_table_init() -> prepare_function_table() assigns
func[lastfunc].irqbank =3D 0..9 to Ports B..K instead of 1..10.

However, as described in commits 11f25ac56372 ("dt-bindings: pinctrl:
sun55i-a523: increase IRQ banks number") and 6b81aa0c8a4f ("arm64: dts:
allwinner: a523: Add missing GPIO interrupt"), the hardware IRQ register
layout and Device Tree interrupt numbering on A523 and A733 start at index 0
for the unimplemented Port A (RAZ/WI), with Ports B..K occupying hardware a=
nd
DT indices 1..10.

On Allwinner A523, drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c defines an
identity bank map starting at 0:

    static const unsigned int a523_irq_bank_map[] =3D { 0, 1, 2, 3, 4, 5, 6=
, 7, 8, 9 };

When Ports B..K are given irqbank 0..9 without updating a523_pinctrl_data,
sunxi_irq_base_reg() maps Port B (irqbank 0) via a523_irq_bank_map[0] =3D 0=
 to
Port A's unimplemented IRQ registers at offset 0x200 instead of Port B's at
0x220, Port C (irqbank 1) to Port B's registers at 0x220, and so on through
Port K (irqbank 9) accessing Port J's registers at 0x320, leaving Port K's
registers at 0x340 unused.

Furthermore, arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi and
Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
specify 11 GIC interrupts starting with Port A (GIC_SPI 67) at index 0, Por=
t B
(GIC_SPI 69) at index 1, through Port K (GIC_SPI 140) at index 10:

    interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
                 <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
                 ...
                 <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
                 <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;

Because sunxi_pinctrl_init_with_flags() populates
pctl->irq[i] =3D platform_get_irq(pdev, i) for i =3D 0 .. desc->irq_banks -=
 1,
assigning irqbank 0..9 to Ports B..K pairs Port B with Port A's GIC_SPI 67
(pctl->irq[0]), Port C with Port B's GIC_SPI 69 (pctl->irq[1]), through Por=
t K
with Port J's GIC_SPI 85 (pctl->irq[9]), while index 10 (GIC_SPI 140 for
Port K) is never requested.

Similarly, on Allwinner A733, drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
uses SUNXI_PINCTRL_NCAT3_REG_LAYOUT with no irq_bank_map:

    static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
            .irq_banks =3D 10,
            .irq_read_needs_mux =3D true,
            .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
    };

In drivers/pinctrl/sunxi/pinctrl-sunxi.h, sunxi_irq_base_reg() computes the
register offset directly from bank without calling sunxi_irq_hw_bank_num():

    static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, =
u16 bank)
    {
            if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
                    return pctl->bank_offset + bank * pctl->bank_mem_size +
                           A733_IRQ_REGS_OFFSET;

            return IRQ_REGS_OFFSET +
                   sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
    }

Because pctl->bank_offset (0x80) is Port A's register base (IRQ-A at 0x0c0 =
for
bank 0) and Port B's IRQ registers are at bank 1 (0x140), assigning irqbank
0..9 to Ports B..K shifts all A733 IRQ register accesses down by one bank to
0x0c0..0x540 (Ports A..J) instead of 0x140..0x5c0 (Ports B..K).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103213002.1673=
560-1-lee@kernel.org?part=3D1
