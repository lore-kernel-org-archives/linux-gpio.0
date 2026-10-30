Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361647;
	b=NY8vG/QaadPIk2W8Z6qYtHA0yOWFfl0GrsOee3IuL4ha6D201ooc7pfLmfDO7agfZpEp
	 nVsI5mzoUHFffLYf5cITP2tNG3y4F5OCwlthSyHUuVIGuQ+pBVrd/cUurp7sa0zm8dCwU
	 vd0JcsglE/8dEcL1datXvLCPbVdtVe7H9/GwCWLs8FWS536PpaQG5jiwrSrOmqBLmsE0D
	 1SrGe/kNb5g+i3CUQBTaT2qhSPlCXeJNiBHA6t2E6Yz+ov5QHZtK/GP9GvHqLZEsm2AVq
	 vuG7koHEd5+jz/a7rrYXlKSDwO1tjZZWp+sxqWg+F/D4z2hvRbUSVuPoeTxwjVzFDrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361647;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BszrEEP9s9nlso4X79dqLjLwf6EB/85hHleOcw3jzWc=;
	b=ExEFRvA1LSgZlMeiZyjCzYimzNjspRHd0rGRnQVPSSwTNr+7ZCxaYXct5J8VmoAiTD29
	 it5WEgZPxbsgzVll2dXtVMBH1BtWZT4uJ+dTHMVrk0QLhqud9eYQBKFE6GNjA10oQexj8
	 sxmrFVuswUjve8JJw3BqwhrGzrd5GcvYogSaALx335vDvWwbNnn5bJ8Pos6n6w7A0e1je
	 bQIXS45cxTNTZ9r/8xk6ZSEU2hLqtVcLuWhy2RcB6i0B+1rb4CwFTFvL0nKiKFmmE5zI4
	 cA4KTSydsFZtC2pnQpDGm9Lx/mifWjx4gX6yzpBLryemK8mj9FA2r1TklwiWcQbTC6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8GFq9hh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8F606A31A;
	Fri, 30 Oct 2026 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8GFq9hh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EEE1F000C1;
	Fri, 30 Oct 2026 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793361647;
	bh=BszrEEP9s9nlso4X79dqLjLwf6EB/85hHleOcw3jzWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W8GFq9hhd77aWHsX6hoYXz1saowy8Ph9ODVHWXji6M5W19iG7INwwjneEWiTGxVzK
	 +6EnZJD1RT+ifh3mzE+nBlmChdXB1jQqNdT0+hWoECy51RHTPq1Pseif4kd0OmrK6U
	 dn6aKWUOVwl08mWRxOeK1B9W1Qasdtb8QSAYK6FRb8yqiym7hfAo7E02UzzVBlcTBK
	 rd9cp7iZegUyCy+mF/lQLqZgLTBrlvrBKPLNuuS1JDHHZ7x+AwlR/VQCUSYc/QrSHl
	 +Dth5uUMpYlHiqeSj8MxEKNZlmdF9mHkJF7LLRdhkiV/lgxzLy3NeVHYFgFcUr2c1x
	 mPUMRuTy0V5Kw==
Message-ID: <sashiko-outbox-190960@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Clark" <jjc@jclark.com>
Cc: linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20261030114705.3159093-1-jjc@jclark.com>
References: <20261030114705.3159093-1-jjc@jclark.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 12:00:46 +0000
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
- [High] usb: misc: onboard_usb_dev: UAF race in onboard_dev_attach_usbdev()
--

commit f6a7eed8d40c04892ba2d262827780a7d1796445
Author: James Clark <jjc@jclark.com>

usb: misc: onboard_usb_dev: don't defer the USB device probe

This commit avoids returning -EPROBE_DEFER in onboard_dev_usbdev_probe() wh=
en
the corresponding platform device has not finished probing, preventing an
infinite re-probe loop caused by generic USB interface driver bindings.
Instead, it binds the USB device with NULL drvdata and extends
attach_usb_driver_work to attach such USB devices once the platform device
probes.

> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboar=
d_usb_dev.c
> index c604062404162..aac4e29c82335 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
[ ... ]
> @@ -301,6 +302,47 @@ static const struct attribute_group onboard_dev_grou=
p =3D {
>  __ATTRIBUTE_GROUPS(onboard_dev);
> =20
> =20
> +/*
> + * Attach a USB device that was bound by onboard_dev_usbdev_probe() whil=
e its
> + * platform device was still unbound. The device lock serialises this wi=
th
> + * the probe and with an unbind. This walks the USB bus, not the driver's
> + * device list: unbinding a device holds its lock while it waits for all
> + * references to its node on the driver's list to be dropped, so an iter=
ator
> + * over that list that takes the device lock would deadlock with it.
> + */
> +static int onboard_dev_attach_usbdev(struct usb_device *udev, void *data)
> +{
> +	struct device *dev =3D &udev->dev;
> +	struct onboard_dev *onboard_dev;
> +	int err;
> +
> +	/* Unlocked pre-check, so as not to wait for every USB device's lock. */
> +	if (READ_ONCE(dev->driver) !=3D &onboard_dev_usbdev_driver.driver)
> +		return 0;
> +
> +	device_lock(dev);
> +
> +	if (dev->driver !=3D &onboard_dev_usbdev_driver.driver ||
> +	    dev_get_drvdata(dev))
> +		goto out;
> +
> +	onboard_dev =3D _find_onboard_dev(dev);
> +	if (IS_ERR_OR_NULL(onboard_dev))
> +		goto out;
> +
> +	err =3D onboard_dev_add_usbdev(onboard_dev, udev);
> +	if (err)
> +		dev_err(dev, "failed to attach to %s: %pe\n",
> +			dev_name(onboard_dev->dev), ERR_PTR(err));
> +	else
> +		dev_set_drvdata(dev, onboard_dev);

[Severity: High]
Can onboard_dev_attach_usbdev() race with platform device unbind and cause a
use-after-free of struct onboard_dev (and potentially struct platform_devic=
e)?

In _find_onboard_dev(), the platform device is looked up, its drvdata is re=
ad
without holding device_lock(&pdev->dev), and the reference on &pdev->dev is
immediately dropped before returning the devm-allocated onboard_dev pointer:

drivers/usb/misc/onboard_usb_dev.c:_find_onboard_dev() {
	...
	onboard_dev =3D dev_get_drvdata(&pdev->dev);
	put_device(&pdev->dev);

	return onboard_dev;
}

When the platform device is unbound (for example via sysfs unbind, parent h=
ub
disconnect calling onboard_dev_destroy_pdevs(), or
CONFIG_DEBUG_TEST_DRIVER_REMOVE), __device_release_driver(&pdev->dev) calls
onboard_dev_remove() followed by device_unbind_cleanup():

drivers/usb/misc/onboard_usb_dev.c:onboard_dev_remove() {
	struct onboard_dev *onboard_dev =3D dev_get_drvdata(&pdev->dev);
	...
	onboard_dev->going_away =3D true;

	mutex_lock(&onboard_dev->lock);

	/* unbind the USB devices to avoid dangling references to this device */
	while (!list_empty(&onboard_dev->udev_list)) {
		...
	}
}

Because a USB device bound with NULL drvdata is not yet in
onboard_dev->udev_list, onboard_dev_remove() does not unbind it or take
device_lock(&udev->dev), nor does it cancel attach_usb_driver_work or clear
the platform device's drvdata. In device_unbind_cleanup(),
devres_release_all() frees the devm-allocated struct onboard_dev before
dev_set_drvdata(&pdev->dev, NULL) is called.

If onboard_dev_attach_usbdev() (or onboard_dev_usbdev_probe()) runs
concurrently with platform device unbind, _find_onboard_dev() can return the
non-NULL onboard_dev pointer just before devres_release_all() frees it,
allowing onboard_dev_add_usbdev() to lock and access freed memory.

Furthermore, even if onboard_dev_add_usbdev() sees onboard_dev->going_away =
set
under onboard_dev->lock and returns -EINVAL before devres_release_all() run=
s,
the error path in onboard_dev_attach_usbdev() then evaluates
dev_name(onboard_dev->dev) outside onboard_dev->lock, dereferencing
onboard_dev->dev after onboard_dev (and potentially pdev, since put_device()
was already called) has been freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030114705.3159=
093-1-jjc@jclark.com?part=3D1
