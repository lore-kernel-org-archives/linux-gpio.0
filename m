Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946924;
	b=mE3aal2usfAZeO9xNWyGBD6U/m/RwavYXbcAVSdfFX26yEXh1NrIzp37fY7qddw2go4D
	 bII0e0ANGKCF0u8rfm3mOn9Uoxh2r83l/a4NrKI98YAmRRlbtXDHHkbeQjEtML7U2Xnm0
	 AgR9SlpCoWayPX+8Ni1Ud8r0SeTkkEcKOFQe9rXnHORctOAwGAAqKlQe0UtMSAY3bXcg1
	 EQnEYVLi6RyNw+JECCQhoGsjofI4aMjwly53JLYChgJ0hqc6Q6JM6lX7i2rVxD8/mVSvW
	 XJsXsQ2RrNt8Je+Loa340RDO9GZYlWOZ9bAXEoOms5CUfDDzzQ94Dg7EIila3OchknQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946924;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ErWBEUZFjfUlGEsu4XJ5nuaGHNhBcaz/qI43oR2HDUg=;
	b=cSJrDBRJfigqgnurGOda4zxVDF5R1nptTj+rRN0lQbxzGbM7t0+H10ZYF0BYPRMmVRW0
	 E+Cz7pWhirGEB0aqGHKx0r3RSM8FJ1vuW2fUzSgU58hxGPn4Wr6jOWSdzWiBKYO/B4mbQ
	 A/UDp6zs0MecJj9nj01SMkC2uki+ComSMXIa61Dj4tH7g29X3X61sStmaHNtYvy4gc6BB
	 kuKv7jSsqNzcCfO//sz9rZ/elYuKwclJN+aie4dbeLYQv1DTx2Y2Saorub5GV3kF1T9o4
	 3iwy/0fdu0HiDeXAp9yXwxOzQUQSIzDf4dTiQVDr/XUS75Y3ZL4qU2XQTt+ZBykWdTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArSPDSG2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01884606A326;
	Fri,  6 Nov 2026 06:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArSPDSG2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68C01F008A1;
	Fri,  6 Nov 2026 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946923;
	bh=ErWBEUZFjfUlGEsu4XJ5nuaGHNhBcaz/qI43oR2HDUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ArSPDSG2ouDjqXuF6ai9H53/PZ+1vxsdK7/t30cn3mh9PQBOq/OmoIaxye2t567qq
	 m8/VQdY+OQ9PtTTrrI5g+7LCbhwfxakGWbm9zRk+ILKgITWRJK5m8j+nbhykH7I+sq
	 vo4v3rx5XbRO4fbWnCDiBN0+De05aWRM8zBOiOGVP62vn+U7qz1+FcBmzQSQ3682Ou
	 UTqCxRod+h9T7XnEZKNrhrKA13cb5nvUOqL8o4jLyRpm1yYq7sUYOXBNC6uaHrZbbU
	 RkKdJ6KK7MjM3W4ksgbqX30Wuddbekf6EKYEbuk+3HDk04FTM5LhqaJECp34sfkTBV
	 qBbdxCwd2lnaQ==
Message-ID: <sashiko-outbox-200906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: misc: onboard_usb_dev: don't defer probing
 after the device is configured
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Clark" <jjc@jclark.com>
Cc: linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <f24b025cde0c3af37a958042d9deb96ae4494994.1793941292.git.jjc@jclark.com>
References: <cover.1793941292.git.jjc@jclark.com>
 <f24b025cde0c3af37a958042d9deb96ae4494994.1793941292.git.jjc@jclark.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 06:35:23 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: onboard_usb_dev: -ENODEV fallback leaves device on
  deferred_probe_pending_list
--

commit 8a540d2b1c8688c36c28e760d6d5507f9a82ef03
Author: James Clark <jjc@jclark.com>

usb: misc: onboard_usb_dev: don't defer probing after the device is configu=
red

