Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F4136E48C
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487714; cv=none; b=rQ+q7EDznimuODxYDq9sFfjQq4/WjVh1R0KhhbGzQnFsS8jRy6FtxrnOeFz/p15auTjptL/VkuzfQ1LRnjwn23RyVsVx3ykerh6K3W+5kTyZijSyz5Rle3hPeRgTfibUwn3WMRs5wDbkm/4mEeROMCc5nog8ojNpHZNYyeJB2iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487714; c=relaxed/simple;
	bh=b5pDH7/wOJdew+GeVzJlTsau6S++mSewcbj7s4JsEPs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=O6ZtA/8ONY/E4wOiHeqbv9vufnkWzhAF35PCva/nN7TDXiCPevMNCEkKZ6z7En7Scjb86xkqmEqUdsQRK6zbxtmGvCsl0yCOlic/k8Qw2wBnGgaA+Jtu2wnaIP8tt67mohHg6nLRqkh6de8lnmjKs9WkIlqrP3pS/QSyb/wprvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLn8nFBK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLn8nFBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63E01F000FF;
	Thu,  8 Oct 2026 19:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791487713;
	bh=hPQ5DtqoP76jNX1iEtXj7XdWEzqE+m1r8O4H4N6w/98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eLn8nFBKnsiOfs+IoIhgHj+vqorfeFDUjEentQyJ6aDTmAcQruHMz6VoRukypSepj
	 CnuU8CzzqtviHY+6MPZH0ccKnUCm3rG7e4G9WKnUh6ZRvexc33NWxm7phvH4JIIiGf
	 Rd0noPm0bZyN7LAO9tRfjIEPYzsvuXHt5skQm5OKNgaw+oQT2o3c7vt0aHOK8rrlF+
	 yg/t9+Lb/DocycZ6n0CqFa3q3/AgoSm02WPrUJE0Y0w2OBpvmKCn7KGkbqAmIP7w2g
	 XQPg7dtDOEqkn1saIcNeL69qNn7zSUH5DstGP8exrE+VhRZrBb+7QY5M/onmg6Nze2
	 ZI/l12pAur/JA==
Message-ID: <sashiko-outbox-164521@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6.6.y 1/2] gpio: rockchip: teardown bugs and resource
 leaks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Dinaburg" <artem@trailofbits.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261008191824.98662-2-artem@trailofbits.com>
References: <20261008191824.98662-1-artem@trailofbits.com>
 <20261008191824.98662-2-artem@trailofbits.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 19:28:32 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: rockchip: UAF in rockchip_gpio_to_irq due to dangling bank->=
domain
- [Medium] gpio: rockchip: clk_put() on prepared debounce clock triggers WA=
RN_ON_ONCE
--

commit 02053f662558738041ac46d1ce4ccf500e2ba8c2
Author: Marco Scardovi <scardracs@disroot.org>

gpio: rockchip: teardown bugs and resource leaks

This commit addresses several teardown issues and resource leaks in the
driver's remove path and error handling. It registers a devm action to
release the debounce clock, clears the chained IRQ handler in remove(),
and removes the IRQ domain during driver teardown.

Link: https://patch.msgid.link/20260526171050.12785-3-scardracs@disroot.org

> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index ff9a4b8611d7f..e0e4f3ed5fdd4 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -629,10 +629,17 @@ static int rockchip_gpiolib_register(struct rockchi=
p_pin_bank *bank)
>  	return ret;
>  }
> =20
> +static void rockchip_clk_put(void *data)
> +{
> +	struct clk *clk =3D data;
> +
> +	clk_put(clk);
> +}

[Severity: Medium]
Does this code trigger a warning if the debounce clock is still prepared
and enabled?

If a GPIO line is configured with debounce, it enables the clock:

rockchip_gpio_set_debounce() {
	...
	if (debounce)
		clk_prepare_enable(bank->db_clk);
	...
}

If the driver is unbound while debounce is still active, this devm action
calls clk_put() without unpreparing or disabling the clock first. This
triggers a warning in the clock framework because the active prepare count
is unbalanced.

[ ... ]

> @@ -773,6 +785,9 @@ static int rockchip_gpio_remove(struct platform_devic=
e *pdev)
>  {
>  	struct rockchip_pin_bank *bank =3D platform_get_drvdata(pdev);
> =20
> +	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
> +	if (bank->domain)
> +		irq_domain_remove(bank->domain);

[Severity: High]
Does this cause a use-after-free if another thread tries to map an IRQ
during driver unbind?

The IRQ domain is freed before the GPIO chip is removed, and bank->domain
is never set to NULL. If a concurrent call to gpiod_to_irq() occurs:

rockchip_gpio_to_irq() {
	...
	if (!bank->domain)
		return -ENXIO;
	...
	virq =3D irq_create_mapping(bank->domain, offset);
	...
}

It bypasses the NULL check and accesses the freed domain memory.

Could this also cause a use-after-free during driver rebind?

If the driver is unbound and then bound again, rockchip_gpiolib_register()
calls gpiochip_add_data() before the new IRQ domain is allocated. A
concurrent call to gpiod_to_irq() during this probe window would see the
stale, dangling bank->domain pointer from the previous unbind and attempt
to use it.

>  	gpiochip_remove(&bank->gpio_chip);
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008191824.9866=
2-1-artem@trailofbits.com?part=3D1
