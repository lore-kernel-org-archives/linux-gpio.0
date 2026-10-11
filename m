Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1599C443C38;
	Sun, 11 Oct 2026 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720276; cv=none; b=eiOf8TM3w7DcMeaYHEd6EIhbQFgGUwH+evWiKuwfvZX+A9d692iQanuYgGDjyKl1yd8eJXNeAORla7vk6F8XuifLXJSRRSykI617xcNJ9HL9w+bzEkpB0u6KeVqKQUzxcXH2DRZoDBH1S/ZA/LbyUd15bDIESS5kA+XuxzIkv4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720276; c=relaxed/simple;
	bh=QEpOBS9gPPzWSBOcU0CsnLqqywhxpFr6joWCG2fCxg0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uc4m007+ytg3GuDOD8qdJDyFXuv+TRyVf81LI1ntmNxEWuyv3jRHG2wxUHx46vDd6Ed5/FfEPanmbUG880WvH/lZtagu5LAQ40JQ4XPVM2D8GPFnGk2/CFCkRbIjEMsSP9Hi9xv0Qw1WLP0gNuFrpbsxve2KkyLFL/sRTpuY+iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+yxvwHo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+yxvwHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3A61F0089B;
	Sun, 11 Oct 2026 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791720265;
	bh=QyofKE5rAqqADaeqlORnEZEKu04jaz46h+6ANGyK4ro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O+yxvwHoBCz6xo9UTSDTwyMiorl32Ay76mRwM6blYPTI4Nd6Fyy/OEyGk/rCy7MqR
	 iPHxMoGsyzj79onh/5qLFAFzzEhR5c2L5gYYO3rkWrBoWgs/T1FGOlJR/IB+SMVkh+
	 BVlQ8/s6eJbmTjDa4KRNSzRTzZ1ZqkoiGz76ycrX+XxO+UIzxnurOT8lSeTRRRvJtb
	 Gx21LYZmQ5yGde49Es1CHD7C9iC+EOLxw2TVVDVyQKTKKXsHzIAaBJsiQP92GEaHZn
	 wdDKKBhUJ0uSg9ocgrC0JcwRvFmvfqDg6KwNjBHzqKkTpYzMhthUfUBE6GjA+q9ir6
	 KWkS5U7hinxuA==
Message-ID: <sashiko-outbox-167210@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/13] gpio: mxc: add dev_err_probe() for error paths
 to help diagnostics
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-11-cb47ce2ad758@nxp.com>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-11-cb47ce2ad758@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 12:04:24 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] gpio: mxc: race condition exposes uninitialized irq_domain to co=
nsumers
- [Low] gpio: mxc: missing dev_err_probe() on clk and irq_count error paths
--

commit 7b3e39d56ce16597ec573873f31010421e588a2f
Author: Peng Fan <peng.fan@nxp.com>

    gpio: mxc: add dev_err_probe() for error paths to help diagnostics

This commit replaces bare returns with dev_err_probe() across the probe err=
or
paths for consistent diagnostics and deferred-probe support.

>     Replace bare return statements with dev_err_probe() across all probe
>     error paths for consistent diagnostics and deferred-probe support.

[Severity: Low]
Is this description accurate?

Looking at mxc_gpio_probe(), bare returns for platform_irq_count() and
devm_clk_get_optional_enabled() are still present:

	irq_count =3D platform_irq_count(pdev);
	if (irq_count < 0)
		return irq_count;

	...

	port->clk =3D devm_clk_get_optional_enabled(dev, NULL);
	if (IS_ERR(port->clk))
		return PTR_ERR(port->clk);

Unlike platform_get_irq() or devm_platform_ioremap_resource(), neither of
these functions logs errors or handles probe deferrals internally via
dev_err_probe().

If they fail or defer, the failure might propagate silently without being
recorded in the deferred-probe debugfs list.

Does the commit message need to be updated, or should dev_err_probe() be
added to these error paths?

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 09acb186c84c1..2847304640f17 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
[ ... ]
> @@ -536,11 +536,11 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
> =20
>  	err =3D devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
>  	if (err)
> -		return err;
> +		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");

[Severity: Medium]
Could this expose an uninitialized irq_domain to consumers?

devm_gpiochip_add_data() exposes the GPIO chip to the system. If a consumer
immediately attempts to translate a GPIO to an IRQ via gpiod_to_irq(),
mxc_gpio_to_irq() is invoked.

This creates a narrow window where mxc_gpio_to_irq() can be called before
devm_irq_domain_instantiate() initializes port->domain.

If this happens, mxc_gpio_to_irq() will pass a NULL domain to
irq_find_mapping():

drivers/gpio/gpio-mxc.c:mxc_gpio_to_irq() {
	...
	return irq_find_mapping(port->domain, offset);
}

This can result in the consumer getting an incorrect IRQ mapping or a
permanent -ENXIO failure from gpiod_to_irq(), leading to a permanent
probe failure instead of -EPROBE_DEFER.

Could we instantiate the irq_domain before adding the GPIO chip?

> =20
>  	irq_base =3D devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
>  	if (irq_base < 0)
> -		return irq_base;
> +		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-gpio-mxc-c=
leanup-v6-0-cb47ce2ad758@nxp.com?part=3D11
