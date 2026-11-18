Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993218;
	b=q2+b50lVSzSAn8H0+uDLMYve+nnHg68FRb/iJK4NMKceZGEsffHbVjJnoyUE+sjFuSx3
	 ARpLCs4MO47cNyQM/kHh9ZQJWBaREuafC+wjunAfjaMk6KKplO1BLNjQhDERA86f4QiEv
	 Dvx43frE218qa0mbQPLZRV4zZif9lPRgpcuK4Q9X4VY4jx/vPz7gPy9FCrNyZmXSuldIj
	 zrexvKnOwgtVGM116PlAozKvWAQsEXDA2pv4FG1gG7Oa7Gciq0yevEvFRkNITWO1geA1o
	 AM2O/bbjaQNvzVUfyOsJh7O12DLdg9g4XAzRW4toi3x/9LMKaZVIExhPMS1v8ZLDSqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993218;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=MvvizZ9JHQIxNGSNp585ypBtXBMQ2aCpYxufJnPDzVU=;
	b=rcYsnR4ca4KDHJ+D9FQhJQzs+ZspAM9+CBJClju/ojcVLKnfDWiLWDC9sBB+PFxMpbFD
	 gpIoMTN62rUgBKcih3fkdMz5BJdW08RTdwF9vemb5dNBrSDlZB1BN32TOzy3CBgIQCyuU
	 fr6tAAxL2p5m0hyK0+d2HtIVeXqqtSZV1xUaW4LA62asIBFLeRBNz2B6tqVtyFsJP2Fpx
	 QKKgpF/OqBkeDA+tLpe96Oqm6wCgE1nj+ormqbp7diYl6SlLMLnY2JM35iVPJPpzt718G
	 QalBi++2jA79sjJzmHf6yzYszKwG8sZo7d1kZUOmURPyViJADBQ7frITF9GLSHC3XRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B720C606A88E;
	Wed, 18 Nov 2026 09:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B720C606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <eb60698d243da29c61b3ffded6acca90dfcb3475.camel@crapouillou.net>
Subject: Re: [PATCH v3 2/7] pinctrl: ingenic: Fix hardware dual-edge
 interrupts on X1600
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Wed, 18 Nov 2026 10:13:31 +0100
In-Reply-To: <29961993f8fdc1db97854f940ecf3883c2d32cf6.1794987700.git.hns@goldelico.com>
References: <cover.1794987700.git.hns@goldelico.com>
	 <29961993f8fdc1db97854f940ecf3883c2d32cf6.1794987700.git.hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nikolaus,

Le mercredi 18 novembre 2026 =C3=A0 08:41 +0100, H. Nikolaus Schaller a =C3=
=A9crit=C2=A0:
> Use the hardware dual-edge detector on X1600 and X2000.
>=20
> Set PAT1 when configuring both edges and program EDG on X1600.
> Keep software edge switching for older SoCs without EDG.
>=20
> Tested on X1600 and X2000 using GPIO buttons and register readback.
>=20
> Fixes: 943e0da15370 ("pinctrl: Ingenic: Add pinctrl driver for X2000.")
> Fixes: 4da56f9c6f14 ("pinctrl: ingenic: add x1600 support")

You'll have to decide, I don't think you can have two Fixes: lines.

You also need to add:
Cc: stable@vger.kernel.org

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 19 +++++++++++--------
> =C2=A01 file changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-
> ingenic.c
> index 88c5edeaaddcc..dc5d38c16e18d 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -3622,6 +3622,10 @@ static void irq_set_type(struct ingenic_gpio_chip
> *jzgc,
> =C2=A0		break;
> =C2=A0	}
> =C2=A0
> +	if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
> +	=C2=A0=C2=A0=C2=A0 is_soc_or_above(jzgc->jzpc, ID_X1600))

That actually fits in one line of 80 chars.

But you can do even better and move that to the switch above, and replace t=
he
val1 =3D val2 =3D false;

with:
val1 =3D false;
val2 =3D is_soc_or_above(jzgc->jzpc, ID_X1600);

> +		val2 =3D true;
> +
> =C2=A0	if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
> =C2=A0		reg1 =3D JZ4770_GPIO_PAT1;
> =C2=A0		reg2 =3D JZ4770_GPIO_PAT0;
> @@ -3635,15 +3639,13 @@ static void irq_set_type(struct ingenic_gpio_chip
> *jzgc,
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	if (is_soc_or_above(jzgc->jzpc, ID_X2000)) {
> -		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
> -		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
> -		ingenic_gpio_shadow_set_bit_load(jzgc);
> -		ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
> -	} else if (is_soc_or_above(jzgc->jzpc, ID_X1000)) {
> +	if (is_soc_or_above(jzgc->jzpc, ID_X1000)) {
> =C2=A0		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
> =C2=A0		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
> =C2=A0		ingenic_gpio_shadow_set_bit_load(jzgc);
> +
> +		if (is_soc_or_above(jzgc->jzpc, ID_X1600))
> +			ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset,
> val3);

The minimal diff would have been to change the check for ID_X2000 to ID_X16=
00
above. But the code does look better this way so I take it.

> =C2=A0	} else {
> =C2=A0		ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
> =C2=A0		ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
> @@ -3718,7 +3720,7 @@ static void ingenic_gpio_irq_ack(struct irq_data *i=
rqd)
> =C2=A0	bool high;
> =C2=A0
> =C2=A0	if ((irqd_get_trigger_type(irqd) =3D=3D IRQ_TYPE_EDGE_BOTH) &&
> -	=C2=A0=C2=A0=C2=A0 !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
> +	=C2=A0=C2=A0=C2=A0 !is_soc_or_above(jzgc->jzpc, ID_X1600)) {
> =C2=A0		/*
> =C2=A0		 * Switch to an interrupt for the opposite edge to the one
> that
> =C2=A0		 * triggered the interrupt being ACKed.
> @@ -3758,7 +3760,8 @@ static int ingenic_gpio_irq_set_type(struct irq_dat=
a
> *irqd, unsigned int type)
> =C2=A0		irq_set_handler_locked(irqd, handle_bad_irq);
> =C2=A0	}
> =C2=A0
> -	if ((type =3D=3D IRQ_TYPE_EDGE_BOTH) && !is_soc_or_above(jzgc->jzpc,
> ID_X2000)) {
> +	if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
> +	=C2=A0=C2=A0=C2=A0 !is_soc_or_above(jzgc->jzpc, ID_X1600)) {

Keep it on line line.

Cheers,
-Paul