This commit removes generic_subclass from onboard_dev_usbdev_driver and cal=
ls
the generic USB driver operations directly so the USB device is not
configured before probe deferral.  It also returns -ENODEV instead of -EINV=
AL
when no peer-hub node is found so the device falls back to the generic
driver.

> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboar=
d_usb_dev.c
> index c604062404162..51985e3473ad8 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -591,7 +591,7 @@ static struct onboard_dev *_find_onboard_dev(struct d=
evice *dev)
>  		np =3D of_parse_phandle(dev->of_node, "peer-hub", 0);
>  		if (!np) {
>  			dev_err(dev, "failed to find device node for peer hub\n");
> -			return ERR_PTR(-EINVAL);
> +			return ERR_PTR(-ENODEV);
>  		}
> =20
>  		pdev =3D of_find_device_by_node(np);
> @@ -639,7 +639,11 @@ static int onboard_dev_usbdev_probe(struct usb_devic=
e *udev)
>  	if (err)
>  		return err;
> =20
> -	return 0;
> +	err =3D usb_generic_driver_probe(udev);
> +	if (err)
> +		onboard_dev_remove_usbdev(onboard_dev, udev);
> +
> +	return err;
>  }
> =20
>  static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
> @@ -647,6 +651,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_=
device *udev)
>  	struct onboard_dev *onboard_dev =3D dev_get_drvdata(&udev->dev);
> =20
>  	onboard_dev_remove_usbdev(onboard_dev, udev);
> +	usb_generic_driver_disconnect(udev);
>  }
> =20
>  static const struct usb_device_id onboard_dev_id_table[] =3D {
> @@ -697,7 +702,10 @@ static struct usb_device_driver onboard_dev_usbdev_d=
river =3D {
>  	.match =3D onboard_dev_usbdev_match,
>  	.probe =3D onboard_dev_usbdev_probe,
>  	.disconnect =3D onboard_dev_usbdev_disconnect,
> -	.generic_subclass =3D 1,
> +#ifdef CONFIG_PM
> +	.suspend =3D usb_generic_driver_suspend,
> +	.resume =3D usb_generic_driver_resume,
> +#endif
>  	.supports_autosuspend =3D	1,
>  	.id_table =3D onboard_dev_id_table,
>  };

[Severity: Medium]
Can returning -ENODEV from _find_onboard_dev() leave udev unconfigured on
deferred_probe_pending_list instead of falling back to usb_generic_driver?

During __device_attach(), bus_for_each_drv() visits usb_generic_driver
before onboard_dev_usbdev_driver, where usb_generic_driver_match() returns
false because udev->use_generic_driver is still 0.  When
onboard_dev_usbdev_probe() then fails with -ENODEV, usb_probe_device() sets
udev->use_generic_driver =3D 1 and converts the error to -EPROBE_DEFER:

drivers/usb/core/driver.c:usb_probe_device() {
    ...
	if (error =3D=3D -ENODEV && udriver !=3D &usb_generic_driver &&
	    (udriver->id_table || udriver->match)) {
		udev->use_generic_driver =3D 1;
		return -EPROBE_DEFER;
	}
    ...
}

Previously, generic_subclass caused usb_generic_driver_probe() to run first
and bind child interfaces, which incremented deferred_trigger_count so
driver_probe_device() immediately re-triggered deferred probing.  With
generic_subclass removed, no device binds during probe, so
driver_probe_device() adds udev to deferred_probe_pending_list without
calling driver_deferred_probe_trigger().  Unless another device happens to
bind later, deferred_probe_work is not queued and udev stays unconfigured.

Also, if driver_attach() runs for onboard_dev_usbdev_driver, neither
usb_driver_applicable() nor onboard_dev_usbdev_match() checks
udev->use_generic_driver, so it matches onboard_dev_usbdev_driver again and
repeats the -ENODEV -> -EPROBE_DEFER return without triggering deferred
probing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793941292.gi=
t.jjc@jclark.com?part=3D2
