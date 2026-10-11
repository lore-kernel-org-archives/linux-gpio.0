Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2930443C06;
	Sun, 11 Oct 2026 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720344; cv=none; b=meZYLAAdgKqmWSoOEoOwV8TPPVQU6YOwa081AU8yfMGY5V0gzL99e6cNSreSntgjI2Mmj3Gb82+Eh/CxMWQY2asZb4GLZ/0ZwXQhFHE1/XR+tyDUdT0J5PxN9ioULiwm2XwYdaMMb6a25pSOu1xibXvR50hSrxQCHiMZ6gVwYUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720344; c=relaxed/simple;
	bh=uZ2rQDJ2qwrL3qXUPVWQZTYMbiXpUR7ib0n/A0a5AUk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kX+HXub7mHf0J1cGsO4n++GYr509MnbcyWdAoqJcrKMwSljX5Nfa+U2BOfWRW3QOuNg2T9k3+9Zw3F/1R2seJoiJHy/a07pdvjhwm/BaEwo374ZIJNLmVFq/Heo8+S895BWfN84S0/uWjGFZG/+Bxx2RWhy3LegivVuAjF9Hn2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMRaeXrv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMRaeXrv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE591F0089B;
	Sun, 11 Oct 2026 12:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791720332;
	bh=c3rWGzxOFN16JLF4Iag/Q3aRO9elsHdjp2yaq/NWDko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CMRaeXrv52mZfMUmUJECwczqs6+xH+JRUmjcUpmW0jUxKKhsnPtg60OZdXafFay8l
	 lDexR8KnY8EHit1kzamgcZSERUnlNGZx9lg3kCR5uvBhmDXiY3DxKU4d8KuMuA2/tz
	 Pe6Me7U3kV6GQgZikgs46E3SoYnWe+oCOMInnii28Bn8pawiOi3P/9cmynygRWgoKI
	 eXA3OSl9HygLVMm7BFqPgqTv9AD+VoJYZcaW4tyx3iUkOhpTnBbCJaZdqJIdZsFhDL
	 3ZAtxmdGNnmkgeWi83+FE4cxAlGoIks3gkXco9oJsrI+Sgkxkzm6XCddrKfba0HAqt
	 MwRTss/tEP4Aw==
Message-ID: <sashiko-outbox-167212@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/13] gpio: mxc: use devres functions simplify probe
 code
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-10-cb47ce2ad758@nxp.com>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-10-cb47ce2ad758@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 12:05:31 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: use-after-free and premature exposure of irq_domain
--

commit e70e13ad3287f8fd0b2357d428d23270ccfc9522
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: use devres functions simplify probe code

This commit replaces legacy IRQ domain creation and manual PM runtime error
handling with devres equivalents in the MXC GPIO driver probe. It removes
error path labels by relying on device-managed allocations to unwind resour=
ces.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 8dcfd05e658a6..09acb186c84c1 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c

[ ... ]

> @@ -534,27 +536,31 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
> =20
>  	err =3D devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
>  	if (err)
> -		goto out_bgio;
> +		return err;

[Severity: High]
Does this premature exposure of the GPIO chip cause a use-after-free risk?

By calling devm_gpiochip_add_data() before devm_irq_domain_instantiate(), t=
he
GPIO chip is registered and immediately exposed to kernel consumers and
userspace.

If a consumer requests an IRQ during this window, mxc_gpio_to_irq() will
execute:

drivers/gpio/gpio-mxc.c:mxc_gpio_to_irq() {
	struct mxc_gpio_port *port =3D gpiochip_get_data(gc);

	return irq_find_mapping(port->domain, offset);
}

This passes a NULL port->domain to irq_find_mapping(), failing to map the I=
RQ.

Additionally, if a subsequent probe step like mxc_gpio_init_gc() fails, dev=
res
unwinds allocations in reverse order (LIFO). Devres will first destroy the =
IRQ
domain, leaving port->domain as a dangling pointer to freed memory.

The GPIO chip remains fully registered and exposed until its own devres rel=
ease
action runs later. A concurrent gpiod_to_irq() call during this unwinding
window will dereference the freed port->domain, causing a use-after-free.

Should devm_irq_domain_instantiate() be called before
devm_gpiochip_add_data() to ensure the domain is fully prepared before expo=
sure
and destroyed after the chip is unregistered?

> =20
>  	irq_base =3D devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
> -	if (irq_base < 0) {
> -		err =3D irq_base;
> -		goto out_bgio;
> -	}
> +	if (irq_base < 0)
> +		return irq_base;
> +
> +	d_info =3D (struct irq_domain_info) {
> +		.fwnode		=3D dev_fwnode(dev),
> +		.size		=3D 32,
> +		.hwirq_max	=3D 32,
> +		.virq_base	=3D irq_base,
> +		.ops		=3D &irq_domain_simple_ops,
> +		.dev		=3D dev,
> +	};
> =20
> -	port->domain =3D irq_domain_create_legacy(dev_fwnode(dev), 32, irq_base=
, 0,
> -						&irq_domain_simple_ops, NULL);
> -	if (!port->domain) {
> -		err =3D -ENODEV;
> -		goto out_bgio;
> -	}
> +	port->domain =3D devm_irq_domain_instantiate(dev, &d_info);
> +	if (IS_ERR(port->domain))
> +		return PTR_ERR(port->domain);
> =20
>  	irq_domain_set_pm_device(port->domain, dev);
> =20
>  	/* gpio-mxc can be a generic irq chip */
>  	err =3D mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		goto out_irqdomain_remove;
> +		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-gpio-mxc-c=
leanup-v6-0-cb47ce2ad758@nxp.com?part=3D10
