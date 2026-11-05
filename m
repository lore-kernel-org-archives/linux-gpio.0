Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856909;
	b=ixx3dT/T30MPMSh+TCf0OYAVbilkp1j+gqe8gqS8L6OIGBo+YyIsZExXoyJJgE48ip6q
	 SfAgeqIXE1i1z8Uo3c8/QWMlEvMcjFKUvQXn1zaoocn9ZBQhtBxpdLMwCKP43XGbZOn3y
	 vPU6A45a2LxB4OMEgOE17rvCNHsTWr+1TpcVqXu1yOGyN2NnPKOwjm5Z/2bPdUYqXjJ5f
	 BhSgyl3LKgiFkozHAEGk+aDIX8Yx6vz5HOFxCqCdZO8T+xMKMUnsYPrvwOe5e6heTdnNM
	 b0hGbpmxYU18U8saEMyW0//K5fn1dv9jFddnkN1YknvwSiT6f9Vpwj3K8iwv9c2zRpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856909;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aFo8RYEJkCQxnY4W7EiyNi0HTEwd4i5mtOJ/s59p18E=;
	b=VjzMjg5Fw8qT6GodyoTQjgKDEi1CXqtniVZ+sI7yZJlWKu16stC45OEg3Ttf5OEilN8l
	 nX4ekMusPbUCm+V0N37nZYv9CkGShCtza6jCxsQVp+Hat7p1DUrqLbz/teCFzEAsECwHJ
	 wJOMiW7smhwBngJ2EF+cu5R26SCYnJdAonxPjA7ye5tvJ9DOPE0PY39hus3wYm+Gxv6Vt
	 fgOC14pS+rVivqOy0QVnaeeZ70AB/hHgqVOTI48gGRcGCILOGEBlS0fG0WZ5ClPFr4GzJ
	 pwGoJU66pUaGu+JXrMZu1zqnSYUbShJXNCHlM5LiVvk324CYYesvvl8I8x39VvXBpQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llu7dBrU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DD3606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 05:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llu7dBrU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D5E1F000C1;
	Thu,  5 Nov 2026 05:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793856908;
	bh=aFo8RYEJkCQxnY4W7EiyNi0HTEwd4i5mtOJ/s59p18E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=llu7dBrUxfZvlMcrCvXnfcZa9uVBbGINEA8/p9O7wxxUuJBp7OamjN4/ZOzJkCxYh
	 77ixIcF5wzm7nnLhEbe36rf310AyL63+uofvkvoICCl224n98WV54W41VI7XkIwuld
	 vrHuC8UdenvGwc+fc7yXBWRy1hkMdXgK9h1H6S56lvOwSJHUrNKYAPf/rTmDp5xdLL
	 zAANCiUunUQv4EO3kFblaOzWbwiLk0oryugYisY96oygyOg4z7Ns/mtAkYfQ82Ifij
	 rk6GEN6jl4YUDEFyRuh8ZBveDndcQ+ZzYR31JRjnniZ+/iQs2vCZaz/rZfvuV+SEO8
	 iXqKWpmkO97NQ==
Message-ID: <sashiko-outbox-198599@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] pinctrl: mediatek: Add MT8901/MT8971 ACPI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Paralikar" <shubham.paralikar@mediatek.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261105050535.2551413-1-shubham.paralikar@mediatek.com>
References: <20261105050535.2551413-1-shubham.paralikar@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 05:35:07 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] pinctrl: mediatek: skip-list EINTs masked on PM/IRQ and clobber do=
m_en
- [High] pinctrl: mediatek: missing bias_set/get_combo callbacks in mt8971_=
data
- [High] pinctrl: mediatek: missing virtual GPIO descriptors for MT8971 EIN=
Ts 187+
- [High] pinctrl: mediatek: OOB pull_type read in mtk_pinctrl_program_bias_=
by_gpio()
- [High] pinctrl: mediatek: OOB MMIO for virtual GPIOs in mtk_hw_pin_field_=
lookup()
- [High] pinctrl: mediatek: uninitialized hw->eint left on mtk_build_eint()=
 error
- [High] pinctrl: mediatek: broken GPIO pin range registration via pinctrl_=
add_gpio_range()
- [High] pinctrl: mediatek: MT8971 debounce pin flags cause -EOPNOTSUPP on =
ACPI GpioInt
- [Medium] pinctrl: mediatek: wrong nfuncs=3D8 in mt8971_data for mux funct=
ions 8..10
- [Medium] pinctrl: mediatek: unset has_event_mask in mt8971_eint_hw for ei=
nt_event
- [Medium] pinctrl: mediatek: mtk_pinctrl_program_bias_by_gpio() fails on R=
1R0 pins
- [Medium] pinctrl: mediatek: leak of EINT MMIO mappings in mtk_build_eint()
- [Medium] pinctrl: mediatek: mtk_pinctrl_program_bias_by_gpio() fails on R=
1R0 pins
- [Low] pinctrl: mediatek: leftover debug dev_info() logging in shared prob=
e paths
--

