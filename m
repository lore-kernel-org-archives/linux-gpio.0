Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294705;
	b=w5G1avMo4C5I+v036VcWYW0o9GZM/Yjgtp50+/eDrpmHljohanrPHtQ7A6YBCXAt/+MI
	 yZAgngIl5oqQrPk5BieVadp10J06eKmKvKSUqOI7Q6cxCv1Rhx+PVo+/ClnXkXRvu1duw
	 1FHHbD1zNmAEziLNSVAe6enqiABx6vhi+VpKJm33pb1M9eBGT77V4hz4UhCMMvTbvFJxR
	 qt/qEcDCCbADW6/iwX8HT0YMlj4iNxQWnyDU9lHydsrmdn8PcbhT7+iMjb7Wf9IwXDVuL
	 VQBb1OCbIDDl7qdIQnTt+L9JRHvvD2S8jez8d0hDOVyVIT0bdsmy1ZrgBPWEVa5fCSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294705;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=60R5WeS1rgNrb5meYWj/ZBAedO6KkIeGhnZIgJix0O4=;
	b=dDd3NyukTuib23WSZ5ZBTA/d9WZ7epDy27p/Kmo92+mba7WjpxNqbniH1BTv0Psubv12
	 IZthb69aM866H0N7S2yPLCK/ZM2tQSwxSM41g+mvvMGWwNlaHr4YmtOMSUrBMMau4qI+L
	 e5kgmuokDTWxinjKsVrJa8tp92KHeDJBdCfMo/NTySWoFJAVm6P6KhZls0QX5EX3KoMCT
	 4UGRUdvaiABkd/dJuCuoV3jsCw5aoDzEgEqctsMHHTgUsMTBme9i2mMk53fAKrcFNMY1t
	 nOfMP/RMDJGXjK40UJYtU7Nm+LseIZER2jPdL6LvasSLk5z4+XLoqPtOBXy4QuR9p0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duilaTeI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74832606A330
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 07:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duilaTeI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D0B1F008A2;
	Tue, 10 Nov 2026 07:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294705;
	bh=60R5WeS1rgNrb5meYWj/ZBAedO6KkIeGhnZIgJix0O4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=duilaTeIPcudQZqUgDJ5aF/v6xV4eafLbnUjM+hcv43vyNPoNaAWXhbiyE6VI5sCj
	 SuZ0n2hlmddWyA+NusbqE0UV+sjihXxjZK4B8SdJWMBKgqxIG70fCdSjj255JrdzNa
	 UEAqbha1DsXRND520kzLcWKNbgZc8/GVvODTZxvYnn7E9AQlgNwaXKgkvmFVc6+e9e
	 z4W4I/Nn9FURCTJfybokqTqJwPms9XKgo5xhsVfT/1lCniM6fDSgt4fiGoEYZgVhMY
	 P2Q7kqVIBxpOO9LqrVWhlKNg8mJ60gQdudn+8Lqvj7wvHn5Rm3scna+biEpxXktNoi
	 873NDczWfqlQw==
Message-ID: <sashiko-outbox-206463@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangwu Lai" <laixiangwu@cmss.chinamobile.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261110065722.1340-1-laixiangwu@cmss.chinamobile.com>
References: <20261110065722.1340-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:11:44 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] pinctrl: stm32: incorrect Fixes trailer in commit message
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] pinctrl: stm32: clock leak in stm32_pctl_probe() [1]
--

commit 7844cefd15f00547f16870f8594d1153fe131bff
Author: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

> pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
>
> stm32_pctl_probe() acquires an exclusive reset control for every GPIO
> bank with of_reset_control_get_exclusive(), but none of the error
> paths release them again: the bank loop returns directly on
> -EPROBE_DEFER and on a failed clock lookup, and the
> clk_bulk_prepare_enable() failure and the err_register path also
> leave the already acquired reset controls behind.
>
> On success the reset controls are kept for the lifetime of the device
> and are never released either (the driver has no .remove), but that
> is harmless.  On a failed probe, and in particular when the probe is
> retried after -EPROBE_DEFER, every attempt leaks another set of
> reset control references.
>
> Release the acquired reset controls on all error paths.
>
> Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_nod=
e() helper")
> Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>

[Severity: Low]
Commit bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_node()
helper") only replaced the child-node iteration macro without changing how
bank->rstc was acquired or cleaned up.  Should the Fixes tag instead point
to 2254e77665d5 ("pinctrl: stm32: defer probe if reset resource is not yet
ready"), which moved the of_reset_control_get_exclusive() loop into
stm32_pctl_probe() and added the -EPROBE_DEFER return path?

> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm3=
2/pinctrl-stm32.c
> index 405ebb22c9eaf..02410e57f97d7 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1963,15 +1963,17 @@ int stm32_pctl_probe(struct platform_device *pdev)
>  		bank->rstc =3D of_reset_control_get_exclusive(np, NULL);
>  		if (PTR_ERR(bank->rstc) =3D=3D -EPROBE_DEFER) {
>  			fwnode_handle_put(child);
> -			return -EPROBE_DEFER;
> +			ret =3D -EPROBE_DEFER;
> +			goto err_put_rstcs;
>  		}

[Severity: Medium]
This problem wasn't introduced by this patch, but does jumping to
err_put_rstcs without calling clk_bulk_put(i, pctl->clks) leak the clock
references [1] acquired in earlier iterations of the loop when
of_reset_control_get_exclusive() returns -EPROBE_DEFER on a subsequent bank
(i > 0)?

[1] https://sashiko.dev/#/bug/linux-022b050a-8471-43dd-a330-d8c0a082f0ff

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110065722.1340=
-1-laixiangwu@cmss.chinamobile.com?part=3D1
