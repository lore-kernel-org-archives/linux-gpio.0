Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6882823E334
	for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791649963; cv=none; b=XteLtxsOvZwUEUDyNA4CFNE+7KUZ93gnMogcC++lkPo1gxyvb6NzN6PqmGSGPrtUGaDuy3u+aoQ1DVELpMy+JLOoz1+NnBaOVgtpkDQ/jovlgdKzAHf12TlPfXiwhjH5iOUiMNgWKB9oXPyUScGOEH4PiAIQ3+Cx2JMZGydD9+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791649963; c=relaxed/simple;
	bh=9Dtzbun28+jcWBFe1g+HOaJEqqpJMFqqcIsoIiClaWc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gmO2MSosUCxrVmqED17eyC6Iq7K8kcXvBRVnvJBPLeXVelIVxLA8SOd7lQ62mNn3q6QABtPBzDDEXEbbUzPilyT+cPHpTfjvlIWYxfl7A2AhTI1HkfWrgXUCRQMCaJcUZ5tEPPFoY4qqOoYLgihJNdTiGYfh9wjxUlJbGbSEOVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+IY5BCa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+IY5BCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8581F000FF;
	Sat, 10 Oct 2026 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791649962;
	bh=8+HGO0c3Muv+iPSpheN7cCCUEU8WKzI7Npy1vQTB5S0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E+IY5BCanp1D0j2yn+KoNF4cM/8iWF0ynfRxsbTRVBx0UuxHaMog1WLKyd54EpTHy
	 2Zc4mnnw8fkQVVAEJyIZOrxuGuEupCXv5QlVvVQHYfcIeKNM9DVsQmXueJZZOALvIm
	 kqX5BViT5rHOMv3OnI+X7qoXED8KP3X6vvqF/2NzpPd/oiRk4dvIvftpKR5pMu2keJ
	 ZqXaIuIW6T/gkJxxRArbrvX6a8iuGGM6eZ34QEgUbY6cDBum0X9g03eYkki0sUYijj
	 w3wbg6ADTNsx5xg0pCd9YENC8ep98S4JwaYBN6Yr+Lyipdn9XAxGXKMTyjBAdMB2ni
	 Mdi4bZezFS3iw==
Message-ID: <sashiko-outbox-166741@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: single: add big endian support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261010161545.62959-1-adilov@disroot.org>
References: <20261010161545.62959-1-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:32:41 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] api: undefined readl_be/writel_be macros break generic build
--

commit 37f4a78fd7a9ab63fc123070591147a5473d3fdf
Author: Rustam Adilov <adilov@disroot.org>

pinctrl: single: add big endian support

This commit adds big-endian support for pinctrl-single to handle big-endian
device tree properties. It implements custom I/O accessor functions for=20
big-endian MMIO access, intended to support MIPS platforms like RTL930X.

> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-s=
ingle.c
> index e0eb7240a9859..001a0c157d6a0 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -265,6 +265,26 @@ static void pcs_writel(unsigned int val, void __iome=
m *reg)
>  	writel(val, reg);
>  }
> =20
> +static unsigned int pcs_readw_be(void __iomem *reg)
> +{
> +	return readw_be(reg);
> +}
> +
> +static unsigned int pcs_readl_be(void __iomem *reg)
> +{
> +	return readl_be(reg);
> +}
> +
> +static void pcs_writew_be(unsigned int val, void __iomem *reg)
> +{
> +	writew_be(val, reg);
> +}
> +
> +static void pcs_writel_be(unsigned int val, void __iomem *reg)
> +{
> +	writel_be(val, reg);
> +}

[Severity: Low]
Will this break the build on architectures like ARM and ARM64?

The macros readw_be, readl_be, writew_be, and writel_be are strictly
architecture-specific and do not exist in standard generic headers like
<asm-generic/io.h>. Since pinctrl-single is a generic driver heavily used on
architectures like ARM and ARM64, compiling these macros will result in bui=
ld
failures due to undefined reference or implicit declaration errors.

Should this use the generic kernel APIs ioread32be / iowrite32be (and their
16-bit equivalents ioread16be / iowrite16be) for big-endian MMIO access
instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010161545.6295=
9-1-adilov@disroot.org?part=3D1
