Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677903;
	b=sMMJuMqn/gVKxZXp+fKG7F6MK9PTWXFReGiAHc5NStwSad0257hJzsr+wXQl/pX/cfxm
	 E5UT3pfVP1Ix+BgmPYrxUmrggSNE44+WptVeUdsByi6cKtY1HCXqjrgaLBuMcgtFsUD6M
	 XYSJ4XxL9mGTjqgDZ9fvxEtdHveMYh4PcqPyVpTBi8thHlCs+LGy5DQwKnwAYIDx6nZCu
	 HhUozGD5nMlF0NzUq+WjXwzU0QcaSQyFh+OlOJ4Dlayet+Ge6HwAVoijslSwv884khCbT
	 QaB+ey5U8oLscfhTaWyu0VaZ2KyvzwGP+M7k722NMJ71MiDCw4ZUnPiB+JIqitL4C1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677903;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m3kp2cwP9o26WrQR2C4uENtrB3voODHYgUyWrVHSols=;
	b=N/TloZyBB1ezrEsZ7gRwWMcNo4Lv3iQ40YzMgTVVARoR0kS/VHWOrrfSmNmW22U1rP8u
	 V6iWmRKUXDw4KK5bOAt48IIhVQc8xyVkWGvt2fyN+Id7DeqwphgqRL3oraUhWJjiMMo1a
	 eKFx+3rB0INnke8LLQkHnBUhgMJfHY5YlbcbCvE5OC6asr2yRyQ3W+vHU4m2jx2l1Kh5v
	 u1bNoBe2Sb5M9B1ZW+hYFvi2jSSkFLClc/HlicXuujt0Hs6jCYMu9VzlcwpiQxvJpPFI6
	 d5tFgWqxZoi8OoYmTfVVZtAeCA4Vc2zUFegKTYVydc7/0ZryhzLtds+yDWdxJQU25wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YzKW6q/X";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0287606A326;
	Tue,  3 Nov 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YzKW6q/X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCE91F000C1;
	Tue,  3 Nov 2026 03:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793677902;
	bh=m3kp2cwP9o26WrQR2C4uENtrB3voODHYgUyWrVHSols=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YzKW6q/X/awcdK0kYqZxP1Zkt/KXTgmM0O6Xm2XXyglzs3ItoOAKKF3ukEk1x8EYj
	 iOkDFv8tiN4cqUi9/k73bGNhWYjuSTvqvWKi1kbHMTmLEDjjWidiY656cGgN7WrDWF
	 rxbtGwngolC2AA6ZIyGDtYrB4iRRn72/cK9yEf0mVCvPKtS5D55q4+jstghbg+Jte5
	 AWk57nF0012hgDudmtV8GxK/QNjSi9pYQUd7gWDrp6fqASqctrKvd6q0U/dBI0PP5A
	 /cxt53sNj3WRjHl9h4MDdNKhHwBxOfQTuJ6Gj9mLn5id1KwjOJ8kvUKGNPrylEn2sH
	 qHhstemHJbk9w==
Message-ID: <sashiko-outbox-194542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device
 drivers that may defer
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Clark" <jjc@jclark.com>
Cc: linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com>
References: <cover.1793669297.git.jjc@jclark.com>
 <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 03:51:41 +0000
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
- [Medium] usb: core: broken error handling and missing cleanup in usb_prob=
e_device()
--

commit cc1df1b83e846aac43292fba9d36f8933ba3b140
Author: James Clark <jjc@jclark.com>

usb: core: add a pre_probe callback for device drivers that may defer

This commit adds a pre_probe callback to struct usb_device_driver so that
USB device drivers with generic_subclass set can defer probing before
usb_generic_driver_probe() configures the device and binds interface
drivers. It also converts onboard_dev_usbdev_driver to use pre_probe to
avoid a deferred-probe loop on platforms such as BeagleY-AI.

> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 9b8cd0e4219e6..137b53beb236a 100644
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
> -		goto err_pre_probe;
> +		goto err_pre_probe;
> =20
>  	/* Probe the USB device with the driver in hand, but only
>  	 * defer to a generic driver in case the current USB
> @@ -289,7 +306,9 @@ static int usb_probe_device(struct device *dev)
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
> @@ -300,8 +319,17 @@ static int usb_probe_device(struct device *dev)
>  		if (!udriver->supports_autosuspend)
>  			usb_autosuspend_device(udev);
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
As reported by Sashiko on v2 [1], what happens in usb_probe_device() when
udriver->pre_probe(udev) returns an error other than -EPROBE_DEFER, or when
udriver->probe(udev) fails after usb_generic_driver_probe(udev) has run?

First, when udriver->pre_probe(udev) returns -ENODEV (for example from
onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
to configure the device, bind all child interface drivers (triggering
deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
all down a few lines later in the error =3D=3D -ENODEV block via
usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).

Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
err_pre_probe, which only calls udriver->disconnect(udev) and does not call
usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
unwind the generic probe and runtime PM state. Because really_probe()
clears udev->dev.driver to NULL when usb_probe_device() fails:

- When udev is later unplugged, usb_disconnect() -> device_del() skips
  usb_unbind_device() because udev->dev.driver is NULL, so
  usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
  such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
  remove the port entries added on USB_DEVICE_ADD, leaking struct
  usbport_trig_port objects and sysfs attributes with a dangling port->hub
  pointer to the freed struct usb_device, and usbdev_notify() in
  drivers/usb/core/devio.c never runs usbdev_remove().

- For drivers with supports_autosuspend =3D 1 (such as
  onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
  reference, and hub_configure() enables autosuspend on hub devices; once
  the device suspends, usb_resume_device() fails with -ENOTCONN because
  udev->dev.driver is NULL.

Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
returns -ENODEV, the error =3D=3D -ENODEV block runs
usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
used in usb_unbind_device():

drivers/usb/core/driver.c:usb_unbind_device() {
	if (udriver->disconnect)
		udriver->disconnect(udev);
	if (udriver->generic_subclass)
		usb_generic_driver_disconnect(udev);
	if (!udriver->supports_autosuspend)
		usb_autosuspend_device(udev);
}

Could usb_probe_device() handle errors from udriver->pre_probe() before
resuming or configuring the device, and unwind usb_generic_driver_probe()
and usb_autoresume_device() in reverse order on probe failure?

[1] https://lore.kernel.org/r/sashiko-outbox-191184@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793669297.gi=
t.jjc@jclark.com?part=3D2
