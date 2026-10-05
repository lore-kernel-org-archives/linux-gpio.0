Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F5391E7C;
	Mon,  5 Oct 2026 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232945; cv=none; b=cceABMuI1ecV6ICGMC/BDhZBtrL7C8oEQrNkArhGvEMPzPaNlDHblxHX+SeW1uo0F6yV56/kL6c9MNDabK/lPqP5KtbVuRx8cY/FwevdhvZ38S6ZuAUhusPiVfWmpw1OhPpNlrJmvYKDWbzvAsufSIQNSm5RoPHDCxrqQ6k5SCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232945; c=relaxed/simple;
	bh=gSMNxUYpxXECvtAQOY2noJ/4CXYgml4ZfT6UQshgtTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mbfEjixOnn226WdjP7FikoC395TwT7ltL/Rbp31F+fZQVNCXdXe0L/MpH2dsO1pmGdp/hhFY/36okGozEhl+yXZN31LlGdzZJQyvRe6u01LpN+j4SjecIGA9neIyHXVegqVUxmv2+Zi72MA/z+V+9LKAbLWpD5mqK1ZwOZBnP1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lw9kSXT1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lw9kSXT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A291F000FF;
	Mon,  5 Oct 2026 20:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791232943;
	bh=ijN73Et9JYb13FUizBM8HvvQgbl7lK6UMEPVMtaKX+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lw9kSXT17E1y+KgvDowd2oQBthAfJQmCrrTC+NDuQSfxWmQH19n2XYxdF+LQxDaEr
	 KdlyAg4ePhJcqyZlw438EWGtksXIeAfdZl2Ueb5hHld6L6wPFSF82DwL/ZawR8E8oE
	 OaxVSQRhEyx6KOtDj4w3wAUTH/zQLQ5Qnlxq7+RNP6M6Je5RoVU72QhoDr6MGEbeg8
	 j1jDtBZU08hkggVAjkqYAhNSO3G+7l1LWvvXL4xcH5lG0O6oaX3LKI3LcQ5D9IxDiv
	 w7IHyMM6kwnPGmr4IP9PSrD8i36UvYbvXMPUyZtO4w8CzfDGM9Qfh+bfNk5uZgXJ0w
	 o5eKBqPQqXAPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/11] pinctrl: sunxi: add Allwinner B288 pin
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org
In-Reply-To: <20261005202731.153971-5-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-5-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 20:42:23 +0000
Message-Id: <20261005204223.87A291F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: sunxi: NULL ptr deref on probe deferral due to npins accu=
mulation
--

commit 23f0ad979270766cafcf25e2ddff2cd81bb51adc
Author: Pablo Mazzini <pmazzini@gmail.com>

pinctrl: sunxi: add Allwinner B288 pin controller driver

This commit introduces pin controller and GPIO support for the Allwinner
B288 SoC. It covers configuration for 80 pins across ports B, C, D, F, and
G, including external interrupts.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl=
/sunxi/pinctrl-sun8i-b288.c
> new file mode 100644
> index 0000000000000..f973c2b3f2eba
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c

[ ... ]

> +static struct sunxi_pinctrl_desc b288_pinctrl_data =3D {
> +	.irq_banks	=3D 4,
> +};
> +
> +static int b288_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
> +					   b288_irq_bank_muxes,
> +					   &b288_pinctrl_data, 0);
> +}

[Severity: High]
If b288_pinctrl_probe() fails and defers, will b288_pinctrl_data.npins
accumulate indefinitely and cause a NULL pointer dereference?

Since b288_pinctrl_data is defined as a static global variable, its state
persists across multiple probe attempts. Looking at
sunxi_pinctrl_dt_table_init(), it forwards this struct to init_pins_table()
which modifies desc->npins:

init_pins_table() {
        ...
        desc->npins +=3D pins_per_bank[i];
        ...
}

If the probe fails and defers, or if the driver is unbound and rebound,
desc->npins is not reset to 0, so its value will double on the next probe
attempt.

This leads to the pins array being allocated for the doubled size, but only
the first 80 elements are actually initialized. The rest are zeroed out by
the allocation. Later, in prepare_function_table(), a loop iterates over
the doubled npins value and calls strcmp(pins[i].pin.name, name). For
indexes beyond the actual number of pins, pins[i].pin.name is NULL, which
triggers a crash.

Should npins be cleared to 0 before initialization, or should the static
struct be treated as read-only and copied to a local device structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005202731.1539=
71-1-pmazzini@gmail.com?part=3D4
