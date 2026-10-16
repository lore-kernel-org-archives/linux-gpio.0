Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E8B31326A
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143946; cv=none; b=icJr2yq7FX9boR5WqIVr1hlMeM1ra3gmQLbLLGGLp+4IEKPOB4nOjRe60XeEraEMSSxRWIQ0LwG4ScRAjrYXCtOZUeS25a9H0h/w17qZGaRF/XzZP6/JpH0bZBD82SDZOX4JVCPOYgWyO3VRVo+k/efmzX+vWlYlwqDVB13nTsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143946; c=relaxed/simple;
	bh=SpRsB6ZpnjrbYS+v7CVzpr6cB9U/duncrj0lYp+oh5c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EpwqoeYrw2Owlm1akMwLlU1PcnnTDPgnoXiYCsVi6h/7DgbAaGXQIQv5cO3GBF2Ufr00pe/slAv9/jefG/7F5U5AE1mp69onLQYWsfDlIMQwq2ILXqBThFcBdvZqEF2f68p426UR80PY+r9AMcxrdUeT6JZP4NlIbuRVJCH3zB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJpMgVEL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJpMgVEL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3F61F000C4;
	Fri, 16 Oct 2026 09:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792143944;
	bh=B7AtI4xI4xNRGx6h0zpLfsE76raNoT6LPN0zckzaxck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJpMgVELZSstx6uV7Ml6AMXEBWl62Id+2FtWSD0Gyy1115Mn6Cz4CbhovF6zPYj4f
	 5fk9KK7oiDAhRxdl0H5AxrgYMUwnz8dY8dDcTLyi763ykZEyJmEMtw4uaeUsP4l8/p
	 YHnKhk0OuYbknywsLphb5RHgfUQwxVYuNywKI0JPcz4X7cWu+eaA018DX6IeIyRpb4
	 mW8rKda5uhcRFr5ha4laO2Zz6+4QNtskTIDWvg47MIR8K/A8Yh27QmOv4o0dcWimHn
	 +JdMq7YdrGkB1g3j3bE033lW5mUeMgJmJyYjBY+oTyG+W9J8WbquPTYXNCzHWULrwQ
	 GpYnpGEdEXpHw==
Message-ID: <sashiko-outbox-174094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] gpiolib: let the character device free its IRQs
 first on chip removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261016-gpiolib-chip-removal-v2-6-aambrozewicz@nvidia.com>
References: <20261016-gpiolib-chip-removal-v2-0-aambrozewicz@nvidia.com>
 <20261016-gpiolib-chip-removal-v2-6-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 09:45:44 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: missing cdev notifier and IRQ cleanup in probe error path
--

commit 97979b5ca9a75aef3162272761d1c98137dc48bb
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

gpiolib: let the character device free its IRQs first on chip removal

This patch moves the device notifier call from gpiolib_cdev_unregister()
to gpiochip_remove() to ensure the character device frees its irqs before
the irqchip and mappings are removed. It also serializes irq freeing in
the release paths using locks to prevent races during chip removal.

Link: https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@boot=
lin.com/

> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 788a36475e5d4..b4b3c9ac54c27 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c

[ ... ]

> @@ -2832,5 +2853,4 @@ void gpiolib_cdev_unregister(struct gpio_device *gd=
ev)
>  {
>  	destroy_workqueue(gdev->line_state_wq);
>  	cdev_device_del(&gdev->chrdev, &gdev->dev);
> -	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
>  }

[Severity: High]
With the notifier call removed from here and moved exclusively to
gpiochip_remove(), does this break the error teardown path in
gpiochip_setup_dev()?

If a failure occurs during initialization, the error path unwinds by calling
gcdev_unregister(), which leads here:

drivers/gpio/gpiolib.c:gpiochip_setup_dev() {
    ...
    ret =3D gcdev_register(gc, gpio_devt);
    if (ret)
        return ret;

    ret =3D gpiochip_sysfs_register(gc);
    if (ret)
        goto err_remove_device;
    ...
err_remove_device:
    gcdev_unregister(gdev);
    return ret;
}

Since the notifier is no longer called in gpiolib_cdev_unregister(),
consumers aren't notified to stop active edge detectors and free their irqs.

Additionally, because gpiochip_remove() is not called on this error path,
gpiochip_free_remaining_irqs() is also skipped.

If userspace raced to open the cdev and request an irq during the brief
window it was exposed, could this leave the irq active? The error path
then proceeds to call gpiochip_irqchip_remove(), destroying the irq
domain. When the userspace application later closes the file, it would
attempt to free the irq against the destroyed domain, leading to a
use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-gpiolib-ch=
ip-removal-v2-0-aambrozewicz@nvidia.com?part=3D6
