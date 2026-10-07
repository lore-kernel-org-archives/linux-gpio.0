Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C53D411D;
	Wed,  7 Oct 2026 11:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371043; cv=none; b=MPNze5mQWT75lkQZdp2mSUEg2WaVNVLoFfw2klqBAL0G3Npb2sV74T0ZDUftHZfjspF4ZWU5FxL+NUUYNf6hPEcJmjheB9nPOecH0lvs5ibzDLd+kPqhuab5/TW0DGj61Zhe48HPiUEwBBPszSPjhUPlsp/IkNuXeHXKcFWpC/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371043; c=relaxed/simple;
	bh=Z826TYOc4VMSyPK7DLrjQH9pkpLxQdbcbopr3Rvxaso=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=B/1O+bQr/yaB/vl7snKOYZQN/thrH1Pvdc12fzqvLhidxGYUSI/lfLP/iYaLlM5EDnCOGpCHXn60uiHnQut1kY+DBvFiP5qty/7dUNQ9deWvPLh7ssurzLwQztX+i3/uvBJlV0RMIKQ15rqM8PjnnUyc02H6yQRV6Ec0XCITH88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lm3OVWDN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lm3OVWDN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2661F0089B;
	Wed,  7 Oct 2026 11:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371016;
	bh=vmk4MCe9gxbKr2C1sOgLltIjp3IDAh2AaXVGz0CKf0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lm3OVWDNzVLMZHY9d4u/SqVA8uCwQIrEjyoZJlDboyAluiUsIQpTHN+h8ueT0fN1l
	 u7Oo7RxyUX94SR06gCEV9jBYOtArB4DkBbZNkgesfnsnFrZd6YXTLqTsjufZMZPYix
	 INFlTQwV3kBL8qN+flGR8M3cU1TBO0fOJJ0nDibNsKfpwa13pUqpMa7niNKP+/Ioiy
	 b4pXUpZlIVZ2x0yBCFPHtEnliIXgRQcmpf7BoRvsRyc+aRoFutCtZOBJxNhOgYMtN6
	 /O9x4TjgJOtl4kGTcuXj+3zVIjaG4NIlzg+2GcBWRnt3/fdfZTU1jS29swQoPnqH72
	 geNGvQ3FB8npw==
Message-ID: <sashiko-outbox-162905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/10] gpio: mxc: use local dev variable
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-8-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-8-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 11:03:35 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pm: devres double-put of runtime PM reference on driver unbind
- [Medium] gpio: mxc: double clock disable on driver unbind due to devm_clk=
_get_optional_enabled and runtime PM
--

commit 22e651b0a155c89a26d690a7e46fed22ae9cc238
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: use local dev variable

Introduce a local 'struct device *dev' variable to replace repeated
'&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
readability.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index f5f9ef1564cdf..9d69524e06dbf 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
[ ... ]
> @@ -481,17 +482,17 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
>  		return port->irq;
> =20
>  	/* the controller clock is optional */
> -	port->clk =3D devm_clk_get_optional_enabled(&pdev->dev, NULL);
> +	port->clk =3D devm_clk_get_optional_enabled(dev, NULL);

[Severity: Medium]
Does this code lead to a double clock disable during driver unbind?

By using devm_clk_get_optional_enabled() here, a devres action is queued to
disable the clock when the device is unbound. However, when the device is
removed, the driver core calls pm_runtime_put_sync() to synchronously suspe=
nd
it, which triggers mxc_gpio_runtime_suspend() and disables the clock:

drivers/gpio/gpio-mxc.c:mxc_gpio_runtime_suspend() {
    ...
    clk_disable_unprepare(port->clk);
    ...
}

Afterwards, the devres cleanup sequence runs (leaving the device suspended)
and unconditionally executes the devm clock release action. Won't this call
clk_disable_unprepare() again on an already-disabled clock and trigger a
warning in the clock core?

>  	if (IS_ERR(port->clk))
>  		return PTR_ERR(port->clk);
> =20
> -	err =3D devm_pm_runtime_get_noresume(&pdev->dev);
> +	err =3D devm_pm_runtime_get_noresume(dev);

[Severity: High]
Does this introduce a devres double-put of the runtime PM reference on driv=
er
unbind?

Using devm_pm_runtime_get_noresume() acquires a runtime PM usage count and
queues a devres action (pm_runtime_put_noidle_action) to release it upon
unbind.

>  	if (err)
> -		return dev_err_probe(&pdev->dev, err, "Failed to get PM runtime\n");
> +		return dev_err_probe(dev, err, "Failed to get PM runtime\n");
[ ... ]
> @@ -531,41 +532,41 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
[ ... ]
>  	list_add_tail(&port->node, &mxc_gpio_ports);
> =20
>  	mxc_update_irq_chained_handler(port, true);
> =20
>  	platform_set_drvdata(pdev, port);
> -	pm_runtime_put_autosuspend(&pdev->dev);
> +	pm_runtime_put_autosuspend(dev);

[Severity: High]
Since gpio-mxc has no .remove callback to re-acquire the reference, won't
unbinding the driver (e.g. via unregistering the platform device) execute t=
he
devres action queued by devm_pm_runtime_get_noresume(), causing a double-pu=
t?

Although pm_runtime_put_noidle() uses atomic_add_unless() to prevent the us=
age
counter from dropping mathematically below 0, this double-put could steal a
reference if another component is holding one. Can this accounting error ca=
use
the device to prematurely runtime-suspend while still in use, leading to
unclocked hardware register access faults?

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-gpio-mxc-c=
leanup-v4-0-c9f5a8b50df9@nxp.com?part=3D8
