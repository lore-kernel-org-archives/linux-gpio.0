Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC16F49E5D5;
	Thu, 15 Oct 2026 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062528; cv=none; b=ghjo1ADC7Dygb+RXZsTISPO2VJsb5OM+SkPChFI3QCMsRQKE1hXWTXx/ZG4T0XDvcUfVHDLiZyuz8EseykSvnR07QBsdWwVlVIhAP1uUmZL4wFSnTsgDhN/9Lth5c9I0whzzUgrD77utssaCedB5kfA80a+f195bz6cA2QqBOq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062528; c=relaxed/simple;
	bh=2OUc6ZLrpq0EaaPrdu3o4CdBqQXylIoH7198RAZua6E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QkAap/Zaik6GAmJgA7GYDbc0CRHd863hhRLfpb1AuNF4NZ9BEms2kLbHJCCAL7J0K1IfDbgssnSAAU6Sfc05e+0RuDvZGqnR4Nrtn4PWDqNsSMz5a0wdIqe15iTPQZ+vom9DsA2/J7AmFQ7SbTKEiYy/v85VydBhs+Z20w7vsCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMXORaSC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMXORaSC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0B11F000C4;
	Thu, 15 Oct 2026 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792062527;
	bh=vLJwIYeR8m3GJNKcDAdMHWr1J4usZXU17N/Hp340TCY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMXORaSCqUgIGySJNAHpISNstjdXZtO18nindESN2ah24sLiC2tdhyBTjn/4Xco60
	 aWIyRweXKfLfpCq0HzOQhzpyB9lNmtmRCCJ9D/m5qqiC0R1pTR2AGEGJpQxP4Hkohk
	 H+LYOyph2So4OBlzQ8eqWkfIbRxeTlHfq3xRoALGT422XU7FlJ2LLW+H/5evB24WZq
	 9RECbgd9LvRCalzeo79Qlcra1ae29bq8qbFueTaxNDGtntXPeTb9jE+drYVyBwfb1f
	 sl7TWdXxLGNSfs8wQT1orRhZqLztLUn2+v25W/wq5IP8Vi+4ZZoL9Ew/QjRz+tE7su
	 eWg0c9VUnhIAg==
Message-ID: <sashiko-outbox-172721@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 8/8] gpio: pl061: add Ambarella register-layout
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-cv75-gpio-v10-8-3fe3eb315a55@ambarella.com>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
 <20261015-cv75-gpio-v10-8-3fe3eb315a55@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 11:08:46 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: devres LIFO order UAF on irq.domain during teardown
--

commit a177d737541186c7b1e51ef9f245ebda1871ffa1
Author: Long Zhao <longzhao@ambarella.com>

gpio: pl061: add Ambarella register-layout variant

Add a 32-bit, 32-line layout with DAT/DIR/IS/IBE/IEV/IE/MIS/IC plus
MASK and ENABLE. Probe unmasks the bank and enables the controller.

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 3822faa3e2768..075af7985d893 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
[ ... ]
> @@ -347,6 +393,13 @@ static const struct pl061_drvdata pl061_arm =3D {
>  	.reg_mask_xlate		=3D pl061_arm_reg_mask_xlate,
>  };
> =20
> +static const struct pl061_drvdata pl061_ambarella =3D {
> +	.regmap_config		=3D &pl061_ambarella_regmap_config,
> +	.regs			=3D &pl061_ambarella_regs,
> +	.ngpio			=3D AMBARELLA_GPIO_NR,
> +	.clear_irq_on_type	=3D true,
> +};
> +
>  static int pl061_probe(struct amba_device *adev, const struct amba_id *i=
d)
>  {
>  	struct gpio_regmap_config config =3D {};

[Severity: High]
Can this lead to a use-after-free during device teardown due to devres
ordering?

While this patch adds the new Ambarella variant, the shared pl061_probe()
function registers devres actions in an order that might be unsafe during
teardown.

In pl061_probe(), the gpiochip is registered first:

drivers/gpio/gpio-pl061.c:pl061_probe() {
        ...
        gpio_regmap =3D devm_gpio_regmap_register(dev, &config);
        ...
        ret =3D devm_add_action_or_reset(dev, pl061_remove_irq, pl061);
        ...
}

Because devres executes actions in reverse order of registration (LIFO),
pl061_remove_irq() will run first during a late probe failure or device
removal, calling irq_domain_remove() and freeing the IRQ domain.

At this point, the gpiochip is still registered. If a concurrent
call to gpiod_to_irq() acquires the valid gpio_chip, it will call into:

drivers/gpio/gpiolib.c:gpiochip_to_irq() {
        struct irq_domain *domain =3D gc->irq.domain;
        ...
        return irq_create_mapping(domain, offset);
}

Will this dereference the newly freed gc->irq.domain before the gpiochip
itself is unregistered? Should the IRQ teardown action be registered before
the gpiochip registration to ensure the chip is removed first?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-cv75-gpio-=
v10-0-3fe3eb315a55@ambarella.com?part=3D8
