Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675644C9E1C;
	Fri,  9 Oct 2026 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570174; cv=none; b=Hi1g0P51E9fHVKZ9PDI6OjBN+v++E6/mx+qGoYIaBFUN48ZOzagmV00V+PwOtSgkTweSwU688iYVIeuHZx8CYbtQKS113DAnfJ6+Kq5a1/QL5Pnt2l8M1T6JqM2UU9r24kITgd1JTgAuqafQ8vbRu93DE2lrBk8XCHAXg5Fv9f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570174; c=relaxed/simple;
	bh=pE0HMWDfA4nZMcJ2sA3SxMLTyoAk+zTxkNzpRjJzfjQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Qal2GKrQl2J0vi/exq3+yF0+2CBECFACy9tyd1g12K2hWqnF7s65JfDlActnCj8Gp0aPqgUbJi/8gdP3KQn4fIN24JX6V5MEeVdcAc2D9A7bQAqPU9lVMf5yOET/Q0Ms3eq0B4I4t5sIcUU85b0TfUjd+gb0pONMlwfymODpBNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtW6zCBt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtW6zCBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1411F000FF;
	Fri,  9 Oct 2026 18:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791570173;
	bh=9I9h3FkH7BzvvtRh6hRDL0msM0VjKhEz1HtfMn/05Pg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YtW6zCBtHePPNqE9MVleb1lee6CfCJMQ6mZmtPG6LwHt4CoyXberuUHuXGv+3fE5q
	 5OaKiHAyax/yTt0qbgZ94pDDPaj5BMzckvfbBMGYflwMDvDhu0Z2gEgHuxGASm7yca
	 XDODMVd9wPK9YJ6z7v0amISDMqpAkZZOuldothij/VS1GEuEQGz4hWOhRlqkqgKuNW
	 mLKz+sOQV13UzuoioYZR8QPXmFlArBIkfuNUtOew3VFiMfqoCXputEAZI5gvTpgRWj
	 FnC+noQ5AJm6oIOZ0H0ACZTUMcqMk0PC9WSVIlrB1y4ewAa3XwoWGu++nJyRzo5rN4
	 Z08yTiz4YSrBg==
Message-ID: <sashiko-outbox-165937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/13] gpio: mxc: fix race between chained IRQ
 handler install and probe completion
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-gpio@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-1-1e59e6ddfa00@nxp.com>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
 <20261010-gpio-mxc-cleanup-v5-1-1e59e6ddfa00@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 18:22:51 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: mxc: lockless mxc_gpio_ports list race with shared IRQ handl=
er
--

commit cfebba0884b34920e4ae09750fb2bbf30c42ba32
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: fix race between chained IRQ handler install and probe completion

This commit delays installing the chained IRQ handler in mxc_gpio_probe()
until after the generic IRQ chip, port list entry, and IRQ domain are fully
setup. This ensures the handler does not execute while data structures are
incomplete and prevents leaving a dangling handler if probe fails.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 7e2690d92df6f..e05f276a50e8d 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
[ ... ]
> @@ -525,6 +523,8 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
> =20
>  	list_add_tail(&port->node, &mxc_gpio_ports);
> =20
> +	mxc_update_irq_chained_handler(port, true);
> +

[Severity: High]
Does this still leave a race condition for shared IRQs?

On i.MX21/i.MX27, all GPIO ports share the same parent IRQ. When the first
port probes, it registers mx2_gpio_irq_handler for the shared IRQ, enabling
it.

When the second port probes, it calls list_add_tail() to add itself to
mxc_gpio_ports. If an interrupt arrives concurrently on the already-active
first port, mx2_gpio_irq_handler() iterates over mxc_gpio_ports locklessly =
in
hardirq context.

Since list_add_tail() uses non-atomic pointer updates without compiler or
memory barriers (unlike list_add_rcu), could the active IRQ handler travers=
e a
corrupted list if it preempts the update, dereferencing invalid memory?

While moving the handler installation prevents races for the first port, for
shared IRQs the handler is already live. This leaves the lockless list
mutation race unresolved.

>  	platform_set_drvdata(pdev, port);
>  	pm_runtime_put_autosuspend(&pdev->dev);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-gpio-mxc-c=
leanup-v5-0-1e59e6ddfa00@nxp.com?part=3D1
