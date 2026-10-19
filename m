Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DB5008E2
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420663; cv=none; b=BHhXB2XZKbpmefjrz/pQgo84HkGxzm/ssEvgabr8gSjOIYyIs6FqgHcewJwI5yq9TLjzI6UQ9blQk3gpFRy90R1qOnrXfE5PtU3oe/4BbMhpRqRLl3Yj+IAXTZCqnyEmR2dCJH4NGjLm3ZnFSt4qVrzwhNyylCLn1Led0ja7aF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420663; c=relaxed/simple;
	bh=DvCDqHwwxJ6gVtPbT2/taOw4NiHB3dDYIdYuhn4i148=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MdRRkEq02d89w9ZlL3F8nFo47a1oNehS5Cc843dW8Ln3e+SMH1Bs61TkUhD7FQwFxtuxeCPUnIQIPMmPl6iyNAovm3C3GxaT5L+T0dPSOBNk/JzdFhxeFs4mopUywziJMHcAU1LiL1r5EPz2KZba51jeVPZtjPifZ3by01HrH+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SODW5xOc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SODW5xOc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE6A1F000C4;
	Mon, 19 Oct 2026 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420661;
	bh=JWSC+YBxu1myCwcgeSFMoN436Hodugk7CvPYeQF2xKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SODW5xOcAP3epiRvaklPYtsGqgj5cK3BYtqwTr1w/QsVDt1MxDfUAsqlDIGRQtxb2
	 tLXdITjYvSGC/nEJ38lhwWG8zISLtpS+B+dxdx/ME0F5bx+rY6uRN/1acVYm/OuoEw
	 t0efBEUyd0OAmwIiELvlpqPjzm4XJvgts66jm2qZZar6JZIqfNZahrZb+/lftkl+bo
	 e/goWz8B/SLdXTMYgylIx4qMthJPUuefsEdy6hcqrMFYJL3Vb4ZCTtZeuTCmtquAeT
	 ZnhORkWg/W4mBXzWXpuY66BbArGRAqkQhgvegWqWCve5NxjAfAGut3vis1EOvf5TXp
	 VvCFwC4VwQDzQ==
Message-ID: <sashiko-outbox-177449@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] gpio: mvebu: keep resume masks within
 the irqchip cache
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261019135441.1420968-150-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-150-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:37:40 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: mvebu: TOCTOU race in mvebu_gpio_resume() after dropping gc-=
>lock
- [High] gpio: mvebu: wrong regmap used for Armada XP masks in mvebu_gpio_r=
esume()
--

commit 3f933b6bd33ac55ae181080e42e681c5eace741e
Author: Rosen Penev <rosenp@gmail.com>

gpio: mvebu: keep resume masks within the irqchip cache

This commit updates mvebu_gpio_resume() to mask the saved edge and level
interrupt mask registers against the generic irqchip mask_cache_priv values
before writing them back to hardware on resume.

Link: https://patch.msgid.link/20260915004406.115230-1-rosenp@gmail.com

> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index ac799fced950e..07af0f38252d6 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -1006,6 +1006,8 @@ static int mvebu_gpio_suspend(struct platform_devic=
e *pdev, pm_message_t state)
>  static int mvebu_gpio_resume(struct platform_device *pdev)
>  {
>  	struct mvebu_gpio_chip *mvchip =3D platform_get_drvdata(pdev);
> +	u32 edge_cache =3D ~0U, level_cache =3D ~0U;
> +	unsigned long flags;
>  	int i;
> =20
>  	regmap_write(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
> @@ -1017,32 +1019,51 @@ static int mvebu_gpio_resume(struct platform_devi=
ce *pdev)
>  	regmap_write(mvchip->regs, GPIO_IN_POL_OFF + mvchip->offset,
>  		     mvchip->in_pol_reg);
> =20
> +	/*
> +	 * genirq skips mask_irq() for a line it already considers masked, so
> +	 * unmasking one behind its back leaves an asserted level line that
> +	 * nobody masks. Restore only bits the irqchip cache still has set.
> +	 *
> +	 * Snapshot the caches under the raw spinlock, but release it before
> +	 * the regmap writes below: regmap_write() takes a sleepable lock on
> +	 * PREEMPT_RT.
> +	 */
> +	if (mvchip->domain) {
> +		struct irq_chip_generic *gc;
> +
> +		gc =3D irq_get_domain_generic_chip(mvchip->domain, 0);
> +		raw_spin_lock_irqsave(&gc->lock, flags);
> +		level_cache =3D gc->chip_types[0].mask_cache_priv;
> +		edge_cache =3D gc->chip_types[1].mask_cache_priv;
> +		raw_spin_unlock_irqrestore(&gc->lock, flags);
> +	}

[Severity: High]
Can dropping gc->lock and restoring local interrupts before writing the
hardware mask registers race with the irqchip mask and unmask callbacks?

The irqchip callbacks such as mvebu_gpio_level_irq_mask() and
mvebu_gpio_level_irq_unmask() hold gc->lock across both updating
ct->mask_cache_priv and updating the hardware mask register:

drivers/gpio/gpio-mvebu.c:mvebu_gpio_level_irq_mask() {
	guard(raw_spinlock)(&gc->lock);
	ct->mask_cache_priv &=3D ~mask;
	mvebu_gpio_write_level_mask(mvchip, ct->mask_cache_priv);
}

Since mvebu_gpio_resume() runs during dpm_resume() after dpm_resume_noirq()=
 ->
resume_device_irqs() has re-enabled device interrupts, if a level GPIO
interrupt fires in the window between raw_spin_unlock_irqrestore() and
regmap_write(), the interrupt path:

  mvebu_gpio_irq_handler()
    -> handle_level_irq()
      -> mask_ack_irq()
        -> mvebu_gpio_level_irq_mask()

will clear the bit in ct->mask_cache_priv, mask the hardware register, and =
set
IRQD_IRQ_MASKED in genirq. When mvebu_gpio_resume() then calls regmap_write=
()
with its stale level_cache snapshot where the bit is still 1, won't it unma=
sk
the asserted level line in hardware behind genirq's back and cause the same
unhandled level interrupt storm on resume?

Similarly, if an in-flight IRQF_ONESHOT threaded handler finishes via
irq_finalize_oneshot() -> unmask_threaded_irq() or another CPU calls
enable_irq() -> unmask_irq() during that window, the unmask callback will s=
et
the bit in ct->mask_cache_priv and unmask the hardware register under
gc->lock. Won't mvebu_gpio_resume() then overwrite the hardware register wi=
th
a stale 0 bit from level_cache or edge_cache, leaving the interrupt
permanently masked in hardware while genirq considers it unmasked?

> +
>  	switch (mvchip->soc_variant) {
>  	case MVEBU_GPIO_SOC_VARIANT_ORION:
>  	case MVEBU_GPIO_SOC_VARIANT_A8K:
>  		regmap_write(mvchip->regs, GPIO_EDGE_MASK_OFF + mvchip->offset,
> -			     mvchip->edge_mask_regs[0]);
> +			     mvchip->edge_mask_regs[0] & edge_cache);
>  		regmap_write(mvchip->regs, GPIO_LEVEL_MASK_OFF + mvchip->offset,
> -			     mvchip->level_mask_regs[0]);
> +			     mvchip->level_mask_regs[0] & level_cache);
>  		break;
>  	case MVEBU_GPIO_SOC_VARIANT_MV78200:
>  		for (i =3D 0; i < 2; i++) {
>  			regmap_write(mvchip->regs,
>  				     GPIO_EDGE_MASK_MV78200_OFF(i),
> -				     mvchip->edge_mask_regs[i]);
> +				     mvchip->edge_mask_regs[i] & edge_cache);
>  			regmap_write(mvchip->regs,
>  				     GPIO_LEVEL_MASK_MV78200_OFF(i),
> -				     mvchip->level_mask_regs[i]);
> +				     mvchip->level_mask_regs[i] & level_cache);
>  		}
>  		break;
>  	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
>  		for (i =3D 0; i < 4; i++) {
>  			regmap_write(mvchip->regs,
>  				     GPIO_EDGE_MASK_ARMADAXP_OFF(i),
> -				     mvchip->edge_mask_regs[i]);
> +				     mvchip->edge_mask_regs[i] & edge_cache);
>  			regmap_write(mvchip->regs,
>  				     GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
> -				     mvchip->level_mask_regs[i]);
> +				     mvchip->level_mask_regs[i] & level_cache);
>  		}
>  		break;

[Severity: High]
On MVEBU_GPIO_SOC_VARIANT_ARMADAXP, are these masked writes targeting the
wrong regmap in mvebu_gpio_resume() (and similarly in mvebu_gpio_suspend())?

In mvebu_gpioreg_edge_mask(), mvebu_gpioreg_level_mask(), and
mvebu_gpio_probe(), the per-CPU mask registers at
GPIO_EDGE_MASK_ARMADAXP_OFF(cpu) and GPIO_LEVEL_MASK_ARMADAXP_OFF(cpu) live=
 in
mvchip->percpu_regs rather than mvchip->regs:

drivers/gpio/gpio-mvebu.c:mvebu_gpioreg_edge_mask() {
	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
		cpu =3D smp_processor_id();
		*map =3D mvchip->percpu_regs;
		*offset =3D GPIO_EDGE_MASK_ARMADAXP_OFF(cpu);
		break;
}

drivers/gpio/gpio-mvebu.c:mvebu_gpio_probe() {
	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
		regmap_write(mvchip->regs, GPIO_EDGE_CAUSE_OFF, 0);
		regmap_write(mvchip->regs, GPIO_EDGE_MASK_OFF, 0);
		regmap_write(mvchip->regs, GPIO_LEVEL_MASK_OFF, 0);
		for (cpu =3D 0; cpu < 4; cpu++) {
			regmap_write(mvchip->percpu_regs,
				     GPIO_EDGE_CAUSE_ARMADAXP_OFF(cpu), 0);
			regmap_write(mvchip->percpu_regs,
				     GPIO_EDGE_MASK_ARMADAXP_OFF(cpu), 0);
			regmap_write(mvchip->percpu_regs,
				     GPIO_LEVEL_MASK_ARMADAXP_OFF(cpu), 0);
		}
		break;
}

By passing mvchip->regs instead of mvchip->percpu_regs here, won't
mvebu_gpio_resume() leave the per-CPU mask registers in mvchip->percpu_regs
unupdated while writing the edge_cache and level_cache masked values over t=
he
global GPIO registers at offsets 0x10..0x2c in mvchip->regs (such as
GPIO_EDGE_CAUSE_OFF at 0x14, GPIO_LEVEL_MASK_OFF at 0x1c, and
GPIO_BLINK_CNT_SELECT_OFF at 0x20)?

>  	default:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-150-sashal@kernel.org?part=3D1
