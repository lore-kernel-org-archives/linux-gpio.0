Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490077;
	b=SaKXwtmvwrRTTNLM47w6i+KSb7mm8prc6RAR+V7/YCUP54DqNaLMiwEq/N/TAgs+KD9g
	 DbwfLWfMIrc5nmPLP6VbrbWrRxXaOPNZ9pNRTJxZ5/GIJTFZnRfOODs2qkyD4DV41LLLm
	 F7o7CQ/jTqZnc+9r08pEGuCDoLVvqKeghErqvSqNBRrA2dfr1+XVA9zu/xjYINKUbmJ/S
	 7ySlkZ6g5W4x2RRqhVbHndZ01z0XbNa3aJlqzzNonAZ3OammduaaAGgOn06hjn+//YIEK
	 mlte+KLQjTTaRm3YEUP8ga26RshaAJm0IQjtklHq/8wpzuaZDW1Hhus8HezvzOJJSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490077;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SdknIuAfVwq6m+Q9lMbXaZ3yl0A/jkVAgmdrDkAs0do=;
	b=txGFxN9g0FYMXW5y4o3knqWZd9fxuLAlhLlWaAfvuXQlRyggxUugjqReDCoCtMQScr4h
	 GFDDwNpmD3ylSY+oHlvp1KdR89gcEsWaYTXRAW+gON2Rcf05zTmw8g0jEMpTQzxHCa93z
	 nPa/UkoK6IWujV2BADFq4vRGvKfMUHd8sX5jW1LI6O1WzJ3rfCWwjarI7s+2gx2qVXD+F
	 CdoK8o6Y77yB9Jf3KJFyKTnnhFMkp7wWgrSPMFwTIZlzX5T9jmTt/dPqzGJAgWJ72qHq5
	 JWF25cUX5GqloVL5L3F5slb819kRq0BXJycjfAQPYnJ7xCaQVnWkZQys5J+RKPCtyfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Shi661Do;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394F606A320;
	Tue, 20 Oct 2026 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Shi661Do
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85B31F000C4;
	Tue, 20 Oct 2026 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792490077;
	bh=SdknIuAfVwq6m+Q9lMbXaZ3yl0A/jkVAgmdrDkAs0do=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Shi661DoLzxH6QfpNslLsjsDsdaFA389NCY3ac91/1kW37pAUDloBoy2JhM/cyTTy
	 pqqcev8RavgyYGpGYXqlDEqBXqSfi7zraG95P1z8Acj+YuurRprwMbGBeRmo9wRsGd
	 zY5ugt4ZhzhQF1yFIyc29tVMVLnBQ/+/ot6PY8VNwOHxbF3pPxyBKZOiJbgPJpqWUV
	 bJkNE76UckPJ0KGyBkhS19vc7L4nA3rpaQpFFIqvbglQrAc9FpzawYydR9TqMM1uH0
	 M/mdxHM1aKBrKFH9jTnymUQ6cZRRsj9IQaFZ4w6ylBdyaRrkOIbVtDlZBc5gFjBQkh
	 4reGrqol4iPhA==
Message-ID: <sashiko-outbox-178772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 8/9] gpio: pl061: switch data path to gpio-regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-cv75-gpio-v11-8-e058bae19571@ambarella.com>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
 <20261020-cv75-gpio-v11-8-e058bae19571@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 09:54:36 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] gpio: pl061: dropping IRQ resource helpers breaks GPIO-IRQ locking=
 and cleanup
- [High] gpio: pl061: switching to external irq_domain breaks ACPI _AEI eve=
nts
- [Medium] gpio: pl061: missing irq_set_lockdep_class() in pl061_irq_domain=
_map()
- [Medium] gpio: pl061: pl061_remove_irq() uninstalls unset handler on prob=
e failure
--

commit 94e11dd61f451bc9b5f20341100f3b52b7691a67
Author: Long Zhao <longzhao@ambarella.com>

