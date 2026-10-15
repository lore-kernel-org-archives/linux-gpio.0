Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3726649EC40;
	Thu, 15 Oct 2026 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062275; cv=none; b=oprB8ynUXXbRFP6UeQwNd+jrqo5KYWSHaSDI//H+e+mpPVhgrQXdM5OhfGW0g6orhyarMHG356l5lj4EerCSQPnuaWRZNpK1MyLGaRKR4MUXxTK/oLVPht1iyDM+Ddf7y5exeNgWvKi6OVMwWaWGr7XUiaqPbvAHEcF6ThLyu+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062275; c=relaxed/simple;
	bh=RF/KMPMgUjMHPH2UOBhuPSyWZgNANaGAK7YsTeHxkOs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DeygdZiCrLgSPxvfKo//s269JYnM2iHDi/gZxUWTqD+BRoOCicDP7+hP8b2rbn9o6BO4Vo9YY3y2bFfmHQ6Ol7607zCahT6Q/lelxMODH+c0KjO70FksIHlobjMSONmtGR6fL3y3veEDb1YxmTERa4Ji2H80aBZ5Gwb8kLwf/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRSXoWWB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRSXoWWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29B91F000C4;
	Thu, 15 Oct 2026 11:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792062274;
	bh=1je7H4Q7odwuqsGqgN6EcXOFN/kRbC6SsC3IRsKvsDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DRSXoWWBMeHxdQ2ZPzo0JjHxkolbwvvmFQdwjQAV+b2wKpnBu+5II2s5zZHMsmDUX
	 TdJmvfqWISk1pHwbTutG0WCSzRlyepnO9T/BKZYfMhOQLLPHIJUGVb0WiXSHIeubIz
	 38DisaLOrg8MwFg9vPU85pAGRiWYtEv3iVCmarvd9QsILQd+Xk6mCL/ZN42O2Ti8Jl
	 T/yUogUJ8j+cHSl9Ep7jlgV0y9dlHUEL+9mHf61f2HK06lRTU84rp93+vS0g29LtTQ
	 UzstPUS/zQG6IQR3n9PHYPEu+QmY/KCHNSNHP1yfRG5k4225LcoAJeMA+qH4AN22YD
	 f2D8cS1PlhmEQ==
Message-ID: <sashiko-outbox-172713@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 7/8] gpio: pl061: switch data path to gpio-regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-cv75-gpio-v10-7-3fe3eb315a55@ambarella.com>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
 <20261015-cv75-gpio-v10-7-3fe3eb315a55@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 11:04:33 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: pl061: irq_domain use-after-free on teardown due to devres L=
IFO order
- [Medium] gpio: pl061: Missing IRQ resource helpers allows concurrent GPIO=
 direction changes
--

commit 754bf2316c41a0da3dbb26f8d31b1ba0d0a17c9d
Author: Long Zhao <longzhao@ambarella.com>
Subject: gpio: pl061: switch data path to gpio-regmap

This patch moves the PL061 get, set, and direction operations to use
gpio-regmap. It keeps a custom irqchip and irq domain, creating the domain
with private data and attaching it via gpio-regmap.

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 5c6d4209dc8e7..3822faa3e2768 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
[ ... ]
> @@ -325,67 +284,159 @@ static const struct irq_chip pl061_irq_chip =3D {
>  	.irq_set_wake		=3D pl061_irq_set_wake,
>  	.irq_print_chip		=3D pl061_irq_print_chip,
>  	.flags			=3D IRQCHIP_IMMUTABLE,
> -	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};

[Severity: Medium]
Does removing GPIOCHIP_IRQ_RESOURCE_HELPERS leave the interrupt pins
unprotected against concurrent GPIO direction changes?

Without the .irq_request_resources and .irq_release_resources callbacks,
the gpiolib gpiochip_lock_as_irq() helper is never invoked when an interrupt
is requested. This means userspace or other subsystems could inadvertently
reconfigure an actively interrupting pin as an output.

While omitting the default helpers avoids crashing since
irq_data_get_irq_chip_data() now returns struct pl061 * rather than
struct gpio_chip *, are custom callbacks needed here to properly fetch
the gpio_chip and lock the line?

[ ... ]
> +	gpio_regmap =3D devm_gpio_regmap_register(dev, &config);
> +	if (IS_ERR(gpio_regmap)) {
> +		if (pl061->irq_domain)
> +			irq_domain_remove(pl061->irq_domain);
> +		return PTR_ERR(gpio_regmap);
> +	}
> +
> +	if (irq) {
> +		ret =3D devm_add_action_or_reset(dev, pl061_remove_irq, pl061);

[Severity: High]
Will this devres registration order cause a use-after-free during device
teardown?

The driver registers the GPIO chip via devm_gpio_regmap_register(), which
queues a devres action to unregister the chip via gpiochip_remove().

Later, devm_add_action_or_reset() is called to register pl061_remove_irq().

Since devres actions are unwound in LIFO order upon device unbind or probe
failure, pl061_remove_irq() will execute first and free the irq_domain:

pl061_remove_irq()
    ...
    irq_domain_remove(pl061->irq_domain);

Afterward, the gpio_regmap teardown action runs and calls gpiochip_remove().
This function iterates over active IRQs and dereferences the domain to
dispose of mappings:

gpiochip_remove()
    ... accesses gc->irq.domain ...

Since the domain was already freed by pl061_remove_irq(), does this result
in a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-cv75-gpio-=
v10-0-3fe3eb315a55@ambarella.com?part=3D7