commit ab3a30ea19f9a05365ff5bd3b4f69185efb16390
Author: Shubham Paralikar <shubham.paralikar@mediatek.com>

pinctrl: mediatek: Add MT8901/MT8971 ACPI driver

This commit adds an ACPI pinctrl and GPIO driver for the MediaTek MT8901 and
MT8971 SoCs, selecting the SoC tables at probe time via a vendor _DSD ChipId
property. It also updates the shared Paris, common-v2, and EINT drivers to
support ACPI resources, fixed-stride register tables, bus-hold bias, EINT
wake-event masks, and firmware-owned EINT skip lists.

> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediat=
ek/mtk-eint.c
> index 827231dc0d246..7b3198396b6ec 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
[ ... ]
> @@ -327,12 +508,38 @@ static unsigned int mtk_eint_hw_init(struct mtk_ein=
t *eint)
>  		mask_reg =3D eint->base[i] + eint->regs->mask_set;
>  		for (j =3D 0; j < eint->base_pin_num[i]; j +=3D 32) {
>  			writel(0xffffffff, dom_reg);
> -			writel(0xffffffff, mask_reg);
> +			writel(mtk_eint_mask_word_for_skip(eint, i, j), mask_reg);
>  			dom_reg +=3D 4;
>  			mask_reg +=3D 4;
>  		}
>  	}
> +	return 0;
> +}
> +
> +/* Make sure skip-listed EINTs are unmasked and domain enabled. */
> +static int mtk_eint_restore_skip_list(struct mtk_eint *eint)
> +{
> +	unsigned int k, eint_num, inst, idx;
> +	void __iomem *reg;
> =20
> +	if (!eint->skip_eint_list || !eint->num_skip_eint)
> +		return 0;
> +
> +	for (k =3D 0; k < eint->num_skip_eint; k++) {\n> +		eint_num =3D eint->=
skip_eint_list[k];
> +		if (eint_num >=3D eint->hw->ap_num)
> +			continue;
> +		inst =3D eint->pins[eint_num].instance;
> +		if (inst >=3D eint->nbase)
> +			continue;
> +		idx =3D eint->pins[eint_num].index;
> +
> +		reg =3D mtk_eint_get_offset(eint, eint_num, eint->regs->mask_clr);
> +		writel(BIT(idx & 0x1f), reg);
> +
> +		reg =3D mtk_eint_get_offset(eint, eint_num, eint->regs->dom_en);
> +		writel(BIT(idx & 0x1f), reg);
> +	}
>  	return 0;
>  }

[Severity: High]
Does mtk_eint_restore_skip_list() clobber dom_en for sibling EINTs, and do
suspend/resume and runtime IRQ handling end up masking skip-listed EINTs?

First, in mtk_eint_hw_init(), eint->regs->dom_en (offset 0x400, a plain 32-=
bit
register rather than write-1-to-set) is written with 0xffffffff for each
32-pin word. Immediately afterward in mtk_eint_do_init(),
mtk_eint_restore_skip_list() writes BIT(idx & 0x1f) to dom_en, which
overwrites the entire 32-bit register and clears domain enable for the other
31 EINTs in that word.

Second, mtk_eint_do_init() zero-allocates eint->wake_mask and eint->cur_mask
(where 0 means masked and 1 means unmasked when mtk_eint_chip_write_mask()
writes ~buf[inst][port] to mask_set). Neither mtk_eint_do_init() nor
mtk_eint_restore_skip_list() sets the skip_eint_list bits in wake_mask or
cur_mask, and mtk_eint_do_resume() does not call mtk_eint_restore_skip_list=
().
When the system suspends and resumes:

mtk_eint_do_suspend()
  mtk_eint_chip_write_mask(eint, eint->wake_mask)
    writel_relaxed(~buf[inst][port], reg + eint->regs->mask_set)

mtk_eint_do_resume()
  mtk_eint_chip_write_mask(eint, eint->cur_mask)
    writel_relaxed(~buf[inst][port], reg + eint->regs->mask_set)

Will this mask firmware-owned EINTs such as MT8971 EINT215 (PROCHOT) during
suspend and leave them permanently masked after resume?

Third, mtk_eint_do_init() maps a Linux virq with handle_level_irq for every
pin with inst < eint->nbase, including skip-listed pins. Since dom_en is set
and the pin is unmasked, if a skip-listed EINT asserts at runtime,
mtk_eint_irq_handler() will call generic_handle_domain_irq(), causing
handle_level_irq() to see no registered Linux action and call mask_ack_irq()
to mask and acknowledge the firmware-owned interrupt. Should skip-listed EI=
NTs
also be excluded from dom_en or skipped in mtk_eint_irq_handler(), and have
their bits preserved across suspend and resume?