gpio: pl061: switch data path to gpio-regmap

This commit converts the PL061 GPIO driver data path (get, set, and directi=
on
operations) to use gpio-regmap while switching the interrupt support to a
custom irq_domain attached via gpio_regmap_config.

>     gpio: pl061: switch data path to gpio-regmap
>    =20
>     Move get, set and direction onto gpio-regmap. ARM PL061 sets
>     GPIO_REGMAP_QUIRK_SET_AFTER_DIR so the output value is written
>     after the direction change.
>    =20
>     Keep a custom irqchip and irq domain. Create the domain with
>     the PL061 private data and let gpio-regmap attach it.
>    =20
>     Check the chained-handler regmap_read() return and always run
>     chained_irq_exit(). irq_type still ignores MMIO write returns.
>    =20
>     irq_set_parent() nests the GPIO irq_desc under the AMBA parent
>     for irq_set_wake() and lockdep; checked with PROVE_LOCKING on
>     CV75.
>    =20
>     Signed-off-by: Long Zhao <longzhao@ambarella.com>

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 585871ff25199..3d04f8c2a5c69 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c

[ ... ]

> @@ -231,54 +199,52 @@ static int pl061_irq_type(struct irq_data *d, unsig=
ned trigger)

[ ... ]

>  static void pl061_irq_mask(struct irq_data *d)
>  {
> -	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> -	struct pl061 *pl061 =3D gpiochip_get_data(gc);
> -	u8 mask =3D BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
> -
> -	scoped_guard(raw_spinlock, &pl061->lock)
> -		regmap_clear_bits(pl061->regmap, GPIOIE, mask);
> +	struct pl061 *pl061 =3D irq_data_get_irq_chip_data(d);
> +	unsigned int mask =3D pl061_line_mask(pl061, irqd_to_hwirq(d));
> =20
> -	gpiochip_disable_irq(gc, d->hwirq);
> +	regmap_clear_bits(pl061->regmap, pl061->data->regs->ie, mask);
>  }
> =20
>  static void pl061_irq_unmask(struct irq_data *d)
>  {
> -	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> -	struct pl061 *pl061 =3D gpiochip_get_data(gc);
> -	u8 mask =3D BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
> +	struct pl061 *pl061 =3D irq_data_get_irq_chip_data(d);
> +	unsigned int mask =3D pl061_line_mask(pl061, irqd_to_hwirq(d));
> =20
> -	gpiochip_enable_irq(gc, d->hwirq);
> -
> -	scoped_guard(raw_spinlock, &pl061->lock)
> -		regmap_set_bits(pl061->regmap, GPIOIE, mask);
> +	regmap_set_bits(pl061->regmap, pl061->data->regs->ie, mask);
>  }

[ ... ]

> @@ -322,67 +286,162 @@ static const struct irq_chip pl061_irq_chip =3D {
>  	.irq_set_wake		=3D pl061_irq_set_wake,
>  	.irq_print_chip		=3D pl061_irq_print_chip,
>  	.flags			=3D IRQCHIP_IMMUTABLE,
> -	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};

[Severity: High]
Does dropping GPIOCHIP_IRQ_RESOURCE_HELPERS from pl061_irq_chip and
removing gpiochip_disable_irq() / gpiochip_enable_irq() from
pl061_irq_mask() and pl061_irq_unmask() break GPIO-IRQ resource management
and unbind cleanup?

Attaching the custom domain through config.irq_domain in
devm_gpio_regmap_register() only calls gpiochip_irqchip_add_domain(), which
sets gc->to_irq and gc->irq.domain without installing IRQ resource
callbacks.

Without gpiochip_reqres_irq() and gpiochip_relres_irq() (and the
enable/disable helpers), requesting an interrupt on a PL061 line no longer
calls gpiochip_lock_as_irq() or takes a module reference on the provider:

- GPIOD_FLAG_USED_AS_IRQ and GPIOD_FLAG_IRQ_IS_ENABLED are never set on the
  GPIO descriptor.
