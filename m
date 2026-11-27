Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766915;
	b=CcaZaGO/7nfOdXSOSNiDq9YwKAO5uHh1WoQ7vkLBme37KWV5IfdiiQB/D3iIjaOWpZl6
	 eHwqiivYw2zoH9S1dfSLzWkUH7LC6cT2+arrxo89X9bxcLYz6jC16VHxVshEO1z78HlK5
	 fcqlu8u2DWEfN9lSAfYqoBhUdfSyh1msaeH9xj1E3BBlmalzRWM6ZgkSixKjoGQhtoWiA
	 6rxVdTKR1ydDOrgPW6qbwfYN3hhdpIM09VIjFobBdNBzWXKFkAn97B/EUnyt8ed26ItGQ
	 UzOoKeWC3u2/qtE39Uk/6PLnEh/p579ML/VuipzpD+Sh9Lu0wHq964GsOKplAkuhRZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766915;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s0pu/DCDs3uHG27foQdfxUW5zo8oHokCP3ge7W8z9J8=;
	b=cPLe5XwRqi6I9i83mQs2Zxfzvz9dnLbEN0kdufFjYDmRa8seqj3zcM23FCAAhejbokQg
	 POU5NCROgfKhIVtnno0UrIo0zt5COSz4WQYwEes4ACEwoQoZoLFxwzB1WvwDDKnTTIENs
	 fWP0nd0iMJy88qb6GFEro8r2LGq/5d5DryjsWl/VDFVBNHVcDfz2Cul05SW6+16TCqVDo
	 Jae8QEvSEM7U203PHbxMU9KbtSZO2iyXgdsLiALCwVKTxfp8VwOLYTVrfUEARoxd5DOI8
	 SsQ45S1RFLOm5kKLgO+6N0M11J3jJuTC+N/xCWDpm+U3UgQpgpSp/1T2QFQqC4NchoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se2yNqvJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC28606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se2yNqvJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4171F000C1;
	Fri, 27 Nov 2026 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795766915;
	bh=s0pu/DCDs3uHG27foQdfxUW5zo8oHokCP3ge7W8z9J8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Se2yNqvJYXcScVPcHvR4fa8Ezw4VjGXR7uK/eh2zsU92CgJ6E6tTdLngiMJ0NQ3BF
	 ycqFmb/CkjLbJimNbl/n+Y4Fn4tuyOPn8rujRL9GCe2nKhWg+0mSPcmoaeeJxHf4jM
	 KwRatgDomp/se10CNgAg9Bl1H/GpqiHMlwFv2G6iceD0cW9NCTWjJg8Asou8yF96Z+
	 e9WOGefI0mg7Kb/JdseA3KleNMFtBGkEQfiX5CVd8MiXESKh1WrGugt/7tWI1jihxO
	 dNfO8SjruShi2dUqqRgN2/6gw8XC+j48WbX5xMxN8ZzHAJp3d4//yjqC1m9luq62DX
	 j8L6quQftyeyQ==
Message-ID: <sashiko-outbox-236867@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] gpiolib: release user space's lines when adding
 the chip fails late
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261127-gpiolib-ownlines-v2-3-aambrozewicz@nvidia.com>
References: <20261127-gpiolib-ownlines-v2-0-aambrozewicz@nvidia.com>
 <20261127-gpiolib-ownlines-v2-3-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 08:08:34 +0000
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
- [Medium] gpiolib: race in gpiochip_add_data_with_key() freeing lines
  before list removal
--

commit f343bc6358487260064149695890aadd91c20f07
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

gpiolib: release user space's lines when adding the chip fails late

This commit updates the error path of gpiochip_add_data_with_key() when
gpiochip_setup_dev() fails so that lines owned by the chip and user space
are released and the device is numbed, matching gpiochip_remove().

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 1b92ace14a5aa..6d3531f5833e7 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1419,13 +1419,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
gc, void *data,
>  	if (gpiolib_initialized) {
>  		ret =3D gpiochip_setup_dev(gc);
>  		if (ret)
> -			goto err_teardown_shared;
> +			goto err_release_lines;
>  	}
> =20
>  	return 0;
> =20
> -err_teardown_shared:
> -	gpio_device_teardown_shared(gdev);
> +err_release_lines:
> +	/* The character device may have been live: user space may hold lines. =
*/
> +	gpiochip_free_own_lines(gc);
> +	gpiochip_numb_device(gc);
> +	gpiochip_irqchip_remove(gc);
> +	gpiochip_remove_pin_ranges(gc);
> +	/* What the labels down to err_remove_of_chip undo is done above. */
> +	goto err_remove_of_chip;

[Severity: Medium]
Can calling gpiochip_free_own_lines() and gpiochip_numb_device() here
before err_remove_from_list unlinks gdev->list and runs
synchronize_srcu(&gpio_devices_srcu) race with concurrent consumer lookups?

In gpiochip_remove() (after commit "gpiolib: release the chip's own lines
before numbing it on removal"), gdev is removed from gpio_devices and
gpio_devices_srcu is synchronized before gpiochip_free_own_lines() runs.
Here, if gcdev_register() succeeds (marking gdev->dev registered) and
gpiochip_sysfs_register() fails, an in-flight reader in
gpiod_find_and_request() can still run concurrently with
gpiochip_free_own_lines():

CPU0                                    CPU1
gpiochip_add_data_with_key()
  gpiochip_setup_dev()
    gcdev_register()
                                        gpiod_find_and_request()
                                          scoped_guard(srcu, &gpio_devices_=
srcu)
                                          desc =3D gpiod_fwnode_lookup(...)
    gpiochip_sysfs_register() -> fails
    gcdev_unregister()
  gpiochip_free_own_lines()
    gpio_device_teardown_shared()
                                          gpio_shared_add_proxy_lookup()
                                            lock(&ref->lock)
                                            ref->lookup =3D lookup
      gpiod_remove_lookup_table(ref->lookup)
      kfree(ref->lookup)
                                            gpiod_add_lookup_table(ref->loo=
kup)
                                              <-- use-after-free

gpio_device_teardown_shared() unlinks and frees ref->lookup without
holding ref->lock, relying on gpio_devices_srcu having already drained
gpiod_find_and_request() callers; depending on the interleaving, this can
also dereference an uninitialized lookup->list in list_del() or leave a
lookup table leaked on gpio_lookup_list.  In addition, while gdev remains
on gpio_devices before gpiochip_numb_device() clears gdev->chip, in-flight
readers and lookups that do not check device_is_registered(&gdev->dev)
(such as gpio_to_desc() and gpio_name_to_desc()) can request hogged or
shared lines just freed by gpiochip_free_own_lines().

Removing gdev from gpio_devices under gpio_devices_lock and calling
synchronize_srcu(&gpio_devices_srcu) before gpiochip_free_own_lines(), as
gpiochip_remove() does, would close this window.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-gpiolib-ow=
nlines-v2-0-aambrozewicz@nvidia.com?part=3D3
