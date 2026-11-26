Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708095;
	b=fILDpCFe+ADxg5K51PAUjpmcgp9Ibqk3VRzdCT4ltxaMPRBtDnbd9k272Xn3IvTYZtWM
	 rkdxlh3wssfLl9Jc3/au6bq0j9N0np1WBodr9wD3p3DEg6ArFwZXZuFvVEKAE9wYO6UML
	 hNKRVhRVx86YWhb3u5daTMc8c0peZbBxuIhLotvqIQfWXffqiYVZ6wq3aFa1zxf0v1QNu
	 H8kupaquFilfPe4ivuFxah61SQeu0GdgfI7S5VbRbUcmYaNRMiusqcW9O9xZwG8EqMVB+
	 cGhvnygwicMl6vCm+Mi6ZpIRPveLdG3ElP22CmR2nmE0PaJwGWhkxihQj7Ycejc4/iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708095;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M3W4vsJGw0SNCDBVrrS6TMzZ/xlwfmQ7Tz2OBLXn6UM=;
	b=CMO444lqNpPOdx1ZWmejqZmRgcluJG30vOsdNVI3YDbfs87uDiW+u1YRDvxH/+NNwYD1
	 14uS+12a1wmpl2gfunRzy4P8tG+7EfnK0lLtxijGbTKLoW9TC6gAtg84zwGRaRPtgYkwm
	 L5cNDSYQFLy8yS/ErIHk/0jIHbXTYG4ec8lek3/0mFDvDI8uAT/Iprr0C9OK6+I8bglxF
	 QMEofERndYklpZya43LN/YU+nvzIizBp/Uc3oVwLXNENnjMr0hwv+i+T5a4T8+m8pbweG
	 6LDuz8+F5Lq1WtSvoRshxE4CIl1fslCppiE1247CA5biv/VCF4Z9R6AwUTic33+7zvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b81n8Ha6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7D606A32D
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b81n8Ha6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A653D1F000C6;
	Thu, 26 Nov 2026 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708094;
	bh=M3W4vsJGw0SNCDBVrrS6TMzZ/xlwfmQ7Tz2OBLXn6UM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b81n8Ha6V2fcX5sFbQXUA7NR5lyXJtzoEfn6n7apBBvufn6vI2q2ymySk9VKU5f6r
	 1vsBRayJOwbauqIu6tepk5DTW8z6eR4Ox90HSj2vtb+IbqQorFbwPg5vdZAWqoonsY
	 c35Kso6B9c3y9z5FzpYudjJcjL7mskNp31SZ07h+XoVltGDIzdF3bUJIEvV9HR47f9
	 5LGFsNmptEsdP3STUpebpylQZAVxVmNHqw2ZmPkfuoBqGPS+9qIl4ZbWPcsd2qwMte
	 OSfshG+5dxH8GeWzfwg+7zBJi6PG4wHEqIa/ZYkPDr+K89NVG/MyJwKn/vkbqCN2ua
	 61Qreyq5qzJmg==
Message-ID: <sashiko-outbox-235845@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH 11/13] gpio: 104-idi-48: create the regmap-irq chip
 from the gpio-regmap callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Walle" <mwalle@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261126153600.299724-12-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org>
 <20261126153600.299724-12-mwalle@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 15:48:14 +0000
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
- [High] gpio: 104-idi-48: skipped IRQ mask write and status clear in
  idi_48_probe() [1]
--

commit 36940f74396bbd63f657b4578ebd69175712902d
Author: Michael Walle <mwalle@kernel.org>

gpio: 104-idi-48: create the regmap-irq chip from the gpio-regmap callback

This commit converts the 104-idi-48 driver to create its regmap-irq domain
via the gpio_regmap_config.create_irq_domain callback using
gpio_regmap_add_irq_chip().

> diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-4=
8.c
> index 93d7ccaded83e..434704c06d7ef 100644
> --- a/drivers/gpio/gpio-104-idi-48.c
> +++ b/drivers/gpio/gpio-104-idi-48.c

[ ... ]

> @@ -148,10 +166,14 @@ static int idi_48_probe(struct device *dev, unsigne=
d int id)
>  		return dev_err_probe(dev, PTR_ERR(map),
>  				     "Unable to initialize register map\n");
> =20
> -	chip =3D devm_kzalloc_obj(dev, *chip);
> -	if (!chip)
> +	idi48gpio =3D devm_kzalloc_obj(dev, *idi48gpio);
> +	if (!idi48gpio)
>  		return -ENOMEM;
> =20
> +	idi48gpio->dev =3D dev;
> +	idi48gpio->irq =3D irq[id];
> +	chip =3D &idi48gpio->chip;
> +
>  	chip->name =3D name;
>  	chip->status_base =3D IDI48_IRQ_STATUS;
>  	chip->unmask_base =3D IDI48_IRQ_ENABLE;

[Severity: High]
This problem wasn't introduced by this patch, but configuring
chip->unmask_base on offset 0x7 without a register cache or
handle_mask_sync callback causes regmap_update_bits() to perform a physical
read-modify-write on offset 0x7 [1].

On the 104-idi-48, reading offset 0x7 returns and clears pending interrupt
status bits rather than the active enable mask, while writing it programs
the interrupt enable register.  The read in _regmap_update_bits() clears
pending interrupts before regmap_irq_thread() can service them, and when
all banks are masked (~mask_buf[0] & 0x3f =3D=3D 0) while no status bits are
pending (orig & 0x3f =3D=3D 0), _regmap_update_bits() sees no change and sk=
ips
the write, leaving device interrupts enabled during probe and after masking
all banks.

[1] https://sashiko.dev/#/bug/linux-84cdae6c-00ca-4070-8100-3b16d7660350

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126153600.2997=
24-1-mwalle@kernel.org?part=3D11
