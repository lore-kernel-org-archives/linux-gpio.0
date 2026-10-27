Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075841;
	b=yuSupu/Gk76Z8hQC7Vx9OeNglhUM+yaaqm6gtGJ4qRHaselt4rib1xmSMWB4uhgMTtOM
	 tINU0EIXLUFVD7jEMqYvO6kdAYfUb2GRsfgLitz4Lu1+c35usyCCoFuqqZ6X+FlrmhArx
	 Hc8j/bCjiuJypZkMCbCNkz1XogY0jvdAalhUHxZ88u/rrj7eY8AOExiFwoZ2BRBTZsnUm
	 1k3GCIcxqjTzM8AczLPH01hS0Cn17ZIg5rfYCAu9gfRfe16EcFwGPz2yL3kce+anaeCWW
	 x/7QXot+zvpYSJrc+tFzqV9io6bh2z/zqkDaKh92Vpn+Nim+uPGuhi57GHRGcTJkouw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075841;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ks1RLjzmjl+HbtDvHuzWp+dQzhlExU4YVtMZU45YSIw=;
	b=raDfCKWSs+Xmtcq3TTogHxRcR9Dn/EW3CDsRODLJR7THl8NyxNwq1goA0H54LMtM4TJn
	 JyWXzDPdbb9bunM8o4resw/AB/kbR0tCiGJV3w+jrblyTnL60+ikro6yViZ5RtnVl0zoX
	 6iHGmFrk3ZnxWplpI6+XmfEPj41xGkGeh4E5UnQQY2Yl/hI7VzYiJfirZZy30J0y+KGnI
	 mM0ufOfua4LZdwM9rbzAtRHTCDOptLgtpUpD1L4pxZoZbgSwPYQuBJbxQbPrSyV1Vbx9v
	 Ho6TXc3HHnF9v3LLjzdIO9BJaCkUwrt6odBJCK4Hw6sxa06G/8uxLLGib09jLpT1X8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VzVfavhs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2939606A31A;
	Tue, 27 Oct 2026 04:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VzVfavhs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6DC1F01825;
	Tue, 27 Oct 2026 04:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793075840;
	bh=Ks1RLjzmjl+HbtDvHuzWp+dQzhlExU4YVtMZU45YSIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VzVfavhsVRuwpkGDuiDuU5uMUQrb1YSjIJiFNBI3F01Uuw3FzfmpoC8C0QyEWwNsw
	 ZXnFyuzjKxTWT16hs2LT1WLerSME/QVXfnRRkxTq4o9LmY0LJB+FxUOWtc+kCWozoo
	 PoWKP3qYeqKZ8zQW34trkRz6nVuEeUEUj/xRPSI/Sbrj7wLtcRLvkZ3/5sjHcaLAop
	 GZ52ODqDeE0uLt3ivz6Umt5MJG3zhybLKQIXbNcJUuUgG4LnbcRN+a5vNzFS2wKPTb
	 b2s/9cEcOU87CyqZ8uNo9E7pOV48fpCGnrnTC3irQ1QH7l5Hm1y8hx49JMaMPy/odU
	 seuxQebkRWrSg==
Message-ID: <sashiko-outbox-186082@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 08/11] gpiolib: request ACPI GPIO events for
 external IRQ domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-cv75-gpio-v12-8-c22555400e18@ambarella.com>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
 <20261027-cv75-gpio-v12-8-c22555400e18@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 04:37:19 +0000
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
- [High] gpio: inverted irqchip teardown order in gpio_regmap_unregister()
--

commit ee59cd5ff4cdd5a1601cf9e6bc045d90f8115ad2
Author: Long Zhao <longzhao@ambarella.com>

gpiolib: request ACPI GPIO events for external IRQ domains

