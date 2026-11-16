Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796981;
	b=hir8DHlExUuC6qbU00quQih1xptQHXRqJpxkLcgOe6i4wncDV4aT7JK23dUMQDC3ag+U
	 u3c+CpSWeShv2VZOT3LapT0hg15quPGnbiX5KV9Jlr1Wc23U2/oquZNSTsxkJWS0eXqAj
	 EHuzNvLufBYzjoLUPHhK6J7EjjKGSctTu4Xgs+1NjbnS1qGDTs/BBwqFcfNqeK0BJjb29
	 OZmkB5SHrpxkbby+VJpQLNA+j5EQQEcvG3SBDmrfr3T48qtDiSGsme1yosGDOelQ+9ax8
	 /GRN1lEGVlyL3vevbST9ogDW/S1Q4y2vDSmdrfnKFjZSt/VIXPz7ZhZYtpu/x1ZKsqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796981;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AfiX1LtZbX0E1uziKkl2GJIrE2SnNKZV+JRZHjDKL0g=;
	b=nkCLPHF7TKZH8RqZPyPE38b60rKyr5UCegbPUpK4bJo7t5vesCdmwfBKf46jDHTGkFDR
	 NedzlbbgfBl2eumvT91JNeONP0ntzFlct1T6Vnl3zRmghARlNFnVAx8PrifRagrEUvwHE
	 /NRfDlIhI3kjMxJed8Iayl2cPydc/Rz2ac89ej3JZJOo+C7EUKvYu//4ZyR9nmqLzYP5B
	 FDErEOqPavtx22TC65MFi1RUR5AB0vUfHmJPc76im40878Pvj5lS9IywpQfC3vpBBu3N8
	 Ahnc8JHY/prnVKDnPj/RDD3xX613Kyw0c/m1yrKik93usUj+06u8Ipunr6eiuXQ2oVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ju/NHVvW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F481606A31C;
	Mon, 16 Nov 2026 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ju/NHVvW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644C51F000C4;
	Mon, 16 Nov 2026 02:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794796980;
	bh=AfiX1LtZbX0E1uziKkl2GJIrE2SnNKZV+JRZHjDKL0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ju/NHVvWub19j14oVUaGJ7mfOimUoXokEvQjAIwAR912AJFN1kV+3O+c+J/uLdV0+
	 fQ3VC8MKvGITenFExtJ0ASEIGhO+CQ9mFm3fB7Ipa+CKunkGwbchOlstwAQMpwxUOe
	 XLifzAAtF0KFKhLYvtpIssv691b2mBnbHiQ0GzIWtblQDtyep1RBDQPg6t4VNqOmS6
	 jDnYYAUVf6h8IP59x8jJyhDsAoErZpL0vkfKXpALtRCmS2WaCRWAVlr76KiM6cHdcN
	 92XvMkHH5+ZO3QvWodAPeOib8RTYFfh/sEAG5z+Wl2UCGsirA2h/jGtBKz2O0is6G2
	 M0rQqkP5Aosfw==
Message-ID: <sashiko-outbox-216086@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
 <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 02:42:59 +0000
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
- [Medium] gpio: cs75xx: spurious interrupt when enabling edge-triggered
  IRQs
- [Low] gpio: cs75xx: Kconfig depends on undefined symbol
  ARCH_CORTINA_ACCESS
--

commit 6e394706938fa0fbfbaaa8045989b5a4c049c014
Author: Fil Dunsky <filipp.dunsky@gmail.com>

gpio: Add Cortina Systems CS75xx GPIO driver

This commit adds a GPIO and interrupt controller driver for the Cortina
Systems CS75xx SoCs using gpio-mmio.

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e4280029d86..cc00cfe48d941 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -300,6 +300,18 @@ config GPIO_CLPS711X
>  	help
>  	  Say yes here to support GPIO on CLPS711X SoCs.
> =20
> +config GPIO_CS75XX
> +	tristate "Cortina Systems CS75xx GPIO support"
> +	depends on ARCH_CORTINA_ACCESS || COMPILE_TEST

