Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708457;
	b=jzrqEkbLqEQRxHb8DJSYlvxfY7tEPgAszWrYe2A/uB4xzK1DKdEsuy0SlaBD0Cds62h3
	 iqUhL8xVmgppl7/osBn1IgzWaqQDIAgerE5tbszClDiP428axeVAezjMFx+p4335GJyF6
	 Defp8tnJOO0EfN3Km8bjayicbMxH+DhlhxSSFwlSGAtX/TOBglo7v/ziHdDVsHlPIOx/8
	 P1NoNj3Tjz80/C73Kv/Ssmv2t2aM9x4KgGCQeaC4y6LiEf1QuGAxAH19c644LtUilg5UD
	 VqIIuBUv8F3kvVDQfUkES5CexQWdeq2IBUA+dKyTzDdhEj+jOwRSzigzunQwfAOtVsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708457;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9X13xyRyCFYva+zbw3K/3bQdpIGioez3xJvxNvPsRwk=;
	b=GreyRJBhfWoBzJDot0JOggFNcvAvjZxglzfSoJz8xRJUhQFgHkomQNiPpwToEXn3zPOj
	 qiZFjz/Ph+Gzkwj0wdg07GQzPlRA9JpL/A67po7XI9NOueYrMT5LZpQl1208/ckXb0IvM
	 YEhwSWJw5GuGg9AbU/5nonebXnriUvL7m+GmFYMyfu2j7WLnkwfB7C73d4V4iiEk95+p1
	 nz1G/qJOyuWJp1GqpjhbrmgIbubLaDn8sZY4NRGEgsL9BT57wUeXnoZbl1XcNrhWRYIKc
	 XG8rm/fnRKyIQi9qQmTcNc6z2WrdNfQfw0SYsdLsXCsAIvnBemd6ewO5Pik15MtnlKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8G92IW2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A35606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8G92IW2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8281F000D0;
	Thu, 26 Nov 2026 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708456;
	bh=9X13xyRyCFYva+zbw3K/3bQdpIGioez3xJvxNvPsRwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i8G92IW22iUBpj7nYzYThPRtKnQlu4E/eEBgb7lMdKUjEg74nOshztnYximrqZDs7
	 qORXZudtVT/CbA/X/48q5iNS3/6kwcp/CfRftv/IvQ5/amQA3oyIlAR0F7Zm3fzTNw
	 80rOx4Xsj30NeLl9O4ukEB/5D/7oUtQhmjxht96easX6BdRz6i5ENxcCMbjoA4xRU5
	 J09QizidICOFoWpksjud36v5haFpv3C0rC3wFXGW6/tT9ocKPDbYk2mBbP54viOOC6
	 uq4lafExyzVWsH6zsV1wbttFnUf0C5I5kJRcF3mcpFkh+6ZZYAEFreaPwlC1PhZuic
	 k20o+bKe7rQMg==
Message-ID: <sashiko-outbox-235857@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH 03/13] gpio: rtd1625: create the IRQ domain from the
 gpio-regmap callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Walle" <mwalle@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261126153600.299724-4-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org>
 <20261126153600.299724-4-mwalle@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 15:54:15 +0000
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
- [Medium] gpio: rtd1625: use-after-free of gpio_reg due to devres
  lifetime mismatch
- [Low] gpio: rtd1625: missing Fixes trailer for probe NULL dereference
  fix
--

commit 836b597a055624fd11d643d1081b9d412a5134af
Author: Michael Walle <mwalle@kernel.org>

> gpio: rtd1625: create the IRQ domain from the gpio-regmap callback
>
> Use the new .create_irq_domain() to actually create the domain. This
> way, there is no window where a NULL pointer could be dereferenced.
>
> Switch the irq host_data to the gpio_regmap pointer because it will
> already be needed in the irq domain callbacks. Otherwise the
> .create_irq_domain() callback would have to set the data->gpio_reg
> pointer which looks odd.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

[Severity: Low]
Since this fixes a probe NULL pointer dereference window, should it carry:

  Fixes: 6435d21cbd42 ("gpio: realtek: Add driver for Realtek DHC RTD1625 S=
oC")

> diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
> index cf4f61603dfbf..0713692804e21 100644
> --- a/drivers/gpio/gpio-rtd1625.c
> +++ b/drivers/gpio/gpio-rtd1625.c
[ ... ]
> @@ -505,9 +506,9 @@ static int rtd1625_gpio_setup_irq(struct platform_dev=
ice *pdev, struct rtd1625_g
>  static int rtd1625_gpio_irq_map(struct irq_domain *domain, unsigned int =
irq,
>  				irq_hw_number_t hwirq)
>  {
> -	struct rtd1625_gpio *data =3D domain->host_data;
> +	struct gpio_regmap *gpio_reg =3D domain->host_data;
> =20
> -	irq_set_chip_data(irq, data);
> +	irq_set_chip_data(irq, gpio_reg);
> =20
>  	irq_set_chip_and_handler(irq, &rtd1625_iso_gpio_irq_chip, handle_bad_ir=
q);
[ ... ]
> @@ -524,6 +525,31 @@ static const struct irq_domain_ops rtd1625_gpio_irq_=
domain_ops =3D {
>  	.xlate =3D irq_domain_xlate_twocell,
>  };
> =20
> +static struct irq_domain *rtd1625_gpio_create_irq_domain(struct gpio_reg=
map *gpio_reg)
> +{
> +	struct rtd1625_gpio *data =3D gpio_regmap_get_drvdata(gpio_reg);
> +	struct device *dev =3D regmap_get_device(data->regmap);
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct irq_domain_info d_info =3D {};
> +	int ret;
> +
> +	d_info.fwnode =3D dev_fwnode(&pdev->dev);
> +	d_info.size =3D data->info->num_gpios;
> +	d_info.hwirq_max =3D data->info->num_gpios;
> +	d_info.ops =3D &rtd1625_gpio_irq_domain_ops;
> +	d_info.host_data =3D gpio_reg;
> +
> +	data->domain =3D devm_irq_domain_instantiate(dev, &d_info);
> +	if (IS_ERR(data->domain))
> +		return data->domain;
> +
> +	ret =3D rtd1625_gpio_setup_irq(pdev, data);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return data->domain;
> +}

[Severity: Medium]
Can storing gpio_reg in domain->host_data and irq_data->chip_data cause a
use-after-free of gpio_reg on probe failure or driver unbind?

rtd1625_gpio_create_irq_domain() runs inside gpio_regmap_register(), so
devm_irq_domain_instantiate() queues devm_irq_domain_remove() on dev's
devres list before devm_gpio_regmap_register() queues
devm_gpio_regmap_unregister():

drivers/gpio/gpio-regmap.c:devm_gpio_regmap_register() {
	gpio =3D gpio_regmap_register(config);
	if (IS_ERR(gpio))
		return gpio;

	ret =3D devm_add_action_or_reset(dev, devm_gpio_regmap_unregister, gpio);
...
}

Because gpio_reg is allocated with kzalloc_obj() rather than devm and
freed in gpio_regmap_unregister(), devres teardown on unbind runs
devm_gpio_regmap_unregister() first and calls kfree(gpio) while
data->domain is still published with host_data and mapped chip_data
pointing to freed gpio_reg until devm_irq_domain_remove() runs.

The same mismatch occurs if rtd1625_gpio_setup_irq() fails after
devm_irq_domain_instantiate() succeeds: gpio_regmap_register() immediately
calls kfree(gpio) in its error path while data->domain remains live until
rtd1625_gpio_probe() returns and devres cleans up.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126153600.2997=
24-1-mwalle@kernel.org?part=3D3
