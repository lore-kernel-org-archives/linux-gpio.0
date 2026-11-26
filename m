Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708052;
	b=SQ0Rg2HWShbfbKz6tqC4GLmRzL3N46eVa7m6So/OA7lTniALX6O4rd7FdB8cKpmYImCz
	 vnylCcT2KDPPoCAJ4JixoWSP5ArJ/Fg11T0UMnU2d/raMTW4+KeFdAscNywq3hLlDMIuH
	 h7p68RJQVw5MVgPHWlw+6CzWJxD517gUsYYZr1MvjDdYiL/WZNViNNbdYa58ftsleWyX6
	 IH7djm9jex8g66gdOEkjD4TZaZ2VBNtNrT646Y5P1qhyo4/m8HmLEsxVXMw1oumtg/gV1
	 bLATfiCl4rN7HyAsTGbQHOJiBbmbD92mkRgIh6tXr6nlmhVX9QBhn4BKhrnU51ytA1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708052;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VIrr87Hk5QRjhzur/KxTNJR0zzVKB4zHMYr4c/nIMZ8=;
	b=ldCgbllXaJbAPYF9wBdnZ+nWV+EPSmbCiWF5gw73EkVg/ZwOR/kgy/he2xgNXGYoHrkb
	 HT6gh3a37ShXzbqfzkc2GyW0mBpl+chZjtxDXEwVbY37k5U4kvgcEztXzwx1r1fVOnmdC
	 Rg/M9uQHDLxDmkI3h+LiuU2nhKHApLZHcEVtRVUqUaeCrsGQOAvKxAz/GRhGjUyj22Z+y
	 tpGHjawdhrM/3SmIHiLXNLO2oJ887EwZCzws0H23nE9NtEzhXhl8l1fy62n9eEz5bP5Dd
	 LUceTggajxhBPRv9NUZZZhBXWMmy5SkEKUTe4TkUAKwMWGCUDZzcdyaJzgS3HWErnBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtEYP136;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E85606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtEYP136
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7DB1F000C4;
	Thu, 26 Nov 2026 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708051;
	bh=VIrr87Hk5QRjhzur/KxTNJR0zzVKB4zHMYr4c/nIMZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HtEYP136iiiY/wbJPlPDH2taVObjNFPJPJF81dT2yeYR6Y1p+U36mAA8cNCMmkJQ6
	 AlGJVncOxav4XWvhBJ3VZlUjAwl7nkEnCr2ILm9Svl2B2/NqDI6GCy5MZcUMd1rz4o
	 DftM7WWiF3yqjnrq6nb4qYQSKsS/W9HmNdMz7XZrH5PjVdsm8Lgt6h/Vyrmm+oOojZ
	 6qADiAcmQOC1AAjwxQvxTv6WmMMColSlq4/OrmDCZrcOnq14VP72Xku1Ob0Z61zPtc
	 B8GegPaXgrhHUsCoZSE3iXopima1F5z6BTE+mLDMRveWtA1xbvhcx1lGOL0CznH2K/
	 vx6X7sQkRI4/Q==
Message-ID: <sashiko-outbox-235842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH 02/13] gpio: regmap: add a callback to create the
 IRQ domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Walle" <mwalle@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261126153600.299724-3-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org>
 <20261126153600.299724-3-mwalle@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 15:47:31 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] gpio: regmap: zero ngpio_per_reg fallback in
  gpio_regmap_register() [1]
--

commit fd10248876b372329d85c754bb2bf0c35ed1c5a7
Author: Michael Walle <mwalle@kernel.org>

gpio: regmap: add a callback to create the IRQ domain

This commit adds a create_irq_domain() callback to struct
gpio_regmap_config so controller drivers can create their IRQ domain
after the gpio_chip has been registered.

> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 10cf946dbfc47..e8c13434ea5ba 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c

[ ... ]

> @@ -545,6 +553,16 @@ struct gpio_regmap *gpio_regmap_register(const struc=
t gpio_regmap_config *config
>  	if (ret < 0)
>  		goto err_free_bitmap_output;
> =20
> +	irq_domain =3D config->irq_domain;
> +
> +	if (config->create_irq_domain) {
> +		irq_domain =3D config->create_irq_domain(gpio);
> +		if (IS_ERR(irq_domain)) {
> +			ret =3D PTR_ERR(irq_domain);
> +			goto err_remove_gpiochip;
> +		}
> +	}
> +

[Severity: High]
This problem wasn't introduced by this patch, but can gpio->ngpio_per_reg
remain 0 in gpio_regmap_register() [1]?

Just above this hunk, when config->ngpio is 0 (such as in
ds4520_gpio_probe()), gpiochip_get_ngpios() populates chip->ngpio from the
firmware ngpios property while config->ngpio stays 0:

drivers/gpio/gpio-regmap.c:gpio_regmap_register() {
    ...
	chip->ngpio =3D config->ngpio;
	if (!chip->ngpio) {
		ret =3D gpiochip_get_ngpios(chip, chip->parent);
		if (ret)
			goto err_free_gpio;
	}
    ...
	gpio->ngpio_per_reg =3D config->ngpio_per_reg;
	if (!gpio->ngpio_per_reg)
		gpio->ngpio_per_reg =3D config->ngpio;
    ...
}

If config->ngpio_per_reg is also unset, the fallback copies config->ngpio
instead of chip->ngpio, leaving gpio->ngpio_per_reg as 0 and causing a
divide-by-zero in gpio_regmap_simple_xlate() when gpiochip_add_data()
queries the initial line directions.

[1] https://sashiko.dev/#/bug/linux-85577bd9-c441-47ec-b415-cd40acf50e01

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126153600.2997=
24-1-mwalle@kernel.org?part=3D2
