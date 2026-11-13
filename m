Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558384;
	b=GrFWvn7nApQ7kmoCRYU8Fr3fkD/DeBtRJKyW6hcmuyM8r4OAK95mGQ1MYO7jxQr05Bao
	 Q3lU9T1FaxE/KjuLWKSBu2X63HWJcMQ4AzBn+2FOQuabCud1bd4Q4P9MClM831nWqyHXR
	 U/Mw9AaotojpFRXGoDDRRT8Q1T7gv9E0TTgW0a2nOzT/cXcZzjzXsLDLH2D7nKZum3ZFY
	 Pb5ouxrWulIHZ8YeHvyQSnvEq6ofMiKu99HZO6cPtpu0LMJ4KIRNqBKeL4+vJ+HfC9Qh1
	 B9SArAowhOrK5RIElAetVm66rPzWRBo4X6Dt+CQ3QHsWsvaeCY08i0wZfV0PWFa5vkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558384;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=837lUnH6CnJSRmfKfgKv/ZWXkJOz2AH5o5qRFtY8vr4=;
	b=5B62mAeU6rOzY5iWuQXBbKf8+eTgqoJP5czwaFYEoH/eh/xU4en+kCrR56+7SyWJq+dw
	 hwquhPymUfljIkhnvP7XDBrmcZM9TlAx3WroUI20+MObahDm9ozaFkfkGZAjHFem2nvyS
	 YmrqLKlFibDKAM2ISHno8bZiFQHTnWaw+75dvEibujExVebpJ6JZzhG8Lk9p9+Eu8CRA5
	 rHgOUZ8/oN4+io+BN8Qj8IzPnyDXOUi0/VYLHG8pXa+IXZiznmWvm9pZbIx6U/bjfN1Xp
	 f9Pg17HeP/Fphki8kd/Ccyx6zjhVkjBeO3XMJRlJXVQgWD2TsYIIWMpivJbdh/06YRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROWSg72i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB6C606A31C;
	Fri, 13 Nov 2026 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROWSg72i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2151F000C4;
	Fri, 13 Nov 2026 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558383;
	bh=837lUnH6CnJSRmfKfgKv/ZWXkJOz2AH5o5qRFtY8vr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ROWSg72ijhy9XYwPui5Hh0sBUETm45Nb42Ktgc9AxEuhJsI+9qmlrTTYPCTEQmoBv
	 lM7c1yzRvXeER4bqyz+S7ImHFnjjdWDYCnwPyYgLa+CxS3ysRbFj0R7YDV0nweAJGg
	 LMXjgxNOJeCWFCqLE+E55eCWIVvGq7yELNnlJ9XVB1zL0ZRIWbfkRmEvLRlHJxTAVD
	 cc1j/Q1xZ71Ylvuw40OcyEySFfkmf71IMUmd4uJ++6GiD4kjWYHv0/8zSWJFf1Za4t
	 mG6yengmfzVMiULvWIQAi4P+gy+i+Yc/lz9c4FBv5RchdKoXE39O8snqviHcr/dhsB
	 vuPlcsmA+LrsA==
Message-ID: <sashiko-outbox-212398@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] pinctrl: ingenic: Add X2600 register and GPIO IRQ
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <1c495c7ac851aff2a798c82acf33bbb33da37953.1794557697.git.hns@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
 <1c495c7ac851aff2a798c82acf33bbb33da37953.1794557697.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:26:23 +0000
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
- [Low] pinctrl: ingenic: redundant X2600_GPIO_FLAG_CLR branch in
  ingenic_gpio_irq_ack()
- [Low] pinctrl: ingenic: redundant dual-edge checks and shadow writes
  in irq_set_type()
--

commit 4b5a0225ba958d5462cbfa1ae4bab23a1b574fea
Author: H. Nikolaus Schaller <hns@goldelico.com>

pinctrl: ingenic: Add X2600 register and GPIO IRQ support

This commit adds the X2600 SoC ID, adapts the GPIO shadow and interrupt
flag register accesses to the X2600 layout, and updates GPIO dual-edge
interrupt configuration for X1600, X2000, and X2600.

> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-=
ingenic.c
> index 1aa6a6dc12095..6794c662d2afe 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c

[ ... ]

> @@ -3616,6 +3628,12 @@ static void irq_set_type(struct ingenic_gpio_chip =
*jzgc,
>  		break;
>  	}
> =20
> +	if (type =3D=3D IRQ_TYPE_EDGE_BOTH &&
> +	    (is_soc_or_above(jzgc->jzpc, ID_X2000) ||
> +	     (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
> +	      !is_soc_or_above(jzgc->jzpc, ID_X1830))))
> +		val2 =3D true;
> +
>  	if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
>  		reg1 =3D JZ4770_GPIO_PAT1;
>  		reg2 =3D JZ4770_GPIO_PAT0;
> @@ -3638,6 +3656,9 @@ static void irq_set_type(struct ingenic_gpio_chip *=
jzgc,
>  		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
>  		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
>  		ingenic_gpio_shadow_set_bit_load(jzgc);
> +
> +		if (is_soc_or_above(jzgc->jzpc, ID_X1600) && !is_soc_or_above(jzgc->jz=
pc, ID_X1830))
> +			ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
>  	} else {
>  		ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
>  		ingenic_gpio_set_bit(jzgc, reg1, offset, val2);

[Severity: Low]
This isn't a bug, but irq_set_type() is only called from
ingenic_gpio_irq_ack() (with IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH) and
ingenic_gpio_irq_set_type(), which converts IRQ_TYPE_EDGE_BOTH into a level
trigger on SoCs without hardware dual-edge support before calling
irq_set_type(). Because case IRQ_TYPE_EDGE_BOTH in irq_set_type() is only
reached on SoCs with hardware dual-edge support, val2 can be set to true
directly in the switch statement without re-checking the SoC version.

Also, the ID_X2000 and ID_X1000 branches in irq_set_type() now run the same
shadow register sequence, and the compound SoC check for hardware dual-edge
support is repeated across irq_set_type(), ingenic_gpio_irq_ack(), and
ingenic_gpio_irq_set_type(), which could be factored into a small helper
and a single ID_X1000 branch.

[ ... ]

> @@ -3724,7 +3746,9 @@ static void ingenic_gpio_irq_ack(struct irq_data *i=
rqd)
>  			irq_set_type(jzgc, irq, IRQ_TYPE_LEVEL_HIGH);
>  	}
> =20
> -	if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
> +	if (is_soc_or_above(jzgc->jzpc, ID_X2600))
> +		regmap_write(jzgc->jzpc->map, jzgc->reg_base + X2600_GPIO_FLAG_CLR, BI=
T(irq));
> +	else if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
>  		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
>  	else if (is_soc_or_above(jzgc->jzpc, ID_JZ4740))
>  		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);

[Severity: Low]
This isn't a bug, but is the separate ID_X2600 branch and X2600_GPIO_FLAG_C=
LR
definition needed here?

JZ4770_GPIO_FLAG is 0x50 and REG_CLEAR(x) is ((x) + 0x8), so calling
ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false) in the existing
ID_JZ4770 branch already writes BIT(irq) to jzgc->reg_base + 0x58, which is
identical to X2600_GPIO_FLAG_CLR.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794557697.gi=
t.hns@goldelico.com?part=3D2
