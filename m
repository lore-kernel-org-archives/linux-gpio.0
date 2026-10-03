Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF3D35676A;
	Sat,  3 Oct 2026 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050167; cv=none; b=QMpyZ6tKfDb/zih00s4xFzM5FdNS4p6kKU1QktI9333OQ7zcKUs5rD8HmRhxjSv26pHix3NlkNQHN008befW5buit2/9EkpIIAkbO+kWj1nALkafLwGriDyWiuCmPUNR5yUBWR8Vj1gwKD6ah6GXn8xNnyNVZ0QF9Dk3awbrnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050167; c=relaxed/simple;
	bh=3x4QdE7LKj81Fz8mTouVWK3/sZvPupYkZORfdLEP00g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uTaSBo246hH6jEtYNx+cex2oQrX1dXgUVcH2hRHUwvClApD2jpZ26WvPF7Q+3FtmjGrWygf1KJ+b2eoBsYCmoTqsu+EDfahwdJc5JoHQPuKAgEFk16QtqojqVlJ0/MqhoIzAPxQeVllZHfmblwzUhlNN6crezgkaUzdkP26/RlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1QropY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1QropY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EE51F0089C;
	Sat,  3 Oct 2026 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791050166;
	bh=nkZ2dL/2O2asXKKkHNXFQrVGrjNNiom/09S9nL274ag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1QropY4v/Quypg/SNV95GwZJ3d7vavaDwaDZJs+P02FUAxoPHYO7Ry9e4rC+MG0z
	 kahRc/v51dERPfb9lDP5y2qGTQGcpZEO/fpXeIhxi4BMBXh3UeqQk0m6DUd8uyZX2s
	 tIrpOXmAc/kqS91ZM16kLAnZFs1P1zmLnG2vZJxfNzAVIzqXl0ScIechG89um7sD9k
	 VARyuSdfLlt9x/0xxZz4HcT92I5MMTB+zbAPtDsJJPPbUinUbFXX/aRyAVIVhPVZYG
	 f3HlnekuwfbxRPcYYHw7dwhWK0AA4p4OnHURhRFH6vmuNmxTLWVYKVXanuzd0+IRbq
	 hUYy9sFIZ1kXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] gpio: mxc: use devres-managed PM runtime and
 dev_err_probe
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
 <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 17:56:05 +0000
Message-Id: <20261003175605.B6EE51F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: mxc: PM usage counter underflow due to devm_pm_runtime_get_n=
oresume and manual put
- [High] gpio: mxc: ignored devm_pm_runtime_enable and get_noresume returns
--

commit e443f1e5bd54a410ade428061ede6f400132fc30
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: use devres-managed PM runtime and dev_err_probe

This patch switches the driver to use devres-managed PM runtime functions
and replaces goto error paths with direct returns using dev_err_probe().

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 3c395c82d7d46..73e19d2bf2351 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -474,9 +474,9 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>  	if (of_device_is_compatible(np, "fsl,imx8qm-gpio"))
>  		port->is_imx8qm =3D true;
> =20
> -	pm_runtime_get_noresume(&pdev->dev);
> +	devm_pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	devm_pm_runtime_enable(&pdev->dev);

[Severity: High]
Should the return values of devm_pm_runtime_get_noresume() and
devm_pm_runtime_enable() be checked?

Both functions allocate memory for devres actions and can return error codes
like -ENOMEM. If devm_pm_runtime_get_noresume() fails, it drops its referen=
ce
internally by calling pm_runtime_put_noidle().=20

If we ignore this failure and continue, the probe proceeds under the false
assumption that it holds a PM reference. The manual call to
pm_runtime_put_autosuspend() at the end of mxc_gpio_probe() would then
immediately underflow the PM usage counter.

[ ... ]

> @@ -552,12 +548,6 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>  	pm_runtime_put_autosuspend(&pdev->dev);

[Severity: High]
Will this result in a PM usage counter underflow when the device is unbound?

Because devm_pm_runtime_get_noresume() registers a devres action to call
pm_runtime_put_noidle() on device unbind, the initial reference is already
managed. By manually calling pm_runtime_put_autosuspend() here at the end
of probe to enter autosuspend, the usage counter is decremented early.=20

When the device is subsequently unregistered or unbound, the devres cleanup
will execute and drop the already zeroed usage counter, causing a kernel
warning.

> =20
>  	return 0;
> -
> -out_bgio:
> -	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_put_noidle(&pdev->dev);
> -	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
> -	return err;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003-gpio-mxc-c=
leanup-v1-0-dad728ce27f2@nxp.com?part=3D5
