Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85CD4F3EA4;
	Fri,  9 Oct 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570106; cv=none; b=rpKFzQ6AYT0FnPcXfMvqj1I+wW9QzxFThDiJjQakLjvTFZwhN4GMyaId2sNKiZBEyoPsfL02wtT5jIRsj+K/4sOfajFWJAoV6xvVp5i+v/f9nIWl2BjWTEE7P8mQRwO3sMah/fL3fO4TTRXxflDXSdhHOxYtkSLjEQWhaR8lCaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570106; c=relaxed/simple;
	bh=zMv1CIE+e1uA45lqu1PFfCVmzgBWgApxjsMep4fNiYs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kfUtZCvr7UKmFezTeSTSTdPoG+5g8GS4lONrPOYUh4ZTSaZLtNQzdAkXXFnwPx4Ux2pDoGyhnwPmQVaLM0p9gnEQnaX3iattwQv50fEBjhGrLuVa3/A+8vPJ7s52x5V1y8qncnxhGK1S5+geNAGWJebvHQcn1fDsj3rH88qROq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5UhcVZf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5UhcVZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C76E1F000FF;
	Fri,  9 Oct 2026 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791570105;
	bh=0m6SnbfNP5wGO4K/hXNhWliXpdUuF8ZFDfAX5/kA8H0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L5UhcVZf9WcP58nK7v4O+FcrqWKvyAfUpKTu7WCOsaTndOT73LM7HYRy3+HCqhWAL
	 ijlqacB5wX9ewFzy0uFnhXizMUuQ/ipfZVt/t2t/k4aCjGKMl1yMQKjUwOX+1uER18
	 OtsQLWph41DIUoMN5KH8iMHN78lShH73Ygi+qlEhXH/XaFiAFLb3x1e4+ZRUnOJiXX
	 /D1RvqrFzfHaJHKCTcPQJ0/LDi5BlMA9E52lMAoj6PaxdT5N3ebfUXFe7jwWXUHiAc
	 dYDrulkWs4fnu6CV/4xAA6DZNZ3jCFjpaRPt/8/IDFyoc/5rF+aAaQyBhnHfpPlOvo
	 /sy/Q4sNtMEDw==
Message-ID: <sashiko-outbox-165935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/13] gpio: mxc: switch probe error paths to
 dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-11-1e59e6ddfa00@nxp.com>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-11-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 18:21:44 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] gpio: mxc: missed dev_err_probe() conversion for irq_count and clk
--

commit 9d304bc479f48f3358f5e78d0a6c7c31a38cd860
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: switch probe error paths to dev_err_probe()

This commit converts the error handling paths in the probe function of the
mxc gpio driver to use dev_err_probe(). It aims to provide consistent
diagnostics and support for deferred probe tracking.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 6074b1e3d6834..1eb5cd148c28a 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -520,7 +520,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
> =20
>  	err =3D gpio_generic_chip_init(&port->gen_gc, &config);
>  	if (err)
> -		return err;
> +		return dev_err_probe(dev, err, "Failed to init gpio chip\n");

[Severity: Low]
The commit message states that bare return statements are replaced across
all probe error paths. Are there some that were missed in this conversion?

Looking earlier in mxc_gpio_probe(), there are still bare returns for the
IRQ count and clock setup:

	irq_count =3D platform_irq_count(pdev);
	if (irq_count < 0)
		return irq_count;

and:

	/* the controller clock is optional */
	port->clk =3D devm_clk_get_optional_enabled(dev, NULL);
	if (IS_ERR(port->clk))
		return PTR_ERR(port->clk);

Since platform_irq_count() and devm_clk_get_optional_enabled() can return
-EPROBE_DEFER when their dependencies are not yet ready, should these paths
also be converted to use dev_err_probe() to ensure those deferrals are
properly logged to the deferred-probe debugfs tracking mechanism?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-gpio-mxc-c=
leanup-v5-0-1e59e6ddfa00@nxp.com?part=3D11
