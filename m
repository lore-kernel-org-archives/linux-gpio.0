Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38DB3D0BE1;
	Tue, 13 Oct 2026 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900205; cv=none; b=nA8KhbE7+wqEYx40m0jSQoDRI1WSKFNrXv2QfUOdpvPOemmow2VwmiBr8v427EKdHGph4hZH9TQX9R3XaV1vGZQCB3VdeHQcMkpK2w5+brR3NJ308AO1cNYNFq8CKIkH1pbOSIkZUDqAA5iq2BUHGOVLtTXC6QBXdaGZK+an2ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900205; c=relaxed/simple;
	bh=1IefC3iuQUrnFqoYEi0MFPNxQjrKAvxqtbUvGiWeLsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpKi/5ZX/35Ue+gXAe8JxbEOOV9AMxlwvufI9Bve6cA0rEKdzw83aE3PD/jsdv581szU89oVJTJ6+3r9bCacWzbpNb3Gppqx5ftTTZye4LRfOsOfT3mohXhx2+fflTvrICrAEmwMsDS0JB17+OKNaD01qfzZK6y7nSfeJIwmALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Z2Cw41gu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z2Cw41gu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D04F9169E;
	Tue, 13 Oct 2026 07:03:18 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3F03F7B4;
	Tue, 13 Oct 2026 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791900202; bh=1IefC3iuQUrnFqoYEi0MFPNxQjrKAvxqtbUvGiWeLsc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z2Cw41guH8GdudzEKSB7rd8ujbuphgZqVU4LW2T+IQrL6T21Zy11jE3OaKQsDLwRC
	 othZfQKLHSspMreGKNHWL9k0xpwsRfwXQfuc3DCcvZUhCbY4ofr3q2EKx605NiZGtL
	 pjM52We2Gi12vcgotT+j2A4R9qWqC8yg14Yd9xIw=
Message-ID: <35a421f1-c3f2-4863-938b-b516f5e3d2e6@arm.com>
Date: Tue, 13 Oct 2026 16:03:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: sunxi: a733: program the two-bit I/O voltage
 fields
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, linusw@kernel.org
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261012184130.548261-2-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261012184130.548261-2-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/12/26 20:41, Vinicius Pedrosa wrote:
> The A733 GPIO_POW_MOD_SEL register has a two-bit field per bank, but
> the A733 uses the helper written for one bit per bank, so a request
> for one bank can change the field of another one. With the register
> as firmware leaves it on a Radxa Cubie A7Z (the fields of PB, PC, PD,
> PE, PG, PH, PJ and PK in automatic mode, 0x01155550), a PJ request at
> 1.8 V turns the PE field into fixed 1.8 V (0x01155750).
> 
> Add a variant that takes the field of each bank from a mask table. It

Why do we need a table? The bit assignment is a linear
[bank * 2 + 1:bank * 2], no?

> keeps automatic mode and a fixed 3.3 V mode that already fits, and
> writes only the field of the requested bank. PF is left out: its field
> (11:10) is known, but it is tied to the MMC vqmmc voltage switching.

I don't think this redirection is legit. Yes, PortF could be supplied by 
VCC-IO, but surely that port always has to stay at 3.3V, as the 
datasheet requires.
So I would not treat PortF special here.

> PI is left out as well, since its supply domain is not documented.

Mmmh, but isn't that just because it's not exposed on the A733 package? 
Similar to what we saw on the A523: the registers for the banks are 
clearly there, it's just the manual doesn't mention them, because they 
are not used in the particular SoC version. If I read 0x2000480, I see 
at least 8 pins there (all bits set), and 0x2000488 reads 0xf, so there 
are 17 pins on PortI.
And if we don't use PI pins or the PI supply in the DT, we will never 
try to adjust the PI voltage withstand, so there is no problem.

> Only silicon revision B, as reported through SMCCC, is programmed,
> since the encoding is documented for that revision only.

Where does this come from? Where is it documented to be applicable for 
only a single revision?

