Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EEE286A5
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 19:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487857; cv=none; b=CBcD/Uxt4MFc/VpHYUm9NO0ueA87S9Ers9KnKva4vDs9YILafF0Kmn+j/t5Nm5loD2Y6XUiWR/CvVHq6NxtGcBOe+QLznGhTbi+/tri+Jrw7uWOCOfQu+vuiylVJfnTjBWOAn3nlB/YiAnn8wowKdDp6+jY8kHZ2CCY+1NEvAKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487857; c=relaxed/simple;
	bh=tJ/7BtqnSM+WHfapPl6P07CLAernuZ0NbpPYeSfdMN8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Xl7RVcN9/ItS+kuxSWeaje5y5VbOpd1WKCvGIO+vCyIXWGcV22iwLSGga0Ob01n0RDvr5FHCNuOngDxBI3nw89uxsjNg0Tsd7IT94ijnrecB5wPl4obeqwJVfSSxv9WokYtHGKbzAFwx+TWqfYJOSuglAzF18ZaB0DtuJvrbRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mf43w0l1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mf43w0l1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928641F000FF;
	Thu,  8 Oct 2026 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791487855;
	bh=qY+63xLoOgNBsnHKXk1WpI9TdO15rKhx8U2BxJB8alE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mf43w0l1FJQwWoY5mA4bEQLi2QTf4vKXHkDBghUpKzOvfaMgBScsLVWn57jEFaZ7X
	 c6Cpk4sFp/4cUPiAtxZEKCjfz8c8ekkx/8lSgR7hXY/g5j/8ji7R0DMp7zlkY5clhZ
	 FK7Dw8z9kOz0EKNb56/CBGwPrvr/FBaprTCjVK5oeBTc6/wQcx6FniSouh36d1WhOV
	 0blf2cQ5vYGBA8QRzVlv54PtLSG+d9NjkaA7fCENqQZ3MiM3JaeaGi6PnOSNb9cK+h
	 L9IoB5KFuEVKIfFP5Qh1l5cQ7zkK8nbvoKrIkGp5yOgj8/szD4sM9HakwGdLqzCaDa
	 khVdD0h6y63Zw==
Message-ID: <sashiko-outbox-164526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6.6.y 2/2] gpio: rockchip: fix generic IRQ chip leak on
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Dinaburg" <artem@trailofbits.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261008191824.98662-3-artem@trailofbits.com>
References: <20261008191824.98662-1-artem@trailofbits.com>
 <20261008191824.98662-3-artem@trailofbits.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 19:30:55 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: rockchip: UAF in rockchip_gpio_to_irq due to teardown order
- [High] gpio: rockchip: missing irq mapping disposal causes UAF
--

commit 7ad98fc33c5f3a1c30b1b0722c11e01bbf5172c9
Author: Marco Scardovi <scardracs@disroot.org>
Subject: gpio: rockchip: fix generic IRQ chip leak on remove

This patch addresses a resource leak by explicitly removing the generic
chips and the IRQ domain in rockchip_gpio_remove().

Link: https://patch.msgid.link/20260607230504.35392-2-scardracs@disroot.org

> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index e0e4f3ed5fdd4..86cf3cbcdb403 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -786,8 +786,10 @@ static int rockchip_gpio_remove(struct platform_devi=
ce *pdev)
>  	struct rockchip_pin_bank *bank =3D platform_get_drvdata(pdev);
> =20
>  	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
> -	if (bank->domain)
> +	if (bank->domain) {
> +		irq_domain_remove_generic_chips(bank->domain);
>  		irq_domain_remove(bank->domain);

[Severity: High]
Does removing the IRQ domain before calling gpiochip_remove() introduce a
use-after-free race condition?

Because the GPIO chip is still registered and active in gpiolib, concurrent
operations (like a sysfs write configuring an edge trigger) can still invoke
gpiod_to_irq(). This triggers the driver's .to_irq callback:

rockchip_gpio_to_irq() {
    ...
    virq =3D irq_create_mapping(bank->domain, offset);
    ...
}

Since bank->domain has already been freed, this will dereference a dangling
pointer. Would reversing the teardown order to call gpiochip_remove() before
freeing the domain unregister sysfs nodes, drain pending operations, and
safely close this race window?

[Severity: High]
Does removing the IRQ domain here without disposing of active mappings leak
those mappings and cause a use-after-free in the core IRQ subsystem?

When the domain is removed without iterating over active pins to call
irq_dispose_mapping(), the core IRQ code hits a warning:

irq_domain_remove() {
    ...
    WARN_ON(!radix_tree_empty(&domain->revmap_tree));
    ...
    irq_domain_free(domain);
}

Active IRQ descriptors will retain a dangling pointer to the freed domain in
their irq_data->domain fields. When consumer drivers subsequently unbind and
free their IRQ, irq_dispose_mapping() accesses the freed domain pointer to
check hierarchy flags, leading to a crash.

Should the active mappings be disposed of before removing the domain?

> +	}
>  	gpiochip_remove(&bank->gpio_chip);
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008191824.9866=
2-1-artem@trailofbits.com?part=3D2
