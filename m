Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769737;
	b=v8ZKJaVYSZ/D2b4Vd9Zcj9lzClXF3H8F4Q9j8h39fe4D8V2CP42hdDJc2JC+tgm9xq9h
	 b9xtGE2r3P9MwXvOcCLsMjJJglAyLCNF9+65Rb2say2+cICgwCwcBVO/t+jWBgphhTng4
	 LlB1nJooM8YS9fxJpi6V+pYcGGqA70ynXH7iCeEaBd2H+WVC1Jb/upgduVjMDCUvw3VtL
	 bZ6Fj9hhI6vznDA0XqFsetOdE1QWQSvY5j7oEFhgutUwufj+L2iVwhB0+2tuSfyzJtc3K
	 ZCq3w2NOkxVxvTA9vdJbrBychHpqh4C5Bk6WxNGzBsPVEr6z+316dYBI2c7e+Gj6phA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769737;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4HmQoKwiL/fVlHXWs7sH5vppyf0Dl0wvNXNaUsda3PA=;
	b=1wOxnCZnBxwacP3FoUTzGZyWvMXJBTn81cPnlXGWGDVb9oPtsBF99hjxOTSA58V1GkQG
	 fHxeBVNkYkOyE3hBbaWfYZG06hDHDAX4tiOb04kG38S7FKQBOI20loNHQqfcuKdqd8ioY
	 NTSovWjJ+KrIi6EamBl18Kns6ujGKqb7PkS+yh8kCMdEEwtJvM0WCWEl/aVIyMZPLs+H9
	 1RwpuF1YqCpQ7wOVcIEut9v5ulOPSvsCGBC6ETSf+gcptSb5bFTx2qyAJOxDWFbCGF4lB
	 /AmmeAXM0pW+Gau6zpL0dMcIEyQMtIAWalRRwtLqwH/3N+M7aX02Taer/nnKZI1JvIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFTZ8OAr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC8F606A31B
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFTZ8OAr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF0E1F01825;
	Fri, 23 Oct 2026 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792769737;
	bh=4HmQoKwiL/fVlHXWs7sH5vppyf0Dl0wvNXNaUsda3PA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=RFTZ8OArpjQ+/iYfkwgQRG0Zw/kRwTrun7IiE1tQhV9dorh94xiGU7j5mnB8Te/Wm
	 7RUxxce2+TlkNB06YOnH1ZlXqSawqcWQ7oY6+0bWrfcucFo2P8hAcOf1yiq5fTVvt5
	 z2NqKdUHrBzeiLhcfk5pQcY8HsTUS9cGTZRi7ZTUj1VdivEKEmFrYjbg11V5DBEWS9
	 YIs4M6jJntbZi3YyrQeoHznmoZekrybNxkgwzYgYjpwKObTapfHrwx34A4ZvLPtqwl
	 y93Cr9CLvGibe8UVBWudmhPUrB4NabKu8LSG1q16sJQMdRZv962BCxWkkhHr9Tq+c0
	 11StuAdkndT9w==
Message-ID: <sashiko-outbox-182910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] gpiolib: Add irq_set_affinity helper for GPIO line
 IRQs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liang Hao" <haohlliang@gmail.com>, linux-gpio@vger.kernel.org
In-Reply-To: <20261023151209.58772-2-haohlliang@gmail.com>
References: <20261023151209.58772-1-haohlliang@gmail.com>
 <20261023151209.58772-2-haohlliang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 15:35:36 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpiolib: unlocked parent affinity update in gpiochip_irq_set_affin=
ity()
- [Low] gpiolib: missing hierarchy Kconfig guard in gpiochip_irq_set_affini=
ty()
--

commit 6be16d8d1664dad3beb504901b90bb4ff317a568
Author: Liang Hao <haohlliang@gmail.com>

gpiolib: Add irq_set_affinity helper for GPIO line IRQs

This commit adds gpiochip_irq_set_affinity() and a helper macro so GPIO line
interrupts can forward affinity updates to upstream interrupt controllers in
both hierarchical and chained irqchip setups.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 2987051d99043..0a46265799631 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
[ ... ]
> +int gpiochip_irq_set_affinity(struct irq_data *d,
> +			      const struct cpumask *dest, bool force)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct irq_data *pdata;
> +	unsigned int parent;
> +	int ret;
> +
> +	if (d->parent_data)
> +		return irq_chip_set_affinity_parent(d, dest, force);

[Severity: Low]
Will this fail to build when hierarchical irqdomains are not enabled in the
kernel configuration?

In drivers/gpio/Kconfig, the gpiolib irqchip option only selects the base
irqdomain support:

drivers/gpio/Kconfig:
	config GPIOLIB_IRQCHIP
		select IRQ_DOMAIN
		bool

However, both the parent_data member in struct irq_data and the declaration=
 of
irq_chip_set_affinity_parent() in include/linux/irq.h are guarded by the
hierarchy configuration option:

include/linux/irq.h:
	struct irq_data {
		...
	#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
		struct irq_data		*parent_data;
	#endif
		void			*chip_data;
	};
	...
	#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
	...
	extern int irq_chip_set_affinity_parent(struct irq_data *data,
						const struct cpumask *dest,
						bool force);

