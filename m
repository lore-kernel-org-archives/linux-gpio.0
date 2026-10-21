Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593797;
	b=JlNh7nm7AqrZVM0h9099xIGQaQyyqLLBnd3hzzuXz3BytsVyKy0vSjymn/eyFYS4b6Am
	 JJzR1u+Igphk09uHRccu4L7cJgultwmf7+LHL6msSlvOwlHuUnKxQh8NFTxtXXLwhWyVV
	 7B/e//PlkHuPXqxL6qa8EROzloEWaFdTjnVYxFNXoLGoa2mYkO9qKBzPbgIuH9ZYt1Akg
	 vYzTA7wXkHhqLBss1olc92yqki1DQVMkI0nNsXYb3+kGaZLfg8/0pq7Xy0b85mqky1SRg
	 jzLBlcJXgWyYmhKFRqkG849bl830OOJjjdsMEK6tE1rfBVVwyH598S1jL4GOND7rrog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593797;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0vmNTejEkSxOk70QJsduFcvW8uksB02mQLJb+AMO7Hk=;
	b=U4N+yGyhFLGoQWIrKUW/cBlaO3kB+d4oCa5n1WlzSFhO9FsrhKsarpAxAZlGaR/Wz9vq
	 RWBvLzPYpU4Rqbj0brI05pkE16mR1/nPredS6sNlEfw21R7MqR4vRPWRE0KGlfbhdVIlQ
	 KC7rhjFcZBvpNEe/ESfhjVV3w0QWQdLuEUBXMBubKzaBrElu/FxvJjLuQGWe6h9UrCg3W
	 lbQlhhcfcgPndLn5H71NkPaVRDyCKQ5iGbEkI9eCukx+6AJ4Xbo8yogRW/6cDPandeWpk
	 VrPQ4AehNmmCEbCNXDWe341UtHsfltxaZ9PaICBBXXxZ0+6EYL8Mn+OXniKnhtHfnAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmM+ZanX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340E606A319
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmM+ZanX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA321F000C5;
	Wed, 21 Oct 2026 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593797;
	bh=0vmNTejEkSxOk70QJsduFcvW8uksB02mQLJb+AMO7Hk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DmM+ZanXuysqbF+MCxK/5npo8uOgqwXIW78P2TJocpRav0ELNsSh2U3LEu3WXJ/Xc
	 JzR+TD+jVj1unK1HWUsuvnEHiUq4smuZNWuraoUGh7Fy1YAdVvEUpDmtZy2NEJmBDK
	 3EovPfMHa/YMsfyQuBY5FNp9QbIY6S2pa45F/fsd3WIFEJS2xz5ys3CuD5f1J04hJd
	 eHLQY1jd0R/Ek3pHyZyE/08YZl6cr+zbkUQ9cHVsf5U8nsyhrCbs5yVjWDte3CiF8+
	 s7hV0RhsWjgn6njO6GAl5tZZNxiW3yBGbiS5+MbBdV3bY2zZOPrPEeH6scbNI8/qox
	 haAvvXG6vHHvw==
Message-ID: <sashiko-outbox-180395@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] gpio: shared: detach the proxy device from
 struct gpio_shared_ref
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-4-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
 <20261021-gpio-shared-fwnode-lookup-v6-4-6af7d8eefd25@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:43:16 +0000
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
- [High] gpio: shared: unlocked proxy_dev teardown in gpio_shared_remove_pr=
oxy_dev()
--

commit 744026242eec2478ed3cf7962883c73cf7ffb5cd
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: detach the proxy device from struct gpio_shared_ref

This commit moves the auxiliary device out of struct gpio_shared_ref in
drivers/gpio/gpiolib-shared.c and allocates it dynamically as proxy_dev
when setting up a shared GPIO proxy device.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 043d5daba7a73..3ed25609cae10 100644
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

