Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8844C4FE
	for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791721852; cv=none; b=mBu3tU/6ZoTu71JxghetrcyCHGVN94aeOie0n+Txl3HB4YTJ3k73snYgoCIMoIB+irCi5HlibObnPYhPip8btboRik6mOvBKKVJBYSeemVKqSpU2w7u0o/6ESiNGDv3H+UR85tGlUyfacu14i/Q+DbUHqWNikGRJQ+bOoqFiYXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791721852; c=relaxed/simple;
	bh=yaCD2lchGH4lHH3EBX7UNoOJbSEB+VAEiBPS8s0SCxw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=p2KqD2UQuryM8OU/r8i8LfR47QmFIbIuM3QaFdBg+AShDyq4orPABBoZ7vwq7KDYp2e1QmWOQkYdXSLeJB7b/8llh4kEBDBZ/GCLcxJpnniZKfnUyR3kms84y022NXeYxyTGRZ6vJiDDusFV+AoZGwCAFRlmNbZUUcyLDCSIqCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBPXxYtz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBPXxYtz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44C91F0089B;
	Sun, 11 Oct 2026 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791721841;
	bh=PkPEeC9G8c7L+hB6b66bVStjnzvEute+5QQ/aAsNS8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nBPXxYtzZtHs5IHk6n/3dIz1r0vK3oMIDm4SeL0czg1OQ4Ud0vUGsR7Z3HcejLS+y
	 /I4xFcPo5HKz/+ugSK2uM9aqxQ4gONVp3bhN6AhoGZyO6oYGonyWp7D0KJyuGozyRl
	 JuHujbiW9OmtL4wq3fEEiW4IPhrMbJIKOPZaJsqgDs/jZLhOy+wj8nxY7VhEQ6IDBL
	 B+wGfl/o5ShSsLODS4vD0xdwb4vaMHnI4jKg6jG9LD1D6sTk2IBARjCTCJZCvP6M2p
	 myEbjJvyyptNf3STaqiJ5YFU5B1JbTl7BiSYwpUA/Tzm9TxdeZbBjt5lk4IZeFOmh9
	 zJzBE9ABevtAA==
Message-ID: <sashiko-outbox-167223@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 3/5] gpio: Leverage revocable for accessing struct
 gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261011121246.162759-4-tzungbi@kernel.org>
References: <20261011121246.162759-1-tzungbi@kernel.org>
 <20261011121246.162759-4-tzungbi@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 12:30:41 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] gpio: ABBA deadlock during chip removal due to SRCU lock held whil=
e sleeping in read()
- [High] gpio: TOCTOU race in gpiod_get_direction() overwrites concurrent d=
esc->flags updates
- [Medium] gpio: memory leak of desc->label when chip is revoked before gpi=
od_free_commit
- [Low] core: initialization and teardown sequence mismatch (LIFO violation=
) in gpiodev_release
- [Low] gpio: UAF risk in callers of deprecated gpio_device_get_chip()
--

commit 1cecc3cf824694935c1167959e5066cdaf4d16c5
Author: Tzung-Bi Shih <tzungbi@kernel.org>

gpio: Leverage revocable for accessing struct gpio_chip

The underlying chip can be removed asynchronously. `gdev->srcu` is used
to ensure the synchronization before accessing `gdev->chip`. Revocable
encapsulates the details. Leverage revocable for accessing the struct
gpio_chip and remove the `gdev->srcu`.

> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index a30564d1525ad..50736dd65762d 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2590,11 +2575,9 @@ static ssize_t lineinfo_watch_read(struct file *fi=
le, char __user *buf,
>  	ssize_t bytes_read =3D 0;
>  	int ret;
>  	size_t event_size;
> +	struct gpio_chip *gc;
> =20
> -	guard(srcu)(&cdev->gdev->srcu);
> -
> -	if (!rcu_access_pointer(cdev->gdev->chip))
> -		return -ENODEV;
> +	revocable_try_access_or_return(&cdev->gdev->chip_rev, gc);

[Severity: High]
Does this introduce a potential ABBA deadlock during chip removal?

When userspace reads from the character device (e.g., in lineinfo_watch_rea=
d(),
linereq_read(), or lineevent_read()), this macro acquires the chip_rev SRCU
read lock and holds it for the duration of the function.

If the event FIFO is empty, the reader sleeps indefinitely in
wait_event_interruptible_locked() while holding the SRCU read lock.

Concurrently, if the device is hot-unplugged, gpiochip_remove() calls
revocable_revoke(), which blocks on synchronize_srcu() waiting for all read=
ers
to exit. The reader, however, is waiting to be woken up by the device
unregistered notifier, which is triggered via gcdev_unregister() after
revocable_revoke() has finished. This would cause the removal process to ha=
ng.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f9173560812d0..530daaab60dc1 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -336,7 +337,10 @@ EXPORT_SYMBOL(gpio_device_get_label);
>   */
>  struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
>  {
> -	return rcu_dereference_check(gdev->chip, 1);
> +	struct gpio_chip *gc;
> +
> +	revocable_try_access_with(&gdev->chip_rev, gc);
> +	return gc;
>  }
>  EXPORT_SYMBOL_GPL(gpio_device_get_chip);

[Severity: Low]
This isn't a bug, but can this lead to a Use-After-Free for callers of this
deprecated API?

The revocable_try_access_with macro establishes a scoped cleanup guard that
releases the SRCU lock when exiting the function. The caller thus receives a
bare, unprotected pointer. If the GPIO chip is concurrently removed, any
subsequent dereference by callers (e.g. qe_pin_request() accessing gc->base
without synchronization primitives) could result in a UAF.

[ ... ]

> @@ -455,14 +457,13 @@ int gpiod_get_direction(struct gpio_desc *desc)
>  	unsigned long flags;
>  	unsigned int offset;
>  	int ret;
> +	struct gpio_chip *gc;
> =20
>  	ret =3D validate_desc(desc, __func__);
>  	if (ret <=3D 0)
>  		return -EINVAL;
> =20
> -	CLASS(gpio_chip_guard, guard)(desc);
> -	if (!guard.gc)
> -		return -ENODEV;
> +	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
> =20
>  	offset =3D gpiod_hwgpio(desc);
>  	flags =3D READ_ONCE(desc->flags);
> @@ -475,7 +476,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
>  	    test_bit(GPIOD_FLAG_IS_OUT, &flags))
>  		return 0;
> =20
> -	ret =3D gpiochip_get_direction(guard.gc, offset);
> +	ret =3D gpiochip_get_direction(gc, offset);

[Severity: High]
Could this sequence cause a Time-of-Check to Time-of-Use (TOCTOU) race where
concurrent atomic updates to desc->flags are overwritten?

This function reads desc->flags into a local variable and then calls the
potentially sleeping gpiochip_get_direction(). If a concurrent operation
modifies desc->flags atomically (e.g., gpiochip_lock_as_irq() setting
GPIOD_FLAG_USED_AS_IRQ), the subsequent non-atomic WRITE_ONCE(desc->flags, =
flags)
at the end of gpiod_get_direction() will clobber that update.

If GPIOD_FLAG_USED_AS_IRQ is lost, the subsystem loses track of the fact th=
at
the pin is used as an interrupt, allowing concurrent code to reconfigure the
pin as an output.

[ ... ]

> @@ -898,10 +897,10 @@ static void gpiodev_release(struct device *dev)
>  	synchronize_srcu(&gdev->desc_srcu);
>  	cleanup_srcu_struct(&gdev->desc_srcu);
> =20
> +	revocable_destroy(&gdev->chip_rev);

[Severity: Low]
Does this teardown sequence violate LIFO (Last-In-First-Out) ordering rules?

In gpiochip_add_data_with_key(), gdev->desc_srcu is initialized before
gdev->chip_rev. Here in gpiodev_release(), gdev->desc_srcu is cleaned up
before gdev->chip_rev is destroyed.

While this may not cause an immediate crash, this fragile lifecycle
management is an anti-pattern.

[ ... ]

> @@ -2680,16 +2674,17 @@ int gpiod_request(struct gpio_desc *desc, const c=
har *label)
>  void gpiod_free_commit(struct gpio_desc *desc)
>  {
>  	unsigned long flags;
> +	struct gpio_chip *gc;
> =20
>  	might_sleep();
> =20
> -	CLASS(gpio_chip_guard, guard)(desc);
> +	revocable_try_access_or_return_void(&desc->gdev->chip_rev, gc);
> =20
>  	flags =3D READ_ONCE(desc->flags);
> =20
> -	if (guard.gc && test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
> -		if (guard.gc->free)
> -			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
> +	if (test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
> +		if (gc->free)
> +			gc->free(gc, gpiod_hwgpio(desc));

[Severity: Medium]
With the early return introduced here, does this skip the rest of the clean=
up
block if the chip has been revoked, leaking the label?

If a GPIO line is requested and a label is dynamically allocated, and later=
 the
chip is unbound (revoking the chip_rev handle), calling gpiod_free_commit()
will return early. This skips the desc_set_label(desc, NULL) cleanup further
down in the function.

When gpiodev_release() later frees the descriptor array, the active labels =
are
not freed, which results in a memory leak.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011121246.1627=
59-1-tzungbi@kernel.org?part=3D3
