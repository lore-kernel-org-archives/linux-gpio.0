Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940728;
	b=NGVCx7lHZqTV7c31rxfDYxfVgIG3KrKt/rypET8vy/7S+2Blv5986TUHh7yz6uc5jqvv
	 llZhV/yHLTue0toaWW8OTa/dFI/MgkNtBrmbDZPnbJrErRsoNNHlY3/AnyM9xSVWbdZiJ
	 ZfqVHYkhWitebM/d4d9drIn5K9C58nsxHqmnzsFpCbx+D7ss1NMqRZPJsMSX0LtsMjp6S
	 3ZYPpAzaNKq680Ascpo/eltDujX2hQbXsp/XI1QhCJ2kJnD9KidNkmYHCQJA7rbFfuiM8
	 2vOclwHedcmiE5WD0BE7gKTUANj2v2JHZU1tDkjsO6gnf10PIzTABMySe1f0i2fB+dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940728;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dXkgnkwvG82CtcofZShTx+jLwggtZI46Qg6fUKRJGXM=;
	b=iGEtVnbn/Rep4LHDCYR+2+eRQTpsQ9PxnfOfPm7KFs7OlwJFytoH3472Pu3kW5nSvL38
	 CjLhZvZa9aUTOO9K585GdrNahYZiuQA2jyDrY5UjxGhZQn2nvDsjkaQ23SfUS3avdk4Q+
	 jN88nIq72Y8jyyx9Yhy5G/QGjjp0iAGbC04UFp0JaSaXCYqMZEpLVqIHJCy5FB/bd9foh
	 WcuCBxK22zT6qZ51pLOJGd73bR981MF6x1s/+Q/qG9SfUq2uA60hprdc1B1ONYXsSK7eY
	 bAJyfx/PEt4Ttu4BBFGd0lcFZkl1uw4crXMgJ572XbLiO6HRZ1n9OVc2Kd/i3X6g/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcG5JMZs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3524606A31C;
	Tue, 17 Nov 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcG5JMZs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BC71F000C7;
	Tue, 17 Nov 2026 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940727;
	bh=dXkgnkwvG82CtcofZShTx+jLwggtZI46Qg6fUKRJGXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IcG5JMZsJBo9iCcQvJhu5NxBQqAK5G7qcG9UjTrOXmOcdh+Ya5o1VTPjvQ55GruOg
	 a/EW6KAm/F7oveJs+Hlsaqtgq6RWknpG0EJMCvQQhOK0noK8s+PIinojpB9dn8WsWB
	 Fc5ZW5vtu8Ct4Ry0USC7QgfT3OeqLk76m2qqK9Zbnh4hwvYhEp2kZcD9Q85ZmSgXiT
	 AQGDaHDzw/KCqL3RfNjzmEvFjxxMe8PT7uDNuhjMZRTQQjcGXKMthR7FX5IZwz4d6k
	 0g8QXf7IxTDAUErFsG5zmbEB2CPsqnG85rfdHbIFEobrfcp7XUb6P8wzpK76/Wj2hi
	 Ziob5Z7C+dSsA==
Message-ID: <sashiko-outbox-219369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] pinctrl: ingenic: Fix hardware dual-edge
 interrupts on X1600
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <b87494f8bd72efe7d4c8b8c7c6a5f37686861aff.1794940167.git.hns@goldelico.com>
References: <cover.1794940166.git.hns@goldelico.com>
 <b87494f8bd72efe7d4c8b8c7c6a5f37686861aff.1794940167.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:38:47 +0000
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
- [Low] pinctrl: ingenic: redundant checks and duplicated branch in
  irq_set_type()
- [Low] pinctrl: ingenic: missing Fixes: trailers for X2000 and X1600
  dual-edge IRQ
--

commit 478cc52f71c553d81f6fc71fbe29cdc01e47f147
Author: H. Nikolaus Schaller <hns@goldelico.com>

> pinctrl: ingenic: Fix hardware dual-edge interrupts on X1600
>
> Use the hardware dual-edge detector on X1600 and X2000.
>
> Set PAT1 when configuring both edges and program EDG on X1600.
> Keep software edge switching for older SoCs without EDG.
>
> Tested on X1600 and X2000 using GPIO buttons and register readback.
>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

[Severity: Low]
Should this bug fix include Fixes: tags for the commits that introduced X20=
00
and X1600 GPIO support?

  Fixes: 943e0da15370 ("pinctrl: Ingenic: Add pinctrl driver for X2000.")
  Fixes: 4da56f9c6f14 ("pinctrl: ingenic: add x1600 support")

> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-=
ingenic.c
> index 7d3f34c4fb589..f718725d84d4a 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -3622,6 +3622,10 @@ static void irq_set_type(struct ingenic_gpio_chip =
*jzgc,
>  		break;
>  	}
> =20
> +	if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
> +	    is_soc_or_above(jzgc->jzpc, ID_X1600))
> +		val2 =3D true;
> +
>  	if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
>  		reg1 =3D JZ4770_GPIO_PAT1;
>  		reg2 =3D JZ4770_GPIO_PAT0;
> @@ -3644,6 +3648,9 @@ static void irq_set_type(struct ingenic_gpio_chip *=
jzgc,
>  		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
>  		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
>  		ingenic_gpio_shadow_set_bit_load(jzgc);
> +
> +		if (is_soc_or_above(jzgc->jzpc, ID_X1600))
> +			ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
>  	} else {
>  		ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
>  		ingenic_gpio_set_bit(jzgc, reg1, offset, val2);

[Severity: Low]
This isn't a bug, but both callers of irq_set_type()
(ingenic_gpio_irq_set_type() and ingenic_gpio_irq_ack()) already convert
IRQ_TYPE_EDGE_BOTH to level triggers when !is_soc_or_above(jzgc->jzpc,
ID_X1600).  Can case IRQ_TYPE_EDGE_BOTH set val2 =3D true directly instead =
of
setting val2 =3D false and overriding it here?

Also, with the ID_X1600 check added to the ID_X1000 branch, the preceding
is_soc_or_above(jzgc->jzpc, ID_X2000) branch in irq_set_type() is now
identical and can be dropped:

drivers/pinctrl/pinctrl-ingenic.c:irq_set_type() {
    ...
	if (is_soc_or_above(jzgc->jzpc, ID_X2000)) {
		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
		ingenic_gpio_shadow_set_bit_load(jzgc);
		ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
	} else if (is_soc_or_above(jzgc->jzpc, ID_X1000)) {
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794940166.gi=
t.hns@goldelico.com?part=3D2
