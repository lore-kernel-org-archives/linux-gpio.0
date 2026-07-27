Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512CA3E6392;
	Mon, 27 Jul 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142874; cv=none; b=IcHyMvSgSyL8Z0GdFI/mj3V84uIOF6PKhVMIcWxe0EeXsvfmhmagauYradareMojU2R5UmJw1ztuxjFHDDt3mhFAsCIwwMkVBxs1IreQSwYJdHEQ+f2nUukF/dtMTPSULzr3EBbWocB05oVHwTsD6HvWF4O6YJqStZbkImxrWZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142874; c=relaxed/simple;
	bh=QX+alkuKKXoWOKhqAUrH75EgE6wENDYFGmWgVu7BdOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/ACd+kf3XexA0OQUfQTK+2jji3lZj0E4u220G0ARYOb5FbyyqwjlSAVZCq1Ilvz1F9BPz4icVNZBBijz0Nylmtu15s5hHNqPAHE1ZfVl3YBbkn5Yz3Ua2sIOrTTBl4QAeNSGJtxo9Nz0kUGehJAREdG2d0igdGQNQnvqfjaHoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Re+JbrTu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Re+JbrTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3BA1F000E9;
	Mon, 27 Jul 2026 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785142873;
	bh=UHyFGUYnSCQpQej/5e3mYyZNiiqLlqafK+vz90QEer4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Re+JbrTuQA+QQtRaU8uJVMGICF8RHSgGoCa5aRlmYrU4wnGMLECYH6nO9irXPk9FD
	 1bJjD1Al0ZWZBy8dCooPdhL5HeU+s8apwwxxuEBU+SgyTb1o0FHZzcj07qNoO7tVAn
	 OcRDW9fz4bDXXlOFc5FDq+tZ1zqQfqzBY3Tl/b0G6uWIAtddbrX4Xaqc3pm2/d8SoZ
	 3JkpK+gTEnveoGCfYTBvkJuPotd8oGnwbAKZN0QC1KhMXuaK/IRUm8TB9lXSGZ+qqY
	 aM4liH5QuZm1Qb15s0h/ah7l1TXWa7VRLoa9q72E12BL2yavnAjxtyaegpUOyRLA8S
	 Jiqs+S22OQ+lQ==
Date: Mon, 27 Jul 2026 11:01:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v7 17/34] pinctrl: airoha: fix edge-triggered interrupts
 handling
Message-ID: <amceVgvBMsfxrHSp@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-18-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ud4ETSHTLuDstOy+"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-18-mikhail.kshevetskiy@iopsys.eu>

--ud4ETSHTLuDstOy+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Edge-triggered interrupts are handled incorrectly because of
>  * no irq_ack() handler was defined,
>  * no handle_level_irq() handler was used,
>=20
> This patch probably fixes an issue
>=20
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 38 +++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index d218a1f01648b..df3a1d7c7b571 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2613,11 +2613,28 @@ static void airoha_irq_mask(struct irq_data *data)
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> =20
> +	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +		return;
> +
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
>  	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
>  }
> =20
> +static void airoha_irq_ack(struct irq_data *data)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> +	struct airoha_pinctrl_gpiochip *gpiochip =3D &pinctrl->gpiochip;
> +	u8 offset =3D data->hwirq % AIROHA_PIN_BANK_SIZE;
> +	u8 index =3D data->hwirq / AIROHA_PIN_BANK_SIZE;
> +
> +	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +		return;
> +
> +	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
> +}
> +
>  static int airoha_irq_type(struct irq_data *data, unsigned int type)
>  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> @@ -2627,13 +2644,25 @@ static int airoha_irq_type(struct irq_data *data,=
 unsigned int type)
>  	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
>  		return -EINVAL;
> =20
> +	if (type =3D=3D IRQ_TYPE_NONE) {
> +		gpiochip->irq_type[data->hwirq] =3D IRQ_TYPE_NONE;
> +		irq_set_handler_locked(data, handle_bad_irq);
> +
> +		return 0;
> +	}
> +
>  	if (type =3D=3D IRQ_TYPE_PROBE) {
>  		if (gpiochip->irq_type[data->hwirq])
>  			return 0;
> =20
> -		type =3D IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
> +		type =3D IRQ_TYPE_EDGE_BOTH;
>  	}
> +
>  	gpiochip->irq_type[data->hwirq] =3D type & IRQ_TYPE_SENSE_MASK;
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		irq_set_handler_locked(data, handle_edge_irq);
> +	else
> +		irq_set_handler_locked(data, handle_level_irq);
> =20
>  	return 0;
>  }
> @@ -2658,8 +2687,7 @@ static irqreturn_t airoha_irq_handler(int irq, void=
 *data)
>  		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
>  			u32 offset =3D irq + i * AIROHA_PIN_BANK_SIZE;
> =20
> -			generic_handle_irq(irq_find_mapping(girq->domain,
> -							    offset));
> +			generic_handle_domain_irq(girq->domain, offset);
>  			regmap_write(pinctrl->regmap,
>  				     pinctrl->gpiochip.status[i], BIT(irq));
>  		}
> @@ -2673,7 +2701,7 @@ static const struct irq_chip airoha_gpio_irq_chip =
=3D {
>  	.name =3D "airoha-gpio-irq",
>  	.irq_unmask =3D airoha_irq_unmask,
>  	.irq_mask =3D airoha_irq_mask,
> -	.irq_mask_ack =3D airoha_irq_mask,
> +	.irq_ack =3D airoha_irq_ack,
>  	.irq_set_type =3D airoha_irq_type,
>  	.flags =3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
>  	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> @@ -2708,7 +2736,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoh=
a_pinctrl *pinctrl,
>  	gc->ngpio =3D AIROHA_NUM_PINS;
> =20
>  	girq->default_type =3D IRQ_TYPE_NONE;
> -	girq->handler =3D handle_simple_irq;
> +	girq->handler =3D handle_bad_irq;
>  	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
> =20
>  	irq =3D platform_get_irq(pdev, 0);
> --=20
> 2.53.0
>=20

--ud4ETSHTLuDstOy+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamceVgAKCRA6cBh0uS2t
rHxFAP9YNZXRHGGFDBn1nVvA7IHffmmnrTRGAFiWxm/w9KMJjgEAp90QBV30X6TQ
vklFC5qQv0dp+LgYrGbJAp/7xniWtAE=
=6VL/
-----END PGP SIGNATURE-----

--ud4ETSHTLuDstOy+--
