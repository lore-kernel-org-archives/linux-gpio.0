Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990954;
	b=RrEvLkntZr0rZn11XO0+QK3pKAG8eTN8/V2jF+q14DDvWRdsuEeS8+wNY4l8fozxIEkY
	 M/eO6coiX0zD5HELA1/n1YDU7P9z9xDia5IMQ7jmiEy9QbjeYg/HFr1FJn/A0Et3rek/f
	 wTeh/Cg9xKugHAbLmF3y7r2QlCMiL4VpsEWHcHyjsmZ+T/2r8wjaF4EC4zd7TdiIBbZ6r
	 befjlnDzAQhswtTCNYUGbK0QtudZsGUWSaqNS6x4GaP6s7qFE5gFH0WKaBJYcArEUWqK3
	 mJ2g0VEiffFWlHr6djMZX8p+/xm5EdeGtRdaJZPSOkIdRJ5aHFIwLxnMNmn1lV3mT5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990954;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0JIqzdGHNYeH11NmkVY5pYUkgsK4toUE49+n7gYxnFg=;
	b=yx8EFonar1Vw5SVukYyHJKQqnGU7F69Jweg6ApQiwVvPNnflosbKZ/qb4yE+1YAu8bJu
	 5O2PoeQqsqwSHGWw9leqdaTfhFIwQBtA+7BGHRxHodYupSgZFmcBpa5kCGSVOQQJj2B6d
	 sknFGmaou6QJY/zhBKivcL4DrDS2ck6ZMmhP/jzVOyOPacEMPRhpUXrKzdt1ufcpNEmMu
	 b6emdaIaNXbZqHj3lMe/SPRpK/jGMKuYOEETgpa1B5AVuYl1AWQUShEKwTuFbrx+NRzz/
	 j5OJCZ+mJNqahMsPXuElrcIpYubanmgXg/SgthLohhwifT/kTObl5cMaj2pWajb2azQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxmkntyR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8E4606A31C;
	Wed, 18 Nov 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxmkntyR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5395C1F000C4;
	Wed, 18 Nov 2026 08:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990953;
	bh=0JIqzdGHNYeH11NmkVY5pYUkgsK4toUE49+n7gYxnFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxmkntyR9kspWo+jxklIDWViHzR+3NtXQUiLwekNP+40q0OHg+H3sn5UJwWMVBD/4
	 3FSq9WmqduxCDQZVlKg6v3I+ItQQQwLds0HkTxiPyPSIgFrRelC4dbtErY0mAs8fHC
	 jsylQCQfj6pKRlst8vQy6pIYdCrZw6grlcQP8wemFdv3+kYm04YucPht/vjexTJpl0
	 FNC3Uo4MdTsrFA4fn0PawDM/qIH5OOAF+lIbVFjHytuWKLAKoYYvS0dx+klRP17Rat
	 NC9s1lQrxpwQMNxTNIgGlCWmjih6MYhMTGEcKGjzYKZGwMW0lNEF7GJ8rstH2RF3z2
	 nSqnQVfLh0Jng==
Message-ID: <sashiko-outbox-220460@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 10/14] gpio: pl061: switch data path to gpio-regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-cv75-gpio-v15-10-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
 <20261118-cv75-gpio-v15-10-e3c563673fe1@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:35:52 +0000
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
- [Medium] gpio: pl061: premature IRQ domain publish breaks
  pl061_irq_domain_map()
- [Low] gpio: pl061: incomplete changelog and inaccurate
  irq_set_parent() description
--

commit 0b93363ac72443e24d6e5779edcb0ca7954b6b53
Author: Long Zhao <longzhao@ambarella.com>