- Requesting an IRQ on a line configured as a push-pull output is no longer
  rejected, and gpiod_direction_output() no longer prevents reconfiguring a
  line with an active IRQ to output mode.
- On unbind, pl061_probe() relies on gpiochip_free_remaining_irqs() running
  before pl061_remove_irq(), but in drivers/gpio/gpiolib.c:

static void gpiochip_free_remaining_irqs(struct gpio_chip *gc)
{
	struct gpio_desc *desc;

	for_each_gpio_desc_with_flag(gc, desc, GPIOD_FLAG_USED_AS_IRQ)
		gpiod_free_irqs(desc);
}

Because GPIOD_FLAG_USED_AS_IRQ is never set, gpiochip_free_remaining_irqs()
becomes a no-op, and pl061_remove_irq() calls irq_dispose_mapping(virq) ->
irq_free_desc(virq) while consumer irqactions, procfs entries, and threaded
IRQ kthreads are still active.

> +
> +static int pl061_irq_domain_map(struct irq_domain *d, unsigned int virq,
> +				irq_hw_number_t hwirq)
> +{
> +	struct pl061 *pl061 =3D d->host_data;
> +
> +	irq_set_chip_data(virq, pl061);
> +	irq_set_chip_and_handler(virq, &pl061_irq_chip, handle_bad_irq);
> +	irq_set_noprobe(virq);
> +	irq_set_parent(virq, pl061->parent_irq);
> +
> +	return 0;
> +}

[Severity: Medium]
The commit message states:

  "irq_set_parent() nests the GPIO irq_desc under the AMBA parent
   for irq_set_wake() and lockdep; checked with PROVE_LOCKING on
   CV75."

Does irq_set_parent() actually configure lockdep classes for
irq_set_irq_wake()?

Looking at kernel/irq/manage.c, irq_set_parent() only sets desc->parent_irq
when CONFIG_HARDIRQS_SW_RESEND is enabled (for software IRQ resending in
irq_sw_resend()), and is a no-op stub otherwise:

#ifdef CONFIG_HARDIRQS_SW_RESEND
int irq_set_parent(int irq, int parent_irq)
{
	scoped_irqdesc_get_and_lock(irq, 0) {
		scoped_irqdesc->parent_irq =3D parent_irq;
		return 0;
	}
	return -EINVAL;
}
EXPORT_SYMBOL_GPL(irq_set_parent);
#endif

Every irq_desc has its desc->lock initialized to the shared
&irq_desc_lock_class in init_desc(). Previously, gpiochip_irq_map() called
irq_set_lockdep_class() to place child GPIO interrupts into a separate
lockdep class from pl061->parent_irq.

Without irq_set_lockdep_class() in pl061_irq_domain_map(), won't calling
enable_irq_wake() or disable_irq_wake() on a mapped PL061 GPIO IRQ trigger
a recursive locking splat on &irq_desc_lock_class when
irq_set_irq_wake(virq) holds the child desc->lock and calls
pl061_irq_set_wake() -> irq_set_irq_wake(pl061->parent_irq)?

