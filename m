Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195770;
	b=cIeN3ja7LxUgAN2R+Upts9rFnJaublKH1g8+xXPM5uRweEvxl5ecPCT9WBQrYVlxTky3
	 Y0relpGpurfZAuJ/yV/45XDkz1kHp9z/H/x590kxcrPEpi53Yuga1ELcbdz16ibhSCUZy
	 kMx+bnabJ6pscDrNAKVHYD6onm5y+/8SDGti1uuAUq4Ld7HImtzp/aLTIm1mfRgq6S7Xa
	 dkpYGTKYvGNkaEeQjdAQ1/YtCRRW4/1uQ+U9/C7xzF2iop4aHufnALlPkSUchtCstLsCY
	 uFTf3YzYVahhOKJs8WqoqJryMKiOKIdbj7pi+Vb4w4d9wupToyrgmDquPV9CkJfgrEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195770;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MxC3qwAmwCyuprYd3XLtiDqt20Vzu/W8XwnCmGxn9B4=;
	b=CTEHShHXC66WUq/6luly91OcOnNsEV+TGxLxd0F8ZsBGXpVQs6C4xVf9fdzwav7LAIei
	 fwBenJZRnA16Ej48Ft+kMC5iWISWZctDKnCaTVKTRNwmDopj/YtYrHrU36KTVE8aaClkA
	 m6VMlC+M1xygFNnQ4M4Ajoj1ccICZkY49csvMNbjT0RHutXOFhPhIRuYQZ5GU/alU1ljC
	 dgdqn7lsdk19GAnB0fGnInKK12yXXirigU0h+SPS8IgKFfe2euU4/4bwgT7B5R2b6dr8q
	 7xU20GE7f5d2jGAshQsof7KZSSq2yL8BSt01ijjqPoEKHGJkL78XaIiKpOiFkLKQzYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ep2kRVnt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065C560A261F
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 17:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ep2kRVnt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2175F1F000ED;
	Fri, 20 Nov 2026 17:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195769;
	bh=MxC3qwAmwCyuprYd3XLtiDqt20Vzu/W8XwnCmGxn9B4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ep2kRVntUJGzKfINJdx1Gsy+w7dHlwYVm/Vl+WZ6HU5MG7+YZ8wfgccQMfqZurFdY
	 UkGb4Az4DxiYkxZ0VHfvFTILg64KmQ6rzbQ5yRnzHd80Z08SPiH3YU7bRoYIaFwHIX
	 5wKzoC36UMuiQ0d6TxZkQSTWdbaY+S6tOF1PSBRL/IOaOm9Ao78BEX9F4afe5Z0CZG
	 X9s1Miu5avStGXOJKR7AgtuhjvDNWeqzGOeGwMljdV7ejyEDQg1bpmPtUFrBBeX8/Q
	 9lFaj5JCj2T91/Or0hsVOv01Y0HKebpfks8PygTYMvLKdaRyVoVplgMPd+QTg/kNpu
	 YFGqXJihlwa9g==
Message-ID: <sashiko-outbox-225664@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/1] pinctrl: mediatek: Add MT8901/MT8971 ACPI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Paralikar" <shubham.paralikar@mediatek.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261120165908.3204369-2-shubham.paralikar@mediatek.com>
References: <20261120165908.3204369-1-shubham.paralikar@mediatek.com>
 <20261120165908.3204369-2-shubham.paralikar@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:29:28 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] pinctrl: mediatek: dom_en clobber and resume masking of
  skip_eint_list
- [High] pinctrl: mediatek: missing bias_set_combo and bias_get_combo in
  mt8971_data
- [High] pinctrl: mediatek: broken zero and edge debounce in
  mtk_eint_set_debounce()
- [Medium] pinctrl: mediatek: mt8971_eint_hw leaves has_event_mask unset
- [Medium] pinctrl: mediatek: MMIO mapping leak of EINT bases in
  mtk_build_eint()
- [Medium] pinctrl: mediatek: late gpiochip_add_pin_range() in
  mtk_build_gpiochip()
- [Medium] pinctrl: mediatek: 5-bit DRV_ADV mask on MT8971 exceeds
  mtk_drv_adv_to_uA()
- [Low] pinctrl: mediatek: bus-hold misreported as pull-up in Moore
  mtk_pinconf_get()
--

commit 2b689323e13770cc2d8b01816cd9e413c2dc20fb
Author: Shubham Paralikar <shubham.paralikar@mediatek.com>

pinctrl: mediatek: Add MT8901/MT8971 ACPI driver

This commit adds an ACPI probe helper and SoC drivers for the MediaTek
MT8901 and MT8971 Paris pin controllers, along with ACPI, wake-event,
skip-list, reg_order, and bus-hold support in the shared pinctrl and EINT
drivers.

> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediat=
ek/mtk-eint.c
> index 389ceaffcee4a..1f8d68673725b 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c

[ ... ]

> @@ -327,12 +486,38 @@ static unsigned int mtk_eint_hw_init(struct mtk_ein=
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
> =20
> +/* Make sure skip-listed EINTs are unmasked and domain enabled. */
> +static int mtk_eint_restore_skip_list(struct mtk_eint *eint)
> +{
> +	unsigned int k, eint_num, inst, idx;
> +	void __iomem *reg;
> +
> +	if (!eint->skip_eint_list || !eint->num_skip_eint)
> +		return 0;
> +
> +	for (k =3D 0; k < eint->num_skip_eint; k++) {
> +		eint_num =3D eint->skip_eint_list[k];
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
> =20
> @@ -371,6 +556,8 @@ static void mtk_eint_irq_handler(struct irq_desc *des=
c)
>  				shift =3D __ffs(status);
>  				status &=3D ~BIT(shift);
>  				mask =3D BIT(shift);
> +				if (shift + j >=3D eint->base_pin_num[i])
> +					continue;
>  				eint_num =3D eint->pin_list[i][shift + j];

[ ... ]

> @@ -436,6 +623,8 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
>  int mtk_eint_do_resume(struct mtk_eint *eint)
>  {
>  	mtk_eint_chip_write_mask(eint, eint->cur_mask);
> +	mtk_eint_apply_event_unmask(eint);
> +	mtk_eint_apply_wake_event_unmask(eint);
> =20
>  	return 0;
>  }

[Severity: High]
Does mtk_eint_restore_skip_list() clobber dom_en for sibling EINTs, and do
mtk_eint_do_resume() and mtk_eint_irq_handler() end up masking skip-listed
firmware EINTs?

Unlike mask_clr, dom_en is a plain 32-bit bitmask register that
mtk_eint_hw_init() just set to 0xffffffff, so writing BIT(idx & 0x1f) to
dom_en clears domain enable for the other 31 EINTs in that word.

Also, skip-listed EINTs never have their bits set in eint->cur_mask (where
1 means unmasked), and mtk_eint_do_resume() calls
mtk_eint_chip_write_mask(eint, eint->cur_mask) without restoring the skip
list, which writes ~cur_mask to mask_set and leaves EINT215 masked after
resume.  Finally, if a skip-listed EINT asserts while AP domain access is
enabled, mtk_eint_irq_handler() dispatches it via
generic_handle_domain_irq() to handle_level_irq(), which calls
mask_ack_irq() and masks the firmware-owned interrupt because no Linux
irqaction is registered.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8971.c b/drivers/pinctrl/=
mediatek/pinctrl-mt8971.c
> new file mode 100644
> index 0000000000000..6b0ac68e834ef
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8971.c
> @@ -0,0 +1,91 @@

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

mt8971_data wires up eint_event_mt8971, but mtk_eint_write_event_mask()
returns early when !eint->hw->has_event_mask, so eint_event_mt8971 and
wake-event unmasking in mtk_eint_irq_set_wake() and mtk_eint_do_resume()
have no effect on MT8971.

> +/* EINT215 is used by firmware for PROCHOT and must stay unmasked. */
> +static const unsigned int mt8971_skip_eint_list[] =3D {215};
> +
> +static const struct mtk_pin_soc mt8971_data =3D {
> +	.reg_order =3D mt8971_reg_order,
> +	.reg_order_stride =3D 0x4000,
> +	.pins =3D mtk_pins_mt8971,
> +	.npins =3D ARRAY_SIZE(mtk_pins_mt8971),
> +	.ngrps =3D ARRAY_SIZE(mtk_pins_mt8971),
> +	.eint_hw =3D &mt8971_eint_hw,
> +	.eint_pin =3D eint_pins_mt8971,
> +	.nfuncs =3D 16,
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
Are .bias_set_combo, .bias_get_combo, and .pull_type missing from
mt8971_data?

mtk_pinconf_get() and mtk_pinconf_set() in pinctrl-paris.c handle all
PIN_CONFIG_BIAS_* parameters exclusively through bias_get_combo and
bias_set_combo, so every bias configuration or query on MT8971 currently
fails with -ENOTSUPP.  In addition, because mt8971_reg_order defines
non-zero masks for PU, PD, RSEL, PUPD, R0, and R1 on every non-virtual pin,
leaving pull_type as NULL causes mtk_pinconf_bias_set_combo() and
mtk_pinconf_bias_get_combo() to always match the RSEL / PU_PD branches and
never reach PUPD_R1R0.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/p=
inctrl/mediatek/pinctrl-mtk-common-v2.c
> index ca8782f9358ac..e1bf3a4e089b3 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c

[ ... ]

> @@ -398,16 +444,25 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct p=
latform_device *pdev)
>  	}
> =20
>  	for (i =3D hw->soc->nbase_names, j =3D 0; i < count_reg_names; i++, j++=
) {
> -		hw->eint->base[j] =3D of_iomap(np, i);
> +		if (is_of_node(fwnode)) {
> +			hw->eint->base[j] =3D of_iomap(np, i);
> +		} else {
> +			res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
> +			hw->eint->base[j] =3D res ? ioremap(res->start,
> +							  resource_size(res)) : NULL;
> +		}
>  		if (!hw->eint->base[j]) {
>  			ret =3D -ENOMEM;
>  			goto err_free_eint;
>  		}
>  	}

[Severity: Medium]
Does this leak the ioremap() mappings in hw->eint->base[] if a later step
in mtk_paris_pinctrl_probe_soc() fails or when the device is unbound?

Once mtk_build_eint() returns 0, neither mtk_eint_teardown() nor any devres
action unmaps hw->eint->base[].  Using devm_platform_ioremap_resource() (or
unmapping in mtk_eint_teardown()) would avoid leaking the MMIO mappings.

[ ... ]

> @@ -905,8 +989,12 @@ static int mtk_pinconf_bias_get_pu_pd(struct mtk_pin=
ctrl *hw,
>  	} else if (pu =3D=3D 0 && pd =3D=3D 1) {
>  		*pullup =3D 0;
>  		*enable =3D MTK_ENABLE;
> -	} else
> +	} else if (pu =3D=3D 1 && pd =3D=3D 1) {
> +		*pullup =3D MTK_BUS_HOLD;
> +		*enable =3D MTK_ENABLE;
> +	} else {
>  		err =3D -EINVAL;
> +	}
> =20
>  out:
>  	return err;

[Severity: Low]
Can returning *pullup =3D MTK_BUS_HOLD (2) from mtk_pinconf_bias_get_pu_pd()
and mtk_pinconf_bias_get_pu_pd_rsel() cause mtk_pinconf_get() in
pinctrl-moore.c to misreport bus-hold as PIN_CONFIG_BIAS_PULL_UP?

pinctrl-paris.c was updated to check pullup !=3D MTK_PULLUP, but
pinctrl-moore.c still checks:

drivers/pinctrl/mediatek/pinctrl-moore.c:mtk_pinconf_get() {
	...
	case PIN_CONFIG_BIAS_PULL_UP:
		if (hw->soc->bias_get_combo) {
			err =3D hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
			if (err)
				return err;
			if (ret =3D=3D MTK_PUPD_SET_R1R0_00 || ret =3D=3D MTK_DISABLE)
				return -EINVAL;
			if (!pullup)
				return -EINVAL;
	...
}

When pu =3D=3D 1 && pd =3D=3D 1, pullup is MTK_BUS_HOLD, so !pullup is fals=
e and
PIN_CONFIG_BIAS_PULL_UP succeeds instead of returning -EINVAL.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h b/drivers/pinc=
trl/mediatek/pinctrl-mtk-mt8971.h
> new file mode 100644
> index 0000000000000..7e59bc9507a18
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h
> @@ -0,0 +1,1646 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2026 MediaTek Inc.
> + *
> + * MediaTek MT8971 pin data.
> + */
> +#ifndef __PINCTRL_MTK_MT8971_H
> +#define __PINCTRL_MTK_MT8971_H
> +
> +#include "pinctrl-paris.h"
> +
> +static const struct mtk_pin_field_order mt8971_reg_order[PINCTRL_PIN_REG=
_MAX] =3D {
> +	[PINCTRL_PIN_REG_DIR]     =3D { .index =3D 0, .offset =3D 0x00, .mask =
=3D 0x1,  .bitpos =3D 0 },
> +	[PINCTRL_PIN_REG_DO]      =3D { .index =3D 0, .offset =3D 0x10, .mask =
=3D 0x1,  .bitpos =3D 0 },
> +	[PINCTRL_PIN_REG_DI]      =3D { .index =3D 0, .offset =3D 0x20, .mask =
=3D 0x1,  .bitpos =3D 0 },
> +	[PINCTRL_PIN_REG_MODE]    =3D { .index =3D 0, .offset =3D 0x30, .mask =
=3D 0xf,  .bitpos =3D 0 },
> +	[PINCTRL_PIN_REG_DRV]     =3D { .index =3D 1, .offset =3D 0x00, .mask =
=3D 0x7,  .bitpos =3D 0 },
> +	[PINCTRL_PIN_REG_DRV_ADV] =3D { .index =3D 1, .offset =3D 0x00, .mask =
=3D 0x1f, .bitpos =3D 8 },

[Severity: Medium]
Is the 0x1f mask for PINCTRL_PIN_REG_DRV_ADV in mt8971_reg_order compatible
with mtk_drv_adv_to_uA()?

mt8971_data uses mtk_pinconf_adv_drive_get_raw(), which reads a 5-bit value
(0..31) with this mask and passes it to mtk_drv_adv_to_uA() in
pinctrl-paris.c during PIN_CONFIG_DRIVE_STRENGTH and
PIN_CONFIG_DRIVE_STRENGTH_UA queries.  mtk_drv_adv_to_uA() expects a 3-bit
value and triggers WARN_ON_ONCE(val < 0 || val > 7) if bits 3 or 4 are set.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/m=
ediatek/pinctrl-paris.c
> index 1ae8133dd9c55..51f180839c94c 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c

[ ... ]

> @@ -928,9 +955,17 @@ static int mtk_gpio_set_config(struct gpio_chip *chi=
p, unsigned int offset,
> =20
>  	desc =3D (const struct mtk_pin_desc *)&hw->soc->pins[offset];
> =20
> +	/*
> +	 * Not every EINT has debounce hardware, the virtual GPIOs among them,
> +	 * and some SoCs have no debounce table at all (db_time is NULL).
> +	 * Report that as unsupported so gpiolib treats the request as optional
> +	 * rather than warning about an -EINVAL from the EINT driver.
> +	 */
>  	if (!hw->eint ||
>  	    pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUNCE ||
> -	    desc->eint.eint_n =3D=3D EINT_NA)
> +	    desc->eint.eint_n =3D=3D EINT_NA ||
> +	    !hw->eint->hw->db_time ||
> +	    !hw->eint->pins[desc->eint.eint_n].debounce)
>  		return -ENOTSUPP;
> =20
>  	debounce =3D pinconf_to_config_argument(config);

[Severity: High]
On MT8901 (where db_time is non-NULL), what happens when ACPI configures a
debounce-capable pin with debounce =3D=3D 0 or before irq_set_irq_type() se=
ts
level sensitivity?

acpi_dev_gpio_irq_wake_get_by() and acpi_find_gpio() unconditionally call
gpio_set_debounce_timeout() even when the ACPI resource specifies a
debounce timeout of 0, and before irq_set_irq_type() runs.
mtk_gpio_set_config() forwards that call to mtk_eint_set_debounce():

drivers/pinctrl/mediatek/mtk-eint.c:mtk_eint_set_debounce() {
	...
	if (!mtk_eint_can_en_debounce(eint, eint_num))
		return -EINVAL;

	dbnc =3D eint->num_db_time;
	for (i =3D 0; i < eint->num_db_time; i++) {
		if (debounce <=3D eint->hw->db_time[i]) {
			dbnc =3D i;
			break;
		}
	}
	...
}

If the EINT sens register bit is 0 (edge-sensitive),
mtk_eint_can_en_debounce() returns 0 and mtk_eint_set_debounce() returns
-EINVAL, which gpio_set_config_with_argument_optional() does not ignore,
failing the ACPI GpioInt/GpioIo lookup.  If the EINT is level-sensitive and
debounce =3D=3D 0, the loop matches 0 <=3D db_time[0] (156 us) and enables a
156 us hardware debounce filter via MTK_EINT_DBNC_SET_EN instead of
disabling debounce.

> @@ -961,9 +996,21 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>  	if (ret < 0)
>  		return ret;
> =20
> +	/* On DT the range comes from the gpio-ranges property. */
> +	if (!is_of_node(dev_fwnode(hw->dev)))
> +		return gpiochip_add_pin_range(chip, dev_name(hw->dev), 0, 0,
> +					      chip->ngpio);
> +
>  	return 0;
>  }

[Severity: Medium]
Can calling gpiochip_add_pin_range() after devm_gpiochip_add_data() miss
pinmux setup for GPIOs requested during chip registration?

devm_gpiochip_add_data() registers the ACPI GeneralPurposeIo OpRegion (which
evaluates AML _REG), clears ACPI _DEP dependencies, and exposes the GPIO
device before returning.  Any GPIO requested during that window sees an
empty pin_ranges list in gpiochip_generic_request(), skipping
pinctrl_gpio_request() / mtk_pinmux_gpio_request_enable() and racing with
the unlocked list_add_tail() in gpiochip_add_pin_range().  Registering the
range via chip->add_pin_ranges would populate pin_ranges before
acpi_gpiochip_add() runs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120165908.3204=
369-1-shubham.paralikar@mediatek.com?part=3D1
