Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4662615665C
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971496; cv=none; b=RPUp0iKU9nVZ9ALafyyXSBkeT6fsUurixUAjHUumQam7isyUd4ekh9ExcDKiwmt8VdUg0nJVZTH7sR4ZY3t9w7RfAlmTBrUZHwDMbgXxrCI18yiM2/QILop5QVYJ4K1+WWwE82a0dG2vFOrxeaor46Z1aypq+nMDqYcG3KhQI9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971496; c=relaxed/simple;
	bh=5PBbDqW92Bb1E5ENcV7Swcqc/CAu2s6sjASYQt2E61E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WT++nbz3xiKIaflx1gvVipAanC4Y0iVjRmicsxtJl5vcQ0UP3VuF0W30MUliEjEYkAUFPiEdrCVJEqjTc4lA9gwaSQFYEFh73+MoZneiOEZ6uMscC7yP2UPmeu0yH5114A4bfX+tC99FH20N+1x7B0VVXmdwL7VX4gi6ib2UB8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMr9qXZH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMr9qXZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF0F1F00893;
	Wed, 14 Oct 2026 09:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971495;
	bh=nhO7InCoGGIv4TQ7O/nI1JcEROurn9wTtHbE+zfqcRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UMr9qXZHWlNntkqodq/6SvjKpORtKEGf0bkKU2J5sHIUWWS8eGkYpO/7UiWywrs8A
	 xibzGHUi5QT+s+76kiRXE1/8VnTd6oY5qv1D6tlmm0xMbaEJc5B3l2ax+OERXNrmL2
	 D5Cg537Hzm2pcCgNz7ZYHLH/WLIZMzUKWeesDb9fIjygh8g6Lh4wIeFsdxoHAWDHmz
	 tuz6Jb7AwxKGWBAMIaEwMQ1/dSbihf1UlDECSH99OX24OBEXdA5dN34FHyDr/ezRrT
	 Kw58KtncJFRDcVwxlfyiRSlNfq2Hi8NfrL5A+Gb48JLwbrK1xNuKzArp93VkGaVPdb
	 hzlmVMbnm+brA==
Message-ID: <sashiko-outbox-171094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] gpio: shared: convert to using software nodes
 for GPIO shared proxy lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261014-gpio-shared-fwnode-lookup-v4-4-2253ad645fd6@oss.qualcomm.com>
References: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
 <20261014-gpio-shared-fwnode-lookup-v4-4-2253ad645fd6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:51:34 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] gpio: use-after-free of dangling proxy_fwnode on proxy creation fa=
ilure
- [High] gpio: missing NULL check in gpio_device_teardown_shared causes pan=
ic
- [High] gpio: lockless proxy_fwnode teardown causes data race and incorrec=
t chip lookup
- [Medium] gpio: missing proxy device cleanup on error causes permanent -EE=
XIST probe failure
- [Medium] gpio: missing error code in gpio_shared_make_proxy_dev causes si=
lent failure
- [Medium] gpio: lockless proxy_fwnode initialization causes data race in p=
roxy lookup
--

commit 5c7699dca403f7ae958b2532cf7a05f31e80a27e
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: convert to using software nodes for GPIO shared proxy lookup
   =20
Automated management of shared GPIOs only allows to request shared pins
when they're assigned to a real struct device. Firmware node, no-device
lookup currently isn't supported and can't be because we're using
platform lookup tables to point the callers to the shared proxy GPIO
controllers.