[ ... ]
> @@ -536,6 +747,9 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mt=
k_eint_pin *eint_pin)
>  {
>  	unsigned int size, i, port, virq, inst =3D 0;
> =20
> +	dev_info(eint->dev, "EINT init: ap_num=3D%u nbase=3D%u db_cnt=3D%u\n",
> +		 eint->hw->ap_num, eint->nbase, eint->hw->db_cnt);
> +
>  	/* If clients don't assign a specific regs, let's use generic one */
>  	if (!eint->regs)
>  		eint->regs =3D &mtk_generic_eint_regs;
> @@ -553,6 +767,9 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mt=
k_eint_pin *eint_pin)
>  				continue;
>  			eint->base_pin_num[inst]++;
>  		}
> +		for (i =3D 0; i < eint->nbase; i++)
> +			dev_info(eint->dev, "EINT init: base[%u] has %u pins\n",
> +				 i, eint->base_pin_num[i]);
>  	} else {
[ ... ]
> @@ -602,14 +819,23 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct =
mtk_eint_pin *eint_pin)
>  	if (!eint->domain)
>  		goto err_eint;
> =20
> +	dev_info(eint->dev, "EINT init: irq domain created (ap_num=3D%u)\n",
> +		 eint->hw->ap_num);
> +
>  	if (eint->hw->db_time) {
>  		for (i =3D 0; i < MTK_EINT_DBNC_MAX; i++)
>  			if (eint->hw->db_time[i] =3D=3D 0)
>  				break;
>  		eint->num_db_time =3D i;
> +		dev_info(eint->dev, "EINT init: debounce table has %u entries\n",
> +			 eint->num_db_time);
> +	} else {
> +		dev_info(eint->dev, "EINT init: no debounce table (db_time=3DNULL)\n");
> +	}
> =20
>  	mtk_eint_hw_init(eint);
> +	dev_info(eint->dev, "EINT init: hw_init done, creating IRQ mappings\n");
> +	mtk_eint_restore_skip_list(eint);

[Severity: Low]
This isn't a bug, but are these step-by-step dev_info() trace messages in
mtk_eint_do_init(), mtk_build_eint(), and mtk_paris_pinctrl_probe_soc()
(including printing hw->eint with %p in mtk_paris_pinctrl_probe_soc())
leftover bringup debugging that should be removed or converted to dev_dbg()=
 so
they do not spam the boot log on every MediaTek Paris SoC?

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8971.c b/drivers/pinctrl/=
mediatek/pinctrl-mt8971.c
> new file mode 100644
> index 0000000000000..951d3feeafa3f
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8971.c
> @@ -0,0 +1,58 @@
[ ... ]
> +static const struct mtk_eint_hw mt8971_eint_hw =3D {
> +	.port_mask =3D 0xf,
> +	.ports     =3D 4,
> +	.ap_num    =3D 216,
> +	.db_cnt    =3D 32,
> +	/*
> +	 * The debounce registers are not confirmed for MT8971 yet, so leave
> +	 * db_time unset and report debounce as unsupported.
> +	 */
> +	.db_time   =3D NULL,
> +};
> +
> +static const unsigned int eint_event_mt8971[] =3D {20};

[Severity: Medium]
Should mt8971_eint_hw set .has_event_mask =3D true?

mt8971_data wires up eint_event_mt8971 to .eint_event and .total_wake_eints,
but mtk_eint_apply_event_unmask() and mtk_eint_write_event_mask() return ea=
rly
when !eint->hw->has_event_mask, leaving eint_event_mt8971 unused.

> +/* EINT215 is used by firmware for PROCHOT and must stay unmasked. */
> +static const unsigned int mt8971_skip_eint_list[] =3D {215};
> +
> +const struct mtk_pin_soc mt8971_data =3D {
> +	.reg_in_order =3D true,
> +	.reg_order =3D mt8971_reg_order,
> +	.reg_order_stride =3D 0x4000,
> +	.pins =3D mtk_pins_mt8971,
> +	.npins =3D ARRAY_SIZE(mtk_pins_mt8971),
> +	.ngrps =3D ARRAY_SIZE(mtk_pins_mt8971),
> +	.eint_hw =3D &mt8971_eint_hw,
> +	.eint_pin =3D eint_pins_mt8971,
> +	.nfuncs =3D 8,

[Severity: Medium]
Should .nfuncs in mt8971_data be 16 instead of 8?

In pinctrl-mtk-mt8971.h, mt8971_reg_order[PINCTRL_PIN_REG_MODE] has a 4-bit
mask (0xf) and mtk_pins_mt8971[] defines functions with muxval 8, 9, and 10.
In mtk_pctrl_show_one_pin():

	pinmux =3D mtk_pctrl_get_pinmux(hw, gpio);
	if (pinmux >=3D hw->soc->nfuncs)
		pinmux -=3D hw->soc->nfuncs;

With .nfuncs =3D 8, any MT8971 pin muxed to function 8, 9, or 10 will have 8
subtracted from its reported pinmux value in debugfs.

> +	.gpio_m =3D 0,
> +	.base_names =3D mt8971_pinctrl_register_base_name,
> +	.nbase_names =3D ARRAY_SIZE(mt8971_pinctrl_register_base_name),
> +	.pull_type =3D NULL,
> +	.drive_set =3D mtk_pinconf_drive_set_rev1,
> +	.drive_get =3D mtk_pinconf_drive_get_rev1,
> +	.adv_drive_set =3D mtk_pinconf_adv_drive_set_raw,
> +	.adv_drive_get =3D mtk_pinconf_adv_drive_get_raw,
> +	.eint_event =3D eint_event_mt8971,
> +	.total_wake_eints =3D ARRAY_SIZE(eint_event_mt8971),
> +	.skip_eint_list =3D mt8971_skip_eint_list,
> +	.n_skip_eint =3D ARRAY_SIZE(mt8971_skip_eint_list),
> +};

