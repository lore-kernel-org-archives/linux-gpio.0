Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3CA2749C1;
	Tue, 13 Oct 2026 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873309; cv=none; b=UNGinsMD7xaen8vOaNPaCOAXM0CuRpwe/Qro77SNtpDir/fQrNf4HP0eWLJQghWbpSYDtjGVNZAN/Bqn+tz4m1uUmYZBLDagYxvgLd/0Zg/mzOP55d8YvPHnjZpwVSif46f6FnqFBkpmDWokntWvPymGgY5w/ZGflXduKXZtgS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873309; c=relaxed/simple;
	bh=gd0LagBJjnH9V8B+vhte51oZfnXVH/1HQmXLZCfxIYw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hNDTmadPYwoJNSDhDtZyFQVY4OUTDLTy2r7fY/HuzEri4vFewMSgYDrTO3Knflh79dXIPSbt27pqN5qX+1k8yq/K7HKFA99nR77R9hCxjPyNdOvrDxoRuBTKF0di+ZNDLxrFIYBWiLBZRuPUuGbT4QguQFz1m4CYhyiWztOrYD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Myx0JJWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Myx0JJWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8499B1F000FF;
	Tue, 13 Oct 2026 06:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791873307;
	bh=iFofP8v6Vao3Q4BkXopniSrnzh3Hw77unOt0JxnlVY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Myx0JJWHygHIsD3V/IChlQ5lnF6K5PDq2BgjyecK/o5CFSfO4xfQG+rZa2J3Kwh6Z
	 tJkfQIf8/RfvAkzePBw83ptp7KKKHk0o/RE/OSAKETz12Lim/8/g0GiNv6vvtewd9Q
	 7Bx3oa4nH6lxlblOi6MwtTJTh3BoEqq2EpI1Q6EjXIcW/l5ge2OH2QlNb8GMDLCxtI
	 6JIAP1M8CQ67JlxnvrCzmz3c3njgG7+OpPr8giXnu8ZO3BS5iSbNJQc/0qMS/hErIK
	 DKca13422ZYEvQn5UUkQa39MbrlQuEwcxL9Co5gSfwlZKCAqp8JHJ384sYEDK8LXxu
	 QHcEUPu5Lc4+A==
Message-ID: <sashiko-outbox-169107@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] gpio: mxc: fix wakeup_pads bit operations
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
 <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:35:07 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpio: mxc: missing for_each_set_bit hunk and sign-extension bug
--

commit 163a0b84d8efa779538111b96ea2ce2543fbd9da
Author: Peng Fan <peng.fan@nxp.com>

    gpio: mxc: fix wakeup_pads bit operations
   =20
    gpio_set_wake_irq() can be called concurrently for different pins on
    the same port. The writer-vs-writer race is the concern: two concurrent
    gpio_set_wake_irq() calls for different pins on the same port both do
    a non-atomic read-modify-write on the same wakeup_pads word.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 7e17d7668980d..e3a80f17d0412 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -72,8 +72,8 @@ struct mxc_gpio_port {
>  	unsigned long both_edges;
>  	struct mxc_gpio_reg_saved gpio_saved_reg;
>  	bool power_off;
> -	u32 wakeup_pads;
>  	bool is_pad_wakeup;
> +	unsigned long wakeup_pads;

[Severity: Medium]
The commit message states "The reader side (for_each_set_bit in
noirq_suspend, wakeup_pads > 0) runs in noirq context", but it appears
the hunk that changes this loop is missing from the patch.

Because wakeup_pads is now an unsigned long, the existing loop in
drivers/gpio/gpio-mxc.c:mxc_gpio_set_pad_wakeup() has a sign-extension issu=
e:

	for (i =3D 0; i < 32; i++) {
		if ((port->wakeup_pads & (1 << i))) {
			...

On 64-bit platforms, when i =3D=3D 31, the 32-bit signed expression (1 << 3=
1)
evaluates to -2147483648. When bitwise ANDed with the newly widened
unsigned long, it sign-extends to 0xFFFFFFFF80000000UL, which inadvertently
masks against bits 32-63 as well.

Could the missing for_each_set_bit hunk be added to resolve this?

>  	u32 pad_type[32];
>  	const struct mxc_gpio_hwdata *hwdata;
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gpio-mxc-c=
leanup-v7-0-c4d769587d3e@nxp.com?part=3D3
