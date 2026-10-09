Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204704FDE56;
	Fri,  9 Oct 2026 18:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569961; cv=none; b=GsIjooVxQK91uUKeHVz071SJ50nKlgiRaAxUXyQ4tIDKMtnbYT9unzikFl5BkscgxR/cB7EgiEBSvwJK4rAE1AztHUka0gb0AMgu2FAIdu3pk6l1T/mFmSsGNR2wZ8wo0qNbKU4kQsMphuZCESZ0AKRZbtDcYJHX33cUb5Dwn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569961; c=relaxed/simple;
	bh=RX84YMPrs1qwJb38gSYsPZ5lpaU2PHTYLk8DjOLrmXA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DAdOEtlVJmDEtv/GuiKMhQLNDPcMV/Cwi5+NY0hR1E9jnAQHqo5gT5Kq+/YB6oFFDCdivW9sIgt05D2t3T/x7GtRT1iHtSS8cZDyid3+Qa3jeI7cUb4avKFV8tLUquj0ndU1gl55kFVFMx6rO7gxC/Mr70YX6bWuKjwK/4FZsLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDynWVvN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDynWVvN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0891F000FF;
	Fri,  9 Oct 2026 18:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791569958;
	bh=A02iR0jkYleCC6lgytNB3nIYB8qHkP0T5ZFIQTHG+yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDynWVvNZ9VgdrWueBAgHd5wLpr0tBKtIhi+ogTEZNW15gHSRII+4HwDQs9ZS/3us
	 pAktiQiQwUE/AKuhc+ALCL32aCrTJocztb14ZEsJ1L2o3EWQrzFbTbzHR2XUiTfYyj
	 76Oma+FsgR+m4E5ZiGArhei6LgnYBIk5sWXF0wXwkQ6vPykWqFHvkp+xuVVmz+BcaU
	 gkfYFTDS4+iPQZMVK0/LmPYK4kjS2pUc0mucVcDmwny+CjEwZ8SR6EQ0coLUirJngB
	 gBqAYwe/1lzNh207loVqQQUwLNkBOVozm/mrOXm6+Z/Hp5M5uCGxEZQVjXbMO4anS4
	 We+AqmNxwTiRw==
Message-ID: <sashiko-outbox-165930@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-9-1e59e6ddfa00@nxp.com>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-9-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 18:19:18 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pm: double put of usage counter due to no_free_ptr() self-assignme=
nt
--

commit f4335cfd7512992cdd6d3fcb1a49da9aabbb176c
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: use cleanup guard for pm_runtime_get_noresume() balance

This commit replaces the manual pm_runtime_put_noidle() error path cleanup
with a __free scope-based guard in mxc_gpio_probe(). It also attempts to
disarm the guard on the success path before calling
pm_runtime_put_autosuspend().

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 5ae9cdee6424d..3d5a6566d3f43 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c

[ ... ]

> @@ -556,6 +561,8 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>  	mxc_update_irq_chained_handler(port, true);
> =20
>  	platform_set_drvdata(pdev, port);
> +
> +	pm_guard =3D no_free_ptr(pm_guard);
>  	pm_runtime_put_autosuspend(dev);

[Severity: High]
Does this self-assignment defeat the no_free_ptr() cleanup inhibition,
causing a double-put of the usage counter?

Because no_free_ptr() is marked __must_check, assigning it back to the
same variable is a common attempt to silence compiler warnings. However,
no_free_ptr(pm_guard) internally sets pm_guard to NULL but evaluates to
the original pointer value.

By assigning the evaluated result back to pm_guard, the NULL value is
immediately overwritten with the original pointer, leaving the guard
armed.

When mxc_gpio_probe() returns successfully, the cleanup handler will execute
pm_runtime_put_noidle(dev) because pm_guard is still armed. Since this path
also explicitly calls pm_runtime_put_autosuspend(dev) right after the
assignment, will this result in the usage counter being decremented twice?

> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-gpio-mxc-c=
leanup-v5-0-1e59e6ddfa00@nxp.com?part=3D9
