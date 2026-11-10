Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289909;
	b=oLELN1S2oFmMOhV5nCKt2N+GxIgq9epI8/qCxMRXjPir5uPKLxzqlZEsFLkZ4jQuRVM5
	 S6ZAcHc3cYUgnvGbKa1SL7Kl6yRUBJS9crgchl9GkspbDCvBjjmTUspP+G2VWA2sahOY7
	 D0WgUYBX1P+hry0lMM5FhrnW6P1B9cSxBJ3vHY7GsiIAIfzumzALRrQyGPFjzoScrNivc
	 RaK+nxHg3XzOVHso5kpBNqKS99IgmpZjL7267lyCsi+p1s8H0uanrj3VO5eeuU2WyPptf
	 c2aIY3l0N8foYLAsvC3kiL408eapUUo9BNoZ9Kise4+2rfvTV8cFxB2xM7B0xWwHwpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289909;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yLEwQTD3+E4ufWNfmRuRFferJMvkILCK9cmOkTWmGnc=;
	b=Ihl+bNIs5HQ6nJFtsKw6Fj1Ha+Ob4vD/DZ5CDs8fvNeoSyPcy4RoEEBThQOfCbCMD7HJ
	 xKiS6CNbcl52h66/ZFBPl9EdWkz8mTojRnJYfgcA0TIJwDqnKEbLEYmd7WQw7QTZIWPUj
	 lKybr7U6DsOzhzx8BI7bvG8hb3IjzX+fj1RNWb3V+5hrLrJlkjQS1LdKeWFNe16f4g8va
	 WcI+RQhy5D9116tQglLto5yfFn4swaOSexwPUNieDn7UgBmWSqJJBZzno/Li2fc/5v9SE
	 itguUHWcI+Tyu4MKA69wYNcHVpiPzJlWTeA0RhsgOh9geThNhPcPnoQ1osfesUnFE+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhivSZ4V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9E606A31C;
	Tue, 10 Nov 2026 05:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhivSZ4V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7941D1F008A4;
	Tue, 10 Nov 2026 05:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289908;
	bh=yLEwQTD3+E4ufWNfmRuRFferJMvkILCK9cmOkTWmGnc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AhivSZ4V1mB6Iqx1MRKz1Q3o9N0XlxtiEvT04M1MuesLQ8Km787zQGQRWlnyblDci
	 TOIYk5k18l89qDTEkvxrxqffAvrMLtKJ7aoZw61QcGKVL4vVJ+Q1zAd/WoUW8ed2DX
	 ovKpSMGtNNGnkbgQcSi+xhT6R9I3owTzwzpvq12+oAqyAo/iyNh+ri7DhCPYNLAX5J
	 T7BPdp2ix+pAf1kTA09+s7NKRru/7EhBYomt8C3JUVzxykWhQifXFtUnWDarNqDzOD
	 VpeFLE/9O+boU6aBXZm4BBs0i1BnYeznUfImCACb4cFl/XGv4CgzMJMReqKT22Xy56
	 LO5Kif/53SwRQ==
Message-ID: <sashiko-outbox-206348@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 10/14] gpio: pl061: switch data path to gpio-regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-cv75-gpio-v14-10-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
 <20261110-cv75-gpio-v14-10-e586aad0467a@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:51:48 +0000
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
- [High] gpio: pl061: dropping IRQ resource helpers breaks IRQ locking
  and unbind
--

commit d4312a121fe3ffeafa0c808d47b54f2cad54a4cd
Author: Long Zhao <longzhao@ambarella.com>

gpio: pl061: switch data path to gpio-regmap

This commit converts the PL061 GPIO data path to gpio-regmap while keeping
a custom irq_chip and instantiating an external irq_domain.

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 27ed759486caf..cb1ef0f3774c1 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c

[ ... ]

> @@ -229,54 +198,47 @@ static int pl061_irq_type(struct irq_data *d, unsig=
ned trigger)

[ ... ]

