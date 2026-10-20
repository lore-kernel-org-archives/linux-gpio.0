Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508252;
	b=oExSkyIqSLZvrgvmkJ7dsQpgDNRuhGuKzqZp00Yeudr1fOkf/F6hjO19NJCYeAoDvyza
	 U5BuBdY0GrPmrD9qTch0gj+t246asf+H+YuwPwifPr6WjhFBjAuoPeuW4Q8T9SKXH9B24
	 L4s+KvIrB8tqbZgVAoO71BwDTU17/+uA7Xg0e68yDLY+DlXtsrGvWULueeJ8PlI4Z6ECf
	 DqcB/7ExGlExQTFYwhTwMYYmUoefEoyEOSNyoc2YldmLl94dWHEYEpgli/8q7vp943E1d
	 xJsBqG2ttyCJVepoj4mJphvhylGjLuyCrIgwKRm9AWwntWxcVqpPVBIBL0/Q1WMFDPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508252;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6mkMDZAnxw+SPWJ54WBKNv+DkBnfcruVHnk7aiRxm/g=;
	b=p6SZZfDYkBMYVNWs8C3kX6iT34GoKHvqW9XaW80Mou6aRDA1z+T7q7/ZaIqzl0NfCIdv
	 PV6Y/c8zEnVI8NqX9PM2/yumFc1eyaPzxt0mPyKJp6P9Fp49iQJscdMDgHW5L+QHq6k6V
	 6CntkculBTBUwhqlq6Ifeyk6omjxdhYaCm9ixDMTfB+OzYFaOoOhsDpLrCujrZmOLLBAG
	 E+pTW6kUpJcXaB3KRGXnDfffH8gUt4lvVT3pu1z5iKze6iDBL3waL9SXBKrLAz2sevWQu
	 EUPnuHsGS02hxE2aJ0Q6kM4vToxy6VeBf0Qfjm6gYbVI5YbhYLq/fUVilTCOzxR9BHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=At1NfAu9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C1606A31B
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=At1NfAu9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365681F000C7;
	Tue, 20 Oct 2026 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792508251;
	bh=6mkMDZAnxw+SPWJ54WBKNv+DkBnfcruVHnk7aiRxm/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=At1NfAu98PRNt5FaY92tM7hgBJPGgbEKVOTvLbRg4mHQY33ErBnpKP2ccHLENdBe4
	 Jdifdi6zZ/s7cH1Cy4g2LfIIanjnN4k3YZPyvLnkcUoukHKoBeLosYtAOtOLvagAV5
	 Lmss5zg71qM/PwbRaL0Qk1Ma4ewI06J73Y2goermCpZSM/r+VC4tETkGkbnTgqVHL/
	 yxxDWt7lWMSTCrMum6yAQxhy98G3QZr9YVvZfdLOfgea+LyLV51sN43yCR4uurLA/w
	 1wItHgPMO2Vm0oGOeUBLIkdzVd6Y61J5AFetxNIOFRMeNxE0yaE+JH/OfyQW/d9XIs
	 bQNWDgigauJcg==
Message-ID: <sashiko-outbox-179202@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] gpio: shared: detach the proxy device from
 struct gpio_shared_ref
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261020-gpio-shared-fwnode-lookup-v5-1-f4a2dfc059d7@oss.qualcomm.com>
References: <20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com>
 <20261020-gpio-shared-fwnode-lookup-v5-1-f4a2dfc059d7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:57:05 +0000
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
- [Medium] gpio: shared: leak of proxy_dev and IDA ID on partial setup fail=
ure in gpiochip_setup_shared()
--

commit 31669b11716fa33851710078614d4d0ed83430d1
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: detach the proxy device from struct gpio_shared_ref

This commit moves the auxiliary device structure out of struct
gpio_shared_ref and allocates it separately when setting up the GPIO shared
proxy device, while also moving the IDA allocation and release to match the
proxy device lifecycle.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 8c9ac9d933049..c7893a5ac80a6 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c

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
> =20
> -	memset(adev, 0, sizeof(*adev));
> +	id =3D ida_alloc(&gpio_shared_ida, GFP_KERNEL);
> +	if (id < 0) {
> +		kfree(adev);
> +		return id;
> +	}
> =20
> -	adev->id =3D ref->dev_id;
> +	adev->id =3D id;
>  	adev->name =3D "proxy";
>  	adev->dev.parent =3D gdev->dev.parent;
>  	adev->dev.platform_data =3D entry;
> -	adev->dev.release =3D gpio_shared_adev_release;
> +	adev->dev.release =3D gpio_shared_proxy_dev_release;
> =20
>  	ret =3D auxiliary_device_init(adev);
> -	if (ret)
> +	if (ret) {
> +		ida_free(&gpio_shared_ida, id);
> +		kfree(adev);
>  		return ret;
> +	}
> =20
>  	ret =3D auxiliary_device_add(adev);
>  	if (ret) {
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

> @@ -592,7 +604,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
>  				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
>  				 ref->con_id ?: "(none)");
> =20
> -			ret =3D gpio_shared_make_adev(gdev, entry, ref);
> +			ret =3D gpio_shared_make_proxy_dev(gdev, entry, ref);
>  			if (ret) {
>  				gpiod_free_commit(desc);
>  				return ret;

[Severity: Medium]
Can this error path leak ref->proxy_dev and its gpio_shared_ida ID when a
subsequent iteration fails?

In gpiochip_setup_shared(), each shared entry has at least two references in
entry->refs:

drivers/gpio/gpiolib-shared.c:gpiochip_setup_shared() {
    ...
		if (list_count_nodes(&entry->refs) <=3D 1)
			continue;
    ...
		list_for_each_entry(ref, &entry->refs, list) {
			...
			ret =3D gpio_shared_make_proxy_dev(gdev, entry, ref);
			if (ret) {
				gpiod_free_commit(desc);
				return ret;
			}
		}
}

If gpio_shared_make_proxy_dev() succeeds for the first ref in entry->refs (=
or
for a previous shared entry on the same chip) and then fails on a later ref,
gpiochip_setup_shared() only calls gpiod_free_commit(desc) and returns the
error.

In the caller gpiochip_add_data_with_key() in drivers/gpio/gpiolib.c:

	ret =3D gpiochip_setup_shared(gc);
	if (ret)
		goto err_remove_irqchip;

this bypasses gpio_device_teardown_shared(), leaving the already-created
ref->proxy_dev auxiliary devices registered on the auxiliary bus and leaking
their dynamically allocatedadev structures and gpio_shared_ida IDs (as well=
 as
subsequently overwriting ref->proxy_dev if the GPIO controller re-probes).

[ ... ]

>  			}
>  		}
>  	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-gpio-share=
d-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com?part=3D1
