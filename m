Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398590;
	b=vY5zK86FqX/Skc18bUlgaNCMauWhZDrDvhJ9pA/MtW6T0HR78EnafGFOFeIsxeRXydwC
	 YamgB65EkPANpNuN/kbvLXQypv4mdT57PlJaRxwd8+e42ybgTtTMAWvBoIRbOsocefYQK
	 JYA9X5wQeniEWSCmpqvCA06kqjucfJm3z5QpGdPG080gls9jFINIz6S8pNamMMf5QFe2l
	 zgSxFFCmW6uFGQXgUR37PLQxC26xYpZjl3+cVNtxYaQ73w+0A47A5Gl+oGfJyZwnR+pqa
	 8H9RLZAzrHTEQJ4MQKv6h3d8xoyfrcfp6tVeEZFpkDAwaT36fMc45Kv5148Ck3LRM5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398590;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=glzj+R7+FS/ozRyLbp/lqz11txiRCEoRKrNHhF4+8iU=;
	b=iW4hFjEYxIVtkfnGFgWQ8HklCDDVBFxFC53lFwCTp/zLkOKDD9yLIYYg3Pz+XIId9R0x
	 S33ewdXg23hYcimrw767f+2ZNy0mSm6CLjOutlMUgJQZkekAeKS+9ximYrhhQio3/gXzi
	 QYqB6bu1XbuEMSlW+5YvN0HnPXdj20Fp3uA+O0ZGF3RSmOmmlu4ayMQccTHZppo5rKCoI
	 lXzQ1TCxzuUbmhYlirz9gTTj8CF5ule+m2Uc3J2iT1Hib7/zmZseoacL7xc7bWgkgNvqu
	 OZPkiPoaImmYfGRkBTkt/i6aUIyR0QVLPq/hcGFFIBrF/F2fBAbveDb3p5TdpGtO+Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g94SMgWL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79A5606A31A;
	Mon, 23 Nov 2026 01:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g94SMgWL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517221F000C4;
	Mon, 23 Nov 2026 01:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795398590;
	bh=glzj+R7+FS/ozRyLbp/lqz11txiRCEoRKrNHhF4+8iU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g94SMgWLRcZecpoz27ZpPeVY25ouM3foddkMm5JqcXW/PWPmhOoEjry+7y9RkAeWg
	 0rz/jq5QVp7wGAw5qIqeRkB+MMFBpNYOcJq9Flb8uD9gRnKGCyWxB1mK6S+QCeb3bh
	 CmHxx010mEYkDL5R1MXK4NkpdXkBLJgAiAGX4r9b5P7S5GV7VRMcinWRo71PmpD4Zi
	 hOQEMq73pByUojOGZ7+f4HpHPEogNxIsFXQqM1lxCs0RC95UE2BHjgz9PMNbH+vvR8
	 5CNwx3VqVKGd+ofeIkApnSxPhglrS21G7VeZus8H1drzwSN97EsqtbAEk3SKBnLqF6
	 mgd54Ownp9bhQ==
Message-ID: <sashiko-outbox-228534@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] gpio: Add Siflower GPIO controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122-sf19a2890-gpio-v3-2-3a4857ebc84a@telaak.dev>
References: <20261122-sf19a2890-gpio-v3-0-3a4857ebc84a@telaak.dev>
 <20261122-sf19a2890-gpio-v3-2-3a4857ebc84a@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 01:49:49 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] gpio: siflower: non-raw regmap spinlock acquired in raw IRQ and
  hardirq contexts
- [High] gpio: siflower: IRQ domain and chained handlers registered
  before priv->gpio
- [Medium] gpio: siflower: undisposed virtual IRQ mappings in
  priv->domain on teardown
- [Medium] gpio: siflower: Kconfig dependency on undefined symbol
  MACH_SIFLOWER_MIPS
--

commit 86affe3feaf16149d7ee585860ef5d5bfff26ad5
Author: Qingfang Deng <qingfang.deng@siflower.com.cn>

gpio: Add Siflower GPIO controller driver

This commit adds a GPIO and interrupt controller driver for Siflower MIPS
and RISC-V SoCs using gpio-regmap and regmap-mmio.

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e4280029d86..0b52fc2a5335e 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -721,6 +721,20 @@ config GPIO_SIFIVE
>  	help
>  	  Say yes here to support the GPIO device on SiFive SoCs.
> =20
> +config GPIO_SIFLOWER
> +	tristate "Siflower GPIO support"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST

