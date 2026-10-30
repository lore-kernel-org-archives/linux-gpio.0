Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390576;
	b=s5bLRL+FmbKlA3UzR5yIERcQyLnJH0SF6CEOf9MXRFuT6LS9V5Xv7jeFP15/znNczwyo
	 SD9Odh4msQdn70Z/pVzQhDu/XKbdWijxmgGQw2I6O6LwUcJxC/MDGwIYLbrRF+1J2hg4r
	 vhfdb2xi5Au46zMYl6RTBurHEkUhwsaTcm4iBxIfGt7olFWzH+ms+Dd19Pk86RXC09Rmo
	 rYjT8gI7ieCbozkxhccmcE5v9Wse+sTfXVTaIYKgflvYLEZgjsIW3fxYCjk2+n0sU3Pnu
	 rSEsN496ZZj8qnapZMEAyrZ98y9QOPuB6DUL2n+EEgWzAPBy0/gsLOfKpRCfdB8KbEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390576;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y5gJrbOwB86SIXV4U5K6PcOeOp+kcDR3rI3NT5Rwrfc=;
	b=VFYYiO3Oi/2w/xVlzmE5ilcsv+pqgwbedI7+DYysrPqNMngskQJR6wfW8Zv2rGxt7K1y
	 1UlwjPYI3A6fUQ4zM5Blyk4qtX+uANO48FZiJrUOLoSPojLvYDypkDCMJIWh1ziGw4acn
	 Up308Zh9l80Tje450xlfRKxUuXA9IP1C3kYPqoJoUj7zrBDq6zRbZZob60YIsLwzXSbfw
	 GtZy3jeK232l6CvjcHGv+TWm1Mplso0dAY1wjaUxNMf/ai6Gxn+LksSNHyB1QEZYuaSj7
	 cLc1768w06gxafrdxlzWm6Jy5os4Mow2Mc8MuCp4QG2pACaT6OQdIvcv47t7EbCfEYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0UIZpUH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D493606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 20:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0UIZpUH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F20D1F000C1;
	Fri, 30 Oct 2026 20:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793390576;
	bh=y5gJrbOwB86SIXV4U5K6PcOeOp+kcDR3rI3NT5Rwrfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E0UIZpUHjaFdZbHgNLvuBxUBkEWPSlOV+08lOd9cH6Ox6Lzqt7CNYBuuIARa9gDPl
	 I57qzAhSlBfwJpfLeCEDLHZeOgZczw1mzqWLzw7IKQl28AUeSbhLbSEyNpGACIYo/Q
	 ERB2GE0UYEPk1m/Y5gt3YuZ4Gs6w4tDQmj2DbSomFZq/AnqHIl3wGEZQuA+6Jnw9O6
	 J/M1BJ7u8sNBUIkypkV/uPpgegDliGqAwZ/Vc87QxSGom0gsXD4oHJZxKIgoVaibtF
	 SubQ8czCaQPuQ59R6D6KriM0tp87kMLLI3iN6jwLPORBSUhKoC05Im7cQk+M6iU7Lj
	 T4TZXVzVv+jzA==
Message-ID: <sashiko-outbox-191459@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ
 and skip unhandled EOI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Munique Feitoza" <muniquefeitoz4@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 20:02:55 +0000
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
- [High] pinctrl: amd: missing EOI in do_amd_gpio_irq_handler() on spurious=
 IRQ
--

commit df92227f2b1cea5ec26fd7063440df3f2e4656a4
Author: Munique Feitoza <muniquefeitoz4@gmail.com>

pinctrl: amd: Clear interrupt enable on spurious IRQ and skip unhandled EOI

This commit clears BIT(INTERRUPT_ENABLE_OFF) alongside BIT(INTERRUPT_MASK_O=
FF)
when disabling a spurious GPIO IRQ in do_amd_gpio_irq_handler(), and returns
early before writing EOI_MASK to WAKE_INT_MASTER_REG when ret is false.

> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 9fa752f552d43..42844094916a7 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -671,7 +671,8 @@ static bool do_amd_gpio_irq_handler(int irq, void *de=
v_id)
>  			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
>  			regval =3D readl(amd_gpio_pin_reg(gpio_dev, irqnr + i));
>  			if (!gpiochip_line_is_irq(gc, irqnr + i)) {
> -				regval &=3D ~BIT(INTERRUPT_MASK_OFF);
> +				regval &=3D ~(BIT(INTERRUPT_MASK_OFF) |
> +					    BIT(INTERRUPT_ENABLE_OFF));
>  				dev_dbg(&gpio_dev->pdev->dev,
>  					"Disabling spurious GPIO IRQ %d\n",
>  					irqnr + i);
> @@ -722,7 +723,8 @@ static bool do_amd_gpio_irq_handler(int irq, void *de=
v_id)
>  			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
>  			regval =3D readl(amd_gpio_pin_reg(gpio_dev, pin));
>  			if (!gpiochip_line_is_irq(gc, pin)) {
> -				regval &=3D ~BIT(INTERRUPT_MASK_OFF);
> +				regval &=3D ~(BIT(INTERRUPT_MASK_OFF) |
> +					    BIT(INTERRUPT_ENABLE_OFF));
>  				dev_dbg(&gpio_dev->pdev->dev,
>  					"Disabling spurious GPIO IRQ %d\n",
>  					pin);
> @@ -735,7 +737,7 @@ static bool do_amd_gpio_irq_handler(int irq, void *de=
v_id)
>  	}
> =20
>  	/* did not cause wake on resume context for shared IRQ */
> -	if (irq < 0)
> +	if (irq < 0 || !ret)
>  		return false;

[Severity: High]
Does skipping the EOI write when !ret is true leave the AMD GPIO controller
with an unacknowledged interrupt after a spurious GPIO IRQ?

When an unmasked pin raises an interrupt while gpiochip_line_is_irq() is fa=
lse
(for instance, at boot before a client driver such as i2c-hid probes as in
commit d21b8adbd475 ("pinctrl: amd: Disable and mask interrupts on probe"),=
 or
after suspend/resume when firmware leaves an unused pin unmasked as in comm=
it
0cf9e48ff22e ("pinctrl: amd: Disable and mask interrupts on resume")),
do_amd_gpio_irq_handler() clears and disables the pin interrupt in the
!gpiochip_line_is_irq() branch on the main or RGPIO bank without setting
ret =3D true:

drivers/pinctrl/pinctrl-amd.c:do_amd_gpio_irq_handler() {
	...
			if (!gpiochip_line_is_irq(gc, irqnr + i)) {
				regval &=3D ~(BIT(INTERRUPT_MASK_OFF) |
					    BIT(INTERRUPT_ENABLE_OFF));
				dev_dbg(&gpio_dev->pdev->dev,
					"Disabling spurious GPIO IRQ %d\n",
					irqnr + i);
			} else {
				ret =3D true;
			}
			writel(regval, amd_gpio_pin_reg(gpio_dev, irqnr + i));
	...
}

If no other registered GPIO IRQ is active during the same invocation, ret
remains false even though the AMD GPIO hardware asserted the interrupt line.

Returning early at if (irq < 0 || !ret) skips writing EOI_MASK to
WAKE_INT_MASTER_REG:

	/* did not cause wake on resume context for shared IRQ */
	if (irq < 0 || !ret)
		return false;

	/* Signal EOI to the GPIO unit */
	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
	regval =3D readl(gpio_dev->base + WAKE_INT_MASTER_REG);
	regval |=3D EOI_MASK;
	writel(regval, gpio_dev->base + WAKE_INT_MASTER_REG);
	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);

Because the flow handlers used by amd_gpio_irqchip (handle_edge_irq,
handle_level_irq, and handle_simple_irq) do not call .irq_eoi,
do_amd_gpio_irq_handler() is the only place that signals EOI to the GPIO
unit. Wouldn't skipping EOI_MASK after servicing a spurious GPIO interrupt
prevent the controller from delivering subsequent valid GPIO interrupts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030195025.5153=
-1-muniquefeitoz4@gmail.com?part=3D1
