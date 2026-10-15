Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E750509F19
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067847; cv=none; b=ZfJwBRu3vpFo3eysRkePU1Uxsfq26IiUKagIF0ZGJmF7Q/qGwpevsY8dPyF8uxAQRPcNJ9awiOqHXXAqlqMpaUFE+iLzRZZC/fMCYs1E/+EELqcpHdJDJaSpGL6ZwBiiWe534wIbD2U9sLeg4yJ0skDAv+fu5kwBzrSHN/Gcz8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067847; c=relaxed/simple;
	bh=G2E3pSBkHrO6DMJk0uyH9EbgbDotpAz9tSZPpNDnVcc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HDP7o2BS8eE0eR3Mh7ZHhxz0rDSsn+XhYOW6KIoe5vsTMy3DmCXflzc9w1I/Sz7kv1VwYKSC/66SLHeTB1y+vcQ6KoLl0qhUQUZDN5UIMtGhNBnVswHATR+KRIMJ724g1YsqO5Tv/gFiLe5PVB2kkCOwQ5223LM6/hGgZfBO+mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJktlDl9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJktlDl9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF031F000C4;
	Thu, 15 Oct 2026 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067846;
	bh=pU2lD2CTQFKFiRfTSxDSpraKPjvAAF0AtCG/rZSi4iM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJktlDl9fdtRqJd95H5wnMlj8GJn8xuIhePyeBv35hfmRYLAwajt4k5R3hPUBVDsl
	 EVybtWV3baxqIySAThcdsxQKNU1cpevHalFyA8Zmpzhet9p3MYAmlmyFf4umIxDtRr
	 sM3/wJ0Ep+o7R2ZmaFyDJw+9W14bM/oC8dIbcXql2FpeD6GsVfAqXlNGDbZ9AjEKMe
	 DM3n8Ukzoz+4HeSIi/Ht/CJMGjBlEUkqwUQxHiqK1DgcwC9eD1q+BtrVPYFEvhx0H2
	 2GfQsIJP3QpdzIRLc8m0XAPchZf38ecaBh+5A3O4QFCEplJ5XglK+W4p75hA01eaS3
	 kyOl61becyQFg==
Message-ID: <sashiko-outbox-172816@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: shared-proxy: Fix race between concurrent first
 users
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261015122740.971792-1-shengchao.guo@oss.qualcomm.com>
References: <20261015122740.971792-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:37:25 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: shared-proxy: integer underflow of votecnt on proxy free err=
or path
- [Low] gpio: shared-proxy: spurious warning and logic bypass in set_config
--

commit 2a16d83da9ca16fcf3fc8f06a64d08bb431d1954
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

gpio: shared-proxy: Fix race between concurrent first users

This commit addresses a race condition where concurrent consumers
requesting a shared proxy line could both observe the use count as 2
before any configuration occurs, resulting in a failure. It resolves
this by introducing a configuration counter and a per-proxy flag to
track actual configuration changes rather than just requests.

> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-=
proxy.c
> index bc69b8729d196..0d9ef98a4229e 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c

[ ... ]

> @@ -117,6 +141,11 @@ static void gpio_shared_proxy_free(struct gpio_chip =
*gc, unsigned int offset)
> =20
>  	proxy->shared_desc->usecnt--;
> =20
> +	if (proxy->configured) {
> +		proxy->configured =3D false;
> +		shared_desc->cfgcnt--;
> +	}
> +

[Severity: High]
If the hardware write fails in the earlier gpio_shared_proxy_set_unlocked()
call inside this function, proxy->voted_change remains true:

	if (proxy->voted_change) {
		ret =3D gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
		if (ret)
			dev_err(proxy->dev, ...);
	}

When we unconditionally clear proxy->configured and decrement cfgcnt
here despite the failure, can this allow a new proxy to bypass checks and
reset the global votecnt to 0?

If cfgcnt drops to 0 and votecnt is reset, a later reuse of this proxy
could see voted_change still set. If votecnt is 0 at that point,
calling gpio_shared_proxy_set_unlocked() again could skip the hardware
write but decrement votecnt, causing it to underflow to UINT_MAX.
Could we ensure voted_change is cleared, or configured is not cleared
if the write fails?

[ ... ]

> diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
> index 618756f6c6aaf..ae10506b7029f 100644
> --- a/drivers/gpio/gpiolib-shared.h
> +++ b/drivers/gpio/gpiolib-shared.h
> @@ -41,6 +41,7 @@ struct gpio_shared_desc {
>  	struct gpio_desc *desc;
>  	unsigned long cfg;
>  	unsigned int usecnt;
> +	unsigned int cfgcnt;
>  	unsigned int votecnt;
>  	int def_val;
>  	struct mutex mutex; /* serializes all proxy operations on this descript=
or */

[Severity: Low]
Since concurrent probes are now tracked using cfgcnt rather than usecnt
to determine if the line has been initialized, does
gpio_shared_proxy_set_config() also need to be updated?

If two consumers concurrently request the line but haven't configured it,
usecnt is 2. If one of them then calls gpio_shared_proxy_set_config(),
it still checks usecnt > 1. This could cause a spurious conflict warning
if the requested configuration differs from the uninitialized state, or it
might bypass the hardware configuration entirely if they match, erroneously
assuming another consumer already applied it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015122740.9717=
92-1-shengchao.guo@oss.qualcomm.com?part=3D1