[Severity: Medium]
Is MACH_SIFLOWER_MIPS defined anywhere in the tree?  Because that Kconfig
symbol does not exist (and there is no RISC-V dependency for the RISC-V
SoCs mentioned in the changelog), GPIO_SIFLOWER can only be enabled when
COMPILE_TEST is set.

> diff --git a/drivers/gpio/gpio-siflower.c b/drivers/gpio/gpio-siflower.c
> new file mode 100644
> index 0000000000000..4bf7e36960e4c
> --- /dev/null
> +++ b/drivers/gpio/gpio-siflower.c
[ ... ]
> +static const struct regmap_config sf_gpio_regmap_config =3D {
> +	.reg_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.val_bits	=3D 32,
> +};

[Severity: High]
Should sf_gpio_regmap_config set .use_raw_spinlock =3D true?

Without it, devm_regmap_init_mmio() protects priv->regmap with a non-raw
spinlock_t.  sf_gpio_irq_ack(), sf_gpio_irq_mask(), sf_gpio_irq_unmask()
and sf_gpio_irq_set_type() access priv->regmap while holding the irq_desc
raw_spinlock_t, and sf_gpio_irq_handler() reads priv->regmap in hardirq
context, triggering a lockdep invalid wait context splat or sleeping in
atomic context on PREEMPT_RT.

> +static int sf_gpio_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	d_info.fwnode =3D dev_fwnode(dev);
> +	d_info.size =3D soc->ngpios;
> +	d_info.hwirq_max =3D soc->ngpios;
> +	d_info.ops =3D &sf_gpio_irq_domain_ops;
> +	d_info.host_data =3D priv;
> +
> +	priv->domain =3D devm_irq_domain_instantiate(dev, &d_info);
> +	if (IS_ERR(priv->domain))
> +		return PTR_ERR(priv->domain);

[Severity: Medium]
Does teardown dispose of virtual IRQ mappings in priv->domain before the
domain is removed?

Because priv->domain is allocated externally and passed via
config.irq_domain, gpiochip_irqchip_remove() skips irq_dispose_mapping().
When devm_irq_domain_remove() then calls irq_domain_remove(), any mapped
irq_desc entries are leaked with dangling pointers to the freed domain and
priv.

> +	for (i =3D 0; i < ngroups; i++) {
> +		ret =3D platform_get_irq(pdev, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		priv->irq[i] =3D ret;
> +		irq_set_chained_handler_and_data(priv->irq[i],
> +						 sf_gpio_irq_handler, priv);
> +		ret =3D devm_add_action_or_reset(dev,
> +					       sf_gpio_remove_chained_handler,
> +					       (void *)(unsigned long)priv->irq[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	config.parent =3D dev;
> +	config.regmap =3D priv->regmap;
> +	config.ngpio =3D soc->ngpios;
> +	config.reg_dat_base =3D GPIO_REGMAP_ADDR(GPIO_IR(0));
> +	config.reg_set_base =3D GPIO_OR(0);
> +	config.reg_dir_in_base =3D GPIO_OEN(0);
> +	config.reg_mask_xlate =3D sf_gpio_reg_mask_xlate;
> +	config.set_config =3D sf_gpio_set_config;
> +	config.irq_domain =3D priv->domain;
> +	config.drvdata =3D priv;
> +
> +	priv->gpio =3D devm_gpio_regmap_register(dev, &config);

[Severity: High]
Can irq_chip callbacks dereference priv->gpio before it is initialized or
after it has been freed?

sf_gpio_irq_mask(), sf_gpio_irq_unmask(), sf_gpio_irq_request_resources()
and sf_gpio_irq_release_resources() all pass priv->gpio to
gpio_regmap_*_irq(), which dereferences &gpio->gpio_chip.  Because
priv->domain and the parent chained handlers are registered before
devm_gpio_regmap_register(), priv->gpio is NULL until
devm_gpio_regmap_register() returns.  Furthermore, devres unwinds in
reverse order on unbind, so devm_gpio_regmap_unregister() frees priv->gpio
before sf_gpio_remove_chained_handler() and devm_irq_domain_remove() run,
leaving a use-after-free window if an IRQ is masked, unmasked or released
during teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-sf19a2890-=
gpio-v3-0-3a4857ebc84a@telaak.dev?part=3D2
