Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777897;
	b=XLZ4M9RlQKb7fIhX56XLkh14BWmiyL0oIynZkSVW1P07aT0CfROFrdqYlxVs+/s+lh4j
	 E+4GiDp/ZZL6nibOmOLM3z36ke/WjrpaJYxJPXkF7Xhm5fbXIfCSLo3e8BIz4ahXjHeoh
	 UB+bSW3xgKc66Ey8LvHvOAMngbAPxkBc61dB3Kc6Pj9+niHOQSfw1aLlxaDe22O/jRreW
	 fLhRQqtVXprokl4mgFBaTsdbeVdacdDSANBBE7RiYM6OmuaZg8VHgBMUulDUrp0T5xWgB
	 D98xndjYN3xscmJQxR2ojaA9pbImXYJRRz1OURyFnLEs23W2OnR+Zsq6qAO6o0rTCkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777897;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YUdKAW2x5w2v94/Dk5NtaV5xZ2U2hyZ3tpd5fn6Hdj8=;
	b=d88zEofxdRIvONuo/iNxS8zJqQoSWy0LBL+tWDfeJxaNs4UwPlGSLnGTXFpgiq4WRtVZ
	 eBCe+nnU1otv9K0TIk430lZ7jlEsQSIeKhHlhdZsrkE/SUNgWEVTS83iRQCHSqYZAuOIC
	 8EnTtWE7mChzPC77P/JBdIaBqn+oQAt+bbDt1NHf+rjtUs1NCWscD9k74WGHMCNwNqQMB
	 /Cr7V1tdq7QqgDF7L1mh0p/v3u7HXtPsUvVMlIjeD1hz8qtpuwdz9uSyXFbrngmhu5rIC
	 1Kni2ED6T3zzgny8TZtW53VfN+WtwdbZDLwuw/jbrvDR4Mh+m4TUVmpBuqbc8dNgXSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CGAmG/pZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BEC606D827;
	Wed,  4 Nov 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CGAmG/pZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C047C1F00919;
	Wed,  4 Nov 2026 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793777897;
	bh=YUdKAW2x5w2v94/Dk5NtaV5xZ2U2hyZ3tpd5fn6Hdj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CGAmG/pZC47VPPxRm6FEq6WdcQy4WlNnPe0hGKyTkj1Ok9ybcswIIiI6Ix4W4e2Hq
	 mJ5htyrHKDG2zg1FYcmVe/WCreKcfr4LAJq2KL9S9ESGTqubEQ0riehtN0Qf5Yhuc/
	 il8ZKORJH5YQIHNcFPGPSrHSmKOZcb9ey7tKPYyoqxAM9/dQXTTj11PZK73QJL7/Qa
	 LrRhO8BSZBjgWXWTBNflJwL4nPvCuOXEUwuWbMPPjIkJR/sPKIYSnO9YwrLDWRC2Av
	 2+tm45RTPHAvKuLGtVeY1pX9S4SvAnptMgRnCb613rsXIk+y46ejm8JxtLcjdqYDJm
	 Smhi9eVpIIK3Q==
Message-ID: <sashiko-outbox-196803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:38:16 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] gpio: siflower: Kconfig depends on undefined MACH_SIFLOWER_MIPS
- [Low] gpio: siflower: sf_gpio_probe() open-codes deasserted reset helper
--

commit 22b6fa5e482223ae6c4b545f3ef7b8a0b9775f11
Author: Qingfang Deng <qingfang.deng@siflower.com.cn>

gpio: Add Siflower GPIO controller driver

This commit adds a GPIO and interrupt controller driver for Siflower MIPS
and RISC-V SoCs, including SF19A2890, SF21A6826, and SF21H8898.

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e4280029d86..6125a8452a5bf 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -721,6 +721,17 @@ config GPIO_SIFIVE
>  	help
>  	  Say yes here to support the GPIO device on SiFive SoCs.
> =20
> +config GPIO_SIFLOWER
> +	tristate "Siflower GPIO support"
> +	depends on OF_GPIO
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST

[Severity: Medium]
Can CONFIG_GPIO_SIFLOWER be enabled without CONFIG_COMPILE_TEST?

MACH_SIFLOWER_MIPS is not defined anywhere in the kernel tree, so this
dependency always evaluates to n unless COMPILE_TEST is set, and causes
scripts/checkkconfigsymbols.py to report an undefined Kconfig symbol.

Additionally, the commit description, Kconfig help text, and driver header
state that this controller is also used on Siflower RISC-V SoCs, which would
be excluded by a MIPS-only machine dependency, and the driver only uses
generic device property and platform APIs rather than OF_GPIO internals.

> diff --git a/drivers/gpio/gpio-siflower.c b/drivers/gpio/gpio-siflower.c
> new file mode 100644
> index 0000000000000..6eb560da7ffd5
> --- /dev/null
> +++ b/drivers/gpio/gpio-siflower.c

[ ... ]

> +static void sf_gpio_reset_assert(void *data)
> +{
> +	reset_control_assert(data);
> +}
> +
> +static int sf_gpio_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	priv->rstc =3D devm_reset_control_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return PTR_ERR(priv->rstc);
> +
> +	ret =3D reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(dev, sf_gpio_reset_assert, priv->rstc);
> +	if (ret)
> +		return ret;

[Severity: Low]
This isn't a bug, but could sf_gpio_probe() use
devm_reset_control_get_optional_exclusive_deasserted() (or
devm_reset_control_get_exclusive_deasserted(), since resets is required in
the devicetree binding) instead of open-coding the deassertion and custom
sf_gpio_reset_assert() devres action on top of the deprecated
devm_reset_control_get_optional() wrapper? That would also allow dropping
rstc from struct sf_gpio_priv.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
gpio-v1-0-45e463c48728@telaak.dev?part=3D2
