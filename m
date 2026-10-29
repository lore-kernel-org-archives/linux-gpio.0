Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282267;
	b=0mYuZcukOmmDoey8kjoPAQNC2huOQQVMUQEcBf6NaeNR3j1znAi9QIwElgPYA1nCS80d
	 IlY/Uvg1SChKNikpm0uWHpJ+6tK2DdAaqqtj5ZX2l1V197lAjrqMKSk8ftqmJ2Gu2OCDN
	 4iePh6+ZXzc2sRIaiz12v/NHDjQoVT1wArvyBQbh/JhS1x1wAgRvwABNy1JCzoteqNHuW
	 NhwyWJCKH1MP5cCi5jG+YrQ8HfL0fdYOLOPZTDAkZk44ZFQhD/sGEcLas6/rSg2pCSOx6
	 pVHwHB7Hp/PHKzR7MRP73sMgUrgAtOmu+bWNstK1FrOk5ZCLbH4mM6LHHeoGg7CrChg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282267;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7wn9UzqCO9Eos88OM/bNaEjZ0zJDw3Jl5XXivCfKS9s=;
	b=gYv5+6iECJiKqNrq4LC98NRURmEBTdnWPAjb4BXQ7lYUFbERrgnqJ1Pv7rDFZNSXs8Jk
	 shHvHGr5pumEpLXtoe2sBHTJeusDlkaTE+AH4k8Dju+17o/YhYW/zREIvR/9c5OFm9T9M
	 c0bQ4WZxeqMyl+qMm5/7SHUjXfUzLtT2pfuWC5FHc5FaQJyH9QaHyWjHkpijb6HvevTkG
	 tWwet2HnndI5JZio5gxMAc4ZsvtYjD/9tyCqVIniUUajkBNyT6VPXjBvIWv409pX8pOS5
	 GUHbU288QAhe8J2x79cCLNhf4JGgJNyG2tj9ghExPqCrMPUh+bsUb+R92VNWHIyLL0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkTMIaB0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FDD606A31F;
	Thu, 29 Oct 2026 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkTMIaB0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E901F01825;
	Thu, 29 Oct 2026 13:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793282266;
	bh=7wn9UzqCO9Eos88OM/bNaEjZ0zJDw3Jl5XXivCfKS9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bkTMIaB0RXdfBpRj0Rgv73ipqG5yF2rW0SX6l8/Vu2IUPEkMcCFw0tAga08IOnk10
	 8YuzFnBXQTQyIYa3IJLthzbEj2S03kdsrdnsr9oPZFOFtWTfrbwj6MAeIFaEnetJsL
	 glHhdedmSM5rKCzTIh/vJORaF30Y/YOXvnfuVFeCSf9vhRySfYvLngO0hbS5i9gY0T
	 m+Ezci5S1BwEoySY8VoeZShMEvjwnDHkVxJFncdQcF01Uks45KQcotKDedl+WefS3y
	 3eQ5dg6Ri4WY41UlvQRKv17bOAcu9kc+qX1YIEaxOZUmIbq2XIOX/mXVKLgiHZnAQv
	 Nj4zn1JJ1o+Jw==
Message-ID: <sashiko-outbox-189447@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/11] gpio: vf610: propagate return value to callers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261029-gpio-vf610-fixes-v1-2-45b484b4c434@nxp.com>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
 <20261029-gpio-vf610-fixes-v1-2-45b484b4c434@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 13:57:45 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpio: vf610: vf610_gpio_irq_set_wake() breaks GPIO wakeup on Vyb=
rid SoCs
--

commit 4cb6078cbfdf301b9f65c4307b8d2ea1ba2ec0b8
Author: Peng Fan <peng.fan@nxp.com>

gpio: vf610: propagate return value to callers

This commit updates vf610_gpio_irq_set_wake() to propagate the return value
from enable_irq_wake() and disable_irq_wake() instead of unconditionally
returning 0.

> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index adfa2c2d5873d..44b846ff1b936 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -188,13 +188,14 @@ static int vf610_gpio_irq_set_wake(struct irq_data =
*d, u32 enable)
>  {
>  	struct vf610_gpio_port *port =3D
>  		gpiochip_get_data(irq_data_get_irq_chip_data(d));
> +	int ret;
> =20
>  	if (enable)
> -		enable_irq_wake(port->irq);
> +		ret =3D enable_irq_wake(port->irq);
>  	else
> -		disable_irq_wake(port->irq);
> +		ret =3D disable_irq_wake(port->irq);
> =20
> -	return 0;
> +	return ret;

[Severity: Medium]
Does propagating ret here break GPIO wakeup on Vybrid (VF500/VF610) SoCs?

On Vybrid platforms in arch/arm/boot/dts/nxp/vf/vfxxx.dtsi, all
fsl,vf610-gpio controllers (gpio0 through gpio4) inherit mscm_ir as their
interrupt parent:

arch/arm/boot/dts/nxp/vf/vfxxx.dtsi:
	soc {
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		compatible =3D "simple-bus";
		interrupt-parent =3D <&mscm_ir>;
		ranges;

In drivers/irqchip/irq-vf610-mscm-ir.c, vf610_mscm_ir_irq_chip sets neither
.irq_set_wake nor IRQCHIP_SKIP_SET_WAKE:

drivers/irqchip/irq-vf610-mscm-ir.c:
static struct irq_chip vf610_mscm_ir_irq_chip =3D {
	.name			=3D "mscm-ir",
	.irq_mask		=3D irq_chip_mask_parent,
	.irq_unmask		=3D irq_chip_unmask_parent,
	.irq_eoi		=3D irq_chip_eoi_parent,
	.irq_enable		=3D vf610_mscm_ir_enable,
	.irq_disable		=3D vf610_mscm_ir_disable,
	.irq_retrigger		=3D irq_chip_retrigger_hierarchy,
	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
};

When a consumer calls enable_irq_wake() on a Vybrid GPIO interrupt, the call
chain irq_set_irq_wake() -> set_irq_wake_real() -> vf610_gpio_irq_set_wake()
calls enable_irq_wake(port->irq), which invokes set_irq_wake_real() on
port->irq in kernel/irq/manage.c:

static int set_irq_wake_real(unsigned int irq, unsigned int on)
{
	struct irq_desc *desc =3D irq_to_desc(irq);
	int ret =3D -ENXIO;

	if (irq_desc_get_chip(desc)->flags &  IRQCHIP_SKIP_SET_WAKE)
		return 0;

	if (desc->irq_data.chip->irq_set_wake)
		ret =3D desc->irq_data.chip->irq_set_wake(&desc->irq_data, on);

	return ret;
}

Because vf610_mscm_ir_irq_chip lacks both IRQCHIP_SKIP_SET_WAKE and
.irq_set_wake, set_irq_wake_real(port->irq, 1) returns -ENXIO. Previously,
vf610_gpio_irq_set_wake() ignored this and returned 0, allowing
irq_set_irq_wake() on the child GPIO IRQ to set IRQD_WAKEUP_STATE so that
suspend_device_irq() left the GPIO pin unmasked while port->irq remained
active as a chained interrupt.

With this change (and after the follow-up commit 614715b30c6f ("gpio: vf610:
simplify with irq_set_irq_wake")), irq_set_irq_wake() on any Vybrid GPIO IRQ
fails with -ENXIO, preventing IRQD_WAKEUP_STATE from being set and causing
suspend_device_irq() to mask the wakeup GPIO interrupt in PORT_PCR(n) during
system suspend.

Should vf610_mscm_ir_irq_chip also be updated to set .irq_set_wake =3D
irq_chip_set_wake_parent (or IRQCHIP_SKIP_SET_WAKE) before propagating this
return value?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-gpio-vf610=
-fixes-v1-0-45b484b4c434@nxp.com?part=3D2
