Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606262;
	b=ZMp+F9Gnk3PUn4j9xkb5Dpuc0XJzuGkYPz9kRIwYxIVGU36XHMstlOiIcqVdcBfWLLCx
	 hFbUxgEltNGuxRl54labIZWTQ1OHW6BB+vyf/ZktK/GXmSGbHQRsl5PX/CmGYfG80RhZ8
	 ADqCU0ox/nDR72+jUpvxE3hd8u7EP4AcOI4dma4+wegH9j1GJ1qeXcAXDYVqVnHhFsFac
	 wgyiTIHy0Lg+E8NMzk1QhYFWyyMrCv1AxnkimooAoYnJymH4ugeUldPj24+P+gCM9+bWo
	 lJmZkpMD1ucUaDIQxs0WiFJDpoCHrYuTpbg8qqju9CadtKHn3+8uV2tX2qCJLjzCaAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606262;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jXLUrJBOrkNfXKOqBgafE4yStIV1aB/uU7S9kATHnE8=;
	b=iBVfFWqBK81mFZcOYIH4+9cJROe2yPRoQpI5lxdLbYSiZKfrnz9XHQVcj49BqT0WQlfh
	 P8HgsUawL73STe4/fu1XjhAjDfxowRxGT3004HDXjw1Bl9JJ9QPAisqwqEwhGUlqFg7kH
	 DwidH3Oh7/pIBDfgijFsqEapcbmQ4yV4fE31IJQAZ/Nw1SoVkfHwjawh7nZQSu8e2Nj58
	 T9XMy76DBUx9vsrnirXoZ9PAuWVv2nVrVseoQ3ko3NaDvzV/5e4DqzaTjmXTfse5w34dn
	 zBd3V+SXnsu8vvr1ytrZrCIZxTgKiiYAT9MaSFk1ohUGafukJZmQhQUAeKCiI5+4CRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jIv0Zrqq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A99A606A321
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jIv0Zrqq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FE11F000C4;
	Wed, 25 Nov 2026 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795606261;
	bh=jXLUrJBOrkNfXKOqBgafE4yStIV1aB/uU7S9kATHnE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jIv0Zrqq1PRnLl14nBc5GFlqwujmm6rt980QuyPn1dqHGAcem2QhgXdGjB++sERqc
	 m8KYM9jr8ZZtJbJLTNDkwudo4AKd533Lj6N09+xXtNOmANUTCvZ8FNgmYIZpgTB+/+
	 +7jN/hHXolQIXz31BzJwEVBe03RsnC9yuJUTCIPneURx5xWiyj9mlLroz/ZHnyRAZN
	 IKVRkiTh5zs1oXmOw68pgT/GQx8x0r7elTBKWw/d8+ZDvA6FRezA2Gx/Y9+NHJn1ma
	 a9Cd7NieihYnPfEcplBv7yhsMxwWFABddF5uBbzsGHGnjbjPcZmT12wb3EX9mOTrU7
	 QN/ESa88yivww==
Message-ID: <sashiko-outbox-233252@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpiolib: release user space's lines when adding the
 chip fails late
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261125-gpiolib-setupdev-v1-1-aambrozewicz@nvidia.com>
References: <20261125-gpiolib-setupdev-v1-1-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:31:01 +0000
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
- [Medium] gpiolib: gc->free() skipped for shared GPIOs in
  gpiochip_numb_device()
- [Medium] gpiolib: double free_irq() and skipped gc->free() on ACPI
  GPIOs
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] gpiolib: early gdev list addition races with internal line
  requests [1]
--

commit a2a874bafb89861c1957ce33b2879e2d092ce02d
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

gpiolib: release user space's lines when adding the chip fails late

