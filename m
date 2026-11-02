Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625162;
	b=c2hp+I+MD5Sb/wFm9VhaKVYWlAh49UwNVeizwfhpOqe7Bgfvn2D+P+DNvShlOYNhR7rx
	 g23Nn6/5IJv5TGSIlgM6lh3DfqKcG0Q8702BET44SW+vMaqO1Lrg7Yr8nAZCOXuFvNRWO
	 aaDeDPAmiHWZOnEe8nBn/YR2nDXMUDrPfJ5doXVXg76jnxBaahZvcSrgd8BF/TjbbeRJB
	 Uj8r9fboCrCCwjJtSdSHHGJCEzcj8ySDh9BFoxBIj8sTbYiL9EB/g31sO8OvRGEtoh2rN
	 ANxilUOVHbk23nnu8ftLWmeytRegysRHEjtx/sBFVeGdf3UCDWh/44I46ED6QbetdjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625162;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KJsJqsmXxbfwpfW3QRJOU1jFaxsz1rsPQ/9ApAL+n58=;
	b=J420oWAwesopGk4F6XSmTWj7XsnW/jaPMzdkvx2SvoDHQ7ZYY77MUMER5Xfn8SuttWfI
	 /6QGtJ/Pn8XcQYSOKWrOZ5/wfYH9uWl0YkTcNbdUVb/PUId8n/IHbmyHayzbWutJHp8hu
	 ANi1A3iBzRFhBJQW4iMF75/w8gsKFSyxaiHNeU1y/gVlN2TdHJlIeck8brHZFoMQSAQp7
	 8IFNgzoXgAf9Vpw3ZDUSpvwF+132WIF6Fdx7gVP5oGSBSo0dDb0PeC89xb3mktIxd91Ii
	 jojDqnzlgkC97vRCiOMUTfbUm5YT89ts6ZUjfKAN9j/47OWllAVIc6J5guthQfyjrUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OsOV0RK2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0007606A32C
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OsOV0RK2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354281F00A16;
	Mon,  2 Nov 2026 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793625161;
	bh=KJsJqsmXxbfwpfW3QRJOU1jFaxsz1rsPQ/9ApAL+n58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OsOV0RK22ONabnT/igcf6iANlck0J3F7wCbdJdsJadwTe38BdE9eBeGoT3vLaqg0p
	 m0Dkfqc3qAsCpaeYnI8kQ3lWpimvRzDcWz33S5aWMCgCLd8ePmNW24M0oEccUdG2GO
	 /Fd+dwPR5TUoJHYbQTgenakIFuMdUfYOosyDg4l1p3iwN/9qULU4GSZqrc6BfpBZlC
	 cQX4xk/x5Po+0073axtP/zVO0SSQL04Rje2B74kCO4vJsZL3zsFNgMD/XkOALqexum
	 X7wGco/uHtaadNfcrPBBwGdD+mPdVcNMdi0msVSmo66RD1/bUQdVcBiwq9+l19Jmjh
	 9rFhGZ4K55fJA==
Message-ID: <sashiko-outbox-193473@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/5] gpio: shared: convert to using software nodes
 for GPIO shared proxy lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-5-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
 <20261102-gpio-shared-fwnode-lookup-v9-5-a1d6cc501098@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 13:12:40 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] gpio: shared: use-after-free in software_node_notify_remove() =
on proxy removal
- [Medium] gpio: shared: software node leak in gpio_shared_make_proxy_dev()=
 on add error
--

commit 8540cb961814db62ab8d7cec3ac6bee73e8c8520
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: convert to using software nodes for GPIO shared proxy lookup

