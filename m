Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB674CE685;
	Fri,  9 Oct 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547390; cv=none; b=kc9ir1MVJ2uXIPnL4PQFzhUaqrkJdQJ/iFaJjXBwY8yElWXKB6L+X4re5LsKLVUa6z8Q9oIJB2FvP1zrK6fEF1YQ1b1pgNAVPNFurKINWj2/JtOLeVscxH0ujaGAzoESO18OO7vhD9aKA8c5qzx3bJu8mOJcgUDTvGg1J9dbkVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547390; c=relaxed/simple;
	bh=8gWiA0asIPSsWf0UeGmuSkTDC50BK8VpZK+eRHdNMqY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d217ayIilgSStakIo8lo5VjlVh81KampK0be91S9VdzIY468aOuSzqQkhQLDOVjsDHvif0qEMWrzkPNKZ5I6ONTGNF2JChsrAc8WkMZ+J638xcvdf92fI2zR3z6TG0s7jpSRDi0KsSoh352ibYb07iXfnIsq+9df5fAWtniCviE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om4VD5F0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om4VD5F0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FF51F000FF;
	Fri,  9 Oct 2026 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791547386;
	bh=dp8ciwSp/4dmwQiunjG8oh6pM9J/DPl34RlT4xvbNqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=om4VD5F0JPpbfy2ubL40gg9Kuweds3RdZ+yKvo8F+v1AtN67BvF9gOj2hKo6eoWiB
	 0bICLJ6S8ytJsjNCx6L6E6RNM6MRc8q7bwojeUNRmCsCE48ytaVAI1GzFbtF6xCDdL
	 kJlH2xhsFgWzYTUVpnA3yZpTY70T+3rKaY4fiCOr+d8K+bi1s+IX207E8Nlb3G7oVh
	 vV5LVxk8HkSD/i7hnZAnaNgv/t3dwkgEA4K+OZOwzhRHd/5YNOEHVgb6fwlBBfpd+g
	 o3xJQh6ULGo+lXxKRi+5+g8JMGgxUEFmvpJ+9vNWkdBw3bFZoGdctkVIWrXzxgnOKF
	 aWA73uQ1RL+Nw==
Message-ID: <sashiko-outbox-165467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] gpio: pl061: add Ambarella register-layout variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: linux-gpio@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-cv75-gpio-v1-7-5836bd438423@ambarella.com>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-7-5836bd438423@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:03:05 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: pl061: regmap cache seeded with physical pin levels on first=
 write
- [High] gpio: UAF of irq_domain in gpiochip_remove() due to devres ordering
--

commit 35420eba05adeb99d5c7ba4b27a388ab6107e2d2
Author: Long Zhao <longzhao@ambarella.com>
Subject: gpio: pl061: add Ambarella register-layout variant

Add a 32-bit, 32-line layout with DAT/DIR/IS/IBE/IEV/IE/MIS/IC plus
MASK and ENABLE. Probe unmasks the bank and enables the controller.

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index ba3350a8971c8..ccadeb1183058 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
[ ... ]
> @@ -318,6 +330,17 @@ static bool pl061_arm_volatile_reg(struct device *de=
v, unsigned int reg)
[ ... ]
> +static bool pl061_ambarella_volatile_reg(struct device *dev, unsigned in=
t reg)
> +{
> +	switch (reg) {
> +	case AMBARELLA_MIS:
> +	case AMBARELLA_IC:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
[ ... ]
> +static const struct regmap_config pl061_ambarella_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.max_register =3D AMBARELLA_ENABLE,
> +	.volatile_reg =3D pl061_ambarella_volatile_reg,
> +	.cache_type =3D REGCACHE_FLAT_S,
> +	.fast_io =3D true,
> +	.use_raw_spinlock =3D true,
> +};

[Severity: High]
Does this configuration cause the regmap cache to be seeded with physical
pin levels on the first write?

Because AMBARELLA_DAT is not marked as volatile in
pl061_ambarella_volatile_reg() and the regmap_config lacks .reg_defaults,
the cache is completely empty at probe. On the first call to gpio_set(),
the regmap core experiences a cache miss in _regmap_update_bits() and
falls back to a physical MMIO read via _regmap_read().

This populates the regmap cache with the physical input levels of all pins
on the bank. The single requested bit is then modified, and the full 32-bit
register is written back to hardware.

If any output pin was heavily loaded or externally driven during this
initial read, could its false physical state be latched and permanently
driven as an output, directly causing the glitch the patch aimed to prevent?

[ ... ]
> @@ -348,6 +395,13 @@ static const struct pl061_drvdata pl061_arm =3D {
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

[Severity: High]
Does unbinding the driver trigger a use-after-free of the irq_domain in
gpiochip_remove() due to devres ordering?

Inside pl061_probe(), the devres action to remove the IRQ is registered
after the gpio_regmap:

    gpio_regmap =3D devm_gpio_regmap_register(dev, &config);
    ...
    if (irq) {
        ret =3D devm_add_action_or_reset(dev, pl061_remove_irq, pl061);
    ...

If a client or userspace holds a GPIO IRQ, unbinding the driver triggers
devres teardown in LIFO order. pl061_remove_irq() will run first, calling
irq_domain_remove(), which kfrees the irq_domain.

Next, devm_gpio_regmap_unregister() runs and calls gpiochip_remove().
This invokes gpiochip_free_remaining_irqs(), which calls gpiod_free_irqs()
and eventually gpiochip_to_irq():

drivers/gpio/gpiolib.c:gpiochip_to_irq() {
    struct irq_domain *domain =3D gc->irq.domain;
    ...
    return irq_create_mapping(domain, offset);
}

Because gc->irq.domain was already freed by pl061_remove_irq(), this causes
a use-after-free.

Can the devres registration order be adjusted to ensure the gpiochip is
removed before the irq_domain is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-cv75-gpio-=
v1-0-5836bd438423@ambarella.com?part=3D7
