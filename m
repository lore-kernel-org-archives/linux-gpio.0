Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7D0320CD3
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 05:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522980; cv=none; b=LMc0H95X3+kGI/M/kaFDgVIpkPt3zkaJaTmLhM/nLPAAnrqnvcfqfQgv8S+V8Biinfw0JgbmCBS5VGwuENFDJ444BDx75mS0dq8zCeMln9fcdr2+4XfaGgzWw3TfxMR7ZskSMzwI2d5FttrVNWFZQh++kl51J/OeAYXvk/5pM4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522980; c=relaxed/simple;
	bh=gZYBXBOtEufstiAdsyubpPe4oYLTeXLwq7MOS+cEVuE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=S4+h7YHOa9s6/6L6HCoMN86gcuPGP2jcJ/riLiED6bMnPv7dL87Ah+XFm7qWbOmlFZ49Oq2ug79QLk4mCwkKtHi4yKcgMwCxu9/1dgg+CuLNUaEa7ZWmZcU30pDmIVuyFpUHQzL/nfV11nhz4Andsl2g+2J4Y/vUt+C2GF38ouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvKGtmU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvKGtmU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9F91F000FF;
	Fri,  9 Oct 2026 05:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791522979;
	bh=s2P9wEd61SFWx7193ds5FESAIFEvJqHuUf5szMDT5lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bvKGtmU29cnHv8VxrdWcKTCIn7lKXLr5Tb4XNNG8Ixqb7WjLBkU1m5fMiHanT+X1c
	 c31dVuULoYuhHIoAIVnkLLa9CywWRI2LIoIvOdGF8ulfof1AQul+v4eK3dJ5+2zoVw
	 hCH6L6pXX4/D1pEp+D5XpQ/m1pKsqplLIZAaeoZfeo3jUYHvCh+yJG4Emtu4vi9zQy
	 d8hbEQw8oPLC4v98RCrMpm8E0w2frYXQNUgKmxsk8fVNngWiwilRMdRYLhfPwGSyOq
	 qWeFkhu67gisPJAdIjLIYpkzZZ+zHe59xOSA7CkztvjeucEwBsqWT33bFQ+KXQ7Ftz
	 9JxjoRxguzfpg==
Message-ID: <sashiko-outbox-164878@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: pxa: propagate pxa_gpio_probe_dt() error code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haotian Zhang" <vulab@iscas.ac.cn>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261009050604.3128124-1-vulab@iscas.ac.cn>
References: <20261009050604.3128124-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 05:16:18 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] gpio: pxa: probe returns -EPERM (-1) when CONFIG_OF is disabled
--

commit e354788ab87bb0e86721190d9d799a35572742ca
Author: Haotian Zhang <vulab@iscas.ac.cn>

gpio: pxa: propagate pxa_gpio_probe_dt() error code

pxa_gpio_probe_dt() returns the negative errno produced by
devm_irq_alloc_descs(), which may be -ENOMEM, -EINVAL or -EEXIST. The
caller in pxa_gpio_probe() overwrites that value with a fixed -EINVAL, so
the actual reason for the failure is lost. Return irq_base so that the
original error code is propagated.

> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
> index 3ff21e8992788..7d513932d09f0 100644
> --- a/drivers/gpio/gpio-pxa.c
> +++ b/drivers/gpio/gpio-pxa.c
> @@ -632,7 +632,7 @@ static int pxa_gpio_probe(struct platform_device *pde=
v)
>  	} else {
>  		irq_base =3D pxa_gpio_probe_dt(pdev, pchip);
>  		if (irq_base < 0)
> -			return -EINVAL;
> +			return irq_base;

[Severity: Low]
Does this unintentionally return -EPERM when CONFIG_OF is disabled?

When CONFIG_OF is not enabled, pxa_gpio_probe_dt() is defined as a stub that
returns -1:

#else
#define pxa_gpio_probe_dt(pdev, pchip)		(-1)
#endif

With this patch, pxa_gpio_probe() will now directly propagate that -1, which
translates to -EPERM. This seems like a misleading error code for missing
platform data or device tree configuration compared to the previous -EINVAL.

>  	}
> =20
>  	if (!pxa_last_gpio)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009050604.3128=
124-1-vulab@iscas.ac.cn?part=3D1
