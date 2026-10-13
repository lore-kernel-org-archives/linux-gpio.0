Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5437F472F63;
	Tue, 13 Oct 2026 06:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872769; cv=none; b=twHGJOjduZdW0uxsXRgBjHWUtW5+XOfGrSRxs4D19gxWI/hKu35HgsLaqviO8UWgkX/Tj9YAvfziIONM/Xk09F0x95ULYgWA4NiYzIORfuVdKiiX8pdoDVo17v4knJWRzZ9UFDmaehzsdSTYeLaCEwuTaoY4/iVMW03mvLYX/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872769; c=relaxed/simple;
	bh=xp7ZLRwwkKk0wFtzLb9LwR7ClOdw8anOJ+SvfUCH9UQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OWRgl+yNM22IcoOlso1FA0w5z5W91XYlDP+vtB+JKtnC+VUb75p1jlgXsE4PxzFVH90Ux8+7pdqtb3gCjm8KTL7vyCwXWg8IZEPW/7eV/989rIKPvX5MWjUEavKEgQZ27FTTQFhnQdt1I/WqPx72+GdkQCnnrzQKP/9z6RkX+YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAc326eu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAc326eu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E8A1F000FF;
	Tue, 13 Oct 2026 06:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791872767;
	bh=oz5CL/v92Uqu04dTTsPNWPuIhZWu53ndAsDsFKnTcls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EAc326euRk1zWpmfmgN6icZrvuVI72rWBOrtd0an5+b0GLZud3I13U6rfPYeTkvxq
	 f70DddDqtn4+223+ayfr66CGyEO0iXrZVnZscHbAfg9CyPqh0MuF9uubaH2SlCinYe
	 6e2xx+k7moJunS1BMeu2+9y3y8ZCXCzjZX2chZ9JoFe+zz5+iXLaICr5cg/6vybLCn
	 G++WuFAYiGSbjaLMEOW8y35gd1VdJKxfIAfwSMl/oyR3d19A2oBoD9rfkXwzeAe5je
	 AWycPZkRx6oNPRxw3SpyXHDsjJ02W4OhV9oliDKHyH/lGvVw9W2bofy3UqMOsfEMn/
	 KZGLq+u6HiLBg==
Message-ID: <sashiko-outbox-169085@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] gpio: mxc: fix both_edges bit operations
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-2-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
 <20261013-gpio-mxc-cleanup-v7-2-c4d769587d3e@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:26:06 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpio: state corruption on error path in gpio_set_irq_type()
--

commit 3d5872f9d45fab5b313d49ded5e6a9aacb019069
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: fix both_edges bit operations

This commit converts both_edges from u32 to unsigned long and uses atomic
bitops to prevent concurrent updates from overwriting each other.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index e05f276a50e8d..7e17d7668980d 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c

[ ... ]

> @@ -168,7 +169,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 =
type)
>  	int edge;
>  	void __iomem *reg =3D port->base;
> =20
> -	port->both_edges &=3D ~(1 << gpio_idx);
> +	clear_bit(gpio_idx, &port->both_edges);

[Severity: Medium]
If a caller requests an unsupported IRQ type, the switch statement later in
this function falls through to the default case and returns -EINVAL:

	switch (type) {
	...
	default:
		return -EINVAL;
	}

Could clearing both_edges early here leave the software state desynchronized
from the hardware on this error path?

If the hardware was previously configured for dual-edge interrupts, test_bi=
t()
in the IRQ handler will now return false, failing to flip the edge and
potentially leading to a stuck IRQ line or interrupt storm.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gpio-mxc-c=
leanup-v7-0-c4d769587d3e@nxp.com?part=3D2