[Severity: High]
Are .bias_set_combo and .bias_get_combo (as well as .pull_type) missing from
mt8971_data?

mt8971_reg_order defines PINCTRL_PIN_REG_PU, PINCTRL_PIN_REG_PD,
PINCTRL_PIN_REG_PUPD, PINCTRL_PIN_REG_R0, PINCTRL_PIN_REG_R1, and
PINCTRL_PIN_REG_RSEL, but mt8971_data leaves .bias_set_combo and
.bias_get_combo NULL. As a result, mtk_pinconf_get() and mtk_pinconf_set() =
in
pinctrl-paris.c return -ENOTSUPP for all bias parameters, and
mtk_pinctrl_program_bias_by_gpio() returns -EOPNOTSUPP on MT8971.

Also, if .bias_set_combo and .bias_get_combo are set to
mtk_pinconf_bias_set_combo and mtk_pinconf_bias_get_combo while .pull_type =
is
NULL, try_all_type defaults to MTK_PULL_TYPE_MASK. Because mt8971_reg_order
provides non-zero masks for all bias register fields on every pin, won't
mtk_pinconf_bias_set_combo() and mtk_pinconf_bias_get_combo() always match
MTK_PULL_RSEL_TYPE first for every pin unless a per-pin pull_type table is
provided?

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/p=
inctrl/mediatek/pinctrl-mtk-common-v2.c
> index faa6dbf0f6356..c8d88c9d3f05a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -81,7 +82,50 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl =
*hw,
>  	bool found =3D false;
>  	u32 bits;
> =20
> -	if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
> +	/*
> +	 * With reg_in_order, each pin has a fixed-size register block:
> +	 * offset =3D reg_order[field].offset + pin * reg_order_stride.
> +	 * Fields not present on this SoC have a zero mask and are handled by
> +	 * the "not supported" path below.
> +	 */
> +	if (hw->soc->reg_in_order && hw->soc->reg_order &&
> +	    hw->soc->reg_order[field].mask) {
> +		const struct mtk_pin_field_order *o =3D &hw->soc->reg_order[field];
> +
> +		if (desc->number > U32_MAX / hw->soc->reg_order_stride) {
> +			dev_err(hw->dev,
> +				"pin %d * reg_order_stride overflow\n",
> +				desc->number);
> +			return -EINVAL;
> +		}
> +
> +		if (o->offset > U32_MAX - desc->number * hw->soc->reg_order_stride) {
> +			dev_err(hw->dev,
> +				"offset + pin %d * reg_order_stride overflow\n",
> +				desc->number);
> +			return -EINVAL;
> +		}
> +
> +		if (o->index >=3D hw->nbase) {
> +			dev_err(hw->dev,
> +				"Invalid base for field %d for pin =3D %d (%s)\n",
> +				field, desc->number, desc->name);
> +			return -EINVAL;
> +		}
> +
> +		pfd->index  =3D o->index;
> +		pfd->offset =3D o->offset +
> +			      desc->number * hw->soc->reg_order_stride;
> +		pfd->bitpos =3D o->bitpos;
> +		pfd->mask   =3D o->mask;
> +		/* Fields never cross a register boundary in this layout. */
> +		pfd->next   =3D 0;
> +
> +		return 0;
> +	}

[Severity: High]
Can the reg_in_order path in mtk_hw_pin_field_lookup() perform out-of-bounds
MMIO accesses when called on virtual GPIOs?

On MT8901, the reg_cal range tables stop at physical pin 181, so
mtk_hw_pin_field_lookup() returns -ENOTSUPP for virtual GPIOs 182..208. On
MT8971, reg_in_order is true and pins 182..186 in mtk_pins_mt8971[] are
virtual GPIOs with no backing pad hardware, but this branch calculates
pfd->offset =3D o->offset + desc->number * hw->soc->reg_order_stride for any
desc->number without checking mtk_is_virt_gpio(hw, desc->number).

