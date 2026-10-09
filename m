Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36A24F30D0;
	Fri,  9 Oct 2026 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570233; cv=none; b=fLKRw1nP4C6SYB8eVRwDsHzZVAE+F10Gpc/ROfAK56Q190sxmCpgBySagibtjLoJdBp9kLNVPk5vSLeGapRQ91RLtF4Nm5Ea0Kb0wIUnzfLFDuHYmKr0eWGDgwerT/ygJgPme0Al7CPg27AyGmJ6oyuz9w8blX+GwsVoNQtOoN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570233; c=relaxed/simple;
	bh=dPYTY23/HRrjQS1ieBtNhB24xPq7MNV6GjuR2hT8V2E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=oGQ4T/h/DbQW3vRzFrWnPIxkQGnJtbyBX40kcaPbI7glg8kXqPSAcTzxMKQwdvL10QFfg9ijR4rPVrIMqf2A8o7auhRi1jziyUuKSvWoV9NTmTnyesxuARwfyRj6Mowr2mkpnNPV4lej3gb0uUAwE8pQHFBfiFZK5luNKr6sFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIssyuvD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIssyuvD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00491F000FF;
	Fri,  9 Oct 2026 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791570230;
	bh=C6effdS0IOAWbUC3v0gEMeJvHMyAjAMAkssJi8AQtIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jIssyuvDqEKo/dn6an2w5S9coLhTMLGM71VqgiIKpgdtzGPU81ZSVa4V28et/RqPa
	 afcxx0AEd8fPqTJcbAfwMGBR2ZLQtP/e+lkUQMVRwAYrUJ4BI/S4qbtfyLsQ3Qmvfe
	 f+4fy43ws3ZWjQxp9rRYzNzff67Zn6h4UegzFnDmkjHP4RkQYK2oa0VCNuxqasxdEM
	 u3em7MBRYnMkyF/z9W4nftXSRdSYBwcWFEw0DLEOKwJ0QWPCXTCsACsDOhjtfkB+xU
	 FwxNF7bQC5qj1vHRKYVmdIG76P3HaQ+Ta8hWzRHQCJ2tcn7mr4WZvXwrwf6+eg/g4O
	 5iWp6WcondPHw==
Message-ID: <sashiko-outbox-165938@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/13] gpio: mxc: convert probe error handling to
 devres
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-10-1e59e6ddfa00@nxp.com>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-10-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 18:23:49 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] pm: double-put of PM runtime usage count on probe success
- [High] gpio: mxc: NULL ptr dereference on probe error due to inverted PM =
cleanup order
- [High] gpio: mxc: early gpiochip exposure returns -ENXIO from to_irq
--

commit 8d3ca67baef31cc2d1c0b0ff840208db9ae18818
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: convert probe error handling to devres

This commit converts the manual probe error handling in mxc_gpio_probe() to
devres management by utilizing devm_pm_runtime_set_active_enabled() and
devm_irq_domain_instantiate(). Error path labels are eliminated, replacing
them with direct returns.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 3d5a6566d3f43..6074b1e3d6834 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
[ ... ]
> @@ -491,8 +492,9 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
> =20
>  	struct device *pm_guard __free(pm_runtime_put_noidle) =3D dev;
> =20
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> +	err =3D devm_pm_runtime_set_active_enabled(dev);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to enable PM runtime\n");
[ ... ]
> @@ -534,27 +536,31 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
> =20
>  	err =3D devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
>  	if (err)
> -		goto out_bgio;
> +		return err;

[Severity: High]
Could exposing the GPIO chip before the IRQ domain is ready cause issues for
concurrent consumers?

Because devm_gpiochip_add_data() is called before the IRQ domain is
instantiated, a concurrent consumer might call gpiod_to_irq() while
port->domain is still NULL.

In this scenario, irq_find_mapping() inside mxc_gpio_to_irq() will safely
handle the NULL domain and return 0. However, gpiod_to_irq() translates a
0 return value from a custom to_irq callback as -ENXIO. This bypasses the
gpiolib protection that normally returns -EPROBE_DEFER for uninitialized
irqchips, causing the consumer probe to fail permanently.

> =20
>  	irq_base =3D devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
> -	if (irq_base < 0) {
> -		err =3D irq_base;
> -		goto out_bgio;
> -	}
> +	if (irq_base < 0)
> +		return irq_base;

[Severity: High]
Does this sequence create a window for a NULL pointer dereference on probe
error?

When returning an error after devm_gpiochip_add_data(), the
__free(pm_runtime_put_noidle) cleanup will execute immediately, dropping the
usage count to 0. Since devm_pm_runtime_set_active_enabled() uses devres, PM
runtime won't be disabled until later during devres release.

If a concurrent consumer requests and frees a GPIO during this window, it c=
an
drop the final usage count and trigger mxc_gpio_runtime_suspend(). Because
platform_set_drvdata() hasn't been called yet, dev_get_drvdata() will return
NULL, which is then dereferenced in mxc_gpio_save_regs().

[ ... ]
> @@ -566,13 +572,6 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>  	pm_runtime_put_autosuspend(dev);
> =20
>  	return 0;

[Severity: High]
Does the self-assignment of no_free_ptr() earlier in this block fail to
inhibit the cleanup?

The mxc_gpio_probe() function ends with:

	pm_guard =3D no_free_ptr(pm_guard);
	pm_runtime_put_autosuspend(dev);

	return 0;

The no_free_ptr() macro is implemented as a statement expression that
nullifies the internal pointer but evaluates to the original pointer value.
Assigning this output back to the same variable overwrites the nullified
value with the original pointer.

Because pm_guard is still non-NULL when the function returns, the
pm_runtime_put_noidle() cleanup function will also execute, resulting in a
double-put of the PM runtime usage count on success.

Can this be resolved by using no_free_ptr(pm_guard) without the assignment?

> -
> -out_irqdomain_remove:
> -	irq_domain_remove(port->domain);
> -out_bgio:
> -	pm_runtime_disable(dev);
> -	dev_info(dev, "%s failed with errno %d\n", __func__, err);
> -	return err;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-gpio-mxc-c=
leanup-v5-0-1e59e6ddfa00@nxp.com?part=3D10
