Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5382F90C5;
	Sat,  3 Oct 2026 17:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050166; cv=none; b=uwAsOhrrSEGehNcisFtbvFwju/IezQ4IaM6V5OVe9T/XiS2ZX50PGDbsmBhpaYQUyxFMDoE52AQ7Vg3zLg4PhhGjEHa3gAUEh1P9LNy2hXtT/NqW6EauHyPlnz46DcIokIWzctkxT2qrcN4ABDReGhp1UN7Nrne5xDP8trI++rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050166; c=relaxed/simple;
	bh=cPNG+4GMIbddDAJXpAZbt9DeQzrNF7DB5jKedlJyOlw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mTknt7Z/eTZrpbuqrdrWMfRJUd6ZhzJwOumtCldI9pdCInTHd4Uk5IEd4dKeIU6bOImQO6fYMtkA9aQGNXxjPNG3/reAy1IePu3UQ4Z2BEzwn9fTANhAsIayfUSc+GkOb7UG1nGy683PpJYD9lKymSRvme9UwQB/KLp4N28fBHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGpWOsgA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGpWOsgA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9975F1F0089B;
	Sat,  3 Oct 2026 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791050164;
	bh=jeJcpdXg7bdrP82WQZG9ALr+2V3QufYAamgqv0J4fXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jGpWOsgAMWdTds8Rbwx5EmEtK4T44iE667FE2dXg7hAEf9XJOgzz6pya6rKaewmvH
	 V5nUpzGctuJE6g/OgL0QH81Wo8u97Pb3Roa3xaYZTKUG6WyPtiF1dTbangp+Dy4RTl
	 zXOG85uFJzA64BTUoJetikYe42y9mjuc866hQAcatvEd9Kwsiffony1pEStfXqOodD
	 W3N9jMhzMjdrlFnBjWgVf1xAAqYpyJ+U2xPrbRV/VjyXaXIHUjnNI3N0wInCY4FHjx
	 cjUWUcKUd/s4XCb4sYXEiUaZAuSiE0DQTRUxA9RcgD6Uve/OjfhcjkVZuZtyTKGLQD
	 NuszcpPcMzzSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-7-dad728ce27f2@nxp.com>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
 <20261003-gpio-mxc-cleanup-v1-7-dad728ce27f2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 17:55:58 +0000
Message-Id: <20261003175604.9975F1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: mxc: sign extension in field_get() breaks edge flipping for =
pins 15/31
--

commit afaa23e01f6d59d21c3b7e082aaa50a10fe5daeb
Author: Peng Fan <peng.fan@nxp.com>

gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get

This commit introduces MXC_ICR_REG and MXC_ICR_MASK macros to replace
open-coded shift and mask arithmetic in the driver. It then updates
gpio_set_irq_type() and mxc_flip_edge() to use the new macros alongside
field_prep() and field_get().

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index a3274be7126a1..18ff33a0abfb7 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c

[ ... ]

> @@ -139,6 +140,9 @@ static struct mxc_gpio_hwdata imx35_gpio_hwdata =3D {
>  #define GPIO_INT_FALL_EDGE	(port->hwdata->fall_edge)
>  #define GPIO_INT_BOTH_EDGES	0x4
> =20
> +#define MXC_ICR_REG(gpio)	(GPIO_ICR1 + (((gpio) & 0x10) >> 2))
> +#define MXC_ICR_MASK(gpio)	(0x3 << (((gpio) & 0xf) << 1))

[Severity: High]
Does this literal 0x3 evaluate to a signed integer?

If the mask is calculated for pin 15 or 31, the shift will be 30 bits.
Shifting the signed integer 0x3 by 30 bits produces a negative signed
integer (0xC0000000). Would using an unsigned literal like 0x3U prevent
this?

[ ... ]

> @@ -231,16 +234,15 @@ static int gpio_set_irq_type(struct irq_data *d, u3=
2 type)
>  static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>  {
>  	void __iomem *reg =3D port->base;
> -	u32 bit, val;
> +	u32 val;
>  	int edge;
> =20
>  	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
> =20
> -	reg +=3D GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
> -	bit =3D gpio & 0xf;
> +	reg +=3D MXC_ICR_REG(gpio);
>  	val =3D readl(reg);
> -	edge =3D (val >> (bit << 1)) & 3;
> -	val &=3D ~(0x3 << (bit << 1));
> +	edge =3D field_get(MXC_ICR_MASK(gpio), val);

[Severity: High]
Does this field_get() result in sign-extension corruption when reading
pins 15 or 31?

Because MXC_ICR_MASK(gpio) evaluates to a signed integer, the internal
__field_get() macro casts the register value to typeof(mask), which is
signed. When it performs the right shift (>> 30) to extract the field,
it will do an arithmetic right shift, causing the extracted 2-bit field
to sign-extend into a negative value (e.g., 0x80000000 >> 30 becomes -2
instead of 2).

> +	val &=3D ~MXC_ICR_MASK(gpio);
>  	if (edge =3D=3D GPIO_INT_HIGH_LEV) {
>  		edge =3D GPIO_INT_LOW_LEV;
>  		pr_debug("mxc: switch GPIO %d to low trigger\n", gpio);
> @@ -252,7 +254,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port,=
 u32 gpio)
>  		       gpio, edge);
>  		return;

[Severity: High]
Could the sign-extended negative value trigger this error path?

If edge evaluates to a negative number like -2, it will fail the
validation checks for GPIO_INT_HIGH_LEV and GPIO_INT_LOW_LEV. This
regression would cause IRQ_TYPE_EDGE_BOTH interrupts on pins 15 and 31
to abort here on the first edge, failing to invert the polarity and
causing subsequent interrupts to be missed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003-gpio-mxc-c=
leanup-v1-0-dad728ce27f2@nxp.com?part=3D7