This commit replaces platform lookup tables for shared GPIO proxy devices
with managed software nodes attached to the proxy auxiliary devices,
allowing shared GPIO lookup to work via firmware nodes even when no
consumer struct device is present.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 9d73a02e99890..57d8fd0bf2e1b 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
[ ... ]
> @@ -303,56 +303,70 @@ static int gpio_shared_of_scan(void)
> =20
>  static void gpio_shared_proxy_dev_release(struct device *dev)
>  {
> -	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> +	struct auxiliary_device *proxy =3D to_auxiliary_dev(dev);
> =20
> -	ida_free(&gpio_shared_ida, adev->id);
> -	kfree(adev);
> +	ida_free(&gpio_shared_ida, proxy->id);
> +	kfree(proxy);
>  }
> =20
>  static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
>  				      struct gpio_shared_entry *entry,
>  				      struct gpio_shared_ref *ref)
>  {
> -	struct auxiliary_device *adev;
> +	struct property_entry properties =3D { };
> +	struct auxiliary_device *proxy;
> +	struct device *dev;
>  	int ret, id;
> =20
> -	adev =3D kzalloc_obj(*adev);
> -	if (!adev)
> +	proxy =3D kzalloc_obj(*proxy);
> +	if (!proxy)
>  		return -ENOMEM;
> =20
>  	id =3D ida_alloc(&gpio_shared_ida, GFP_KERNEL);
>  	if (id < 0) {
> -		kfree(adev);
> -		return id;
> +		ret =3D id;
> +		goto err_free_proxy;
>  	}
> =20
> -	adev->id =3D id;
> -	adev->name =3D "proxy";
> -	adev->dev.parent =3D gdev->dev.parent;
> -	adev->dev.platform_data =3D entry;
> -	adev->dev.release =3D gpio_shared_proxy_dev_release;
> +	dev =3D &proxy->dev;
> +	proxy->id =3D id;
> +	proxy->name =3D "proxy";
> +	dev->parent =3D gdev->dev.parent;
> +	dev->platform_data =3D entry;
> +	dev->release =3D gpio_shared_proxy_dev_release;
> =20
> -	ret =3D auxiliary_device_init(adev);
> +	ret =3D auxiliary_device_init(proxy);
> +	if (ret)
> +		goto err_free_ida;
> +
> +	ret =3D device_create_managed_software_node(dev, &properties, NULL);
>  	if (ret) {
> -		ida_free(&gpio_shared_ida, id);
> -		kfree(adev);
> +		auxiliary_device_uninit(proxy);
>  		return ret;
>  	}

[Severity: Critical]
As reported by Sashiko on v8 [1], can using
device_create_managed_software_node() here cause a use-after-free and
refcount underflow in software_node_notify_remove() when the proxy device
is removed or unbound?

In gpio_shared_make_proxy_dev(), device_create_managed_software_node()
creates a struct swnode with refcount 1, sets swnode->managed =3D true, and
attaches it to proxy->dev. When auxiliary_device_add() registers
proxy->dev, software_node_notify() increments the swnode refcount to 2.

Later, when gpio_shared_proxy_probe() registers the proxy gpio_chip with
gc->parent =3D &proxy->dev and gc->fwnode =3D NULL,
gpiochip_add_data_with_key() propagates the parent's fwnode to the child
gdev->dev:

drivers/gpio/gpiolib.c:gpiochip_add_data_with_key() {
    ...
    gdev->dev.parent =3D gc->parent;
    device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
    ...
}

When gpiochip_setup_dev() calls device_add(&gdev->dev),
software_node_notify(&gdev->dev) increments the same managed swnode's
refcount to 3.

However, managed software nodes cannot be shared across devices because
software_node_notify_remove() drops two references whenever
swnode->managed is true:

drivers/base/swnode.c:software_node_notify_remove() {
    ...
    swnode_put(swnode);

    if (swnode->managed) {
        set_secondary_fwnode(dev, NULL);
        swnode_put(swnode);
    }
}

When gpio_shared_remove_proxy_dev() calls auxiliary_device_delete(proxy),
unbinding gpio-shared-proxy first removes gdev->dev, which runs
software_node_notify_remove(&gdev->dev) and drops the swnode refcount from
3 to 1. Removing proxy->dev then runs
software_node_notify_remove(&proxy->dev), where the first swnode_put()
drops the refcount to 0 and frees swnode, and the subsequent
swnode->managed check and second swnode_put() access freed memory.

> =20
> -	ret =3D auxiliary_device_add(adev);
> +	ret =3D auxiliary_device_add(proxy);
>  	if (ret) {
> -		auxiliary_device_uninit(adev);
> +		auxiliary_device_uninit(proxy);
>  		return ret;
>  	}

[Severity: Medium]
Does this error path leak the software node if auxiliary_device_add()
fails before device_platform_notify() is reached in device_add()?

Because device_create_managed_software_node() is called before the device
is registered, the struct swnode is allocated and added to swnode_kset
with refcount 1, relying on device_platform_notify_remove() ->
software_node_notify_remove() to release it once device_platform_notify()
has run.

If auxiliary_device_add() fails in dev_set_name() or early in device_add()
before device_platform_notify() is called, software_node_notify_remove()
is never invoked, and auxiliary_device_uninit() ->
gpio_shared_proxy_dev_release() frees proxy without calling
device_remove_software_node(dev).

[1] https://lore.kernel.org/r/20261029-gpio-shared-fwnode-lookup-v8-5-d15d7=
5cd560f@oss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-gpio-share=
d-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com?part=3D5