When mtk_gpio_get(), mtk_gpio_set(), or mtk_xt_get_gpio_state() (e.g. via
debugfs /sys/kernel/debug/gpio or dual-edge EINT handling) is called on a
virtual GPIO on MT8971, won't mtk_hw_get_value() / mtk_hw_set_value() read =
or
write unbacked MMIO offsets past the physical pin banks?

> @@ -369,26 +413,49 @@ static const struct mtk_eint_xt mtk_eint_xt =3D {
>  int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>  {
>  	struct device_node *np =3D pdev->dev.of_node;
> -	int ret, i, j, count_reg_names;
> +	int ret, i, count_reg_names;
> +	unsigned int j, nbase;
> +	struct fwnode_handle *fwnode =3D dev_fwnode(&pdev->dev);
> +	struct resource *res;
> +
> +	dev_info(&pdev->dev, "EINT build: starting (CONFIG_EINT_MTK=3D%d)\n",
> +		 IS_ENABLED(CONFIG_EINT_MTK));
> =20
>  	if (!IS_ENABLED(CONFIG_EINT_MTK))
>  		return 0;
> =20
> -	if (!of_property_read_bool(np, "interrupt-controller"))
> +	if (is_of_node(fwnode) && !of_property_read_bool(np, "interrupt-control=
ler"))
>  		return -ENODEV;
> =20
>  	hw->eint =3D devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
>  	if (!hw->eint)
>  		return -ENOMEM;
> =20
> -	count_reg_names =3D of_property_count_strings(np, "reg-names");
> +	if (is_of_node(fwnode)) {
> +		count_reg_names =3D of_property_count_strings(np, "reg-names");
> +	} else {
> +		count_reg_names =3D 0;
> +		for (i =3D 0; i < pdev->num_resources; i++) {
> +			struct resource *r =3D &pdev->resource[i];
> +
> +			if (resource_type(r) =3D=3D IORESOURCE_MEM)
> +				count_reg_names++;
> +		}
> +	}
>  	if (count_reg_names < 0)
>  		return -EINVAL;
> =20
> -	hw->eint->nbase =3D count_reg_names - (int)hw->soc->nbase_names;
> -	if (hw->eint->nbase <=3D 0)
> +	dev_info(&pdev->dev,
> +		 "EINT build: count_reg_names=3D%d nbase_names=3D%u\n",
> +		 count_reg_names, hw->soc->nbase_names);
> +
> +	/* need at least one EINT bank after the pin register bases */
> +	if ((unsigned int)count_reg_names <=3D hw->soc->nbase_names)
>  		return -EINVAL;

[Severity: High]
If count_reg_names < 0 or (unsigned int)count_reg_names <=3D
hw->soc->nbase_names, mtk_build_eint() returns -EINVAL directly after
allocating hw->eint without jumping to err_free_base to free hw->eint and
reset hw->eint =3D NULL.

Because mtk_paris_pinctrl_probe_soc() treats mtk_build_eint() failure as
non-fatal and continues probing, leaving hw->eint non-NULL with uninitializ=
ed
fields (hw->eint->pins =3D=3D NULL, hw->eint->hw =3D=3D NULL, hw->eint->dom=
ain =3D=3D
NULL) will cause subsequent checks gated on if (hw->eint) in
mtk_paris_pinctrl_probe_soc(), mtk_gpio_set_config() (dereferencing
hw->eint->pins[desc->eint.eint_n].debounce), mtk_gpio_to_irq(), and
mtk_paris_pinctrl_suspend() / mtk_paris_pinctrl_resume() to dereference NULL
pointers. Should these two error paths goto err_free_base (or allocate
hw->eint after validating count_reg_names)?

> +	nbase =3D (unsigned int)count_reg_names - hw->soc->nbase_names;
> +	hw->eint->nbase =3D nbase;
> =20
>  	hw->eint->base =3D devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
>  					    sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
>  	if (!hw->eint->base) {
> @@ -397,20 +464,30 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct p=
latform_device *pdev)
>  	}
> =20
>  	for (i =3D hw->soc->nbase_names, j =3D 0; i < count_reg_names; i++, j++=
) {
> -		hw->eint->base[j] =3D of_iomap(np, i);
> -		if (IS_ERR(hw->eint->base[j])) {
> -			ret =3D PTR_ERR(hw->eint->base[j]);
> +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
> +		hw->eint->base[j] =3D is_of_node(fwnode) ? of_iomap(np, i) :
> +				ioremap(res->start, resource_size(res));
> +		if (!hw->eint->base[j]) {
> +			ret =3D -ENOMEM;
>  			goto err_free_eint;
>  		}
> +		dev_info(&pdev->dev, "EINT build: base[%u] mapped @ %pK (res %d)\n",
> +			 j, hw->eint->base[j], i);
>  	}

[Severity: Medium]
Does mtk_build_eint() leak the hw->eint->base[j] MMIO mappings when the dev=
ice
is unbound or when a later step in mtk_paris_pinctrl_probe_soc() fails?

Each hw->eint->base[j] is mapped with unmanaged of_iomap() or ioremap(). On=
ce
mtk_eint_do_init() succeeds, the devm teardown callback mtk_eint_teardown()
removes the IRQ domain and mappings, but nothing calls iounmap() on
eint->base[j] during devres release. Could this use devm_ioremap() /
devm_of_iomap(), or unmap eint->base[j] in mtk_eint_teardown()?

[ ... ]
> @@ -659,6 +761,12 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mt=
k_pinctrl *hw,
>  {
>  	int err, r0, r1;
> =20
> +	/* Bus-hold is not supported for R1R0 path; reject explicitly */
> +	if (pullup =3D=3D MTK_BUS_HOLD) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
> +
>  	if ((arg =3D=3D MTK_DISABLE) || (arg =3D=3D MTK_PUPD_SET_R1R0_00)) {
>  		pullup =3D 0;
>  		r0 =3D 0;
[ ... ]
> @@ -814,6 +923,96 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *h=
w,
[ ... ]
> +static int mtk_pinctrl_public_arg_to_internal(u32 pub, u32 *out)
> +{
> +	switch (pub) {
> +	case MTK_PIN_ENABLE:\n> +		*out =3D MTK_ENABLE;
> +		return 0;
> +	case MTK_PIN_DISABLE:
> +		*out =3D MTK_DISABLE;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}

[Severity: Medium]
When mtk_pinctrl_program_bias_by_gpio() is called with MTK_PIN_ENABLE on a =
pin
of type MTK_PULL_PUPD_R1R0_TYPE, mtk_pinctrl_public_arg_to_internal() maps
MTK_PIN_ENABLE to MTK_ENABLE (1), which is then passed to
mtk_pinconf_bias_set_combo() -> mtk_pinconf_bias_set_pupd_r1_r0().

However, mtk_pinconf_bias_set_pupd_r1_r0() only accepts MTK_DISABLE (0) or
MTK_PUPD_SET_R1R0_00..11 (100..103) and rejects arg =3D=3D MTK_ENABLE (1) w=
ith
-EINVAL. Won't mtk_pinctrl_program_bias_by_gpio() fail with -EINVAL whenever
enabling pull-up or pull-down on any R1R0 pin (such as 138 of the 182 physi=
cal
pins on MT8901)?

> +int mtk_pinctrl_program_bias_by_gpio(unsigned int gpio, u32 pullup, u32 =
arg)
> +{
> +	struct mtk_pinctrl *hw;
> +	const struct mtk_pin_desc *desc;
> +	u32 int_pullup, int_arg;
> +	int err;
> +
> +	err =3D mtk_pinctrl_public_pullup_to_internal(pullup, &int_pullup);
> +	if (err)
> +		return err;
> +	err =3D mtk_pinctrl_public_arg_to_internal(arg, &int_arg);
> +	if (err)
> +		return err;
> +
> +	err =3D -ENODEV;
> +	mutex_lock(&mtk_pinctrl_instances_lock);
> +	list_for_each_entry(hw, &mtk_pinctrl_instances, instance_node) {
> +		if (gpio >=3D hw->soc->npins)
> +			continue;
> +
> +		desc =3D &hw->soc->pins[gpio];
> +		if (desc->number !=3D gpio)
> +			continue;
> +
> +		if (!hw->soc->bias_set_combo) {
> +			err =3D -EOPNOTSUPP;
> +			break;
> +		}
> +
> +		err =3D hw->soc->bias_set_combo(hw, desc, int_pullup, int_arg);
> +		break;
> +	}
> +	mutex_unlock(&mtk_pinctrl_instances_lock);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(mtk_pinctrl_program_bias_by_gpio);

[Severity: High]
Does mtk_pinctrl_program_bias_by_gpio() read out-of-bounds from
mt8901_pull_type[] when called with a virtual GPIO number?

On MT8901, hw->soc->npins is 209 (pins 0..181 are physical pads and pins
182..208 are virtual GPIOs), whereas mt8901_pull_type[] in pinctrl-mt8901.c
only has 182 entries (indices 0..181). Unlike mtk_pinconf_set() in
pinctrl-paris.c, which checks mtk_is_virt_gpio(hw, pin) before calling
bias_set_combo, mtk_pinctrl_program_bias_by_gpio() only checks gpio >=3D
hw->soc->npins. If called with gpio in 182..208, it calls
mtk_pinconf_bias_set_combo():

	if (hw->soc->pull_type)
		try_all_type =3D hw->soc->pull_type[desc->number];

which reads past the end of mt8901_pull_type[]. Should
mtk_pinctrl_program_bias_by_gpio() reject virtual GPIOs with
mtk_is_virt_gpio(hw, gpio)?

[Severity: Medium]
In addition, since mtk_pinctrl_public_arg_to_internal() only accepts
MTK_PIN_ENABLE and maps it to int_arg =3D MTK_ENABLE (1), callers of
mtk_pinctrl_program_bias_by_gpio() cannot pass R1R0 resistance selectors and
any call with MTK_PIN_ENABLE on an MTK_PULL_PUPD_R1R0_TYPE pin will pass
int_arg =3D 1 to hw->soc->bias_set_combo(), causing
mtk_pinconf_bias_set_pupd_r1_r0() to fail with -EINVAL (and failing with
-EOPNOTSUPP on MT8971 where bias_set_combo is NULL). Should
mtk_pinconf_bias_set_pupd_r1_r0() accept MTK_ENABLE with a default R1R0
setting, or should mtk_pinctrl_public_arg_to_internal() support R1R0
arguments?

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h b/drivers/pinc=
trl/mediatek/pinctrl-mtk-mt8971.h
> new file mode 100644
> index 0000000000000..7e59bc9507a18
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h
> @@ -0,0 +1,1646 @@
[ ... ]
> +static struct mtk_eint_pin eint_pins_mt8971[] =3D {
[ ... ]
> +	MTK_EINT_PIN(10, 4, 28, 0),
> +	MTK_EINT_PIN(11, 4, 34, 0),
> +	MTK_EINT_PIN(12, 5, 0, 0),
> +	MTK_EINT_PIN(13, 5, 0, 0),
[ ... ]
> +	MTK_EINT_PIN(185, 0, 54, 0),
> +	MTK_EINT_PIN(186, 0, 55, 0),
> +	MTK_EINT_PIN(187, 1, 0, 1),
> +	MTK_EINT_PIN(188, 1, 1, 1),
[ ... ]
> +	MTK_EINT_PIN(214, 1, 27, 0),
> +	MTK_EINT_PIN(215, 2, 0, 1),
> +};
[ ... ]
> +	/*
> +	 * Virtual GPIO: no ball, but backed by EINT hardware. funcs[0] has
> +	 * no name so that mtk_is_virt_gpio() treats it as virtual.
> +	 */
> +	MTK_PIN(182, "GPIO182", MTK_EINT_FUNCTION(0, 182), DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)),
> +	MTK_PIN(183, "GPIO183", MTK_EINT_FUNCTION(0, 183), DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)),
> +	MTK_PIN(184, "GPIO184", MTK_EINT_FUNCTION(0, 184), DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)),
> +	MTK_PIN(185, "GPIO185", MTK_EINT_FUNCTION(0, 185), DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)),
> +	MTK_PIN(186, "GPIO186", MTK_EINT_FUNCTION(0, 186), DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)),
> +};

[Severity: High]
Are virtual GPIO descriptors for EINTs 187..214 missing from
mtk_pins_mt8971[], and should non-EINT pins in eint_pins_mt8971[] use
INVALID_BASE (0xff) instead of instance 5?

In eint_pins_mt8971[], EINTs 187..214 are populated on EINT bank 1 (indices
0..27), and mt8971_eint_hw.ap_num is 216. However, mtk_pins_mt8971[] stops =
at
pin 186 (npins =3D 187). When any interrupt on EINT bank 1 (hwirq 187..214)=
 is
requested, mtk_eint_irq_request_resources() calls mtk_xt_get_gpio_n(), which
searches mtk_pins_mt8971[0..186], fails to find the EINT, and fails the IRQ
request with -EINVAL (and gpiolib rejects any ACPI GpioInt resource >=3D 187
because chip->ngpio is 187).

Also, the 12 pins without EINT support in mtk_pins_mt8971[] (pins 12, 13, 1=
7,
18, 22, 56..59, 148, 149, 181) are given instance 5 in eint_pins_mt8971[]
rather than INVALID_BASE (0xff). If firmware provides more than 5 EINT memo=
ry
resources, inst < eint->nbase will treat all 12 non-EINT pins as valid EINTs
aliased to bank 5 index 0.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/m=
ediatek/pinctrl-paris.c
> index 09098b68f7257..a827ae618eff3 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
[ ... ]
> @@ -928,9 +956,15 @@ static int mtk_gpio_set_config(struct gpio_chip *chi=
p, unsigned int offset,
> =20
>  	desc =3D (const struct mtk_pin_desc *)&hw->soc->pins[offset];
> =20
> +	/*
> +	 * Not every EINT has debounce hardware, the virtual GPIOs among them.
> +	 * Report that as unsupported so gpiolib treats the request as optional
> +	 * rather than warning about an -EINVAL from the EINT driver.
> +	 */
>  	if (!hw->eint ||
>  	    pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUNCE ||
> -	    desc->eint.eint_n =3D=3D EINT_NA)
> +	    desc->eint.eint_n =3D=3D EINT_NA ||
> +	    !hw->eint->pins[desc->eint.eint_n].debounce)
>  		return -ENOTSUPP;
> =20
>  	debounce =3D pinconf_to_config_argument(config);
> =20
>  	return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounce);
>  }

