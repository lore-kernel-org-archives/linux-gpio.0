Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4E74E2349;
	Fri,  9 Oct 2026 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546621; cv=none; b=FAWuKqj3wVsTAmouygu5emjBVuJBputjtZvDxpXGJv9RWjKQQqKJXBVSiEDGcog2MlnDWwzzR+/CQ0QzBRVyYOZq30SditI9ZXOejWd+fhr4cBW/tiIoV4kNkUoSj0cR8+qAniZGa1+mALHpEZNz2c8W8UmFtThLQA+DoEZLHRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546621; c=relaxed/simple;
	bh=TFFXd+cYvc3fHp3gDWL+8qJ5N7qaWtRg3yREQteF56Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Su6QebNZEo2efiu/RnuhsOj3FEAny4EPWsWWzaM0IVGXGM0kvb2Wes1UDxoEe6uvR+aTOQSA/ZSIdXAzqm0nkQ5/v6fX1rh0FdpJYlGKJVd/mygvBBKgmybC0rr43hhww1oNtlzdJ0+pAjBX044dYSoGEJ0T2JkFrlVtC7IUEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7GoWAV3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7GoWAV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BE11F00898;
	Fri,  9 Oct 2026 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791546613;
	bh=iPppRqxLZdk1AqDwV5UXKlvkeVFupk8bydDBCQstFDg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M7GoWAV3egh4uo4+ZH0C21YbYXclOoBwydxCv38DQgU2UJDAgxa31ZzfK81XwWyBp
	 pcZIB1ZthWapeso2NohGn7cNJaSdWilPmtQOaoiaccZ/mLdCSJjdydYVpOE+XThriB
	 +Fpg/4okrUuMA0BgvWaC3mE74ohooXA2Hk0RkoBCL+n5ikVOKo3hPH2WxBXsjYURmP
	 Zqm5OpGo5a0NB57J3iDd2L9tZox+BG2G6b4TZ7jBiD9kNjAnuEJliSn+/SrnKzTKu+
	 6GtanFF0hPvLxkULt7FYVWmzA08iiQ1NbmvKks0q5tr7rWFNF9fMFSjR02bntZHOlb
	 XDsO+3fohpCbw==
Message-ID: <sashiko-outbox-165431@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] gpio: pl061: switch data path to gpio-regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20261009-cv75-gpio-v1-6-5836bd438423@ambarella.com>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-6-5836bd438423@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:50:11 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] gpio: UAF of irq_domain during devm teardown due to LIFO ordering
- [High] gpio: Missing GPIOCHIP_IRQ_RESOURCE_HELPERS allows GPIO/IRQ confli=
cts
- [High] gpio: Missing synchronize_irq() causes UAF on chained handler remo=
val
--

commit b485edbbc0d9055aa12255ec0a09e3fe648808bb
Author: Long Zhao <longzhao@ambarella.com>

    gpio: pl061: switch data path to gpio-regmap
   =20
    Move get, set and direction onto gpio-regmap. ARM PL061 sets
    GPIO_REGMAP_QUIRK_SET_AFTER_DIR so the output value is written
    after the direction change.

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index b7632b30a9098..ba3350a8971c8 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
[ ... ]
> @@ -293,29 +227,28 @@ static void pl061_irq_unmask(struct irq_data *d)
[ ... ]
> -static const struct irq_chip pl061_irq_chip =3D {
> +static const struct irq_chip pl061_irqchip =3D {
> +	.name			=3D "pl061",
>  	.irq_ack		=3D pl061_irq_ack,
>  	.irq_mask		=3D pl061_irq_mask,
>  	.irq_unmask		=3D pl061_irq_unmask,
> @@ -323,67 +256,187 @@ static const struct irq_chip pl061_irq_chip =3D {
>  	.irq_set_wake		=3D pl061_irq_set_wake,
>  	.irq_print_chip		=3D pl061_irq_print_chip,
>  	.flags			=3D IRQCHIP_IMMUTABLE,
> -	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> -};

[Severity: High]
Does this code omit the GPIOCHIP_IRQ_RESOURCE_HELPERS macro?=20

Without the .irq_request_resources and .irq_release_resources callbacks it
provides, gpiolib won't be notified when an IRQ is requested, and
gpiochip_lock_as_irq() is skipped.

Could this allow the GPIO line to be concurrently configured as an output
while it is actively firing interrupts?

[ ... ]
> +static void pl061_remove_irq(void *data)
> +{
> +	struct pl061 *pl061 =3D data;
> +
> +	irq_set_chained_handler_and_data(pl061->parent_irq, NULL, NULL);

[Severity: High]
Can a concurrent interrupt handler still be executing here?

This replaces the flow handler but doesn't wait for currently executing
handlers to finish like synchronize_irq() would.

> +
> +	for (unsigned int i =3D 0; i < pl061->data->ngpio; i++) {
> +		unsigned int virq;
> +
> +		virq =3D irq_find_mapping(pl061->irq_domain, i);
> +		if (virq)
> +			irq_dispose_mapping(virq);
> +	}
> +
> +	irq_domain_remove(pl061->irq_domain);

[Severity: High]
Could the lack of synchronization against concurrent interrupts lead to a
use-after-free here?

If pl061_irq_handler() is concurrently executing on another CPU, it might c=
all
generic_handle_domain_irq(pl061->irq_domain, ...) and dereference the
domain after it has been freed.

> +}
[ ... ]
> +	gpio_regmap =3D devm_gpio_regmap_register(dev, &config);
> +	if (IS_ERR(gpio_regmap)) {
> +		if (pl061->irq_domain)
> +			irq_domain_remove(pl061->irq_domain);
> +		return PTR_ERR(gpio_regmap);
> +	}
> +
> +	if (irq) {
> +		ret =3D devm_add_action_or_reset(dev, pl061_remove_irq, pl061);

[Severity: High]
Because devm executes actions in reverse (LIFO) order, pl061_remove_irq() w=
ill
execute before the gpio_regmap is unregistered.

Will this destroy the irq_domain while the gpio_chip is still active?

If so, when the gpio_chip is later unregistered, gpiochip_remove() might
dereference the freed domain pointer when attempting to tear down requested
IRQs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-cv75-gpio-=
v1-0-5836bd438423@ambarella.com?part=3D6