> @@ -306,31 +301,43 @@ static int gpio_shared_of_scan(void)
>  }
>  #endif /* CONFIG_OF */
> =20
> -static void gpio_shared_adev_release(struct device *dev)
> +static void gpio_shared_proxy_dev_release(struct device *dev)
>  {
> +	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> =20
> +	ida_free(&gpio_shared_ida, adev->id);
> +	kfree(adev);
>  }
> =20
> -static int gpio_shared_make_adev(struct gpio_device *gdev,
> -				 struct gpio_shared_entry *entry,
> -				 struct gpio_shared_ref *ref)
> +static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
> +				      struct gpio_shared_entry *entry,
> +				      struct gpio_shared_ref *ref)
>  {
> -	struct auxiliary_device *adev =3D &ref->adev;
> -	int ret;
> +	struct auxiliary_device *adev;
> +	int ret, id;
> =20
> -	guard(mutex)(&ref->lock);
> +	adev =3D kzalloc_obj(*adev);
> +	if (!adev)
> +		return -ENOMEM;

[ ... ]

>  	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
>  		 dev_name(&adev->dev), gpio_device_get_label(gdev));
> =20
> +	scoped_guard(mutex, &ref->lock) {
> +		ref->proxy_dev =3D adev;
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -480,7 +491,7 @@ int gpio_shared_add_proxy_lookup(struct device *consu=
mer, struct fwnode_handle *
>  			char *key __free(kfree) =3D
>  				kasprintf(GFP_KERNEL,
>  					  KBUILD_MODNAME ".proxy.%u",
> -					  ref->adev.id);
> +					  ref->proxy_dev->id);
>  			if (!key)
>  				return -ENOMEM;
> =20
> @@ -511,10 +522,11 @@ int gpio_shared_add_proxy_lookup(struct device *con=
sumer, struct fwnode_handle *
>  	return -ENOENT;
>  }
> =20
> -static void gpio_shared_remove_adev(struct auxiliary_device *adev)
> +static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
>  {
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> +	auxiliary_device_delete(ref->proxy_dev);
> +	auxiliary_device_uninit(ref->proxy_dev);
> +	ref->proxy_dev =3D NULL;
>  }

[Severity: High]
Can tearing down ref->proxy_dev in gpio_shared_remove_proxy_dev() without
holding ref->lock race with concurrent readers and cause a use-after-free or
NULL pointer dereference?

In drivers/gpio/gpiolib-shared.c, struct gpio_shared_ref documents that
ref->lock protects the auxiliary device and the lookup table, and
gpio_shared_make_proxy_dev() assigns ref->proxy_dev under ref->lock.

However, gpio_shared_remove_proxy_dev() and gpio_shared_teardown_entry() do
not take ref->lock, and auxiliary_device_uninit(ref->proxy_dev) drops the
final reference and frees ref->proxy_dev via gpio_shared_proxy_dev_release()
before ref->proxy_dev is set to NULL.

In gpiochip_add_data_with_key(), gpiochip_setup_dev() calls gcdev_register()
while gdev is already visible on gpio_devices. If gpiochip_sysfs_register()
subsequently fails, the error path runs:

gpiochip_add_data_with_key()
  -> gpio_device_teardown_shared()
    -> gpio_shared_teardown_entry()
      -> gpio_shared_remove_proxy_dev()

before gdev is removed from gpio_devices and synchronize_srcu() is called
(and gpiod_free_commit() leaves GPIOD_FLAG_SHARED set on the descriptor).

A concurrent consumer in gpiod_find_and_request() that looked up the
descriptor under gpio_devices_srcu can call gpio_shared_add_proxy_lookup(),
take ref->lock, and dereference ref->proxy_dev->id while
gpio_shared_remove_proxy_dev() is freeing ref->proxy_dev or after it has set
ref->proxy_dev to NULL.

Similarly, if a consumer node references multiple shared GPIOs with the same
fwnode and con_id across two GPIO controllers, requesting the pin on one
registered controller calls gpio_shared_add_proxy_lookup(), which walks
gpio_shared_list and can match the ref belonging to the second controller
while its ref->proxy_dev is still NULL or being torn down in
gpio_shared_remove_proxy_dev().

Concurrent gpiochip_setup_shared() calls for other controllers also walk
gpio_shared_list without ref->lock:

	list_for_each_entry(entry, &gpio_shared_list, list) {
		list_for_each_entry(ref, &entry->refs, list) {
			if (ref->proxy_dev && gdev->dev.parent =3D=3D &ref->proxy_dev->dev) {

which can read a non-NULL ref->proxy_dev pointer after
auxiliary_device_uninit() has already freed the structure (or after the slab
slot has been reallocated).

Note that the follow-up commit ("gpio: shared: convert to using software
nodes for GPIO shared proxy lookup") still leaves
gpio_shared_remove_proxy_dev() unlocked and frees ref->proxy_dev and
unregisters ref->proxy_swnode before clearing ref->proxy_dev and
ref->proxy_fwnode to NULL.

Should gpio_shared_remove_proxy_dev() and the readers of ref->proxy_dev
serialize access with ref->lock and check for a NULL ref->proxy_dev?

> =20
>  static void gpio_shared_teardown_entry(struct gpio_device *gdev,
> @@ -534,7 +546,7 @@ static void gpio_shared_teardown_entry(struct gpio_de=
vice *gdev,
>  			ref->lookup =3D NULL;
>  		}
> =20
> -		gpio_shared_remove_adev(&ref->adev);
> +		gpio_shared_remove_proxy_dev(ref);
>  	}
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-gpio-share=
d-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com?part=3D4