[Severity: High]
Should mtk_gpio_set_config() and mtk_eint_irq_handler() also check
hw->eint->hw->db_time (or should eint_pins_mt8971[] clear .debounce)?

In pinctrl-mt8971.c, mt8971_eint_hw sets .db_time =3D NULL with a comment n=
oting
that debounce registers are not confirmed on MT8971 and debounce should be
reported as unsupported. However, 32 pins in eint_pins_mt8971[] still have
.debounce =3D 1.

When acpi_dev_gpio_irq_wake_get_by() requests an ACPI GpioInt on any of tho=
se
32 pins on MT8971, it calls gpio_set_debounce_timeout() ->
mtk_gpio_set_config(). Because .debounce is 1 and mtk_gpio_set_config() does
not check !hw->eint->hw->db_time, it calls mtk_eint_set_debounce(), which
returns -EOPNOTSUPP. Since gpio_set_config_with_argument_optional() only
ignores -ENOTSUPP and treats -EOPNOTSUPP as a fatal error, won't ACPI GpioI=
nt
setup fail on all 32 debounce-marked pins on MT8971? Additionally, in
mtk_eint_irq_handler(), if (eint->pins[eint_num].debounce) will still call
mtk_eint_debounce_process() and touch the unconfirmed dbnc_ctrl and dbnc_set
registers on MT8971.

