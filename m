Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3A94DCB1A
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420063; cv=none; b=Ad1I6y0j8QsoRmtTVWqmr8rS0RyIHxtTLt4hbfqqUnHFwvmJyJUpJF0jgJs0vtMPOKMak9nfwg0iNYnL3bNq2kx9l/0EK1TucwJWy4BAzQ6pmO3RTkGTawQw0qqZJQDBOwA4RF8yGfv6vXCeAQofZnp2hKniNdcOfuWYyT+2vQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420063; c=relaxed/simple;
	bh=FJ9Ki3JWkCZaP5RXJSsXU3ekd/a1tL4ObTRPfjxUyaM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UwQdL2QWZA1ZgKnnPC6tGe5sRiUKGKHZA2Mlexvodcfmwfb3KgOkQBgUWtGFtiOoYJYaflD0Q/ZazuCHQdWA7huInFNTSrCCEY9Ft0dF2eDLlVvDXf14UXZndp2rEqQC5epmHz9pFO3Slq81B5NeXKBv3kxTX2BKWVx70cgCZQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZkMb8+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZkMb8+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647D41F000C4;
	Mon, 19 Oct 2026 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420061;
	bh=lP9S6/VSw6gOjpJYVF6KDr82tfF20YYb1oEAVl5iyCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZkMb8+UPWnV77ekmVwMw3HPF0GblVI/OMnp/Mo7QIGpA7aBbbQJRdselgBjb4hn9
	 hu9cQnLWtb3ap/Cm46IQu+OEW2FOzOsvJqdSqzlQjSgxrsKwOcuBK9MWWGd8NZq7XI
	 HeWvBJHpSK0q4LG+kfNN+xCWcOeNVxPnQ9MEkB8YKXQAtAH0Up71QRa2eatjUIG4tz
	 DqwIIssKhgbQHYHlY6o/YKsxLO1pbU86uIBkn4eJPlWZsNVWW1ZXH/SRLeKEtanck0
	 xadKPNsaNr6wt/U/U+nKfa6txehnS+LMkVYWEE1ErVf1KeSOuHOuh9jBWQWaJbj1HQ
	 3pDJolghh7ALA==
Message-ID: <sashiko-outbox-177386@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.1] pinctrl: qcom: Add
 irq_get/set_irqchip_state() for msm gpio irqchip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261019135441.1420968-105-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-105-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:27:41 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pinctrl: qcom: missing parent delegation in msm_gpio_irq_set_irqch=
ip_state()
- [Medium] pinctrl: qcom: intr_ack_high ignored in msm_gpio_irq_set_irqchip=
_state()
--

commit 301c33b42ee8c08eddc97fb199477c476ddbf18c
Author: Maulik Shah <maulik.shah@oss.qualcomm.com>

pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip

This commit implements the .irq_get_irqchip_state and .irq_set_irqchip_state
callbacks for msm_gpio_irq_chip to support replaying edge interrupts for
IRQCHIP_STATE_PENDING after wakeup on MPM-based Qualcomm SoCs.

Link: https://patch.msgid.link/20260424-pinctrl_irqchip_states-v1-1-85286f0=
78916@oss.qualcomm.com

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index e99871b90ab9c..4804d5cba011c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1289,6 +1289,43 @@ static int msm_gpio_irq_set_affinity(struct irq_da=
ta *d,
>  	return -EINVAL;
>  }
> =20
> +static int msm_gpio_irq_set_irqchip_state(struct irq_data *d,
> +					  enum irqchip_irq_state which, bool val)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
> +	const struct msm_pingroup *g =3D &pctrl->soc->groups[d->hwirq];
> +
> +	if (which !=3D IRQCHIP_STATE_PENDING)
> +		return -EINVAL;
> +
> +	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
> +		return -EINVAL;

[Severity: High]
Does returning -EINVAL here and in msm_gpio_irq_get_irqchip_state() break
parent interrupt state queries and updates on PDC-based Qualcomm SoCs?

In kernel/irq/manage.c, __irq_get_irqchip_state() and irq_set_irqchip_state=
()
walk up data->parent_data and stop at the first irq_chip that defines the
callback, without falling back to parent_data when -EINVAL is returned:

