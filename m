Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9454B483BF2;
	Wed,  7 Oct 2026 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370794; cv=none; b=JqvRAGlcHc23iOI+0ox2Bxmf7Hax4+O/BJFRuODadj1yIFPpZbm298nTrj9IS/n+3VRZe0D1dN49ps27gCvwVkcndbIicpKZdEvhApc/NGcE1dG2ejeCQSBPwRmVzN3gkIrCIrHrOUH7r/90n4u1ZeERsbT9TUfa0FMlTiJxpkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370794; c=relaxed/simple;
	bh=izGr+DOrXeyNom7BbMy0vC6KZjjpTrsHvfUmStC56FY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=u4ZkXzDzyUNqkE0nBazH1k1GeifZ1dSDpsnToMHQixpSrPgZkZbfFr42ywEdeub04tv7jHD/a0/SW8BGey0Vm/sSs6V83Y+CCHFSBg4l3NPTtXF9MwaT5WBfYWeakY+OC1ug4lSFdjf0CQpBQvbS81UgfV9qgqe3/l3quDnKZFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dK56D60f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dK56D60f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91F41F0089B;
	Wed,  7 Oct 2026 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370766;
	bh=PorhDB+xXpEehO+cFThcBUFVUbyaTFCR77rSWIHn39Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dK56D60fz95O4x1bcfEdzrpThK+1Rz1ovM7TfGOGZR65unN7Moy/k6dq0/wjYCLB4
	 giQwWXNMdg24aXrgpNVERNpfKJ0iXnutok803ES0QdlbEKCm7SzqwXjLWnVxIFfyL/
	 ZtRi+crGNRVg4tofsauDU4LYWA5CPtniw8l0QnXhxz658k1TU4LFZIC100s8Rheuqx
	 xvXF6luiWjmVRC37hDmcqE3S50EVV/qo1VqXc1falVIo237BK2ZvdpLM9lhVlyJ0A8
	 jBIzxtPXzz0tOkShmuLcAAMY7tjwcGpwBGXoRhBRhp0vUjfTBPzQaTCPE2xq633Bv/
	 fH6+ri+LADvvw==
Message-ID: <sashiko-outbox-162899@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/10] gpio: mxc: convert probe error handling to
 devres
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-6-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-6-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 10:59:26 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pm: usage counter underflow due to mixed devm and manual autosuspe=
nd
--

commit dc287cc46ea891b838f3b39a1fd6ed65d627a965
Author: Peng Fan <peng.fan@nxp.com>

    gpio: mxc: convert probe error handling to devres
   =20
    This patch converts the driver's probe error handling to use devres. It
    replaces irq_domain_create_legacy() with devm_irq_domain_instantiate()
    and updates the PM runtime initialization to use devm_ variants, elimin=
ating
    the need for manual cleanup labels.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 5da603569d88d..54b09f1a4b509 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -484,9 +485,13 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>  	if (IS_ERR(port->clk))
>  		return PTR_ERR(port->clk);
> =20
> -	pm_runtime_get_noresume(&pdev->dev);
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	err =3D devm_pm_runtime_get_noresume(&pdev->dev);
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err, "Failed to get PM runtime\n");
> +
> +	err =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");

[ ... ]

> @@ -558,14 +567,6 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>  	pm_runtime_put_autosuspend(&pdev->dev);

[Severity: High]
Since devm_pm_runtime_get_noresume() increments the usage counter and queues
a devres action to drop it on unbind, will this manual call to
pm_runtime_put_autosuspend() cause an issue?

Because the devres action remains queued, when the device is unbound (e.g.,
via device tree overlay removal or hot-unplug), the devres cleanup will
execute and decrement the usage counter a second time. Could this cause a PM
usage counter underflow, corrupting the device and parent power state?

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-gpio-mxc-c=
leanup-v4-0-c9f5a8b50df9@nxp.com?part=3D6