[Severity: Low]
Is ARCH_CORTINA_ACCESS defined anywhere in the tree?  Without that Kconfig
symbol, GPIO_CS75XX can only be enabled when COMPILE_TEST is set, and
scripts/checkkconfigsymbols.py will report an undefined symbol.

[ ... ]

> diff --git a/drivers/gpio/gpio-cs75xx.c b/drivers/gpio/gpio-cs75xx.c
> new file mode 100644
> index 0000000000000..b4f2889103311
> --- /dev/null
> +++ b/drivers/gpio/gpio-cs75xx.c

[ ... ]

> +static void cs75xx_gpio_irq_unmask(struct irq_data *d)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct cs75xx_gpio *g =3D gpiochip_get_data(gc);
> +	irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +	u32 ie;
> +
> +	gpiochip_enable_irq(gc, hwirq);
> +
> +	guard(gpio_generic_lock_irqsave)(&g->chip);
> +	/*
> +	 * The status of a level interrupt is latched while the line is
> +	 * asserted, also after the ack, so it may be stale by now. Clear it,
> +	 * it is set again right away if the line is still asserted.
> +	 */
> +	if (irqd_is_level_type(d))
> +		writel(BIT(hwirq), g->base + CS75XX_GPIO_INT);
> +	ie =3D readl(g->base + CS75XX_GPIO_IE);
> +	writel(ie | BIT(hwirq), g->base + CS75XX_GPIO_IE);
> +}
> +
> +static int cs75xx_gpio_irq_set_type(struct irq_data *d, unsigned int typ=
e)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct cs75xx_gpio *g =3D gpiochip_get_data(gc);
> +	u32 mask =3D BIT(irqd_to_hwirq(d));
> +	u32 lvl, edge, both_edges;
> +
> +	guard(gpio_generic_lock_irqsave)(&g->chip);
> +
> +	lvl =3D readl(g->base + CS75XX_GPIO_LVL);
> +	edge =3D readl(g->base + CS75XX_GPIO_EDGE);
> +	both_edges =3D g->both_edges & ~mask;
> +
> +	switch (type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_LEVEL_LOW:
> +		lvl &=3D ~mask;
> +		edge &=3D ~mask;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		lvl |=3D mask;
> +		edge &=3D ~mask;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		lvl &=3D ~mask;
> +		edge |=3D mask;
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		lvl |=3D mask;
> +		edge |=3D mask;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		both_edges |=3D mask;
> +		edge |=3D mask;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	g->both_edges =3D both_edges;
> +	writel(lvl, g->base + CS75XX_GPIO_LVL);
> +	writel(edge, g->base + CS75XX_GPIO_EDGE);
> +	if (g->both_edges & mask)
> +		cs75xx_gpio_set_polarity(g, mask);

[Severity: Medium]
Can configuring and unmasking an edge-triggered interrupt fire an immediate
spurious interrupt?

cs75xx_gpio_probe() leaves CS75XX_GPIO_EDGE and CS75XX_GPIO_LVL at their
reset or boot loader state, so any line initially in level mode will
re-latch its bit in CS75XX_GPIO_INT whenever the input matches
CS75XX_GPIO_LVL.  In addition, cs75xx_gpio_irq_set_type() writes
CS75XX_GPIO_LVL before switching CS75XX_GPIO_EDGE to edge mode, which
latches CS75XX_GPIO_INT if the pin already matches the new lvl bit.
Because neither cs75xx_gpio_irq_set_type() nor cs75xx_gpio_irq_unmask()
clears CS75XX_GPIO_INT for edge interrupts, unmasking the line in
CS75XX_GPIO_IE immediately triggers a spurious interrupt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-cs75xx-gpi=
o-v4-0-ad80a944e966@gmail.com?part=3D2