> gpio: pl061: switch data path to gpio-regmap
>
> Move get, set and direction onto gpio-regmap. ARM PL061 sets
> GPIO_REGMAP_QUIRK_SET_AFTER_DIR so the output value is written after
> the direction change.
>
> Keep a custom irqchip and irq domain. Create the domain with the PL061
> private data and let gpio-regmap attach it.
>
> Leave the chained handler's regmap_read() unchecked. mis stays 0 on
> failure, so the pending loop does nothing, and chained_irq_exit()
> still runs. irq_type still ignores MMIO write returns.
>
> The irqchip uses its own child IRQ lockdep class. Split teardown into
> two devm actions: dispose mappings while the domain is still alive,
> and clear the chained handler only after it was installed. Checked
> with lockdep on the CV75 board. irq_set_parent() nests the GPIO
> irq_desc under the AMBA parent for irq_set_wake().
>
> The irqchip is immutable and stores struct pl061 as its chip data,
> so the GPIOCHIP_IRQ_RESOURCE_HELPERS macro does not apply. Look up
> the gpio_chip while mapping the IRQ, then call gpiochip_reqres_irq(),
> gpiochip_relres_irq(), gpiochip_enable_irq() and
> gpiochip_disable_irq() from the irqchip.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

[Severity: Low]
This isn't a bug, but the commit message says irq_set_parent() nests the
GPIO irq_desc under the AMBA parent for irq_set_wake().  irq_set_parent()
only records desc->parent_irq under CONFIG_HARDIRQS_SW_RESEND for software
interrupt resending; irq_set_lockdep_class() is what puts the child
irq_desc in a separate lockdep class so irq_set_irq_wake() on parent_irq
does not trigger a lockdep recursion warning.

The changelog also omits the addition of struct pl061_regs and struct
pl061_drvdata and the rewrite of pl061_suspend() and pl061_resume() to use
regcache syncing instead of struct pl061_context_save_regs.

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 27ed759486caf..db3d02976383d 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
[ ... ]
> @@ -289,29 +255,64 @@ static void pl061_irq_unmask(struct irq_data *d)
[ ... ]
> +static int pl061_gc_from_domain(struct gpio_chip *gc, const void *data)
> +{
> +	const struct pl061 *pl061 =3D data;
> +
> +	return gc->irq.domain =3D=3D pl061->irq_domain;
> +}
> +
> +static struct gpio_chip *pl061_lookup_gc(struct pl061 *pl061)
> +{
> +	struct gpio_device *gdev;
> +
> +	if (pl061->gc)
> +		return pl061->gc;
> +
> +	gdev =3D gpio_device_find(pl061, pl061_gc_from_domain);
> +	if (!gdev)
> +		return NULL;
> +
> +	pl061->gc =3D gpio_device_get_chip(gdev);
> +	gpio_device_put(gdev);
> +	return pl061->gc;
> +}
[ ... ]
> @@ -319,68 +320,175 @@ static const struct irq_chip pl061_irq_chip =3D {
[ ... ]
> +static int pl061_irq_domain_map(struct irq_domain *d, unsigned int virq,
> +				irq_hw_number_t hwirq)
> +{
> +	struct pl061 *pl061 =3D d->host_data;
> +
> +	if (!pl061_lookup_gc(pl061))
> +		return -ENODEV;

[Severity: Medium]
Can pl061_irq_domain_map() fail with -ENODEV if a consumer maps an IRQ
before devm_gpio_regmap_register() finishes?

devm_irq_domain_instantiate() publishes pl061->irq_domain on
irq_domain_list before devm_gpio_regmap_register() runs, and inside
gpio_regmap_register(), gpiochip_add_data() registers the gpio_device
before gpiochip_irqchip_add_domain() sets gc->irq.domain:

CPU0                                    CPU1
pl061_probe()
  devm_irq_domain_instantiate()
    ...
      __irq_domain_publish()
                                        irq_create_fwspec_mapping()
                                          irq_find_matching_fwspec()
                                          irq_domain_associate_locked()
                                            pl061_irq_domain_map()
                                              pl061_lookup_gc()
                                                --> NULL (-ENODEV)
  devm_gpio_regmap_register()
    gpio_regmap_register()
      gpiochip_add_data()
      gpiochip_irqchip_add_domain()
        gc->irq.domain =3D irq_domain

Because the domain is already published, a concurrent consumer does not get
-EPROBE_DEFER from irq_find_host(); instead pl061_irq_domain_map() fails
with -ENODEV and irq_create_fwspec_mapping() returns 0, failing the
consumer's probe.

Since pl061_irq_domain_map() does not use pl061->gc itself, could
pl061_lookup_gc() be deferred to pl061_irq_request_resources(), or could
pl061->gc be populated before publishing the IRQ domain?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-cv75-gpio-=
v15-0-e3c563673fe1@ambarella.com?part=3D10
