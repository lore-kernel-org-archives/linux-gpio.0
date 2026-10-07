Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DD04ACC69;
	Wed,  7 Oct 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370660; cv=none; b=Is2UAqLBNXzPQjb4Tr0LwudsUH4SaO2onMZsm18wP6zYvCuvVhubmp/CqR1g4OfdMY7DhtDhTQWkIXm/y7FZPKnkI6EG2MQqmAMorQyRudK1HSCpDCy1YTyW8nPZ4amGNSIx/yZKAwYhpJg9v8gclJ/gHJLeaMYR/JroyFQToiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370660; c=relaxed/simple;
	bh=nFnvT8EwsuEKtSGoQbiSHMY6mS85WE7NOEv9+yQA3DM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Q55JZMfZ6ukkd9v//VCNCq12bVHGPYD+VYeAxw69CrCuO/KeG84DZJToUNDghcbgCL+sq/UaeLI7VhMTMK8EYY2aScSHAeGPmw1reEceJ/XGOKB7djn0Eqebe9Cev1b3aHVSa7uH39izOrrj44YatMZ/6aekvB2twkw677y8WzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBJN1xCO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBJN1xCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2D31F0089B;
	Wed,  7 Oct 2026 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370634;
	bh=gRQ+2gP1H2+IrCpdyzJ4kBi+mM2kGG4FaOHlY54BJV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mBJN1xCOJ5RIU8KcIbwvMK3A2kMr+3LeP5Iy+e7bybLiraj1WT4ydNj48C2+1vN10
	 5x+W7/40GVF7x3I0NKwZdkaJt3hHdsj3KN9B0Xj3lT+X2TtczVUE38HgOtt1Dewqne
	 UEQFl1jOCNUH0JGS4LDGJxE31gtamcTYBP01cUju/jjLemp1g442e98XXP6acYT4z2
	 cBjAeVUSbC+NPuoUvKzIZSVIEJpP+08LmDflhz/RD5Obo56MjXkE3g/bmBI91sjY4x
	 cBV2D6khWtGI8Yq7gTLY6KUi6cKsQk3djbZRnsrht2t0ZmOPwbMJSoWcK11sPtWbgk
	 8UC084+tj2+Qw==
Message-ID: <sashiko-outbox-162895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/10] gpio: mxc: fix race between chained IRQ
 handler install and probe completion
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-1-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-1-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 10:57:13 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: mxc: data race on mxc_gpio_ports list during concurrent prob=
e and shared IRQ
--

commit bd719d33a26c1f816073bbdb04f543bc3f5ed730
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: fix race between chained IRQ handler install and probe completion

mxc_update_irq_chained_handler() is called before the IRQ domain, the
generic IRQ chip, and the port list entry are set up. If an interrupt
arrives in that window, it leads to a crash or missing port. This commit
moves the handler installation after all dependencies are ready.

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

[Severity: High]
For fsl,imx21-gpio devices, all ports share a single parent IRQ. After the
first port probes, the shared chained handler (mx2_gpio_irq_handler)
becomes active.

When a subsequent port is probed, list_add_tail() mutates the global
mxc_gpio_ports list without any spinlocks or RCU primitives.

If an interrupt fires concurrently on the shared parent IRQ, the handler
running on another CPU will traverse the actively mutating list:

drivers/gpio/gpio-mxc.c:mx2_gpio_irq_handler() {
    ...
    list_for_each_entry(port, &mxc_gpio_ports, node) {
    ...
}

Can this lockless traversal of a list undergoing non-atomic mutation cause
pointer corruption or an immediate crash?

> +	mxc_update_irq_chained_handler(port, true);
> +
>  	platform_set_drvdata(pdev, port);
>  	pm_runtime_put_autosuspend(&pdev->dev);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-gpio-mxc-c=
leanup-v4-0-c9f5a8b50df9@nxp.com?part=3D1
