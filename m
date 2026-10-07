Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3BA3C10B5;
	Wed,  7 Oct 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370960; cv=none; b=a8OmrUfu777/DfW8uLejL1EuVtqplhleXPA5zvuLeKKr/hN0HH6pG84gcLfQYX/qW6vm8sea7z3Pm4769UxX5oXZjUxjRSCQ+LTV+sfkSGZ64FZSF6PtgkdzvB1FagAbPuQR0+UmirPQjYN+bAPNezuqqcs4tObSZKoSnaSHgy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370960; c=relaxed/simple;
	bh=X1MKFnuzjLkUsVZR4JwjKZiYJLFiX9IKJcn3YV/MuBU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ghzNJQlLB4lEakeJMcz/IlQu33pSHbUTLftZUnQ1uNxkzQsmz+lgNkf8nVar7yKK8m0GPBPYcCWMusyaUz45nuPF9FkUNElMmTUZR/h2fuYDMQ0yRGoAmBIhhJqox71NTRydeLdWecLkKhifISCnjwnE1x5sVG+Yum6zWQeKgUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzbZtx92; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzbZtx92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94AE1F0089E;
	Wed,  7 Oct 2026 11:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370934;
	bh=rDF2ukPRHZ1reJickafxSljG7CUtCcX3lQcDICJQkVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YzbZtx92eau7aa6eBeQ/Z79HZrW1at3j6/YIOvYdAR7vrIH8jVso8piA9IJvhGOOy
	 EBsdOIKoVSQANyTcJX8e2W29gaP7WDxDym9E201Wjrc43M3aoQOuQKSkE0DGnpdxto
	 dLB7yuVDMpnpQ4yT3Evp9R3taHVkn08BsybiagnRvE26i+atP5lw59EphfwMqFrVjM
	 b3DFXzqZzsyhxViR8FTU/Fbaf98Etx8bnx7dEi0yHx5qwJamLosEsmEkgvjzaIIIcT
	 HwdXZnNiTd5UkwUO7lMepi2+MEzOaRXPr4Pg31g4jKZIQw3rQI/ps8oHBYtbjkH/z+
	 vON/w9AJQpAww==
Message-ID: <sashiko-outbox-162901@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/10] gpio: mxc: switch probe error paths to
 dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-gpio@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-7-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-7-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 11:02:13 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pm: double put of runtime PM usage count on driver unbind
--

commit 30dda5fb34eeb7a2c552816b7e65724d4491a05c
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: switch probe error paths to dev_err_probe()

Replace bare return statements with dev_err_probe() across all probe
error paths for consistent diagnostics and deferred-probe support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 54b09f1a4b509..f5f9ef1564cdf 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c

[ ... ]

> @@ -550,14 +550,15 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
> =20
>  	port->domain =3D devm_irq_domain_instantiate(&pdev->dev, &d_info);
>  	if (IS_ERR(port->domain))
> -		return PTR_ERR(port->domain);
> +		return dev_err_probe(&pdev->dev, PTR_ERR(port->domain),
> +				     "Failed to create irq domain\n");
> =20
>  	irq_domain_set_pm_device(port->domain, &pdev->dev);
> =20
>  	/* gpio-mxc can be a generic irq chip */
>  	err =3D mxc_gpio_init_gc(port, irq_base);
>  	if (err < 0)
> -		return err;
> +		return dev_err_probe(&pdev->dev, err, "Failed to init generic irq chip=
\n");
> =20
>  	list_add_tail(&port->node, &mxc_gpio_ports);
> =20

[Severity: Medium]
Since this series replaces pm_runtime_get_noresume() with
devm_pm_runtime_get_noresume(), does this leave an unbalanced devres action
on driver unbind?

Earlier in mxc_gpio_probe(), the devres-managed get is called:

	err =3D devm_pm_runtime_get_noresume(&pdev->dev);

But at the end of the probe function on success, the count is still manually
dropped:

	pm_runtime_put_autosuspend(&pdev->dev);

If the device is ever unbound (e.g., via DT overlay removal or parent device
unregistration), won't devres execute pm_runtime_put_noidle_action and drop
the reference a second time?

While pm_runtime_put_noidle() uses atomic_add_unless() to prevent underflow
if the count is exactly 0, could it erroneously steal a reference if the
count is > 0 (such as from an open sysfs file or an active child device)?

When the legitimate holder later drops their reference, wouldn't the count
then underflow and trigger a warning, breaking the device's runtime PM stat=
e?

Even if suppress_bind_attrs is used, does that only prevent manual sysfs
unbinds, rather than programmatic device removal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-gpio-mxc-c=
leanup-v4-0-c9f5a8b50df9@nxp.com?part=3D7
