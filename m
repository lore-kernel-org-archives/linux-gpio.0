Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28E647C0ED;
	Mon, 12 Oct 2026 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800956; cv=none; b=FkoqBoLjTX2WfN6WE3LthlP1LjRoaPW4AZ0/f6be9uFiaYkr8c9PWiivLECiCgXWdfiIL5q/G69ANysPY6qGdAN4zJdTVaQb4M4GAQ76kggZVC/2mDzsVKkRHcmh1T6/cu4o3D6ixD9id2uNGroRiFTsBCEddUJ7LKNqJB506aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800956; c=relaxed/simple;
	bh=FxX/DV3Hd+gdPs+NLTFar8Ial//uJec9/23QuYexUgk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YgMiLez4VNQjFtQ+eUVLz/0+0UKEpaeI8/AD0BEUNsQnFUt1JYkhz0VmGiqLmQOQcWwq7aMevbIj8EPtiRCi1QVZvJcn763lfAQ6vuFG251Bf06aFZbY2ymlAA+ZTrHIfyT3cHQ8N6sWOnbloljJtOko8Wak9vLC2z5jfTfsL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZPAzy3T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZPAzy3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CD81F0089B;
	Mon, 12 Oct 2026 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791800948;
	bh=e6cS3WZpM3m966MAnnV/raCQy4PoeQp0AU6aTChnu3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nZPAzy3TiZbmiQGPxGiKU1nSBPiirrXRAfpeXlBqz+YyM8ZUhIhhZ0HZFJT0wVrJm
	 9erxLnHqhxmn1grTwysMSaVKvieIXng7hRNMQFWefgq7FlIu0oFo3XhU1kBlGimj5A
	 0Gzb4y3Xp/h23zBPUSK2xz58T/DbYgbW1Ee/PyzdIWHXml5iJR/0yBB5bTQj5IfPsG
	 dMDUFYIK9LFg7KXQqNTW0gpo+ig2ciLGzNLOCKzkPozwHz+5QtcnPwXIRTp2qf4GiH
	 B6MkX29nuiwhxW2JFllVDoZRp2Cl0c/9hssBkUAU1TnWZNGLmkqoWqS14t/+CtnCG7
	 NP822aCG5uUlQ==
Message-ID: <sashiko-outbox-167955@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/11] pinctrl: sunxi: add Allwinner B288 pin
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org
In-Reply-To: <20261012100816.331033-5-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
 <20261012100816.331033-5-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 10:29:07 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] pinctrl: sunxi: out-of-bounds write in irq_array when Bank 0 has 0=
 pins
- [High] pinctrl: sunxi: Missing irq_bank_map breaks B288 IRQ offsets and d=
omain size
- [High] pinctrl: sunxi: probe deferral crash due to npins accumulation
--

commit 6057aa70ee139132fe0176fd6bf4d482c87bdc64
Author: Pablo Mazzini <pmazzini@gmail.com>

pinctrl: sunxi: add Allwinner B288 pin controller driver

This commit adds a new pin controller driver for the Allwinner B288 SoC,
supporting 80 pins across ports B, C, D, F, and G. It uses DT-provided
mux values and specifies 4 banks of external interrupts.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl=
/sunxi/pinctrl-sun8i-b288.c
> new file mode 100644
> index 0000000000000..f973c2b3f2eba
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> @@ -0,0 +1,49 @@
[ ... ]
> +/* PH0 exists only on the BSP's FPGA platform and is omitted. */
> +static const u8 b288_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =3D
> +/*	  PA  PB  PC  PD  PE  PF  PG */
> +	{  0, 17, 15, 29,  0,  7, 12 };

[Severity: High]
Since Bank 0 (PA) has 0 pins, does this cause an out-of-bounds write in
the core sunxi pinctrl driver?

In drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c:prepare_function_table(),
last_bank and irq_bank are initialized to 0. When processing PB (bank 1),
the condition (bank > last_bank) evaluates to true (1 > 0), causing irq_bank
to erroneously increment to 1.

This shifts the logical IRQ bank indices for PB, PD, PF, and PG to
1, 2, 3, and 4 instead of 0, 1, 2, and 3.

Later, sunxi_pinctrl_build_state() configures the interrupts:

    int irqnum =3D func->irqnum + func->irqbank * IRQ_PER_BANK;
    pctl->irq_array[irqnum] =3D pin->pin.number;

For PG (irqbank 4), irqnum will be between 128 and 139. However, irq_array
is allocated for exactly 4 banks (128 elements) in
sunxi_pinctrl_init_with_flags(), which would result in an out-of-bounds
write past the end of the array.

> +
> +static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =3D
> +/*	  PA  PB  PC  PD  PE  PF  PG */
> +	{  0,  6,  0,  6,  0,  6,  6 };
> +
> +static struct sunxi_pinctrl_desc b288_pinctrl_data =3D {
> +	.irq_banks	=3D 4,
> +};

[Severity: High]
Does omitting the irq_bank_map array break external interrupts?

Without an irq_bank_map, drivers/pinctrl/sunxi/pinctrl-sunxi.h:
sunxi_irq_hw_bank_num() returns the sequential logical irqbank indices.

Because the irq_bank offset is already shifted to 1, 2, 3, and 4, these
logical indices will be used as physical hardware bank offsets.

This incorrectly maps PD, PF, and PG to hardware banks 2, 3, and 4 instead
of their actual hardware indices 3, 5, and 6.

Additionally, because PG receives irqbank 4, its out_hwirq is calculated
as 4 * 32 + irqnum (>=3D 128), which exceeds the bounds of the 128-entry
IRQ domain created during probe.

> +
> +static int b288_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
> +					   b288_irq_bank_muxes,
> +					   &b288_pinctrl_data, 0);
> +}

[Severity: High]
Could this lead to a kernel panic during a probe deferral?

The driver passes the static b288_pinctrl_data descriptor to
sunxi_pinctrl_dt_table_init(), which calls init_pins_table() and
accumulates the total pin count:

    desc->npins +=3D pins_per_bank[i];

If the driver probe defers, desc->npins will double on the next attempt
(from 80 to 160) because the static descriptor is reused.

The pins array is then allocated for 160 elements, but only the first 80
will have their .pin.name populated.

During DT parsing in fill_pin_function(), if an unrecognized pin name is
encountered, the search loops over the oversized array and evaluates:

    if (!strcmp(pins[pin].pin.name, name))
        break;

Iterating past index 79 would call strcmp() with a NULL pointer for
.pin.name, causing a panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012100816.3310=
33-1-pmazzini@gmail.com?part=3D4
