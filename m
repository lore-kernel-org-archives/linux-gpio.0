Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374895;
	b=Zx64OlHxsJwKXKDq18cIK5KabbKP7vvwzFTICCOBux9T8wbmkGrOr9axNnC3DvdwY6lL
	 t0V8YL5q47S1+D2h7sp9pW/2kiORgAU//XTlsPGLGoF10XB3fikCMLg4jtOEAQ6P1oI/B
	 +5NuscuKh0syq6QyPuf4pcCJ15iaZDVR6l0DupnSCDzli7r/psgjL64aKQh3FRjl8yEIh
	 Nsiuso9YLyJukEmQGHfw6p/36yyPoM3aCNaZKsIuPHv7n8bCzmYw41jG/3kJcd7VKw6AJ
	 k2/fxfOS/z61Gv2WqjoJGBDJDlK18oiMvTfA8lMbUKX4J2x/rP4Z2hjU1PTdxGRvepA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374895;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LIWNixqv9zrMy8vRtJQSIYMwJdRtiwKtjAJ57lkACKw=;
	b=OiFtGgSBoiA4SaQCm6bz8hHipwo1JCIQyO2UrFmbCpHcQi+xiOlR6GVP6wPYLtRByVx5
	 aJSVP9HKEGLSXLer1tUa5Q+yccwMcGXdugwCFiwsl/GqOAfOVH337kKI/a9PNM6nboD0Y
	 8rYOUfZHXvfVbJ8L+562NRJ8jHTvS/HD5hJljFVUSn7m4qmpf4JFS/axSAbzHK5UL0MPi
	 Vu/hjkWoukphEl/fQXFVlljI2LcIugr/U2cNOI32kmFOI6JI+Ci7Jvnr4WCgIIOLi0rtj
	 WgBx2aL22v6H6JpRO5w+4etyud26G+8qsgjI6iLnvBJldcTiemF/Ub9nUvvFh8ialtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIq4m5iR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E5606A31C;
	Fri, 30 Oct 2026 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIq4m5iR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE9C1F000C1;
	Fri, 30 Oct 2026 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793374895;
	bh=LIWNixqv9zrMy8vRtJQSIYMwJdRtiwKtjAJ57lkACKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JIq4m5iRzWHPU+qDK/tfysc/K8E2znxJEoHi4Tcbf7BU6HeQNW9cHj8iwEZ+6VFHK
	 XZw2iMqgjiOdxJYuohPEwZGYmryQeLdr2EZZE6wEPZTh2RAfoWLWUgC9jD07KA1ewy
	 uxQ7ohcBeIDIBczoXMMO7TGcCoAgkUMKlmMYyoy6wjgpOUW45JSAnugCnE+mCx4OBz
	 ZeWT1dfw6ZPhi2vV2s59nrckH+rcJraI09kxjhzwLG4IJVLXq9qGK9maFeykmvg2k2
	 apdmta0+88tlzJojcysicsnJa+elj9JEXpP2w6Uos2+uI48ul5d7ZMGpex4ZSzfbB0
	 l59w8qjtLgFdg==
Message-ID: <sashiko-outbox-191184@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device
 drivers that may defer
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Clark" <jjc@jclark.com>
Cc: linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20261030151919.3511106-1-jjc@jclark.com>
References: <20261030151919.3511106-1-jjc@jclark.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 15:41:34 +0000
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
- [Medium] usb: core: missing generic and runtime PM cleanup in usb_probe_d=
evice()
--

commit c4ba8a98e9f819e5526aef5f1c45cb74910c09c6
Author: James Clark <jjc@jclark.com>

usb: core: add a pre_probe callback for device drivers that may defer

This commit adds a pre_probe callback to struct usb_device_driver so that
device drivers with generic_subclass set can defer probing before
usb_generic_driver_probe() configures the device and binds its interfaces.
It also converts onboard_usb_dev to use pre_probe to avoid a re-probe loop
when the companion platform device has not finished probing.

> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index d3a61ebc6afb0..724cfa9da4e01 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -249,24 +249,41 @@ static int usb_probe_device(struct device *dev)
>  {
>  	struct usb_device_driver *udriver =3D to_usb_device_driver(dev->driver);
>  	struct usb_device *udev =3D to_usb_device(dev);
> -	int error =3D 0;
> +	int error =3D 0, pre_error =3D 0;
> =20
>  	dev_dbg(dev, "%s\n", __func__);
> =20
>  	/* TODO: Add real matching code */
> =20
> +	/*
> +	 * Give the driver a chance to defer before anything is done to the
> +	 * device. The generic probe below binds the interface drivers, and
> +	 * each binding triggers deferred probing, so a probe that deferred
> +	 * after it would be retried straight away and the device re-probed
> +	 * in a loop.
> +	 *
> +	 * Any other error from pre_probe() is not acted on until the generic
> +	 * probe has run, so that the -ENODEV fallback below works as it does
> +	 * for probe().
> +	 */
> +	if (udriver->pre_probe) {
> +		pre_error =3D udriver->pre_probe(udev);
> +		if (pre_error =3D=3D -EPROBE_DEFER)
> +			return pre_error;
> +	}
> +
>  	/* The device should always appear to be in use
>  	 * unless the driver supports autosuspend.
>  	 */
>  	if (!udriver->supports_autosuspend)
>  		error =3D usb_autoresume_device(udev);
>  	if (error)
> -		return error;
> +		goto err_pre_probe;
> =20
>  	if (udriver->generic_subclass)
>  		error =3D usb_generic_driver_probe(udev);
>  	if (error)
> -		return error;
> +		goto err_pre_probe;
> =20
>  	/* Probe the USB device with the driver in hand, but only
>  	 * defer to a generic driver in case the current USB
> @@ -289,15 +306,26 @@ static int usb_probe_device(struct device *dev)
>  	 * specialised device drivers prior to setting the
>  	 * use_generic_driver bit.
>  	 */
> -	if (udriver->probe)
> +	if (pre_error)
> +		error =3D pre_error;
> +	else if (udriver->probe)
>  		error =3D udriver->probe(udev);
>  	else if (!udriver->generic_subclass)
>  		error =3D -EINVAL;
>  	if (error =3D=3D -ENODEV && udriver !=3D &usb_generic_driver &&
>  	    (udriver->id_table || udriver->match)) {
>  		udev->use_generic_driver =3D 1;
> -		return -EPROBE_DEFER;
> +		error =3D -EPROBE_DEFER;
>  	}
> +	if (error)
> +		goto err_pre_probe;
> +
> +	return 0;
> +
> +err_pre_probe:
> +	/* The driver core doesn't call disconnect() for a failed probe. */
> +	if (udriver->pre_probe && !pre_error && udriver->disconnect)
> +		udriver->disconnect(udev);
>  	return error;
>  }

[Severity: Medium]
When udriver->pre_probe(udev) returns a non-deferral error (for example,
-EINVAL or -ENOMEM from onboard_dev_usbdev_pre_probe() when
_find_onboard_dev() or onboard_dev_add_usbdev() fails), or when pre_probe()
succeeds and udriver->probe(udev) fails, usb_probe_device() runs
usb_autoresume_device(udev) and usb_generic_driver_probe(udev) before jumpi=
ng
to err_pre_probe.

However, err_pre_probe only invokes udriver->disconnect(udev) and does not
undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
usb_unbind_device() does:

drivers/usb/core/driver.c:usb_unbind_device() {
	if (udriver->disconnect)
		udriver->disconnect(udev);
	if (udriver->generic_subclass)
		usb_generic_driver_disconnect(udev);
	if (!udriver->supports_autosuspend)
		usb_autosuspend_device(udev);
}

Because the driver core does not call usb_unbind_device() when
usb_probe_device() fails, doesn't a non-deferral failure leave udev unbound
(udev->dev.driver =3D=3D NULL) while still configured with bound child
interfaces, an unbalanced runtime PM usage count when !supports_autosuspend,
and a sent USB_DEVICE_ADD notification that will never be paired with
USB_DEVICE_REMOVE on unplug (leaking struct usbport_trig_port and sysfs
attributes in usbport_trig_notify())?

Similarly, on the -ENODEV fallback path where udev->use_generic_driver is s=
et
to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cau=
se
the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
second time and emit a duplicate USB_DEVICE_ADD notification without an
intervening USB_DEVICE_REMOVE?

Should pre_probe() handle the -ENODEV fallback and return immediately on any
error before touching the device, and should the error path after
usb_generic_driver_probe() and usb_autoresume_device() also unwind them via
usb_generic_driver_disconnect() and usb_autosuspend_device()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030151919.3511=
106-1-jjc@jclark.com?part=3D1
