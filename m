Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B1484891;
	Wed,  7 Oct 2026 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370584; cv=none; b=A+w39q/YiPIqdiP37sPOBTe0e5BrziWjaJnaNV1cvO9yFzSxdCIdH4fSZrXt5hoPc4uMnAMzQTOXvuEQ0M1zwr/VCVgJJsvu2zxWMtXpv8LU6+3dB16VRtbBy0uNrEWtp1MkExy4RuDUrnHB1sRTqmrSbHfaxkwHpD7rft4SiXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370584; c=relaxed/simple;
	bh=8FGhWITpE36ZXuj1OJ0MzKOO3+Kvats8A9Q13BaQJgA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cAHUmN+v5M0sXTEt7nhrMMvsNwV3L2aFot4DvbqXotIoY7IAZsoNqCSqYHHHfagSz3+kJFBU+bBgqmPcAVJHXveQzf4X8dQLI3ILtZdT5rK9U2oGjnCNg8v9+BgOEppwSoLCpIZOieto4DMHUEe/tXabZplw5xeQQajl/lulcw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzhfJcMq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzhfJcMq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7EB1F0089B;
	Wed,  7 Oct 2026 10:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370562;
	bh=Bv6nA4IIB2ajLQ0ldXPAE2sxf/iV1nrV8jrT4kL54X4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NzhfJcMqDCAHPFRmP2Jsqn1lGKvNaOVW1V2MsurXWs5tHmVsYA/rR2ullT7rRsEdt
	 V4f+QpqeILHeFpDHBIwnQBNVVuEBGyn7fMdzhoCMNa6EYcPm1vqs7VXGmFuUtCC0Jt
	 KcgYYabRVbLi0FZIsCHAafLs59+c9W5JTtnHadQ5msTMSg+G+hfJkkI1V+wq9sqlme
	 zRCD6XGbHQk95OxffvWXXN6EGwfgvwmUyw/2bNBeolCth//3HfjlOXFGZ18K/ABbmU
	 xeMU+vLdv/D1NgmlQ27TRLJZLgor+TLtxE5rtIFsjcJRe0hgLqxQoVShj/wYDIlzrk
	 5IsMKlETiVVJw==
Message-ID: <sashiko-outbox-162890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/10] gpio: mxc: use BIT() macro for single-bit
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-10-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-10-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 10:56:01 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpio: mxc: race condition in gpio_set_irq_type updating port->bo=
th_edges
--

commit 71b368728fc9ada85f870f46f968a6583a740b0c
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: use BIT() macro for single-bit operations

This commit replaces open-coded shifts with the BIT() macro to avoid potent=
ial
signed-shift issues and improve consistency. No functional changes are
intended.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 39de616cd434f..ad50b602c4a16 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -209,7 +209,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 =
type)
>  	int edge;
>  	void __iomem *reg =3D port->base;
> =20
> -	port->both_edges &=3D ~(1 << gpio_idx);
> +	port->both_edges &=3D ~BIT(gpio_idx);

[Severity: Medium]
Could this unprotected read-modify-write on the shared port bitmask lead to=
 a
race condition?

Concurrent updates to the shared port->both_edges bitmask could cause one C=
PU
to overwrite and lose the IRQ edge configuration of another pin, potentially
leading to missed interrupts or stuck IRQ lines.

This can happen during parallel device probing or via userspace GPIO
configuration (e.g., libgpiod/sysfs) when two CPU cores concurrently call
gpio_set_irq_type() for different GPIO pins on the same port.

The IRQ subsystem serializes irq_set_type() on a per-pin basis (via
desc->lock), not per-port.

While the driver correctly takes the port-wide lock later in this function =
via
scoped_guard(gpio_generic_lock_irqsave, &port->gen_gc) for its MMIO register
updates, it performs read-modify-write operations on the shared
port->both_edges software mask completely outside of this critical section.

[ ... ]

> @@ -229,7 +229,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 =
type)
>  				edge =3D GPIO_INT_HIGH_LEV;
>  				pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
>  			}
> -			port->both_edges |=3D 1 << gpio_idx;
> +			port->both_edges |=3D BIT(gpio_idx);

[Severity: Medium]
This appears to be a second unprotected modification in the IRQ_TYPE_EDGE_B=
OTH
path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-gpio-mxc-c=
leanup-v4-0-c9f5a8b50df9@nxp.com?part=3D10
