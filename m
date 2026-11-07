Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794031754;
	b=nZHCmReJSL4QYz+DUF17ehRkQc71MRA4tqypt/EuGB9vcgMV+PNk/K/EBZBh4+l6BvsY
	 Q808KVNndx+3fDk2cZXjYqrE4zEfx/qb8B1AWmtjFXUR1G75o9wPUs5RnUEckFbr6uwgX
	 KOgjTlieR0CyFcF3lN2/6SL691KnOQEtK+fHBc/vMBqG3ZMTANCINy7UVpwIa7HrFelW1
	 58Pz0Pp81KyTPtHeSMJwQuOM9PqIUQsYo1yNxr98zKN0OddgIYx1ExHoH2F+/O2ze18s0
	 3el2Z9ZTivh8Ej9VMvAkJrpv/T6zzo+aLS5lHRZ9j/OrbmGzvMP4C/+mEQAT+e7boFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794031754;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t/xqax8exAxlylKTX8nYluFZwojZSBm+/GXhP+SEiZo=;
	b=ux0W4goHJI36dY5S/W+OtvYpl7z6vW6vvvEAGMX/xkn9peZLOqPrfu4uvPf2wASfDspR
	 xPGCkQhv7f1mriYoZA5Hfs4p1Rzgbxt4bN0GFF8Hr1IopWdgua5HCPTTqnf1odD5qivPF
	 jqZMV/yc8Umc9kxGClHKGxoar2GLnasbC7faj5NBEb4/ZC/7HxP+PP2VuGsaX4aNXQ15i
	 W4vqygkCMUBX5qoD9C7OXOTbcDmSHNS1fl38hypA39YVYdozmhaw+/9hKKxQ7bJgb/JrG
	 rx+RdNymTFQnAnaRr1ZEsaQvnyrlbuDBdTKKPugmPa3smpPQY3dZB0p7Lv0FfEF9e3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G6DoZ/VD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126B8606A326
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 06:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6DoZ/VD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A811F0089F;
	Sat,  7 Nov 2026 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794031753;
	bh=t/xqax8exAxlylKTX8nYluFZwojZSBm+/GXhP+SEiZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G6DoZ/VDjEkm+YdQQP6U257Aqf2YeqcA0y53e0PyYgri97P+VREC1/LUm3c/HCJwI
	 CSGW52ZJ9NEq5AXKLUSBLZEY5Ww64g5m+XnyWgu5NJabtL4qdbGRxgLs8T2hSMDB+M
	 3N6PS7RwBsW64Emx5VFI9oitWEXXCCgqhZJySZlUlKCZidxac5Be0w5uJYz4SauQWz
	 nzpV/H8KOxap4M9CLrBGoEv3ODiFCNXZ4RPpGmKrUMuDpeyfpQ5lLEjXd1bs03luh7
	 k+/AYMufYiASXN662aMHr1W4HXr3Hkb0TXnUBnaUgt3D6CG3ugN4lLCAU1rrc1I6F3
	 WxkB/0orp+Y7w==
Message-ID: <sashiko-outbox-202652@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: rockchip: restore interrupt settings after
 hibernation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261107-b4-gpio-rockchip-hib-v1-1-19f4d163a55e@iav.lv>
References: <20261107-b4-gpio-rockchip-hib-v1-1-19f4d163a55e@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 06:09:13 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] gpio: rockchip: lost edge interrupts in rockchip_irq_resume()
  on GPIO v1
--

commit ee188794739447af06471d0bb656d9e9f704358d
Author: Igor Velkov <iav@iav.lv>

gpio: rockchip: restore interrupt settings after hibernation

This commit saves the GPIO interrupt enable, type, polarity, and both-edge
registers on suspend and restores them on resume so interrupt configuration
is preserved across hibernation.

> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 0f46ff095a248..83a5cc8f3fe68 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -489,6 +489,11 @@ static void rockchip_irq_suspend(struct irq_data *d)
>  	struct rockchip_pin_bank *bank =3D gc->private;
> =20
>  	bank->saved_masks =3D irq_reg_readl(gc, bank->gpio_regs->int_mask);
> +	bank->saved_en =3D rockchip_gpio_readl(bank, bank->gpio_regs->int_en);
> +	bank->saved_type =3D rockchip_gpio_readl(bank, bank->gpio_regs->int_typ=
e);
> +	bank->saved_polarity =3D rockchip_gpio_readl(bank, bank->gpio_regs->int=
_polarity);
> +	if (bank->gpio_type =3D=3D GPIO_TYPE_V2)
> +		bank->saved_bothedge =3D rockchip_gpio_readl(bank, bank->gpio_regs->in=
t_bothedge);
>  	irq_reg_writel(gc, ~gc->wake_active, bank->gpio_regs->int_mask);
>  }
> =20
> @@ -496,7 +501,23 @@ static void rockchip_irq_resume(struct irq_data *d)
>  {
>  	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>  	struct rockchip_pin_bank *bank =3D gc->private;
> +	u32 polarity =3D bank->saved_polarity;
> +
> +	/*
> +	 * Restore from hibernation follows a cold boot: write the enables and
> +	 * the trigger back before we unmask.
> +	 */
> +	if (bank->toggle_edge_mode) {
> +		u32 data =3D readl(bank->reg_base + bank->gpio_regs->ext_port);
> =20
> +		polarity &=3D ~bank->toggle_edge_mode;
> +		polarity |=3D ~data & bank->toggle_edge_mode;
> +	}
> +	rockchip_gpio_writel(bank, bank->saved_en, bank->gpio_regs->int_en);
> +	rockchip_gpio_writel(bank, bank->saved_type, bank->gpio_regs->int_type);
> +	rockchip_gpio_writel(bank, polarity, bank->gpio_regs->int_polarity);

[Severity: High]
Does recomputing polarity from ext_port here clear pending toggle_edge_mode
interrupts on GPIO_TYPE_V1 before rockchip_irq_demux() can handle them?

On GPIO_TYPE_V1, rockchip_irq_set_type() emulates IRQ_TYPE_EDGE_BOTH by
configuring a level-sensitive trigger in int_type and arming int_polarity to
the inverse of ext_port.  When the pin changes state, int_status remains
asserted only while int_polarity matches the new pin level, until
rockchip_irq_demux() flips int_polarity and dispatches the IRQ.

Because rockchip_irq_resume() runs via syscore_resume() while CPU interrupts
are still disabled, overwriting bank->saved_polarity with ~data when a pin
transitioned during suspend or hibernation flips int_polarity away from the
active level and drops the pending wakeup or edge event.  Restoring
bank->saved_polarity directly preserves the pending level condition for
rockchip_irq_demux() to flip and dispatch once interrupts are re-enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-b4-gpio-ro=
ckchip-hib-v1-1-19f4d163a55e@iav.lv?part=3D1