[ ... ]
> @@ -1069,26 +1139,79 @@ int mtk_paris_pinctrl_probe(struct platform_devic=
e *pdev)
[ ... ]
>  	/* Build gpiochip should be after pinctrl_enable is done */
>  	err =3D mtk_build_gpiochip(hw);
>  	if (err)
>  		return dev_err_probe(dev, err, "Failed to add gpio_chip\n");
> =20
> +	dev_info(dev, "PROBE: gpiochip registered, adding GPIO range\n");
> +
> +	pinctrl_add_gpio_range(hw->pctrl, &hw->range);
> +#ifdef CONFIG_GPIO_ACPI
> +	if (hw->eint) {
> +		dev_info(dev, "PROBE: requesting ACPI GPIO interrupts\n");
> +		acpi_gpiochip_request_interrupts(&hw->chip);
> +		dev_info(dev, "PROBE: ACPI GPIO interrupts requested\n");
> +
> +		err =3D devm_add_action_or_reset(dev,
> +					       mtk_pinctrl_acpi_free_interrupts,
> +					       &hw->chip);
> +		if (err) {
> +			pinctrl_remove_gpio_range(hw->pctrl, &hw->range);
> +			return dev_err_probe(dev, err,
> +					     "Failed to add ACPI GPIO cleanup\n");
> +		}
> +	} else {
> +		dev_info(dev, "PROBE: no EINT, skipping ACPI GPIO interrupts\n");
> +	}
> +#endif
> +
>  	platform_set_drvdata(pdev, hw);
> =20
> +	/*
> +	 * Register so mtk_pinctrl_program_bias_by_gpio() can find this
> +	 * controller. The devm action unregisters it before hw is freed.
> +	 */
> +	mtk_pinctrl_register_instance(hw);
> +
> +	err =3D devm_add_action_or_reset(&pdev->dev,
> +				       mtk_paris_unregister_instance, hw);
> +	if (err)
> +		return err;