This commit extracts gpiochip_numb_device() from gpiochip_remove() and
calls it on the gpiochip_setup_dev() error path in
gpiochip_add_data_with_key() so that lines and IRQs requested by user
space after character device registration are released before tearing
down the chip.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 57024a1b042b6..f222b81ff7567 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -904,6 +904,24 @@ static void gpiochip_free_remaining_irqs(struct gpio=
_chip *gc)
>  		gpiod_free_irqs(gc, desc);
>  }
> =20
> +static void gpiochip_numb_device(struct gpio_chip *gc)
> +{
> +	struct gpio_device *gdev =3D gc->gpiodev;
> +
> +	/* Numb the device, cancelling all outstanding operations */
> +	rcu_assign_pointer(gdev->chip, NULL);
> +	synchronize_srcu(&gdev->srcu);
> +
> +	/*
> +	 * No new interrupts can be requested through the character device now.
> +	 * Have it free the ones it holds, also on the shared proxies, before
> +	 * forcibly freeing the rest and removing the irqchip.
> +	 */
> +	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
> +	gpio_device_teardown_shared(gdev);
> +	gpiochip_free_remaining_irqs(gc);
> +}
> +
>  static void gpiodev_release(struct device *dev)
>  {
>  	struct gpio_device *gdev =3D to_gpio_device(dev);
> @@ -1390,13 +1408,18 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
gc, void *data,
>  	if (gpiolib_initialized) {
>  		ret =3D gpiochip_setup_dev(gc);
>  		if (ret)
> -			goto err_teardown_shared;
> +			goto err_numb_device;
>  	}
> =20
>  	return 0;
> =20
> -err_teardown_shared:
> -	gpio_device_teardown_shared(gdev);
> +err_numb_device:
> +	/*
> +	 * User space may hold lines by now. Free the hogs while the chip can
> +	 * still free them; the gpiochip_free_hogs() below then finds none.
> +	 */
> +	gpiochip_free_hogs(gc);
> +	gpiochip_numb_device(gc);

[Severity: Medium]
Does moving gpio_device_teardown_shared() into gpiochip_numb_device() skip
gc->free() for shared GPIO lines when gpiochip_setup_dev() fails?

gpiochip_setup_shared() reserves each shared pin on the parent chip via
gpiod_request_commit(desc, "shared"), which invokes gc->request().  Under
err_teardown_shared, gpio_device_teardown_shared() ran while gdev->chip
was still non-NULL.  Now gpiochip_numb_device() clears gdev->chip first,
so when gpio_device_teardown_shared() calls gpiod_free_commit(), guard.gc
is NULL and guard.gc->free() is skipped, leaking pinctrl reservations or
driver resources acquired in gc->request().

>  err_remove_irqchip:
>  	gpiochip_irqchip_remove(gc);
>  err_remove_irqchip_mask:

[Severity: Medium]
Can running gpiochip_numb_device() before gpiochip_irqchip_remove() and
acpi_gpiochip_remove() warn on a double free_irq() and skip gc->free() for
ACPI GPIOs?

gpiochip_add_irqchip() calls acpi_gpiochip_request_interrupts(), which
requests each ACPI event descriptor with gpiochip_request_own_desc(),
marks it GPIOD_FLAG_USED_AS_IRQ, requests event->irq, and sets
event->irq_requested =3D true.  When gpiochip_setup_dev() fails,
gpiochip_numb_device() now clears gdev->chip and force-frees event->irq
via gpiochip_free_remaining_irqs().  gpiochip_irqchip_remove() then calls
acpi_gpiochip_free_interrupts(), which sees event->irq_requested still
set and calls free_irq(event->irq, event) a second time (triggering the
"Trying to free already-free IRQ" warning in __free_irq()), and both
acpi_gpiochip_free_interrupts() and acpi_gpiochip_remove() call
gpiochip_free_own_desc() with gdev->chip already NULL, skipping
gc->free().

[Severity: High]
This problem wasn't introduced by this patch, but exposing the chip in
gpiochip_add_data_with_key() before its internal line requests complete
[1] lets a concurrent consumer grab a line first and abort
registration with -EBUSY.

gpiodev_add_to_list_unlocked(), of_gpiochip_add(), and acpi_gpiochip_add()
make the chip visible to consumers before gpiochip_hog_lines() and
gpiochip_setup_shared() run:

CPU0                              CPU1
gpiochip_add_data_with_key()
  gpiodev_add_to_list_unlocked()
  of_gpiochip_add()
                                  consumer_probe()
                                    gpiod_get()
                                      gpiod_request()
  gpiochip_hog_lines()
    returns -EBUSY
  goto err_free_hogs;

If an asynchronously probing consumer requests a line meant to be hogged
or shared, gpiochip_hog_lines() or gpiochip_setup_shared() fails with
-EBUSY and tears down the controller registration.

[1] https://sashiko.dev/#/bug/linux-0a1f2aa1-7014-44b7-8c14-12774825d6d8

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-gpiolib-se=
tupdev-v1-1-aambrozewicz@nvidia.com?part=3D1
