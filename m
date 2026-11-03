Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709603;
	b=3PD5DYWQ/C4RGPECwJxPTo14Z7uhJwcQxFpYHKmwpBN9Ne13HqOQhAJh9pYcI+Jq1iZ7
	 vmFMqKVIHX8yVCga4vMnGzVW//wJoWfqzTP5/vS7CU9TFhXpZaLdKvSjwHfbunzac17p7
	 AtVr9gsy80EOVZAKLxFwK/ofI4ATSR9vV3rTk4RToH8h5UGvK8gzI6zD9odSCqkQnHbWW
	 dUzVNXej08us34FFA+dhSHcZms12bl5QdoRnH+07W50FbFlPT6jPHIlwPlP50k+GJK414
	 XF/nqfdrtJoDn2OjlDpv+FDluqZvVLASna72LQwzEQoKEzsGCc+8gaZcYowvoBp92GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709603;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+jDAGQFUors0c08fGHPRCDFMWFrOHFAFunwM+w5wVKU=;
	b=OmbsVjD4SxJOhTaWgEs7rydK9HxAwsn0B3AHpmTbDbYIBLGzPhLJdytD0dEuRcQDeEBf
	 x6xLdihty8yx73s3qjif9DRY9r11OKV5IePRTsFuD/fx66eVMDiGJz8+4PUQ50Xak8Yh9
	 7VsaEycDu/8MvVzXZoxFLlUEr+35p3nTRzoIL3I9GldAGKjZfwgYVUqiYW1eLcQRNb3Gr
	 IHxyqhgQISUm/XCS4WZDTXZoYE4xYYIAscgQK15UjKjmwCqnAbnc5rfM+rm2pEWtYsHKA
	 q6TtqxyMRgjrK9c9k17sVzgRGZpS/viB8MlLI9a1b/2MzNpDR49UDfAIIw/79iL+BMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CV4kOfEq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A4606A324
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CV4kOfEq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6D51F000C1;
	Tue,  3 Nov 2026 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793709602;
	bh=+jDAGQFUors0c08fGHPRCDFMWFrOHFAFunwM+w5wVKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CV4kOfEqFwZOfPkYJafLZFjgMN2INH+/uatwUafMMsRGQyctbG1sNjWjjL4KDd1Iv
	 6yMUcTJawyC33FqS7lG3d7Hy7aJfx/QcCLH3VEAmb0x3TbmYcot0cud6CMZpjslUqh
	 izGa1Xq6BMMZJ6nzZEqquKLOd6l30+5opXIwdgVPAOXmV1lwLw4gR5QgFFY6tz76Bo
	 6RVnFex5Bf3oUTc7e7nnvb4lSdTV7T16GvxSx7EyzP3n+tc3D7mEKM4tbGZM9TAPlS
	 4yHMjINWNE5XY5icM/SHj9MtQD9POLKIi32AIVqc56WtnTH08IkxqX+RVWlnRrb0WF
	 VU9xOxDPsfwBw==
Message-ID: <sashiko-outbox-195265@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/5] gpio: shared: detach the proxy device from
 struct gpio_shared_ref
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-4-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
 <20261103-gpio-shared-fwnode-lookup-v10-4-c0c592c8ab0a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 12:40:01 +0000
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
- [Medium] gpio: shared: unlocked read of ref->proxy_dev in gpiochip_setup_=
shared()
--

commit 4ce42ba5e6d6a1657f4afe872398baaf6f83b930
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: detach the proxy device from struct gpio_shared_ref

This commit moves the auxiliary device structure out of struct
gpio_shared_ref and allocates it dynamically during proxy device setup so
that its lifetime is managed by its embedded struct device reference count
rather than being zeroed on re-initialization.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 6b18386493387..9d73a02e99890 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -35,11 +35,10 @@ struct gpio_shared_ref {
>  	/* GPIO flags this consumer uses for the request. */
>  	enum gpiod_flags flags;
>  	char *con_id;
> -	int dev_id;
>  	/* Protects the auxiliary device struct and the lookup table. */
>  	struct mutex lock;
>  	struct lock_class_key lock_key;
> -	struct auxiliary_device adev;
> +	struct auxiliary_device *proxy_dev;
>  	struct gpiod_lookup_table *lookup;
>  	bool is_reset_gpio;
>  };

[ ... ]

> @@ -341,6 +348,10 @@ static int gpio_shared_make_adev(struct gpio_device =
*gdev,
>  	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
>  		 dev_name(&adev->dev), gpio_device_get_label(gdev));
> =20
> +	scoped_guard(mutex, &ref->lock) {
> +		ref->proxy_dev =3D adev;
> +	}
> +
>  	return 0;
>  }

[ ... ]

> @@ -511,10 +522,17 @@ int gpio_shared_add_proxy_lookup(struct device *con=
sumer, struct fwnode_handle *
>  	return -ENOENT;
>  }
> =20
> -static void gpio_shared_remove_adev(struct auxiliary_device *adev)
> +static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
>  {
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> +	struct auxiliary_device *proxy;
> +
> +	scoped_guard(mutex, &ref->lock) {
> +		proxy =3D ref->proxy_dev;
> +		ref->proxy_dev =3D NULL;
> +	}
> +
> +	auxiliary_device_delete(proxy);
> +	auxiliary_device_uninit(proxy);
>  }

[ ... ]

> @@ -617,7 +635,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
> =20
>  	list_for_each_entry(entry, &gpio_shared_list, list) {
>  		list_for_each_entry(ref, &entry->refs, list) {
> -			if (gdev->dev.parent =3D=3D &ref->adev.dev) {
> +			if (ref->proxy_dev && gdev->dev.parent =3D=3D &ref->proxy_dev->dev) {

[Severity: Medium]
Should this check in gpiochip_setup_shared() hold ref->lock while reading
ref->proxy_dev?

In drivers/gpio/gpiolib.c, gpiochip_add_data_with_key() and
gpiochip_remove() drop gpio_devices_lock before calling
gpiochip_setup_shared() and gpio_device_teardown_shared(), so
gpiochip_setup_shared() on one CPU can run concurrently with
gpio_shared_make_proxy_dev() or gpio_shared_remove_proxy_dev() on another
CPU.

While gpio_shared_make_proxy_dev() and gpio_shared_remove_proxy_dev() update
ref->proxy_dev under ref->lock, gpiochip_setup_shared() reads ref->proxy_dev
without holding ref->lock. Because struct device dev is at offset 0 of
struct auxiliary_device, &ref->proxy_dev->dev evaluates to the pointer value
of ref->proxy_dev itself. If ref->proxy_dev is non-NULL on the first load in
the condition and gpio_shared_remove_proxy_dev() concurrently clears
ref->proxy_dev to NULL before the second load, &ref->proxy_dev->dev can
evaluate to NULL. For a GPIO chip being registered with gdev->dev.parent =
=3D=3D
NULL, gdev->dev.parent =3D=3D &ref->proxy_dev->dev would then evaluate to t=
rue,
falsely setting GPIOD_FLAG_SHARED_PROXY on an unrelated GPIO chip.

Also, in gpio_shared_make_proxy_dev(), auxiliary_device_add(adev) is called
before ref->proxy_dev is assigned under ref->lock, and in
gpio_shared_remove_proxy_dev(), ref->proxy_dev is cleared to NULL before
auxiliary_device_delete(proxy) completes. Could the proxy driver's probe run
gpiochip_setup_shared() while ref->proxy_dev is still NULL (or already
cleared to NULL) and miss setting GPIOD_FLAG_SHARED_PROXY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-gpio-share=
d-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com?part=3D4
