Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162782;
	b=uUpl52ZlBIIj8F85IBul4lmcgBnMvEeUeiVaVyVcH7UOSZHXIZlzTSt9TOta3ULdLbkB
	 415HdRoK12JL+n6gQNoVjcdQq/bZ9A/eM0EwFkLsfXvNz8ek1upeokPtqHOnsDTRogSXe
	 2VA1og7R/OdiCyk+Uxu7hOhcJJZGwhBaqG80GgilFZnKV8DPDKlSfFNkGr100g9IkwQgq
	 tFb++947TWyxpWmnfk0f4iByZq7oc7xrEFh7T3urMfBLbTl5Otx2DOJQVoQFkBDzr8eQJ
	 JSKPqwO2QxL4Z/c+sG3Q/HKZ5ez/5buuROAaYXrHtNtPyitWqBzezThY5VrCeANWqlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162782;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/Th7hiL8VbzxYIPh5EGS2WpfrL97t4GWrxDck5QZ7xc=;
	b=MsSFipF4AyDYKigYiUsqBZcWQOmtB9zr3t/KHPKeHni6zNE+fhO4vLrLTy0O4BfVoWDi
	 o/P3SC0YHSGcvvekKaUBL+eEy8jb36nSxKgqDm0x8MUwyAfP9UQFmkgJ0JRDHhcDSdSn+
	 x+evcoDraJeqmzymtVXmoZhUVjDc9jHWfS17rxorRn0VIuppzo/Vm3soY3Xhd/PMpYJqu
	 HxYzRoa3sye3g6To5Rk/wkWKaHGOR1dMLdYyaeCpbfuuMaxf/VUb4Jkr0V8CQ0cpdat2d
	 9XrxsBXVWEDag2Y6zS8j1TAqdS9uKqR+zmcG5fmDRmgWyWIOTvplwwGVwFJt64tnXHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjbYjX2j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E46606A320
	for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2026 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjbYjX2j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED761F008A1;
	Sun,  8 Nov 2026 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794162781;
	bh=/Th7hiL8VbzxYIPh5EGS2WpfrL97t4GWrxDck5QZ7xc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NjbYjX2jxCwCyzKueeftnKMAPtfZQWfyQj45HXP6tU2aepjijD+peAf2F3Eyd4lrN
	 4C2wQoBbMMovlKerpxO5mwp4GR/q6Yiowq9VhtNApeRM65tUxK53yyjnzK55aQ0mZ4
	 lvWC5L9fH1zclqTCH25DvsQY7XBbWxmfun4wOQvCrxuewCuu7BMyKoN9+WG1mbGIOH
	 phALiwrjDTTMjuI8BcOGRBHyVRqpD33laHjVPPAzj/0aRIij51ux2fGSB//cD7NeB3
	 Y3wI+EAlw5n5Nhd2jFpIwGJSGv/JeJxRSMCrNeHjUeaIjE0X04p5b2NRA3ZBH5+qY6
	 qlm91PqspBQ/A==
Message-ID: <sashiko-outbox-203905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] gpio: rockchip: restore the bank registers after
 hibernation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261108-b4-gpio-rockchip-hib-v2-1-27d3d510cb73@iav.lv>
References: <20261108-b4-gpio-rockchip-hib-v2-1-27d3d510cb73@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 18:33:01 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] gpio: rockchip: rockchip_irq_resume() unmasks irqs before
  noirq bank restore
- [Medium] gpio: rockchip: unclocked debounce filter in
  rockchip_gpio_resume_noirq()
--

commit cfd7c691406544bfff804ff2dac05dcea1c1f7d9
Author: Igor Velkov <iav@iav.lv>

gpio: rockchip: restore the bank registers after hibernation

This commit saves and restores the Rockchip GPIO interrupt registers in
irq_suspend/irq_resume and the data, direction, and debounce registers in
noirq suspend/resume callbacks so that bank state is preserved across
hibernation.

> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 0f46ff095a248..4c68a62d79851 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -487,17 +487,33 @@ static void rockchip_irq_suspend(struct irq_data *d)
>  {
>  	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>  	struct rockchip_pin_bank *bank =3D gc->private;
> +	const struct rockchip_gpio_regs *reg =3D bank->gpio_regs;
> =20
> -	bank->saved_masks =3D irq_reg_readl(gc, bank->gpio_regs->int_mask);
> -	irq_reg_writel(gc, ~gc->wake_active, bank->gpio_regs->int_mask);
> +	bank->saved_masks =3D irq_reg_readl(gc, reg->int_mask);
> +	bank->saved_en =3D rockchip_gpio_readl(bank, reg->int_en);
> +	bank->saved_type =3D rockchip_gpio_readl(bank, reg->int_type);
> +	bank->saved_polarity =3D rockchip_gpio_readl(bank, reg->int_polarity);
> +	if (bank->gpio_type =3D=3D GPIO_TYPE_V2)
> +		bank->saved_bothedge =3D rockchip_gpio_readl(bank, reg->int_bothedge);
> +	irq_reg_writel(gc, ~gc->wake_active, reg->int_mask);
>  }
> =20
>  static void rockchip_irq_resume(struct irq_data *d)
>  {
>  	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>  	struct rockchip_pin_bank *bank =3D gc->private;
> +	const struct rockchip_gpio_regs *reg =3D bank->gpio_regs;
> =20
> -	irq_reg_writel(gc, bank->saved_masks, bank->gpio_regs->int_mask);
> +	/*
> +	 * Restore from hibernation follows a cold boot: write the interrupt
> +	 * registers back before we unmask.
> +	 */
> +	rockchip_gpio_writel(bank, bank->saved_en, reg->int_en);
> +	rockchip_gpio_writel(bank, bank->saved_type, reg->int_type);
> +	rockchip_gpio_writel(bank, bank->saved_polarity, reg->int_polarity);
> +	if (bank->gpio_type =3D=3D GPIO_TYPE_V2)
> +		rockchip_gpio_writel(bank, bank->saved_bothedge, reg->int_bothedge);
> +	irq_reg_writel(gc, bank->saved_masks, reg->int_mask);
>  }

