Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708126;
	b=Y5zcKftgk7JeUepitW4tNZMNsZxzY9LO96UnyHazh5prIEM1VlkjfeAzNfpkL7rsJk1F
	 Xc+7ExcMlyDgxAlCfwrS5LwEd9IWHlAXbw4jZWPzRaQWUsd2e98OHGleGdLVAdqgMxf4q
	 tLEz7RYKJWGwkgWVu/0bDLHxA1W16TtDWr09MXMuG3Vimm/cadsJKY/tQPvAhlEM2WlJ/
	 PfnJ/dZ7ewSBJDW6HoXcYEo6R1Y4FH6MP4B4xIbOEaL7SspOCY77AOy7ixTmuW7+TysFk
	 2kFgP7c7kvQncue6I/yQBIdh+JpZU13G++gUgxwj6b+Pd5oO2guGmaQfOl97zN5R+0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708126;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0XUweKibchPQ8gV8cWD/CQnNi3P8/ZzJbasU7I5GO/4=;
	b=llRwJolpUKFd61AeeoshL/mU6c7jfou+dSzm98my+H3KQy2dK5s7ZqZ58m9oWU6mvW7u
	 x1QbPCj5L7djwg3xVPnsYROlHnHJFknok+pKbJqnM7wsFqVumyTqjfX1LoDvo2ONO3H52
	 lhYqbuT55aJRpPudmwYwD7P1QsVTMHDDNBew2i7IDssKUElC26cMsftPo/il+lt7Y20Ux
	 UJGbDDgFgpqbJgXzLSscmpt1NX00OQbpjogYlMfFTAPoftoa83j6r+W14LGxuTBXR+Ivk
	 K40vif6vHvRz5XQmAKSp2cpzKKTB7gemtcTTVuAMuKyNjH0b41MkE4CeXuavjlLCFZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RArIs3p0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA6606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RArIs3p0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AC01F000C6;
	Thu, 26 Nov 2026 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708126;
	bh=0XUweKibchPQ8gV8cWD/CQnNi3P8/ZzJbasU7I5GO/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RArIs3p0W8tLlmJNea6kuZlclfOpiXHBpOGYvs0/30TXdU1qRplwv/Da6zW9yCKDs
	 0KWby90VuXFhT1+hhQGj4qc+LsucADrZVAST5XWMtTbrq73h/QnUEOLLm7OONPm290
	 4GsSLjQugM13XvFToVwqWqrutMQDGBKywERuGh7kGKP+Z2tIJqudEMg3l4rbrSIfSF
	 LNa6yBzYUUUT9AYyyIL9h/wtHMTN9TgblK9+a8YuRhA1ek+ABF5txD83GHZG/RxqRX
	 9aJZiQJKeL2M3RqLFNST0eMC96pvC+NbIP9ADnnOyMMxv7TzJy8KMcIKqAayqXsgah
	 AEh+4iQ3oMhoA==
Message-ID: <sashiko-outbox-235846@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH 09/13] gpio: pcie-idio-24: create the regmap-irq
 chip from the gpio-regmap callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Walle" <mwalle@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261126153600.299724-10-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org>
 <20261126153600.299724-10-mwalle@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 15:48:45 +0000
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
- [High] gpio: pcie-idio-24: gpio_regmap_add_irq_chip() breaks IIN0..23
  IRQ requests
--

commit c95318f918a77c064e6fbf9f0881933abda168a3
Author: Michael Walle <mwalle@kernel.org>

gpio: pcie-idio-24: create the regmap-irq chip from the gpio-regmap callback

This commit converts the pcie-idio-24 GPIO driver to register its regmap
IRQ chip through the gpio_regmap_config.create_irq_domain callback using
gpio_regmap_add_irq_chip().

> diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-id=
io-24.c
> index 8fb34398053dc..3be7aad266e0d 100644
> --- a/drivers/gpio/gpio-pcie-idio-24.c
> +++ b/drivers/gpio/gpio-pcie-idio-24.c

[ ... ]

> @@ -225,13 +229,27 @@ static int idio_24_set_type_config(unsigned int **c=
onst buf, const unsigned int
>  	return ret;
>  }
> =20
> +static struct irq_domain *idio_24_create_irq_domain(struct gpio_regmap *=
gpio)
> +{
> +	struct idio_24_gpio *const idio24gpio =3D gpio_regmap_get_drvdata(gpio);
> +	struct irq_domain *domain;
> +
> +	domain =3D gpio_regmap_add_irq_chip(gpio, idio24gpio->irq, 0, idio24gpi=
o->chip);
> +	if (IS_ERR(domain))
> +		return dev_err_cast_probe(regmap_get_device(idio24gpio->map), domain,
> +					  "IRQ registration failed\n");
> +
> +	return domain;
> +}

[Severity: High]
Does switching to gpio_regmap_add_irq_chip() cause IRQ requests on the
Isolated Input lines (IIN0..IIN23, offsets 24..47) to fail with
-ENOTSUPP?

Unlike devm_regmap_add_irq_chip(), gpio_regmap_add_irq_chip() installs
gpio_regmap_irq_reqres(), which calls gpiochip_reqres_irq() ->
gpiochip_lock_as_irq().  Because gc->can_sleep is false and
gc->get_direction is set, gpiochip_lock_as_irq() queries
gpiod_get_direction().  Without fixed_direction_mask configured in
gpio_config, gpio_regmap_get_direction() calls idio_24_reg_mask_xlate()
with IDIO_24_CONTROL_REG, which rejects offsets below 48:

drivers/gpio/gpio-pcie-idio-24.c:idio_24_reg_mask_xlate() {
    ...
	case IDIO_24_CONTROL_REG:
		/* We can only set direction for TTL/CMOS lines */
		if (offset < 48)
			return -ENOTSUPP;
    ...
}

As a result, requesting an interrupt on any of the 24 Isolated Input
lines fails.  Setting gpio_config.fixed_direction_mask (and
fixed_direction_output for the FET outputs at offsets 0..23) or returning
the fixed directions in idio_24_reg_mask_xlate() would allow
gpiod_get_direction() to succeed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126153600.2997=
24-1-mwalle@kernel.org?part=3D9
