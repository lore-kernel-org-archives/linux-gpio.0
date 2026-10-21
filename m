Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613722;
	b=BasbevIHIDTYOZemMMa06RmQ1Ct9r7R8Z6Z7etTi0EvRXuMka9oYRLrxzWfaDU1hY5z0
	 cU0n9lf1M01HCrW57qzZQf7pS2a4PPAfMUTEtRmOn2VhIdM/8ALMrDfPFcZcRBQ+ks9NP
	 LSbccRLNt4jsIDavh4cfBvUXRIdunZ7uxXvG3+RHtUg30rzvOucvYk2HNlnbQc8vaynmx
	 OulnDLhg028jOBQ6DURmphUVORaR6Lxh5P+emprUFXBI76MxlWT+AN3g3LjkHRov3NaFU
	 31iLr6Ga753GCVrb2lO/P6S6vmtm3HLb761nmFk+D66dpwEpJnA6N6Djhn98DJ7PTpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613722;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zq9yb46p8BYitR2rhv1fKGPC+pR2fvTagtTNmEU1Vxs=;
	b=TQHMQAjps4ZYzJ3MahToUg9SpmjaAwJVtOVXhWr9O4wh7X9PT4u2jd28uFcEMMGlibGq
	 ku8phm+498Se79DH4srLK65DZdgCupMmZvJUIE6giDA2NYvNOOJaUw6xOqA7pGXfrHtI0
	 +zc8LvyAo/IlesKskyZ6faJQHn/zoZgwpoOsgCps/AlhMdbwPdYrXopnczZs5Wxbd/BvL
	 kBJ9j2Ca9xyri1LztxDFoiu23+kHX/Eq0244efplTxbfBz84wrGnZYTVqTBgwbzDCVU8c
	 dsTvfJd0uw4qHYBr5TMRzL5p/jrATImKQAp1mLx7VIJWMzgVS4unLLz1zeGPyamSYaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agH0lzGr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6866606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 20:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agH0lzGr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307EB1F000C2;
	Wed, 21 Oct 2026 20:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792613721;
	bh=zq9yb46p8BYitR2rhv1fKGPC+pR2fvTagtTNmEU1Vxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=agH0lzGrSnXq9DTbWl+wKXTPJyB6+tbI+L9zfeYvZvo28ieyfAeEYPEvxu+KgeXkU
	 OUACjKq0VGyCXV2UR/Rb9DvYwsaPKD4uf1PQMt3tVx8xCO12VRVDh4Jqc+DjhQZyXi
	 7hPZ7PJJGPR8WwTGDMffmhcJiYm/wRxVEb5/z8lwmKSBS0fFpTqOencdrahAHtGVUz
	 ZPJmw3zWEWVh6xuty+bM2RV/h/yW3o4gueUQaHcYk7RNl+axPiQXihPurUmaDj9ArJ
	 3dcPLuUDCb1KeOCmRHih8xCul1GpoLvRLwfwohf3YgHhuS0t4VuYf3kL9Mpkydl6Vg
	 qLSUwG1JNX18w==
Message-ID: <sashiko-outbox-180634@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] pinctrl: qcom: Restore the pin configuration after
 hibernation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birk Skyum" <birk.skyum@pm.me>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261021195250.83540-1-birk.skyum@pm.me>
References: <20261021195250.83540-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 20:15:20 +0000
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
- [Medium] pinctrl: qcom: msm_pinctrl_restore_noirq() enables IRQ before cl=
earing status
--

commit d8439285386d0a36cbc72eb8f4753391eb0fd921
Author: Birk Skyum <birk.skyum@pm.me>

pinctrl: qcom: Restore the pin configuration after hibernation

This commit adds freeze_noirq and restore_noirq hibernation callbacks to
pinctrl-msm to save and restore the control, output, and interrupt
configuration registers for pins in use by the kernel as well as the SDC
pads. It also wires up msm_pinctrl_dev_pm_ops in the x1e80100 pinctrl
driver.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 27f06bbc113c9..8ddb4261bf89a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c

[ ... ]