>  static void pl061_irq_mask(struct irq_data *d)
>  {
> -	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> -	struct pl061 *pl061 =3D gpiochip_get_data(gc);
> -	u8 mask =3D BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
> +	struct pl061 *pl061 =3D irq_data_get_irq_chip_data(d);
> +	unsigned int mask =3D pl061_line_mask(pl061, irqd_to_hwirq(d));
> =20
> -	scoped_guard(raw_spinlock, &pl061->lock)
> -		regmap_clear_bits(pl061->regmap, GPIOIE, mask);
> -
> -	gpiochip_disable_irq(gc, d->hwirq);
> +	regmap_clear_bits(pl061->regmap, pl061->data->regs->ie, mask);
>  }
> =20
>  static void pl061_irq_unmask(struct irq_data *d)
>  {
> -	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> -	struct pl061 *pl061 =3D gpiochip_get_data(gc);
> -	u8 mask =3D BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
> -
> -	gpiochip_enable_irq(gc, d->hwirq);
> +	struct pl061 *pl061 =3D irq_data_get_irq_chip_data(d);
> +	unsigned int mask =3D pl061_line_mask(pl061, irqd_to_hwirq(d));
> =20
> -	scoped_guard(raw_spinlock, &pl061->lock)
> -		regmap_set_bits(pl061->regmap, GPIOIE, mask);
> +	regmap_set_bits(pl061->regmap, pl061->data->regs->ie, mask);
>  }

[ ... ]

> @@ -320,67 +280,169 @@ static const struct irq_chip pl061_irq_chip =3D {
>  	.irq_set_wake		=3D pl061_irq_set_wake,
>  	.irq_print_chip		=3D pl061_irq_print_chip,
>  	.flags			=3D IRQCHIP_IMMUTABLE,
> -	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};

[ ... ]

> +	if (irq) {
> +		const struct irq_domain_info info =3D {
> +			.fwnode		=3D dev_fwnode(dev),
> +			.size		=3D data->ngpio,
> +			.hwirq_max	=3D data->ngpio,
> +			.ops		=3D &pl061_irq_domain_ops,
> +			.host_data	=3D pl061,
> +		};
> +
> +		pl061->irq_domain =3D devm_irq_domain_instantiate(dev, &info);
> +		if (IS_ERR(pl061->irq_domain))
> +			return PTR_ERR(pl061->irq_domain);
> +
> +		/*
> +		 * Registered before the gpiochip so unbind runs it after
> +		 * gpiochip_free_remaining_irqs(), while the domain is still
> +		 * alive. devm removes the domain after this action.
> +		 */
> +		ret =3D devm_add_action_or_reset(dev, pl061_dispose_irq_mappings, pl06=
1);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does dropping GPIOCHIP_IRQ_RESOURCE_HELPERS and
gpiochip_enable_irq()/gpiochip_disable_irq() break IRQ teardown on unbind
and gpiolib's direction vs. IRQ protections?

Without those helpers, GPIOD_FLAG_USED_AS_IRQ and GPIOD_FLAG_IRQ_IS_ENABLED
are never set on the GPIO descriptors.  Although the comment above
pl061_dispose_irq_mappings() relies on gpiochip_free_remaining_irqs()
cleaning up active interrupts first during unbind,
gpiochip_free_remaining_irqs() only iterates over descriptors with
GPIOD_FLAG_USED_AS_IRQ set and becomes a no-op.

If a line has an active interrupt when the device is unbound (for example,
via GPIO_V2_GET_LINE_IOCTL edge detection), pl061_dispose_irq_mappings()
calls irq_dispose_mapping() -> free_desc() while desc->action and the
threaded IRQ handler are still installed, warning in remove_proc_entry()
and freeing the irq_desc; a later free_irq() then sees irq_to_desc(virq) =
=3D=3D
NULL and leaks the irqaction while leaving edge_irq_thread running with a
dangling dev_id pointer.

Leaving those flags unset also regressions direction and module lifetime
enforcement: requesting an IRQ on a line configured as an output is no
longer rejected by gpiochip_lock_as_irq(), switching a line with an active
enabled IRQ to output mode is no longer blocked by
gpiod_direction_output_nonotify(), and module refcounting in
gpiochip_reqres_irq()/gpiochip_relres_irq() is bypassed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-cv75-gpio-=
v14-0-e586aad0467a@ambarella.com?part=3D10