kernel/irq/manage.c:__irq_get_irqchip_state() {
    ...
    do {
        chip =3D irq_data_get_irq_chip(data);
        if (WARN_ON_ONCE(!chip))
            return -ENODEV;
        if (chip->irq_get_irqchip_state)
            break;
#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
        data =3D data->parent_data;
#else
        data =3D NULL;
#endif
    } while (data);
    ...
}

On PDC-based SoCs (IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP), msm_gpio_init() sets
pctrl->skip_wake_irqs for wakeup-capable GPIOs because interrupt detection =
is
handled by the parent hierarchy (msmgpio -> PDC -> GICv3), and
qcom_pdc_gic_chip in drivers/irqchip/qcom-pdc.c explicitly wires:

    .irq_get_irqchip_state =3D irq_chip_get_parent_state,
    .irq_set_irqchip_state =3D irq_chip_set_parent_state,

Previously, msm_gpio_irq_chip left both callbacks NULL, so calls walked past
msmgpio to PDC and GICv3. With this change, when synchronize_irq(),
disable_irq(), or __free_irq() calls __synchronize_hardirq() ->
__irq_get_irqchip_state(irqd, IRQCHIP_STATE_ACTIVE, &inprogress), or when
KVM vgic, machine_kexec_mask_interrupts(), or irq_inject_interrupt() queries
or updates state on a PDC-routed GPIO, the walk stops at msmgpio and fails
with -EINVAL.

Should msm_gpio_irq_set_irqchip_state() and msm_gpio_irq_get_irqchip_state()
delegate to irq_chip_set_parent_state(d, which, val) and
irq_chip_get_parent_state(d, which, val) when d->parent_data &&
test_bit(d->hwirq, pctrl->skip_wake_irqs), similar to
msm_gpio_irq_set_affinity() and msm_gpio_irq_set_vcpu_affinity()?

> +
> +	msm_writel_intr_status(val, pctrl, g);
> +
> +	return 0;
> +}
> +
> +static int msm_gpio_irq_get_irqchip_state(struct irq_data *d,
> +					  enum irqchip_irq_state which, bool *val)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
> +	const struct msm_pingroup *g =3D &pctrl->soc->groups[d->hwirq];
> +
> +	if (which !=3D IRQCHIP_STATE_PENDING)
> +		return -EINVAL;
> +
> +	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
> +		return -EINVAL;
> +
> +	g =3D &pctrl->soc->groups[d->hwirq];
> +	*val =3D msm_readl_intr_status(pctrl, g);
> +
> +	return 0;
> +}

[Severity: Medium]
How does msm_gpio_irq_set_irqchip_state() behave on TLMM v2 SoCs where
g->intr_ack_high is set (such as apq8064, ipq8064, mdm9615, msm8660, and
msm8960), or if g->intr_status_bit is non-zero?

In drivers/pinctrl/qcom/pinctrl-msm.c, msm_ack_intr_status() clears a pendi=
ng
interrupt by accounting for both g->intr_ack_high and g->intr_status_bit:

static void msm_ack_intr_status(struct msm_pinctrl *pctrl,
				const struct msm_pingroup *g)
{
	u32 val =3D g->intr_ack_high ? BIT(g->intr_status_bit) : 0;

	msm_writel_intr_status(val, pctrl, g);
}

By passing the raw boolean val directly to msm_writel_intr_status(val, pctr=
l, g),
won't calling irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true) on an
intr_ack_high platform acknowledge and clear the pending interrupt instead =
of
setting it pending, while passing false writes 0 and fails to clear it?

Also, in msm_gpio_irq_get_irqchip_state(), g =3D &pctrl->soc->groups[d->hwi=
rq]
is initialized twice, and *val =3D msm_readl_intr_status(pctrl, g) converts=
 the
full 32-bit register read to bool without masking with BIT(g->intr_status_b=
it)
(unlike msm_gpio_irq_handler()). Should both functions mask/shift with
BIT(g->intr_status_bit) and account for g->intr_ack_high?

[ ... ]

>
> --=20
> 2.34.1
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-105-sashal@kernel.org?part=3D1