[Severity: High]
Does registering hw->range with pinctrl_add_gpio_range() here leave
gdev->pin_ranges empty on ACPI, duplicate ranges on Device Tree platforms, =
and
leave a dangling range on error or teardown?

First, mtk_build_gpiochip() sets chip->request =3D gpiochip_generic_request=
 and
chip->free =3D gpiochip_generic_free. In gpiolib, gpiochip_generic_request()
checks:

	if (list_empty(&gc->gpiodev->pin_ranges))
		return 0;

Calling pinctrl_add_gpio_range() only adds hw->range to hw->pctrl->gpio_ran=
ges
and does not add a pin range to gc->gpiodev->pin_ranges (unlike
gpiochip_add_pin_range()). On ACPI platforms, gc->gpiodev->pin_ranges remai=
ns
empty, so gpiochip_generic_request() returns early without calling
pinctrl_gpio_request() or mtk_pinmux_gpio_request_enable() to mux the pin to
GPIO mode.

Second, on Device Tree platforms, devm_gpiochip_add_data() in
mtk_build_gpiochip() already parses the DT gpio-ranges property via
of_gpiochip_add_pin_range(), so unconditionally adding hw->range registers a
duplicate range.

Third, if devm_add_action_or_reset(&pdev->dev, mtk_paris_unregister_instanc=
e,
hw) fails (or when the driver is unbound), pinctrl_remove_gpio_range() is
never called for hw->range. Should this use gpiochip_add_pin_range() (for
example via chip->add_pin_ranges when gpio-ranges is not present in DT) so
that gpiolib populates gdev->pin_ranges and automatically removes the range
when the gpio_chip is torn down?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105050535.2551=
413-1-shubham.paralikar@mediatek.com?part=3D1
