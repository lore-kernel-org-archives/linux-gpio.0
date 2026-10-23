Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769428;
	b=s6VD4nMlfSku5CIOkoAKoENpNQKkKMCYmnBl31nX2U0LbyEgD0vD6i50g0BAozme1qXG
	 sjefr/CT5HGkWS9+wEu1M2oBj10okJo1xPNbB08jC3Y/eLq7eNcCCPGE5ZMR6AAnWoQlu
	 xjKKXrQSuQaqxrKqHWrw1K2DXSQSlmW3LFdsgeQVMFQoqortUJuAZN2xBnPbOzeyAsJk+
	 QlOpaFQaUBCNY15uEAAXTmd7vENyUNDELXa+PXZ5zU2VWSB4C/fvebI31WVlGe5uCx/i/
	 KGFJFZIv4D+ymUChDKHW+2bHEOmqudQ5aBja+ZxvwtcRX6ZeKiL4qoeb9rogz57BjcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769428;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hCjEZweP7dlcT/EOlVmUoVk2yu5QBc7OJO4GIZVFCmE=;
	b=3Mylg56uXSLLWkSz9HRdXg5ED0p6x0I2XCf3ILRPkcco7vtGixDQIXUzfB2w0YoQeR/6
	 r7INYId9FEpeiBLy3Cu+C8HoKjspHzL+d2aQxfOfY9+1OksT3p9cSrRvTbwGK8n6txhA4
	 YbhPw/SxE6mB+di1R7pjq57MSvypagFVcXTyhN/hgkkcYJ/0LtUJWUtdmFJCiZT3dzlgp
	 edr8PMHSvzh48O7PYu1N1tLGmaQaNgSlrx4Cj1oxoEcbszjxEHPcUKe3HMTRU0A1yRG7b
	 doswhwjf47RgAfzK3hJZsexk0We19pJduLdEY0rDMRlRyHeErAXSlDh9TmcThQITqog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKOBlgBB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E13606A330
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKOBlgBB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A85D1F01828;
	Fri, 23 Oct 2026 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792769427;
	bh=hCjEZweP7dlcT/EOlVmUoVk2yu5QBc7OJO4GIZVFCmE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=SKOBlgBBGbMbIampl3CmVQbz8TcDGhBItKUlcwRbMXaUtolwPa8svO9Gqt9qvGrHe
	 rlQkprcpIWPP6JxAcV6+hPA/04S9dqgk8vViKSfI++n4D0kI9wUDqflEJ6sv98FpGJ
	 k6Oso64F2JYFSvaoOKYEnGvW4QvqlqXhl9DTE9KNJnvbmtwfTKAyA3HNWcX2Aze80O
	 ebxhykctmcwKIGqf8630yzxvnFL5wD1WG9+o9wk0i+CpTD1b0wxz+ihNkY3VuqaoxB
	 jBMl+Avm97+t/TQpaCWvGBDtHQMBthjyl/5Xr66tIjt22ZekC4VSvKwqA7cByaJ7AE
	 rRK3eSfeTAtvA==
Message-ID: <sashiko-outbox-182907@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpio: dwapb: Use gpiolib irq_set_affinity helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liang Hao" <haohlliang@gmail.com>, linux-gpio@vger.kernel.org
In-Reply-To: <20261023151209.58772-3-haohlliang@gmail.com>
References: <20261023151209.58772-1-haohlliang@gmail.com>
 <20261023151209.58772-3-haohlliang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 15:30:27 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] gpio: dwapb: broken irq_set_affinity on multi-IRQ DT and ACPI plat=
forms
- [High] gpio: unlocked parent call and state desync in gpiochip_irq_set_af=
finity()
- [Low] gpio: unguarded parent_data access in gpiochip_irq_set_affinity()
--

commit 72a8fcde432031570e3b16d2b7058ce326e44df1
Author: Liang Hao <haohlliang@gmail.com>

gpio: dwapb: Use gpiolib irq_set_affinity helper

This commit wires GPIOCHIP_IRQ_AFFINITY_HELPERS into dwapb_irq_chip so that
dwapb GPIO interrupts use the gpiolib irq_set_affinity helper.

> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index aa7c08e607074..9e63c3ecb5b45 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -412,6 +412,7 @@ static const struct irq_chip dwapb_irq_chip =3D {
>  	.irq_enable	=3D dwapb_irq_enable,
>  	.irq_disable	=3D dwapb_irq_disable,
>  	.irq_set_wake	=3D pm_sleep_ptr(dwapb_irq_set_wake),
> +	GPIOCHIP_IRQ_AFFINITY_HELPERS,

[Severity: High]
Does wiring GPIOCHIP_IRQ_AFFINITY_HELPERS unconditionally into dwapb_irq_ch=
ip
cause irq_set_affinity to fail with -EINVAL on multi-IRQ Device Tree
platforms and ACPI platforms?

In drivers/gpio/gpio-dwapb.c, dwapb_convert_irqs() compacts non-zero per-li=
ne
parent IRQs into pirq->irq[]:

drivers/gpio/gpio-dwapb.c:dwapb_convert_irqs() {
	for (i =3D 0; i < pp->ngpio; ++i) {
		if (!pp->irq[i])
			continue;

		pirq->irq[pirq->nr_irqs++] =3D pp->irq[i];
	}
}

And dwapb_configure_irqs() sets up girq differently depending on whether
there is an ACPI companion or Device Tree interrupts:

drivers/gpio/gpio-dwapb.c:dwapb_configure_irqs() {
	if (has_acpi_companion(gpio->dev)) {
		girq->num_parents =3D 0;
		girq->parents =3D NULL;
		girq->parent_handler =3D NULL;

		err =3D devm_request_irq(gpio->dev, pp->irq[0],
				       dwapb_irq_handler_mfd,
				       IRQF_SHARED, DWAPB_DRIVER_NAME, gpio);
		...
	} else {
		girq->num_parents =3D pirq->nr_irqs;
		girq->parents =3D pirq->irq;
		girq->parent_handler_data =3D gpio;
		girq->parent_handler =3D dwapb_irq_handler;
	}
}

On Device Tree platforms with multiple parent interrupts (where
pirq->nr_irqs > 1, such as platforms wiring dedicated per-GPIO interrupts on
Port A), girq->map is left NULL. In drivers/gpio/gpiolib.c,
gpiochip_irq_map() only calls irq_set_parent() when gc->irq.num_parents =3D=
=3D 1
or gc->irq.map is non-NULL, leaving desc->parent_irq =3D=3D 0:

drivers/gpio/gpiolib.c:gpiochip_irq_map() {
	if (gc->irq.num_parents =3D=3D 1)
		ret =3D irq_set_parent(irq, gc->irq.parents[0]);
	else if (gc->irq.map)
		ret =3D irq_set_parent(irq, gc->irq.map[hwirq]);
}

When gpiochip_irq_set_affinity() -> gpiochip_chained_parent_virq() runs,
girq->num_parents !=3D 1, girq->map is NULL, and desc->parent_irq is 0, so
gpiochip_chained_parent_virq() returns 0 and gpiochip_irq_set_affinity()
returns -EINVAL. Furthermore, if per-line parent IRQs are sparsely populated
such that only a single line j > 0 has a valid parent IRQ,
dwapb_convert_irqs() compacts it into pirq->irq[0] with pirq->nr_irqs =3D=
=3D 1,
causing gpiochip_chained_parent_virq() to return line j's parent virq for a=
ny
GPIO line on Port A.

On ACPI platforms (has_acpi_companion(gpio->dev)), girq->parent_handler is
NULL, so gpiochip_chained_parent_virq() also immediately returns 0:

drivers/gpio/gpiolib.c:gpiochip_chained_parent_virq() {
	if (!girq->parent_handler)
		return 0;
	...
	if (girq->num_parents =3D=3D 1)
		return girq->parents[0];

	if (girq->map) {
		if (!gpiochip_irqchip_irq_valid(gc, hwirq))
			return 0;
		return girq->map[hwirq];
	}

	desc =3D irq_to_desc(d->irq);
	if (desc && desc->parent_irq)
		return desc->parent_irq;

	return 0;
}

Because dwapb_irq_chip.irq_set_affinity is now non-NULL,
__irq_can_set_affinity() and irq_can_set_affinity_usr() evaluate to true.
Won't this cause irq_startup() -> irq_setup_affinity() to fail with -EINVAL
when requesting any GPIO IRQ, migrate_one_irq() in kernel/irq/cpuhotplug.c =
to
log ratelimited warnings during CPU hot-unplug, and writes to
/proc/irq/<N>/smp_affinity to fail on these platforms?

[Severity: High]
Can calling pdata->chip->irq_set_affinity() through
gpiochip_irq_set_affinity() on a chained dwapb irq_chip race on the parent
irq_chip without parent_desc->lock held and desynchronize parent and sibling
IRQ affinity state?

For chained dwapb GPIO interrupts, d->parent_data is NULL and the parent is=
 a
separate virq with its own struct irq_desc. When the genirq core invokes
dwapb_irq_chip.irq_set_affinity, only the child GPIO descriptor lock is hel=
d,
yet gpiochip_irq_set_affinity() directly calls into the parent chip:

drivers/gpio/gpiolib.c:gpiochip_irq_set_affinity() {
	pdata =3D irq_get_irq_data(parent);
	if (!pdata || !pdata->chip || !pdata->chip->irq_set_affinity)
		return -EINVAL;

	ret =3D pdata->chip->irq_set_affinity(pdata, dest, force);
	switch (ret) {
	case IRQ_SET_MASK_OK:
	case IRQ_SET_MASK_OK_NOCOPY:
	case IRQ_SET_MASK_OK_DONE:
		irq_data_update_effective_affinity(d,
			irq_data_get_effective_affinity_mask(pdata));
		return IRQ_SET_MASK_OK;
}

Parent irq_chip callbacks such as gic_set_affinity() in
drivers/irqchip/irq-gic-v3.c or plic_set_affinity() in
drivers/irqchip/irq-sifive-plic.c expect their own parent_desc->lock to be
held while masking, updating routing registers, unmasking, and updating
pdata->common->effective_affinity. If two GPIO lines sharing a parent IRQ
update affinity concurrently (or race with operations on the parent virq),
can this corrupt hardware routing state and effective_affinity masks?

In addition, because calling pdata->chip->irq_set_affinity() directly
bypasses irq_do_set_affinity() on parent_desc,
parent_desc->irq_common_data.affinity and IRQD_AFFINITY_SET are never updat=
ed
on the parent descriptor. And when any sibling GPIO line sharing the same
parent IRQ is later started via request_threaded_irq() -> irq_startup() ->
irq_setup_affinity() in kernel/irq/manage.c:

kernel/irq/manage.c:irq_setup_affinity() {
	struct cpumask *set =3D irq_default_affinity;
	...
	if (!__irq_can_set_affinity(desc))
		return 0;
	...
	return irq_do_set_affinity(&desc->irq_data, &mask, false);
}

won't starting that second GPIO line overwrite the shared parent IRQ's
hardware routing back to irq_default_affinity while leaving the first GPIO
line's descriptor reporting stale affinity masks?

[Severity: Low]
Will gpiochip_irq_set_affinity() in drivers/gpio/gpiolib.c fail to build wh=
en
CONFIG_GPIOLIB_IRQCHIP is enabled without CONFIG_IRQ_DOMAIN_HIERARCHY?

In include/linux/irq.h, parent_data in struct irq_data and
irq_chip_set_affinity_parent() are only declared when
CONFIG_IRQ_DOMAIN_HIERARCHY is enabled:

include/linux/irq.h:struct irq_data {
#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
	struct irq_data		*parent_data;
#endif
}

However, gpiochip_irq_set_affinity() accesses d->parent_data and calls
irq_chip_set_affinity_parent() without a CONFIG_IRQ_DOMAIN_HIERARCHY guard:

drivers/gpio/gpiolib.c:gpiochip_irq_set_affinity() {
	if (d->parent_data)
		return irq_chip_set_affinity_parent(d, dest, force);
}

Since CONFIG_GPIO_DWAPB and CONFIG_GPIOLIB_IRQCHIP do not select
CONFIG_IRQ_DOMAIN_HIERARCHY, should this block in gpiochip_irq_set_affinity=
()
be guarded with CONFIG_IRQ_DOMAIN_HIERARCHY like the other parent_data users
in drivers/gpio/gpiolib.c and drivers/gpio/gpio-dwapb.c?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023151209.5877=
2-1-haohlliang@gmail.com?part=3D2