This commit updates gpiochip_irqchip_add_domain() to call
acpi_gpiochip_request_interrupts() so that GPIO-signaled ACPI _AEI events a=
re
requested when a gpio_chip attaches an external IRQ domain.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e5fb60111151f..63c51d9ee0bf5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2353,7 +2353,15 @@ static void gpiochip_irqchip_remove(struct gpio_ch=
ip *gc)
>  int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
>  				struct irq_domain *domain)
>  {
> -	return gpiochip_irqchip_add_allocated_domain(gc, domain, true);
> +	int ret;
> +
> +	ret =3D gpiochip_irqchip_add_allocated_domain(gc, domain, true);
> +	if (ret)
> +		return ret;
> +
> +	acpi_gpiochip_request_interrupts(gc);

[Severity: High]
Can calling acpi_gpiochip_request_interrupts() here trigger a use-after-free
on gc->irq.domain and a NULL pointer dereference on irqd during teardown in
gpio_regmap_unregister()?

In drivers/gpio/gpio-regmap.c, gpio_regmap_register() is the caller of
gpiochip_irqchip_add_domain(). When config->regmap_irq_chip is set, it
registers the gpio_chip first and then creates the regmap IRQ domain:

drivers/gpio/gpio-regmap.c:gpio_regmap_register() {
	...
	ret =3D gpiochip_add_data(chip, gpio);
	if (ret)
		goto err_free_bitmap;

#ifdef CONFIG_REGMAP_IRQ
	if (config->regmap_irq_chip) {
		gpio->regmap_irq_line =3D config->regmap_irq_line;
		ret =3D regmap_add_irq_chip_fwnode(dev_fwnode(config->parent), config->re=
gmap,
						 config->regmap_irq_line, config->regmap_irq_flags,
						 0, config->regmap_irq_chip, &gpio->irq_chip_data);
		if (ret)
			goto err_remove_gpiochip;

		irq_domain =3D regmap_irq_get_domain(gpio->irq_chip_data);
	} else
#endif
	irq_domain =3D config->irq_domain;

	if (irq_domain) {
		ret =3D gpiochip_irqchip_add_domain(chip, irq_domain);
		...
	}
}

With this change, gpiochip_irqchip_add_domain() calls
acpi_gpiochip_request_interrupts(gc), which walks _AEI resources, marks each
event descriptor with GPIOD_FLAG_USED_AS_IRQ via gpiochip_lock_as_irq(), ma=
ps
the virtual IRQ in gc->irq.domain, and requests a threaded IRQ.

However, during teardown, gpio_regmap_unregister() destroys the regmap
irqchip before removing the gpio_chip:

drivers/gpio/gpio-regmap.c:gpio_regmap_unregister() {
#ifdef CONFIG_REGMAP_IRQ
	if (gpio->irq_chip_data)
		regmap_del_irq_chip(gpio->regmap_irq_line, gpio->irq_chip_data);
#endif

	gpiochip_remove(&gpio->gpio_chip);
	...
}

In drivers/base/regmap/regmap-irq.c, regmap_del_irq_chip() disposes all
mapped virtual IRQs via irq_dispose_mapping(virq) while the ACPI event
interrupts are still requested, and then frees d->domain via
irq_domain_remove(d->domain), leaving gpio->gpio_chip.irq.domain dangling.

Immediately after that, gpiochip_remove() runs:

gpiochip_remove()
  -> gpiochip_free_remaining_irqs()
    -> gpiod_free_irqs()
      -> gpiod_to_irq()
        -> gpiochip_to_irq()
          -> irq_create_mapping(gc->irq.domain, offset)

Because the ACPI event descriptor still has GPIOD_FLAG_USED_AS_IRQ set,
gpiod_free_irqs() calls gpiod_to_irq(), which dereferences the freed
gc->irq.domain. Furthermore, in drivers/gpio/gpiolib.c:gpiod_free_irqs():

	int irq =3D gpiod_to_irq(desc);
	struct irq_desc *irqd =3D irq_to_desc(irq);
	void *cookie;

	for (;;) {
		scoped_guard(mutex, &irqd->request_mutex) {

if gpiod_to_irq() fails and returns a negative error, irq_to_desc(irq)
returns NULL and &irqd->request_mutex dereferences a NULL pointer, followed
by gpiochip_irqchip_remove() -> acpi_gpiochip_free_interrupts() calling
free_irq() on an already-disposed virtual IRQ.

Should gpio_regmap_unregister() call gpiochip_remove(&gpio->gpio_chip) befo=
re
regmap_del_irq_chip() so that the ACPI event interrupts and gpio_chip are
torn down before the underlying regmap irq_domain is removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-cv75-gpio-=
v12-0-c22555400e18@ambarella.com?part=3D8