I will send what I came up with in a minute, feel free to poke holes in 
there (it's just compile tested).

Cheers,
Andre

> Computed with both helpers on that register value, the old one changes
> it and the new one leaves it as it is.
> 
> Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> ---
>   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 15 +++++-
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 57 +++++++++++++++++++++
>   drivers/pinctrl/sunxi/pinctrl-sunxi.h       |  6 +++
>   3 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> index ca82f08a3a65..6f5757b8adea 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> @@ -21,10 +21,23 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>   /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>   	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
>   
> +/* PA is not implemented. PF and PI are left to the firmware, so are not listed. */
> +static const u32 a733_io_bias_masks[SUNXI_PINCTRL_MAX_BANKS] = {
> +	[1] = GENMASK(25, 24),	/* PB, VCC-IO */
> +	[2] = GENMASK(5, 4),	/* PC */
> +	[3] = GENMASK(7, 6),	/* PD */
> +	[4] = GENMASK(9, 8),	/* PE */
> +	[6] = GENMASK(13, 12),	/* PG */
> +	[7] = GENMASK(15, 14),	/* PH */
> +	[9] = GENMASK(19, 18),	/* PJ */
> +	[10] = GENMASK(21, 20),	/* PK */
> +};
> +
>   static struct sunxi_pinctrl_desc a733_pinctrl_data = {
>   	.irq_banks = 10,
>   	.irq_read_needs_mux = true,
> -	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> +	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
> +	.io_bias_masks = a733_io_bias_masks,
>   };
>   
>   static int a733_pinctrl_probe(struct platform_device *pdev)
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 3ee5012463da..8e62111d3409 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -10,6 +10,8 @@
>    * warranty of any kind, whether express or implied.
>    */
>   
> +#include <linux/arm-smccc.h>
> +#include <linux/bitfield.h>
>   #include <linux/clk.h>
>   #include <linux/export.h>
>   #include <linux/gpio/driver.h>
> @@ -722,6 +724,58 @@ static const struct pinconf_ops sunxi_pconf_ops = {
>   	.pin_config_group_set	= sunxi_pconf_group_set,
>   };
>   
> +/*
> + * The two-bit encoding is documented for A733 silicon revision B, which
> + * firmware reports through the SMCCC SOC_ID call. Do not assume it for any
> + * other revision, or when the firmware does not tell.
> + */
> +#define SUNXI_A733_SOC_ID		0x091e1903
> +#define SUNXI_A733_REV_B		1
> +
> +static bool sunxi_pinctrl_a733_rev_b(void)
> +{
> +#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
> +	s32 id = arm_smccc_get_soc_id_version();
> +
> +	/* Bit 23 is the JEP106 parity bit. */
> +	return id >= 0 && (id & ~BIT(23)) == SUNXI_A733_SOC_ID &&
> +	       arm_smccc_get_soc_id_revision() == SUNXI_A733_REV_B;
> +#else
> +	return false;
> +#endif
> +}
> +
> +/*
> + * Fields: 0 and 2 fixed 3.3V, 1 automatic, 3 fixed 1.8V. Leave automatic
> + * mode and any other supply voltage to the firmware, and touch only the
> + * field of this bank.
> + */
> +static void sunxi_pinctrl_set_io_bias_2bit(struct sunxi_pinctrl *pctl,
> +					   unsigned int bank, int uV)
> +{
> +	u32 mask = pctl->desc->io_bias_masks[bank];
> +	unsigned long flags;
> +	u32 val, cur, reg;
> +
> +	if (!mask || !sunxi_pinctrl_a733_rev_b())
> +		return;
> +
> +	if (uV >= 1620000 && uV <= 1980000)
> +		val = 3;
> +	else if (uV >= 2970000 && uV <= 3630000)
> +		val = 2;
> +	else
> +		return;
> +
> +	raw_spin_lock_irqsave(&pctl->lock, flags);
> +	reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
> +	cur = field_get(mask, reg);
> +	if (cur != 1 && cur != val && !(val == 2 && cur == 0))
> +		writel((reg & ~mask) | field_prep(mask, val),
> +		       pctl->membase + pctl->pow_mod_sel_offset);
> +	raw_spin_unlock_irqrestore(&pctl->lock, flags);
> +}
> +
>   static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
>   					 unsigned pin,
>   					 struct regulator *supply)
> @@ -795,6 +849,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
>   		       pctl->membase + pctl->pow_mod_sel_offset);
>   		raw_spin_unlock_irqrestore(&pctl->lock, flags);
>   		return 0;
> +	case BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT:
> +		sunxi_pinctrl_set_io_bias_2bit(pctl, bank, uV);
> +		return 0;
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index 7c2f29e75519..c37170b2e4f4 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -130,6 +130,11 @@ enum sunxi_desc_bias_voltage {
>   	 */
>   	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
>   	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> +	/*
> +	 * Bias voltage is set through two-bit fields in PIO_POW_MOD_SEL_REG,
> +	 * whose positions are given by io_bias_masks[], as seen on A733.
> +	 */
> +	BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
>   };
>   
>   struct sunxi_desc_function {
> @@ -155,6 +160,7 @@ struct sunxi_pinctrl_desc {
>   	bool				irq_read_needs_mux;
>   	bool				disable_strict_mode;
>   	enum sunxi_desc_bias_voltage	io_bias_cfg_variant;
> +	const u32			*io_bias_masks;
>   };
>   
>   struct sunxi_pinctrl_function {