[Severity: Medium]
Does restoring the interrupt registers in rockchip_irq_resume() re-enable
edge detection and unmask wakeup interrupts before
rockchip_gpio_resume_noirq() restores the pin directions, output levels,
and debounce settings?

irq_gc_resume() invokes rockchip_irq_resume() during syscore_resume(),
which runs before local_irq_enable() and before dpm_resume_noirq() calls
rockchip_gpio_resume_noirq().  Because suspend_device_irqs() leaves wakeup
lines, IRQF_NO_SUSPEND lines, and the chained parent bank->irq enabled,
bank->saved_masks unmasks those lines while reg->port_dr, reg->port_ddr,
and reg->debounce still hold the boot kernel's reset state.  Hardware edge
detectors can then latch or fire spurious interrupts (and flip polarity on
GPIO v1 emulated both-edge lines in rockchip_irq_demux()) before the bank
configuration is restored in rockchip_gpio_resume_noirq().

In addition, irq_gc_suspend() and irq_gc_resume() skip chip.irq_suspend
and chip.irq_resume when gc->installed is 0, so a bank with no mapped
interrupts at suspend time will not restore reg->int_en if the bank loses
power.

[ ... ]

> @@ -805,6 +821,49 @@ static void rockchip_gpio_remove(struct platform_dev=
ice *pdev)
>  	gpiochip_remove(&bank->gpio_chip);
>  }
> =20
> +static int rockchip_gpio_suspend_noirq(struct device *dev)
> +{
> +	struct rockchip_pin_bank *bank =3D dev_get_drvdata(dev);
> +	const struct rockchip_gpio_regs *reg =3D bank->gpio_regs;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&bank->slock, flags);
> +	bank->saved_dr =3D rockchip_gpio_readl(bank, reg->port_dr);
> +	bank->saved_ddr =3D rockchip_gpio_readl(bank, reg->port_ddr);
> +	bank->saved_debounce =3D rockchip_gpio_readl(bank, reg->debounce);
> +	if (bank->gpio_type =3D=3D GPIO_TYPE_V2) {
> +		bank->saved_dbclk_div_en =3D rockchip_gpio_readl(bank, reg->dbclk_div_=
en);
> +		bank->saved_dbclk_div_con =3D readl(bank->reg_base + reg->dbclk_div_co=
n);
> +	}
> +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> +
> +	return 0;
> +}
> +
> +static int rockchip_gpio_resume_noirq(struct device *dev)
> +{
> +	struct rockchip_pin_bank *bank =3D dev_get_drvdata(dev);
> +	const struct rockchip_gpio_regs *reg =3D bank->gpio_regs;
> +	unsigned long flags;
> +
> +	/* Restore from hibernation follows a cold boot: write the bank back. */
> +	raw_spin_lock_irqsave(&bank->slock, flags);
> +	rockchip_gpio_writel(bank, bank->saved_dr, reg->port_dr);
> +	rockchip_gpio_writel(bank, bank->saved_ddr, reg->port_ddr);
> +	if (bank->gpio_type =3D=3D GPIO_TYPE_V2) {
> +		writel(bank->saved_dbclk_div_con, bank->reg_base + reg->dbclk_div_con);
> +		rockchip_gpio_writel(bank, bank->saved_dbclk_div_en, reg->dbclk_div_en=
);
> +	}
> +	rockchip_gpio_writel(bank, bank->saved_debounce, reg->debounce);
> +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> +
> +	return 0;
> +}

[Severity: Medium]
On GPIO_TYPE_V2 banks, can rockchip_gpio_resume_noirq() re-enable the
hardware debounce filter while bank->db_clk is still gated off in the CRU?

Unlike bank->clk, bank->db_clk is only prepared and enabled on demand in
rockchip_gpio_set_debounce().  When hibernation restore is triggered from
initramfs after clk_disable_unused() has run in the boot kernel, the boot
kernel gates off dbclk_gpioN for any bank where it did not configure
debounce.  Because bank->db_clk is already marked enabled in the restored
kernel image, nothing ungates it in hardware on resume, so writing back
reg->dbclk_div_en and reg->debounce routes those pins through an unclocked
debounce filter and freezes their sampled input state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-b4-gpio-ro=
ckchip-hib-v2-1-27d3d510cb73@iav.lv?part=3D1
