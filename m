Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348C4ACC6C;
	Mon,  5 Oct 2026 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210867; cv=none; b=X7ZUcVqJ/Ofwkw1p5SWnOrCb7P4E5aoSil5kciqb6bYi3eq7LpKQjyhZoQL5hTBULmTQ/KU/oTTOn0VvNMNUhBhEsi52S2F71HezNGq/3zUNpYTXmrOUJhKOVdAjx5413mNgaDJ8PbzRnWAXukb3e0Zi623/CCldsFAC5fwv+3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210867; c=relaxed/simple;
	bh=RcPkdfX+eiL9p7kS2YeYEjSVBG/TZl2pqH0/lwi65YE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RJbB2WegvA0SQdwspFxs/0fDSNG3OYpa/zq3XVp290Srq35KHc6192qKZR3e3XoP8Sx1kRiSlR4dw8fUuGtTFXYDPOxuNAP1/wBU4ykQg5zfqxIMiZStL+iceEBdfcHMOKdyR4OpjXFxbmWqQuTKGpfBldbsUL0y2Yd9tWQxLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jtbl+Qy4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jtbl+Qy4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D8D1F000FF;
	Mon,  5 Oct 2026 14:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210858;
	bh=ODX2J65xB7Pte9GZ3t6Ox7D1MxYhbVFImafa4RX1fSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jtbl+Qy4eBRn4CcNiLDQJKOR2BmbNCJVImuPLo9neP/OVdHjeesjCklVW+ctXhWPE
	 DwOvNl1JpsaLWu/NtuSykVWlfT33Pta7Zp5XjtUJtI+NjZRCo7y/OJxv/45fHUhNXx
	 fv9vXFF+An/VckXZkJLNe4IUZfAA37M0m9g5ez5rQHQz+TktWvvKnGRfvI8ica5wV0
	 pakG+ISWJVOFK2RpbiA0TB/f7OL4eEHSVA+/RCgFWbvlBC9YQmpez/9D+uYpEHEunz
	 TXuixIuTnXEF3NigMT12KrrFbPZvAeoN0UUvxDlJdfU6XsnLrBtQs1iZhEES9yl225
	 JQopzyKNSfyEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/9] gpio: mxc: convert probe error handling to
 devres
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-gpio@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-5-bdc3afbb35e2@nxp.com>
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
 <20261005-gpio-mxc-cleanup-v2-5-bdc3afbb35e2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:34:17 +0000
Message-Id: <20261005143417.D6D8D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] PM: runtime usage counter leak on probe error paths
--

commit c3ae04469456d2be830e9328d1c260b66f15661d
Author: Peng Fan <peng.fan@nxp.com>

    gpio: mxc: convert probe error handling to devres

This patch replaces manual resource unwinding in mxc_gpio_probe() with devm
variants and eliminates the error path labels. It returns directly upon
failure instead of jumping to cleanup code.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 1bd9f5beae4a7..871938e4cc959 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c

[ ... ]

> @@ -486,8 +487,11 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>  		return PTR_ERR(port->clk);
> =20
>  	pm_runtime_get_noresume(&pdev->dev);
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	err =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (err) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");
> +	}

[Severity: Medium]
The usage counter is manually incremented here with pm_runtime_get_noresume=
(),
but this specific reference does not appear to be managed by a devm helper.

[ ... ]

> @@ -513,7 +517,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
> =20
>  	err =3D gpio_generic_chip_init(&port->gen_gc, &config);
>  	if (err)
> -		goto out_bgio;
> +		return err;

[Severity: Medium]
Does this direct return leak the PM usage counter? The original code jumped=
 to
the out_bgio label which called pm_runtime_put_noidle() to balance the manu=
al
pm_runtime_get_noresume() call earlier. Since pm_runtime_get_noresume() is
not devm-managed, returning directly here seems to leave the usage counter
elevated.

[ ... ]

> @@ -529,27 +533,31 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
> =20
>  	err =3D devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
>  	if (err)
> -		goto out_bgio;
> +		return err;
> =20
>  	irq_base =3D devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id()=
);
> -	if (irq_base < 0) {
> -		err =3D irq_base;
> -		goto out_bgio;
> -	}
> +	if (irq_base < 0)
> +		return irq_base;
> +
> +	d_info =3D (struct irq_domain_info) {
> +		.fwnode		=3D dev_fwnode(&pdev->dev),
> +		.size		=3D 32,
> +		.hwirq_max	=3D 32,
> +		.virq_base	=3D irq_base,
> +		.ops		=3D &irq_domain_simple_ops,
> +		.dev		=3D &pdev->dev,
> +	};
> =20
> -	port->domain =3D irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, i=
rq_base, 0,
> -						&irq_domain_simple_ops, NULL);
> -	if (!port->domain) {
> -		err =3D -ENODEV;
> -		goto out_bgio;
> -	}
> +	port->domain =3D devm_irq_domain_instantiate(&pdev->dev, &d_info);
> +	if (IS_ERR(port->domain))
> +		return PTR_ERR(port->domain);
> =20
>  	irq_domain_set_pm_device(port->domain, &pdev->dev);
> =20
>  	/* gpio-mxc can be a generic irq chip */
>  	err =3D mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		goto out_irqdomain_remove;
> +		return err;

[Severity: Medium]
Do these direct returns for devm_gpiochip_add_data(), devm_irq_alloc_descs(=
),
devm_irq_domain_instantiate(), and mxc_gpio_init_gc() failures also skip
dropping the PM usage counter for the same reason?

[ ... ]

> @@ -559,14 +567,6 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>  	pm_runtime_put_autosuspend(&pdev->dev);
> =20
>  	return 0;
> -
> -out_irqdomain_remove:
> -	irq_domain_remove(port->domain);
> -out_bgio:
> -	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_put_noidle(&pdev->dev);
> -	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
> -	return err;
>  }

[Severity: Medium]
With the out_bgio label removed, the explicit pm_runtime_put_noidle() clean=
up
is gone. This could prevent the device from entering runtime suspend if pro=
bed
again or on probe deferral. Should the get_noresume() call be converted to a
devm-managed action, or should the explicit cleanup be retained on these
error paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-gpio-mxc-c=
leanup-v2-0-bdc3afbb35e2@nxp.com?part=3D5
