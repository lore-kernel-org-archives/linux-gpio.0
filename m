Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9C4A6CE7;
	Mon,  5 Oct 2026 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210878; cv=none; b=gzv5HYxuZTCG72JlMrnb7xd90zm+kxMK2YgMiBreB+B/kNWoXOG07vCEHbhZSRORaTTaNlPUQFGwPO/iqNmPl1JGVS2skqnBNnM3HW0j6QWysgeO7xSUn/gxDszaAPKcblC7jSw/YKlCrQYTldLxP+bTNSKyQfHhl1JOVNvFVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210878; c=relaxed/simple;
	bh=My+SvoBsA5z15T/Eq4EiLnIKF6HXggsPNQxdBE9oFqI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oNbO+S9EdtKzllGALyzl87W0Qxs9CAcgqR8CQ3MMF0n04PxTVM24ZLSoieD3bgjPQuoaAcAvDmYN1UHdIAmgnkuwkyLo0Ehd1ppmv2tP7Br8+Ps6K3GybZBlwiRugziqWrBCMjg7RBGkK0Uwf5RblFh9C5PVby85gqMxOQCHmCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9X/tKXM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9X/tKXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3601F000FF;
	Mon,  5 Oct 2026 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210868;
	bh=RB9CKS+0+O1toVBKe1zplBpHg/zeV7wcwLjtwpOoPZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y9X/tKXMyDTIBZAWLPvJF3nhzLqCsPkk0L36/weNFlBmIw/vsNpJ/3FZlFgDn0Shg
	 05S8sDQmHmwWVow+iLBCCqNFQhe7q+zk5UHmDQDIrsQLOdbfIphV2vcVBWDyr5F6Zz
	 tH0NQyJbz9UWBOexjHXYrAlJ1tRs13Zxvlr2M7iasko54/nXxsSg0/4vrMIFCfEGBh
	 6Ykm2mBFiENjip+9PIgMuWmB9XkNAEmN1hVGLZGPDwT+pMzvOzG5coNM7kU9ZKKD+2
	 IzQmrZjd37m0+MxPNjVQ8AkxaFe/coWwDy9VYujxAxbf78dzi8VR9YfkeHj6P6dJpl
	 GOfrfLEmnmd+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] gpio: mxc: use local dev variable
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-gpio@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-7-bdc3afbb35e2@nxp.com>
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
 <20261005-gpio-mxc-cleanup-v2-7-bdc3afbb35e2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:34:28 +0000
Message-Id: <20261005143428.6F3601F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] gpio: mxc: implicit inclusion of linux/of.h
--

commit 28b12eaf4d41de364ce05354d1c3c8a369023e5d
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: use local dev variable

This commit introduces a local dev variable to replace repeated &pdev->dev
dereferences in mxc_gpio_probe() to improve readability. It also switches
to the device-model device_is_compatible() API while retaining the np
variable for of_alias_get_id().

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index c92331f192f91..d762d03c8d6a3 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -24,7 +24,7 @@
>  #include <linux/syscore_ops.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/generic.h>
> -#include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/bug.h>

[Severity: Low]
Does removing the linux/of.h inclusion violate the 'include what you use'
(IWYU) principle?

Looking at mxc_gpio_probe(), the code still explicitly relies on
of_alias_get_id() when CONFIG_GPIO_SYSFS is enabled:

        if (IS_ENABLED(CONFIG_GPIO_SYSFS))
                port->gen_gc.gc.base =3D of_alias_get_id(np, "gpio") * 32;

While this compiles today because linux/of.h happens to be implicitly
included through other headers, could removing the explicit include cause
future build breakages if those internal include chains change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-gpio-mxc-c=
leanup-v2-0-bdc3afbb35e2@nxp.com?part=3D7