> +static int msm_pinctrl_restore_noirq(struct device *dev)
> +{
> +	struct msm_pinctrl *pctrl =3D dev_get_drvdata(dev);
> +	const struct msm_pingroup *g;
> +	struct msm_pin_state *s;
> +	unsigned int i;
> +	u32 val;
> +
> +	guard(raw_spinlock_irqsave)(&pctrl->lock);
> +
> +	for (i =3D 0; i < pctrl->soc->ngroups; i++) {
> +		g =3D &pctrl->soc->groups[i];
> +		s =3D &pctrl->saved[i];
> +		if (!s->saved)
> +			continue;
> +
> +		if (i >=3D pctrl->chip.ngpio) {
> +			msm_writel_ctl(s->ctl, pctrl, g);
> +			continue;
> +		}
> +
> +		/* Set the level before the pin starts driving it. */
> +		val =3D msm_readl_io(pctrl, g);
> +		val &=3D ~BIT(g->out_bit);
> +		val |=3D s->io & BIT(g->out_bit);
> +		msm_writel_io(val, pctrl, g);
> +
> +		msm_writel_ctl(s->ctl, pctrl, g);
> +		if (!g->intr_cfg_reg)
> +			continue;
> +
> +		if (msm_pin_has_own_intr_target(pctrl, g))
> +			msm_writel_intr_target(s->intr_target, pctrl, g);
> +		val =3D msm_readl_intr_cfg(pctrl, g);
> +		msm_writel_intr_cfg(s->intr_cfg, pctrl, g);
> +
> +		/*
> +		 * Changing the configuration can latch an interrupt. One that
> +		 * is latched with the configuration unchanged is a real one.
> +		 */
> +		if (val !=3D s->intr_cfg)
> +			msm_ack_intr_status(pctrl, g);

[Severity: Medium]
Can writing s->intr_cfg before calling msm_ack_intr_status() in
msm_pinctrl_restore_noirq() in drivers/pinctrl/qcom/pinctrl-msm.c assert a
spurious interrupt on the TLMM summary IRQ line?

In msm_gpio_irq_set_type(), writing intr_cfg before clearing the latched
status is noted as safe only because the interrupt is masked:

drivers/pinctrl/qcom/pinctrl-msm.c:msm_gpio_irq_set_type() {
	...
	/*
	 * The first time we set RAW_STATUS_EN it could trigger an interrupt.
	 * Clear the interrupt.  This is safe because we have
	 * IRQCHIP_SET_TYPE_MASKED. When changing the interrupt type, we could
	 * also still have a non-matching interrupt latched, so clear whenever
	 * making changes to the interrupt configuration.
	 */
	if (val !=3D oldval)
		msm_ack_intr_status(pctrl, g);
	...
}

During hibernation freeze, device_wakeup_arm_wake_irqs() and
suspend_device_irqs() -> suspend_device_irq() in kernel/irq/pm.c run before
msm_pinctrl_freeze_noirq(). For any GPIO IRQ that is not in
pctrl->skip_wake_irqs and has wakeup enabled (or uses IRQF_NO_SUSPEND),
suspend_device_irq() leaves the line unmasked:

kernel/irq/pm.c:suspend_device_irq() {
	if (!desc->action || irq_desc_is_chained(desc) ||
	    desc->no_suspend_depth)
		return false;

	if (irqd_is_wakeup_set(irqd)) {
		irqd_set(irqd, IRQD_WAKEUP_ARMED);

		if ((chipflags & IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND) &&
		     irqd_irq_disabled(irqd)) {
			__enable_irq(desc);
			irqd_set(irqd, IRQD_IRQ_ENABLED_ON_SUSPEND);
		}
		return true;
	}
	...
}

As a result, msm_pinctrl_freeze_noirq() saves s->intr_cfg with both
BIT(g->intr_raw_status_bit) and BIT(g->intr_enable_bit) set, and bit i
remains set in pctrl->enabled_irqs.

On hibernation restore in create_image() in kernel/power/hibernate.c,
local_irq_enable() and pm_sleep_enable_secondary_cpus() run before
dpm_resume_start(PMSG_RESTORE) -> dpm_resume_noirq():

kernel/power/hibernate.c:create_image() {
	...
 Enable_irqs:
	system_state =3D SYSTEM_RUNNING;
	local_irq_enable();

 Enable_cpus:
	pm_sleep_enable_secondary_cpus();
	...
	dpm_resume_start(in_suspend ?
		(error ? PMSG_RECOVER : PMSG_THAW) : PMSG_RESTORE);
	...
}

Because the parent TLMM summary IRQ (pctrl->irq) is a chained handler
(msm_gpio_irq_handler), suspend_device_irq() skips it via
irq_desc_is_chained(), leaving it active and unmasked at the GIC while
secondary CPUs are online with IRQs enabled.

When msm_pinctrl_restore_noirq() writes s->intr_cfg with
BIT(g->intr_enable_bit) set before calling msm_ack_intr_status(), any
status bit latched by toggling RAW_STATUS_EN or changing detection/polarity
bits can immediately assert the summary IRQ. Since msm_gpio_irq_handler()
does not take pctrl->lock, another CPU servicing the summary IRQ could
either observe the bogus status bit and dispatch a spurious interrupt, or
observe handled =3D=3D 0 after msm_ack_intr_status() clears it and call
handle_bad_irq().

Would it be safer to write s->intr_cfg with BIT(g->intr_enable_bit) masked
first, call msm_ack_intr_status() if the configuration changed, and only
then set BIT(g->intr_enable_bit) if it was saved as enabled?

> +	}
> +
> +	return 0;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021195250.8354=
0-1-birk.skyum@pm.me?part=3D1