Should the d->parent_data check and irq_chip_set_affinity_parent() call in
gpiochip_irq_set_affinity() be guarded by an #ifdef just like the other
hierarchical helpers in drivers/gpio/gpiolib.c?

> +
> +	parent =3D gpiochip_chained_parent_virq(gc, d);
> +	if (!parent)
> +		return -EINVAL;
> +
> +	pdata =3D irq_get_irq_data(parent);
> +	if (!pdata || !pdata->chip || !pdata->chip->irq_set_affinity)
> +		return -EINVAL;
> +
> +	ret =3D pdata->chip->irq_set_affinity(pdata, dest, force);
> +	switch (ret) {
> +	case IRQ_SET_MASK_OK:
> +	case IRQ_SET_MASK_OK_NOCOPY:
> +	case IRQ_SET_MASK_OK_DONE:
> +		irq_data_update_effective_affinity(d,
> +			irq_data_get_effective_affinity_mask(pdata));
> +		return IRQ_SET_MASK_OK;
> +	default:
> +		return ret;
> +	}
> +}

[Severity: High]
Is it safe to invoke pdata->chip->irq_set_affinity() directly on a chained
parent interrupt without holding the parent irq_desc lock or updating the
parent descriptor's affinity state?

Unlike hierarchical domains where d and d->parent_data belong to the same
struct irq_desc, a chained parent virq has a separate struct irq_desc with =
its
own lock and its own struct irq_common_data. When the genirq core invokes
gpiochip_irq_set_affinity() through irq_do_set_affinity(), only the child
GPIO line's desc->lock is held.

Calling pdata->chip->irq_set_affinity(pdata, dest, force) unlocked from
gpiochip_irq_set_affinity() appears to introduce several issues:

1. Concurrent affinity updates on sibling GPIO lines sharing the same parent
virq (or concurrent operations on the parent virq itself, such as CPU hotpl=
ug
migration in migrate_one_irq()) will race inside the parent irq_chip callba=
ck
and on pdata's effective_affinity mask. Upstream irqchip drivers assume the=
ir
own irq_desc->lock serializes irq_set_affinity(), for example in
drivers/irqchip/irq-gic-v3.c:gic_set_affinity():

	enabled =3D gic_peek_irq(d, GICD_ISENABLER);
	if (enabled)
		gic_mask_irq(d);
	...
	gic_write_irouter(val, reg);

	if (enabled)
		gic_unmask_irq(d);

	irq_data_update_effective_affinity(d, cpumask_of(cpu));

and in drivers/irqchip/irq-sifive-plic.c:plic_set_affinity():

	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);

	irq_data_update_effective_affinity(d, cpumask_of(cpu));

	if (!irqd_irq_disabled(d))
		plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);

Without holding the parent descriptor's lock, concurrent calls can corrupt =
the
parent routing state or observe the parent temporarily masked and leave it
permanently disabled.

2. Because irq_do_set_affinity() only updates desc->irq_common_data.affinity
on the child descriptor:

kernel/irq/manage.c:irq_do_set_affinity()
	switch (ret) {
	case IRQ_SET_MASK_OK:
	case IRQ_SET_MASK_OK_DONE:
		cpumask_copy(desc->irq_common_data.affinity, mask);
		fallthrough;
	case IRQ_SET_MASK_OK_NOCOPY:
		irq_validate_effective_affinity(data);
		irq_set_thread_affinity(desc);
		ret =3D 0;
	}

bypassing irq_do_set_affinity() on the parent descriptor leaves the parent's
irq_common_data.affinity unmodified (and skips deferred affinity movement
checks). As a result, CPU hot-unplug in
kernel/irq/cpuhotplug.c:migrate_one_irq() will migrate the parent interrupt
using its stale affinity mask, and on configurations without effective
affinity masks, irq_data_get_effective_affinity_mask(pdata) will also return
that stale parent affinity mask:

include/linux/irq.h:irq_data_get_effective_affinity_mask()
	static inline
	const struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data=
 *d)
	{
		return irq_data_get_affinity_mask(d);
	}

3. When multiple GPIO lines share a chained parent virq, requesting and
starting up any sibling GPIO line later via
request_threaded_irq() -> __setup_irq() -> irq_startup() -> irq_setup_affin=
ity()
will see a fresh child descriptor without a user-configured affinity mask a=
nd
call irq_do_set_affinity() with irq_default_affinity:

kernel/irq/manage.c:irq_setup_affinity()
	if (irqd_affinity_is_managed(&desc->irq_data) ||
	    irqd_has_set(&desc->irq_data, IRQD_AFFINITY_SET)) {
		if (cpumask_intersects(desc->irq_common_data.affinity,
				       cpu_online_mask))
			set =3D desc->irq_common_data.affinity;
		else
			irqd_clear(&desc->irq_data, IRQD_AFFINITY_SET);
	}
	...
	return irq_do_set_affinity(&desc->irq_data, &mask, false);

Won't starting a second GPIO line on the same parent virq silently reset the
shared parent interrupt's hardware affinity back to the default mask, leavi=
ng
any previously configured sibling GPIO line out of sync with the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023151209.5877=
2-1-haohlliang@gmail.com?part=3D1