> +
> +static void pl061_irq_domain_unmap(struct irq_domain *d, unsigned int vi=
rq)
> +{
> +	irq_set_chip_and_handler(virq, NULL, NULL);
> +	irq_set_chip_data(virq, NULL);
> +}
> +
> +static const struct irq_domain_ops pl061_irq_domain_ops =3D {
> +	.map	=3D pl061_irq_domain_map,
> +	.unmap	=3D pl061_irq_domain_unmap,
> +	.xlate	=3D irq_domain_xlate_twothreecell,
> +};
> +
> +static void pl061_remove_irq(void *data)
> +{
> +	struct pl061 *pl061 =3D data;
> +
> +	irq_set_chained_handler_and_data(pl061->parent_irq, NULL, NULL);
> +
> +	for (unsigned int i =3D 0; i < pl061->data->ngpio; i++) {
> +		unsigned int virq;
> +
> +		virq =3D irq_find_mapping(pl061->irq_domain, i);
> +		if (virq)
> +			irq_dispose_mapping(virq);
> +	}
> +}

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
> +		ret =3D devm_add_action_or_reset(dev, pl061_remove_irq, pl061);
> +		if (ret)
> +			return ret;
> +	}
> =20
> -	ret =3D devm_gpiochip_add_data(dev, &pl061->gc, pl061);
> -	if (ret)
> -		return ret;
> +	config.parent =3D dev;
> +	config.regmap =3D pl061->regmap;
> +	config.ngpio =3D data->ngpio;
> +	config.reg_dat_base =3D GPIO_REGMAP_ADDR(regs->dat);
> +	config.reg_set_base =3D GPIO_REGMAP_ADDR(regs->dat);
> +	config.reg_dir_out_base =3D GPIO_REGMAP_ADDR(regs->dir);
> +	config.reg_mask_xlate =3D data->reg_mask_xlate;
> +	config.quirks =3D data->quirks;
> +	config.irq_domain =3D pl061->irq_domain;
> +	config.drvdata =3D pl061;
> +
> +	gpio_regmap =3D devm_gpio_regmap_register(dev, &config);
> +	if (IS_ERR(gpio_regmap))
> +		return PTR_ERR(gpio_regmap);
> +
> +	if (irq)
> +		irq_set_chained_handler_and_data(irq, pl061_irq_handler, pl061);

[Severity: Medium]
What happens in pl061_probe() if devm_gpio_regmap_register() fails (for
example with -EPROBE_DEFER when resolving pinctrl gpio-ranges or -ENOMEM)?

Because devm_add_action_or_reset(dev, pl061_remove_irq, pl061) is
registered before devm_gpio_regmap_register(), while
irq_set_chained_handler_and_data(irq, pl061_irq_handler, pl061) is only
called afterwards, a failure in devm_gpio_regmap_register() will run
pl061_remove_irq():

pl061_remove_irq()
  irq_set_chained_handler_and_data(pl061->parent_irq, NULL, NULL)
    __irq_do_set_handler(desc, NULL, 1, NULL)

In kernel/irq/chip.c:__irq_do_set_handler(), uninstalling a chained handler
that was never installed calls mask_ack_irq(desc) on the unstarted parent
IRQ, drops an unpaired irq_chip_pm_put() reference, sets desc->depth =3D 1,
and overwrites desc->handle_irq with handle_bad_irq.

Also, doesn't installing the chained handler after
devm_gpio_regmap_register() leave the parent chained handler active
throughout gpiochip_remove() and kfree(gpio) during devm teardown?

[Severity: High]
Furthermore, does switching from gpio_irq_chip to an external irq_domain in
devm_gpio_regmap_register() break ACPI GPIO-signaled events (_AEI) on ARM64
ACPI platforms using PL061 (ARMH0061)?

Previously, devm_gpiochip_add_data() called gpiochip_add_irqchip(), which
registered the domain and called acpi_gpiochip_request_interrupts(gc).

Now, gpio_regmap_register() calls gpiochip_add_data() while chip->irq.chip
is NULL (so gpiochip_add_irqchip() returns early), and then attaches
config.irq_domain via gpiochip_irqchip_add_domain():

gpio_regmap_register()
  gpiochip_add_data()
    gpiochip_add_irqchip() -> returns 0 early because !gc->irq.chip
  gpiochip_irqchip_add_domain()
    gpiochip_irqchip_add_allocated_domain()

Because gpiochip_irqchip_add_domain() never calls
acpi_gpiochip_request_interrupts(), ACPI _AEI interrupts (such as power
button events on SBSA / QEMU virt platforms) will no longer be requested.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-cv75-gpio-=
v11-0-e058bae19571@ambarella.com?part=3D8
