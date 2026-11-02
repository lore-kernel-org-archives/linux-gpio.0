Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603424;
	b=QBEqJkQrkAqwuSAS8l19pM+rqkdBrBCRNQ5b6BX9u1zAo9AlgO6Dy0Uu5tUmMt0XyQEI
	 aF1aiIQh9Nx0Dp7CETFOpSYuAySvCymXn8J7oY/9s2eAExDI/nQLoV9XxCDQ8H4xThmfX
	 JXHrOqUIttYdh0YXCSUQdzO7m+5D7pTalWdPqwDYUJhskG3IDpGZVeh5P1H8QNX4CFmYv
	 uzn9sv5LpchMOTiya9cYOk1ns3SPYEYRPunwjuWjIljmZXNI2li+a2KCo5W0xwWVOvWo5
	 m/eXMhGzyCs1eHkQu5WiG9ZZjEhlis4yYzj1dvt9zMPgQoP0M8feClEDTaLkw+89lkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603424;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=71FZePZh0SfpCwU5gyU0mbWl8GFXJo1phIqc8eWVSCE=;
	b=LrY8UbIlxVbljY/nkQzrOzmZm2Xj5exNxcKnqxnT99sOqX04daTkKQt2E4Qlg1CCZ+dz
	 qJN1aGNG1ho3+NsybX0yxZsk8hjYMnWuFTFarVzoUXeuBxgaRUsMIYJpUZA08X4GDiOGe
	 jgRYlkcP3/lypLud92uHdCnIGGW6nT90VkdfIxSXgOliRJWRwc3c/elsQvHCAuK88RCli
	 a9FNZGEtSAzrG3BQu35FHYt7ZgTjT54wVH9pzU6qQcOS2r3x0zpIN+wTm8thI8oiZqxYI
	 v2bCLi1j6IGwKgRedfSy9EhgKWmaY+3NPeRmhnyh175g8s3EHdJHkRJs5axUFT9uSBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="N//0Kuz7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4384C606A324;
	Mon,  2 Nov 2026 07:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N//0Kuz7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC911F000C1;
	Mon,  2 Nov 2026 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793603423;
	bh=71FZePZh0SfpCwU5gyU0mbWl8GFXJo1phIqc8eWVSCE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N//0Kuz7v4UXomZCj47VB+G/UZA9rMVBxPkCih4uIryvrQ+OEOf4JN/zN1I7Ef9NI
	 TDnwsnX7SaT0G2+o56wEnNTM4XvMaGu3LctY0VgY87ccFOrHw1Gq2cLiqfLTssNcFo
	 s7Do+Hv9T+3Zwa+cLG1z5c1lFV6pPfWb+pMhKUXDXJKCnyxYHR9XVk8MQFVz5KoQEs
	 Jx9wJSddmkg8kQuKAPRx7IDzmXHF7SeOa4QAVyyooD0CoVKqbtwpsqEYrUets9HL7G
	 RoDOHfGr6m5YIT/w5bIv4UIlKWRG6V3YgGS063AAymu0HMXFd5nzrCg42OpCJiFEHS
	 TKRlhfpKJkwLQ==
Message-ID: <sashiko-outbox-193002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/13] gpio: pl061: switch data path to gpio-regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-cv75-gpio-v13-10-4f93114ea204@ambarella.com>
References: <20261102-cv75-gpio-v13-0-4f93114ea204@ambarella.com>
 <20261102-cv75-gpio-v13-10-4f93114ea204@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 07:10:23 +0000
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
- [High] gpio: pl061: dropping IRQ resource helpers breaks IRQ locking and =
unbind
--

commit 074c89211872cf47652e8bf1f251d42902b7bc3b
Author: Long Zhao <longzhao@ambarella.com>

gpio: pl061: switch data path to gpio-regmap

This commit switches the PL061 GPIO data path callbacks (get, set, and
direction) to use the gpio-regmap helper library while keeping a custom
irq_chip and instantiating an external irq_domain for gpio-regmap to attach.

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 27ed759486caf..cb1ef0f3774c1 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c

[ ... ]

> @@ -229,54 +198,47 @@ static int pl061_irq_type(struct irq_data *d, unsig=
ned trigger)

[ ... ]

