Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502610;
	b=ftE514B6tSH21JNEMZnn49+K5T3E58IdIJP6Zse/0NGDC0ABvFx+nA+eSKHOZfb39pzh
	 DCgJZV1vw6cPpK6VYqKldcws4JBsOKHI8ohbKQEvbqK5REN6ifDgOp3hvEz7ovNDpy74I
	 X+zo5MIG/YeawLiVH255eXpmcD5It96Q6ptPOzHs7BgFqMsjamTKB8afVvDYgOXOyMSCz
	 Uy7lGXflF74m0NrI5XRG1I0actc9eRn0tCyirmcv1uHLs/Po+C24UE4A4VQBQY5IPWvcm
	 dWF5FiCi4DNNHCTAd/OOuyIhpaPNIpEd9eDEoW6kaLSSuUWd5qwYlpLLpluvZe8yJtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502610;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fXVAywmvZwfVgrMBN2PTAU3bCoF8ViPD5//FGCvlQ88=;
	b=1isAMsn/dkKwhiWHfQAGxpxY7zY8wctjzjHhgZGkpkVVz93y3PzZF91BCUa/4oDzZv5e
	 xOKLOjiSYVwD3qfUEkl5rlwsZO/UK+vp7ETtJj0c5kjqfOYzK51dmwOgwSM3OiFk1jELp
	 1KTzVpNnp5Atfd3cmjH2s36hLZZeV/GkAbphUSOK9bMlwfZa6VvnW9uJ7uX1CKOs82Zzd
	 h/ZkItF/a1+9ciVPGrfdYcwHVQtbLqW1l2FhVP30Kbf4nBZewowrUgjjR648TpHcswAQm
	 8HhLz7hXSqX6+SBH08remBHPC2x0KUIZ8KlYw8vkEvDWtiPjNhHq76UYKZ6CR5We+Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hfh3kWH/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73540606A31F
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfh3kWH/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DFF1F000C4;
	Tue, 20 Oct 2026 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502605;
	bh=fXVAywmvZwfVgrMBN2PTAU3bCoF8ViPD5//FGCvlQ88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hfh3kWH/Qi4OX58/eY6crr//U32IlJJv/s48cYCuoW2uKCcEmMucSU4rAzE42bK/S
	 rx1117rrICV1tTD/OqSdC+BrtohUWNlMrAdphmYNNfSBXMYWpXO5SboO5EwEyBSQEu
	 XX/eRGUuHl5tBCRuTGtCS/bK3GHv4+t68tRgNcOwIvyww4V9lCGCwc4HzSTtUx0nWH
	 fDZjvU/7i4IurGkx9qiSffRDpkNGwYiQ/q1FXPpfC5zmJzsbbl8wzv7A3vmL0wcSeX
	 4SYX0fQep+KRN9TQdukUWxSPhcre4u/BvVL9IuVMU6Ijui/TDCTLyyBsUE8OlP0Ad2
	 /PzUKCP+QZnNg==
Message-ID: <sashiko-outbox-179021@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] gpiolib: let the character device free its IRQs
 first on chip removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261020-gpiolib-chip-removal-v3-6-aambrozewicz@nvidia.com>
References: <20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com>
 <20261020-gpiolib-chip-removal-v3-6-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 13:23:24 +0000
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
- [Medium] gpiolib: cdev: negative gpiod_get_value_cansleep() treated as ri=
sing edge
--

commit 526f1d7ea8a308d5657aec9728c6582d403f73c5
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

gpiolib: let the character device free its IRQs first on chip removal

This commit reorders GPIO chip removal so that the device notifier runs
after gdev->chip is cleared and before remaining IRQs and the irqchip are
freed, while synchronizing character device release paths with the
notifier.

Link: https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@boot=
lin.com/

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e923512febf15..5eb53f8c5d34c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c

[ ... ]

> @@ -1422,7 +1433,6 @@ void gpiochip_remove(struct gpio_chip *gc)
>  	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
>  	gpiochip_sysfs_unregister(gc);
>  	gpiochip_free_hogs(gc);
> -	gpiochip_free_remaining_irqs(gc);
> =20
>  	scoped_guard(mutex, &gpio_devices_lock)
>  		list_del_rcu(&gdev->list);
> @@ -1431,6 +1441,14 @@ void gpiochip_remove(struct gpio_chip *gc)
>  	/* Numb the device, cancelling all outstanding operations */
>  	rcu_assign_pointer(gdev->chip, NULL);
>  	synchronize_srcu(&gdev->srcu);
> +
> +	/*
> +	 * No new interrupts can be requested through the character device now.
> +	 * Have it free the ones it holds before forcibly freeing the rest, and
> +	 * both before the irqchip and its mappings go away.
> +	 */
> +	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
> +	gpiochip_free_remaining_irqs(gc);
>  	gpio_device_teardown_shared(gdev);
>  	gpiochip_irqchip_remove(gc);
>  	acpi_gpiochip_remove(gc);

[Severity: Medium]
With character device IRQs now freed in the notifier callback after
rcu_assign_pointer(gdev->chip, NULL), can an in-flight dual-edge interrupt
handler queue a spurious rising-edge event to userspace?

Previously, gpiochip_free_remaining_irqs() stopped and synchronized all
GPIOD_FLAG_USED_AS_IRQ handlers before gdev->chip was cleared. With this
change, if edge_irq_thread() or lineevent_irq_thread() runs between
rcu_assign_pointer(gdev->chip, NULL) and free_irq() in the notifier,
gpiod_get_value_cansleep() returns -ENODEV.

In drivers/gpio/gpiolib-cdev.c, edge_irq_thread() passes the return value
directly to line_event_id():

	switch (READ_ONCE(line->edflags) & GPIO_V2_LINE_EDGE_FLAGS) {
	case GPIO_V2_LINE_FLAG_EDGE_BOTH:
		le.id =3D line_event_id(gpiod_get_value_cansleep(line->desc));
		break;

where line_event_id() treats any non-zero value as
GPIO_V2_LINE_EVENT_RISING_EDGE. Similarly, lineevent_irq_thread() checks:

	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
	    && le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
		int level =3D gpiod_get_value_cansleep(le->desc);

		if (level)
			/* Emit low-to-high event */
			ge.id =3D GPIOEVENT_EVENT_RISING_EDGE;

Unlike debounce_work_func(), which drops the event when level < 0, both
threaded IRQ handlers treat -ENODEV as a logical high level and push a
rising-edge event into the kfifo.

Should edge_irq_thread() and lineevent_irq_thread() also check for a
negative return from gpiod_get_value_cansleep() and drop the event?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-gpiolib-ch=
ip-removal-v3-0-aambrozewicz@nvidia.com?part=3D6
