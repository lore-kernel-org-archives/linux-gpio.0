Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F4B4503E6
	for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791632227; cv=none; b=dtWwlAqg7pM+G/iVF5sMJOZY91VA0iQLYfXQBM5uIMI5wyTj/YIZ5Rbic/JDo8uGpoNuMLO8FrFeZzx7OEQk2MwLYLAzG2Bz1JSxjmYbLSTk798RVgaXCDFBqfEOg2iaBiXlcDU2K4OW5ERYP2sCCNnbvRGB+3PeXz6BrIqMk0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791632227; c=relaxed/simple;
	bh=9f0cPTlHUdzx7Ohg8wZ9cNL+b7/B6ZisdWLmZKoZy48=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rUMX9i9OYTxQ4JtTk+mMdEjRgk7bJY1r4TziGIMLUTAbif6bluKiz1wP+73eOgfDdUaCcs8IeRa12qlgqBdJsGq+hXIj6wOsN+L37fOQETHqW03lMNT8YsnE19ujO46EM1ExBpjtahFgaFgegFwoJ2zt0f7zzd+bdHLaB/W1NkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ajij8h+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ajij8h+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76931F000FF;
	Sat, 10 Oct 2026 11:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791632225;
	bh=uQajuSWz9bNuGF4HXU2w/kzGvCmOK8GjkkG+tGHVwb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ajij8h+4V0S9AT3JHcfS2EwEzd78ODZIw9HxXhkwad2YsQBbn9tyw2jrWvWkQBcXS
	 y3eOjVqSwZXXJXQHYZV0orj+bi7TwrTPi89X21mmHxfu1TAq+xkcjq2rdM5r75wJ1X
	 pKBzRrkGrMnIjsBaR2IBzkjtioZU5wiu32SoLSvZwTB1Fmbj2pvAXM+WzOywflaBca
	 BaJxSzBMNTSXbi5Ic9QOUEWIOkrUIDGd3rlhTBIkIbaz8k/V+UiO2BPDqM+eGaBjGV
	 wxsiFDtT1qDmSzlCi5WMH8m3kXmIeCQa4ub3dnEdpIb9aF3XIlzM20ZSE3qyIa4t+p
	 w4yiuCUmwt1vw==
Message-ID: <sashiko-outbox-166471@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] pinctrl: qcom: Restore the pin configuration after
 hibernation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birk Skyum" <birk.skyum@pm.me>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <179163141354.18006.80461347454353634@pm.me>
References: <179163141354.18006.80461347454353634@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 11:37:05 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] pinctrl: qcom: NULL pointer dereference in freeze_noirq under CO=
NFIG_HIBERNATE_CALLBACKS=3Dy && CONFIG_HIBERNATION=3Dn
- [Medium] pinctrl: qcom: lost edge wakeups due to unconditional ack in res=
tore_noirq
- [Medium] pinctrl: dual-edge interrupt missed after hibernation
--

commit 0f4785b0198c4a184e8d48cdee17d396f8fd5f1c
Author: Birk Skyum <birk.skyum@pm.me>
Subject: pinctrl: qcom: Restore the pin configuration after hibernation

This commit saves the control, output, and interrupt configuration registers
of every valid pin during freeze_noirq. It then restores these saved values
during restore_noirq to ensure pins untouched by the loading kernel regain
their correct pre-hibernation state.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 27f06bbc113c9..fba8a41655261 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
[ ... ]
> +/* Remember how the pins are set up when a hibernation image is taken. */
> +static int msm_pinctrl_freeze_noirq(struct device *dev)
> +{
> +	struct msm_pinctrl *pctrl =3D dev_get_drvdata(dev);
[ ... ]
> +	raw_spin_lock_irqsave(&pctrl->lock, flags);
> +	for (i =3D 0; i < pctrl->chip.ngpio; i++) {
> +		if (!gpiochip_line_is_valid(&pctrl->chip, i))
> +			continue;
> +
> +		g =3D &pctrl->soc->groups[i];
> +		s =3D &pctrl->saved[i];
> +		s->ctl =3D msm_readl_ctl(pctrl, g);

[Severity: Medium]
Will this result in a NULL pointer dereference on kernels built with
CONFIG_HIBERNATION=3Dn but CONFIG_HIBERNATE_CALLBACKS=3Dy?

The pctrl->saved array is allocated strictly under CONFIG_HIBERNATION in
msm_pinctrl_probe():

    if (IS_ENABLED(CONFIG_HIBERNATION)) {
        pctrl->saved =3D devm_kcalloc(&pdev->dev, pctrl->chip.ngpio, ...);

However, the callbacks are guarded by pm_sleep_ptr() in
msm_pinctrl_dev_pm_ops, which depends on CONFIG_PM_SLEEP (enabled if either
SUSPEND or HIBERNATE_CALLBACKS is set). If a system (such as a Xen guest on
x86 with COMPILE_TEST) triggers PM_EVENT_FREEZE, msm_pinctrl_freeze_noirq()
could be called and unconditionally dereference the unallocated pctrl->saved
array here.

[ ... ]
> +static int msm_pinctrl_restore_noirq(struct device *dev)
> +{
[ ... ]
> +		msm_writel_ctl(s->ctl, pctrl, g);
> +		if (!g->intr_cfg_reg)
> +			continue;
> +
> +		if (msm_pin_has_own_intr_target(pctrl, g))
> +			msm_writel_intr_target(s->intr_target, pctrl, g);
> +		msm_writel_intr_cfg(s->intr_cfg, pctrl, g);

[Severity: Medium]
Could blindly restoring the saved intr_cfg cause missed dual-edge interrupt=
s?

QCOM hardware emulates dual-edge interrupts by dynamically setting the
polarity opposite to the current physical line level. If the physical line
toggled during hibernation, the restored polarity will match the current
state rather than being opposite to it, causing the hardware to wait for
an edge that already occurred.

Should this re-evaluate the line level and update the polarity by calling
msm_gpio_update_dual_edge_pos() for pins marked in pctrl->dual_edge_irqs
during resume?

> +
> +		/* Enabling the raw status can latch an interrupt. */
> +		if (s->intr_cfg & BIT(g->intr_raw_status_bit))
> +			msm_ack_intr_status(pctrl, g);

[Severity: Medium]
Will unconditionally clearing the interrupt status here drop legitimately
latched edge wakeups?

The TLMM hardware can latch real edge interrupts while the loading kernel
is active or during the suspend/resume window. Unconditionally calling
msm_ack_intr_status() for every pin with RAW_STATUS_EN enabled, without
checking if the configuration actually toggled (as is safely done in
msm_gpio_irq_set_type()), might silently drop pending edge wakeups causing
peripheral drivers to miss events.

> +	}
> +	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179163141354.18006.=
80461347454353634@pm.me?part=3D1