>  static void pl061_irq_mask(struct irq_data *d)
>  {
> -	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> -	struct pl061 *pl061 =3D gpiochip_get_data(gc);
> -	u8 mask =3D BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
> +	struct pl061 *pl061 =3D irq_data_get_irq_chip_data(d);
> +	unsigned int mask =3D pl061_line_mask(pl061, irqd_to_hwirq(d));
> =20
> -	scoped_guard(raw_spinlock, &pl061->lock)
> -		regmap_clear_bits(pl061->regmap, GPIOIE, mask);
> -
> -	gpiochip_disable_irq(gc, d->hwirq);
> +	regmap_clear_bits(pl061->regmap, pl061->data->regs->ie, mask);
>  }
> =20
>  static void pl061_irq_unmask(struct irq_data *d)
>  {
> -	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> -	struct pl061 *pl061 =3D gpiochip_get_data(gc);
> -	u8 mask =3D BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
> -
> -	gpiochip_enable_irq(gc, d->hwirq);
> +	struct pl061 *pl061 =3D irq_data_get_irq_chip_data(d);
> +	unsigned int mask =3D pl061_line_mask(pl061, irqd_to_hwirq(d));
> =20
> -	scoped_guard(raw_spinlock, &pl061->lock)
> -		regmap_set_bits(pl061->regmap, GPIOIE, mask);
> +	regmap_set_bits(pl061->regmap, pl061->data->regs->ie, mask);
>  }

[ ... ]

> @@ -320,67 +280,169 @@ static const struct irq_chip pl061_irq_chip =3D {
>  	.irq_set_wake		=3D pl061_irq_set_wake,
>  	.irq_print_chip		=3D pl061_irq_print_chip,
>  	.flags			=3D IRQCHIP_IMMUTABLE,
> -	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};

[ ... ]

> +	if (irq) {
> +		const struct irq_domain_info info =3D {
> +			.fwnode		=3D dev_fwnode(dev),
> +			.size		=3D data->ngpio,
> +			.hwirq_max	=3D data->ngpio,
> +			.ops		=3D &pl061_irq_domain_ops,
> +			.host_data	=3D pl061,
> +		};
> +
> +		pl061->irq_domain =3D devm_irq_domain_instantiate(dev, &info);
> +		if (IS_ERR(pl061->irq_domain))
> +			return PTR_ERR(pl061->irq_domain);
> +
> +		/*
> +		 * Registered before the gpiochip so unbind runs it after
> +		 * gpiochip_free_remaining_irqs(), while the domain is still
> +		 * alive. devm removes the domain after this action.
> +		 */
> +		ret =3D devm_add_action_or_reset(dev, pl061_dispose_irq_mappings, pl06=
1);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
As reported by Sashiko on v11 [1], does dropping GPIOCHIP_IRQ_RESOURCE_HELP=
ERS
from pl061_irq_chip and removing gpiochip_disable_irq() and
gpiochip_enable_irq() from pl061_irq_mask() and pl061_irq_unmask() introduce
regressions during device unbind and GPIO direction changes?

Without gpiochip_reqres_irq() and gpiochip_relres_irq(),
GPIOD_FLAG_USED_AS_IRQ and GPIOD_FLAG_IRQ_IS_ENABLED are never set on the G=
PIO
descriptors.

On device unbind while an interrupt is requested (for example via userspace
cdev edge detection in edge_detector_setup() -> request_threaded_irq() or an
in-kernel consumer), devm_gpio_regmap_unregister() -> gpiochip_remove() ->
gpiochip_free_remaining_irqs() only frees descriptors that have
GPIOD_FLAG_USED_AS_IRQ set:

drivers/gpio/gpiolib.c:gpiochip_free_remaining_irqs() {
	for_each_gpio_desc_with_flag(gc, desc, GPIOD_FLAG_USED_AS_IRQ) {
		...
	}
}

Because that flag is never set, gpiochip_free_remaining_irqs() becomes a no=
-op
despite the comment in pl061_probe() above devm_add_action_or_reset(). Next,
pl061_dispose_irq_mappings() calls irq_dispose_mapping() -> irq_free_desc()
while desc->action and any threaded handler are still active. This triggers=
 a
warning in remove_proc_entry() on /proc/irq/<virq> and frees the irq_desc.
When the consumer later calls free_irq() (such as on closing the GPIO chara=
cter
device file descriptor), irq_to_desc(virq) returns NULL, leaking the irqact=
ion
and leaving the edge_irq_thread kthread running with a dangling dev_id poin=
ter
to the freed struct line.

In addition, without these helpers:
- gpiochip_lock_as_irq() is not called when an interrupt is requested, so
  requesting an IRQ on a line configured as a push-pull output is no longer
  rejected.
- gpiod_direction_output() no longer prevents switching a line with an acti=
ve
  interrupt to output mode.
- Module reference counting in gpiochip_reqres_irq() and gpiochip_relres_ir=
q()
  is bypassed.

Although the commit message compares this with gpio-idio-16,
gpio-pcie-idio-24, and gpio-104-idi-48, those drivers use fixed-direction
inputs for their interrupt-capable lines and did not previously use
GPIOCHIP_IRQ_RESOURCE_HELPERS, whereas PL061 lines have software-configurab=
le
direction.

[1] https://lore.kernel.org/r/20261020-cv75-gpio-v11-8-e058bae19571@ambarel=
la.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-cv75-gpio-=
v13-0-4f93114ea204@ambarella.com?part=3D10
