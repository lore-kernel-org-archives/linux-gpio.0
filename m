Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415736;
	b=3LioZ7lgoQNeoqyoz1cS8rm7bG94+Zi6DET/dRMMFjDd0cjWHnKjAksc0MjtrQlAhKbS
	 k6gd/xHPv6GhmhMbxMNiHUvtqqZN5MxGeLMDGRnvuwEZ5sb4PyUdM4cIoRLCG1P0UXavZ
	 9ckvGBouE+/usautmQ7MKCbaMUjD8k+ZLVCFM5qMkCSVxtKy1XVxSizT5S966YIyBJtKk
	 Voek2Zwfqe0JA80vN84lViFzVWNxX/4cv5kgo5SVdi3TAUl2tBCwEoaDUIouKMZuHIGf0
	 qtBn1tEt1dVG4vypLXxzjq0sjxoCUi+RcEmo3ZB4IY/xRSqdy7oE5LUZK5W2nQ973BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415736;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JV2i2sA1wBgIS8U0QwIVZQISYML+TLoeyyNk69l9Q/s=;
	b=5lUUYQhE4MgOaX3jOYjBqSsLDMEWXR+cp+NEuGYwIQR/LPVsUPEjOjP7YvFGNZSQwKky
	 Z8MZMSxS/U0irp+cdTXT4gicDANkyGDx8LVOWOkjl+SLs+TQDDz0r6w6nOfTDFiieJTYk
	 yocXi3d6h0+PM98MM3WGGfI4cT1ibyUMUS/M+W23de7kNmcOdik+szsOD/ALbFs7VnKap
	 DilBB9zWHJeIJCPkromkx536amdaNJ6qpaaeqQ39Ik3Limt+/3YcuzLr/9ap0So9sH8Lm
	 h3YTVWTcu+UBq8Yd4Daal7qHuXemcT5ptCVn4kuXBSlxG17/6x4qmfHjZQScS2VpHFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cs4M6kzB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E1606A337
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cs4M6kzB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7DA1F00A06;
	Wed, 11 Nov 2026 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415735;
	bh=JV2i2sA1wBgIS8U0QwIVZQISYML+TLoeyyNk69l9Q/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cs4M6kzBQB/kD2PAnu0hmQOarcUFhzWkezly4orlireLExY+CBeB2LOnGCTyDGMct
	 1OtJP9L8T1c5BCcCeYMMEVfNVkhUq4DmSoQft4b58exhdKOyES0sBe09uFu7cxb8Cs
	 zV6EbXo5EaqUVdH+Dbksd6X1H+UeSXpu3yL0HPfwKmrz0+VwG19Ew/J9o8VY2zgKOl
	 SGGFLzpN+iR9tA0jEoGf5KdYmLIA7aIOFHdZbpcQnc9eIAVQfGcIbZtimTP4W3yqO8
	 OeuHjAOoqaOWGQzoOl8Fk2DKYvgPgFfiZdU/S28k0tTu5aMLlpRFAkxBdJNhUVhS+F
	 fGELbhfx/7n0A==
Message-ID: <sashiko-outbox-209326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: amd: Steer GPIO interrupt to low
 power/efficiency cores
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261111-superm1-pinctrl-power-improvement-v1-1-4bbe6cdbd2e8@amd.com>
References: <20261111-superm1-pinctrl-power-improvement-v1-1-4bbe6cdbd2e8@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:48:55 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] pinctrl: amd: offline low-power CPUs prevent fallback in
  amd_gpio_set_irq_affinity()
- [Low] pinctrl: amd: UML build failure in amd_gpio_set_irq_affinity()
  under CONFIG_X86_64
--

commit 9979566a45b6fdd26d48ee240bec752ee33586ba
Author: Mario Limonciello <mario.limonciello@amd.com>

pinctrl: amd: Steer GPIO interrupt to low power/efficiency cores

This commit steers the AMD GPIO controller interrupt to low power or
efficiency cores on hybrid x86 systems during probe using
irq_set_affinity().

> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 30da75bb93b9a..3ae199cc93435 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
[ ... ]
> @@ -1272,6 +1274,41 @@ static void __iomem *amd_get_named_res(struct devi=
ce *dev, struct platform_devic
>  	return base;
>  }
> =20
> +#ifdef CONFIG_X86_64
> +/*
> + * On hybrid systems prefer to service the GPIO interrupt on low power c=
ores,
> + * then on efficiency (dense) cores to save power.  Userspace can still
> + * override the placement.  Do nothing if neither core type exists.
> + */
> +static void amd_gpio_set_irq_affinity(struct amd_gpio *gpio_dev)
> +{
> +	static const enum x86_topology_cpu_type types[] =3D {
> +		TOPO_CPU_TYPE_LOW_POWER,
> +		TOPO_CPU_TYPE_EFFICIENCY,
> +	};

[Severity: Low]
Does guarding amd_gpio_set_irq_affinity() with CONFIG_X86_64 break 64-bit
ARCH=3Dum builds when CONFIG_COMPILE_TEST is enabled?

On 64-bit User Mode Linux, arch/x86/um/Kconfig defines CONFIG_X86_64=3Dy
without CONFIG_X86, and the UML processor headers define struct cpuinfo_um
rather than enum x86_topology_cpu_type or per-CPU cpu_data(cpu).  Guarding
this with CONFIG_X86 (or excluding CONFIG_UML) would avoid the build
failure.

> +	cpumask_var_t mask;
> +	int cpu, i;
> +
> +	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
> +		return;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(types); i++) {
> +		for_each_possible_cpu(cpu) {
> +			if (cpu_data(cpu).topo.cpu_type =3D=3D types[i])
> +				cpumask_set_cpu(cpu, mask);
> +		}
> +		if (!cpumask_empty(mask)) {
> +			irq_set_affinity(gpio_dev->irq, mask);
> +			break;
> +		}
> +	}

[Severity: Low]
Can offline low-power CPUs prevent amd_gpio_set_irq_affinity() from falling
back to efficiency cores?

When a CPU is offlined via hotplug on x86, remove_siblinginfo() leaves
cpu_data(cpu).topo.cpu_type intact.  Because the loop iterates over
for_each_possible_cpu(cpu) and breaks unconditionally whenever mask is
non-empty, if all TOPO_CPU_TYPE_LOW_POWER CPUs are offline when
amd_gpio_probe() runs, irq_do_set_affinity() rejects the offline-only mask
with -EINVAL and TOPO_CPU_TYPE_EFFICIENCY is never tried.  Iterating over
for_each_online_cpu(cpu) (or checking the return value of
irq_set_affinity()) would allow the fallback to proceed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-superm1-pi=
nctrl-power-improvement-v1-1-4bbe6cdbd2e8@amd.com?part=3D1