This commit converts the GPIO shared proxy lookup mechanism to use
software nodes instead of platform lookup tables. It assigns dummy
software nodes to proxy devices and stores them in reference structures.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index a57a2dd5ca00e..16c0a9d491167 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -313,37 +314,55 @@ static int gpio_shared_make_proxy_dev(struct gpio_d=
evice *gdev,
>  				      struct gpio_shared_entry *entry,
>  				      struct gpio_shared_ref *ref)
>  {
> +	struct software_node *swnode =3D &ref->proxy_swnode;
>  	struct auxiliary_device *adev;
> +	struct device *dev;
>  	int ret, id;
> =20
>  	adev =3D kzalloc_obj(*adev);
>  	if (!adev)
>  		return -ENOMEM;
> =20
> +
>  	id =3D ida_alloc(&gpio_shared_ida, GFP_KERNEL);
>  	if (id < 0) {
>  		kfree(adev);
>  		return id;
>  	}
> =20
> +	ret =3D software_node_register(swnode);
> +	if (ret) {
> +		ida_free(&gpio_shared_ida, id);
> +		kfree(adev);
> +		return ret;
> +	}
> +
> +	ref->proxy_fwnode =3D software_node_fwnode(swnode);

[Severity: Medium]
Is ref->proxy_fwnode protected by a lock here?

If a concurrent consumer calls gpiod_get() and invokes
gpio_shared_get_proxy(), it will acquire ref->lock to safely read
ref->proxy_fwnode. Because the writer ignores the lock, the reader may
observe a partially initialized or stale pointer, leading to a race conditi=
on
during fwnode lookup.

> +	if (!ref->proxy_fwnode) {
> +		ida_free(&gpio_shared_ida, id);
> +		kfree(adev);
> +		goto err_swnode_unreg;

[Severity: Medium]
Will this silently return 0 (success) because ret is not set to a negative
error code before jumping to err_swnode_unreg?

Because ret is 0 from the previous successful call to
software_node_register(), this masks the initialization failure, leaving
the proxy device uninitialized but tricking the caller into proceeding as
if it succeeded.

[ ... ]

>  	ret =3D auxiliary_device_init(adev);
>  	if (ret) {
>  		ida_free(&gpio_shared_ida, id);
>  		kfree(adev);
> -		return ret;
> +		goto err_swnode_unreg;
>  	}
> =20
>  	ret =3D auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_dev_uninit;
> =20
>  	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
>  		 dev_name(&adev->dev), gpio_device_get_label(gdev));
> @@ -353,6 +372,13 @@ static int gpio_shared_make_proxy_dev(struct gpio_de=
vice *gdev,
>  	}
> =20
>  	return 0;
> +
> +err_dev_uninit:
> +	auxiliary_device_uninit(adev);
> +err_swnode_unreg:
> +	software_node_unregister(swnode);
> +
> +	return ret;

[Severity: High]
Does this error path leave ref->proxy_fwnode dangling?

If auxiliary_device_init() or auxiliary_device_add() fails, the code jumps
to err_swnode_unreg, which unregisters and frees the swnode. However,
ref->proxy_fwnode is not reset to NULL.

Since ref is part of the global gpio_shared_list, a concurrent or
subsequent consumer calling gpiod_get() will trigger
gpio_shared_get_proxy(), which will dereference the freed proxy_fwnode
pointer, leading to a Use-After-Free.

[Severity: Medium]
Can returning an error here cause a permanent probe failure for the control=
ler?

In gpiochip_setup_shared(), if gpio_shared_make_proxy_dev() fails for one
entry, it immediately returns the error without cleaning up the proxy
devices and software nodes successfully created in previous iterations:

	ret =3D gpio_shared_make_proxy_dev(gdev, entry, ref);
	if (ret) {
		gpiod_free_commit(desc);
		return ret;
	}

The caller (gpiochip_add_data_with_key()) will then bypass
gpio_device_teardown_shared(). The software_node remains registered, and
when the GPIO controller is reprobed (e.g. after -EPROBE_DEFER),
software_node_register() will be called again with the exact same pointer,
returning -EEXIST.

>  }
> =20
>  #if IS_ENABLED(CONFIG_RESET_GPIO)

[ ... ]

> @@ -628,15 +623,11 @@ void gpio_device_teardown_shared(struct gpio_device=
 *gdev)
>  			gpiod_free_commit(&gdev->descs[entry->offset]);
> =20
>  		list_for_each_entry(ref, &entry->refs, list) {
> -			if (ref->lookup) {
> -				gpiod_remove_lookup_table(ref->lookup);
> -				kfree(ref->lookup->table[0].key);
> -				kfree(ref->lookup->dev_id);
> -				kfree(ref->lookup);
> -				ref->lookup =3D NULL;
> -			}
> -
> -			gpio_shared_remove_proxy_dev(ref);
> +			auxiliary_device_delete(ref->proxy_dev);
> +			auxiliary_device_uninit(ref->proxy_dev);

[Severity: High]
Might ref->proxy_dev be NULL here?

In gpiochip_setup_shared(), if an entry has only 1 consumer
(list_count_nodes <=3D 1), proxy creation is skipped, leaving ref->proxy_dev
as NULL. Additionally, silent initialization failures also leave it NULL.

Passing NULL triggers an immediate kernel panic due to
device_del(&NULL->dev) and mutex_destroy(&NULL->sysfs.lock).

> +			software_node_unregister(&ref->proxy_swnode);
> +			ref->proxy_dev =3D NULL;
> +			ref->proxy_fwnode =3D NULL;

[Severity: High]
Could modifying ref->proxy_fwnode outside of ref->lock cause a data race?

Concurrently, a consumer calling gpio_shared_get_proxy() acquires
ref->lock to safely read ref->proxy_fwnode. Because this teardown path
modifies it locklessly, a data race occurs.

If gpio_shared_get_proxy() reads the pointer as NULL during the race, it
calls gpio_device_find_by_fwnode(NULL):

	struct gpio_device *gdev __free(gpio_device_put) =3D
			gpio_device_find_by_fwnode(ref->proxy_fwnode);

The matching function gpio_chip_match_by_fwnode() incorrectly returns true
for NULL if a device has no secondary fwnode. As a result, the consumer
acquires a descriptor from a completely unrelated GPIO chip instead of
failing safely.

>  		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-gpio-share=
d-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com?part=3D4
