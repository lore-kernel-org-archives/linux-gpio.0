Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509741;
	b=gE3YOOuIGUQwiuD/8UA0Ard65EWTh2NYKTNdZ1zIwIzlvQgnKAmQA9GAK9bezxx54y3c
	 W4K661ki1C2ix+jPdqvdu4b5eCiZa7w9kRbAb4AF7EERA+otIrExdPK281LSkRZMNEqBI
	 PRMh4htjmWk10aW7/epRYLpudeNmLfe91KItRZF4JSxfwQQh/cqYGtkIFxpDEqVxE2WZQ
	 21YVT28Az03JUUHY/WBzFYCL2mGGu8WlnI/DC05JbfLHFESaHpszFeisnhTxN417FUce3
	 PoMYw5/8GrwYnmbYo5hzyXLCn9vzmvF/NvLwcPWSFan5ppIPnlPr8itoBLcH0EtSYSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509741;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dw1G0EF7KyJJHz9gqGSuU323BgP7jOZIpKL6pGo+0g4=;
	b=u+RUB3mb44d5eaizSVZodefa9oZbO6v6XISMg5OSDXJPYwL45NPBVurv9FHaeeRGiXYQ
	 jdK5EBYnu0GyaJJbHTAp6UUv5UuOZBp7oQEeAyOf18RG2nEzGfO+LowviBmixUMuiXmGw
	 BnFp7yWntJdKWH/o9wrXrP3YtbbfLQ9135ShnI074rt2Oj7jl6F8KmHH/LvFFX0gIbPot
	 UTRBdCfF5fVdVXMFoxlJRQPIBzMLw/2ZK7vdtwbJYa76FWuEHZ6gJY9hCOKlbdG0hBmjL
	 Ht3Z6jMGH99bY0lHVXWmL0VIJToHJ5diYULQ8eaSRDyA/YSTkU8dgnXmf50ENNaaw0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913EF606A319
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 15:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A91F1F000C4;
	Tue, 20 Oct 2026 15:22:21 +0000 (UTC)
Message-ID: <sashiko-outbox-179237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] gpio: shared: convert to using software nodes
 for GPIO shared proxy lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261020-gpio-shared-fwnode-lookup-v5-2-f4a2dfc059d7@oss.qualcomm.com>
References: <20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com>
 <20261020-gpio-shared-fwnode-lookup-v5-2-f4a2dfc059d7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 15:21:50 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] gpio: shared: NULL proxy_fwnode match in gpio_shared_get_proxy()
- [High] gpio: shared: proxy device and swnode leak in gpiochip_setup_share=
d()
- [High] gpio: shared: missing lock and NULL check in gpio_device_teardown_=
shared()
- [Low] gpio: shared: goto mixed with scoped_guard() in gpio_shared_make_pr=
oxy_dev()
--

commit b4de64cbf7a306f0ab8621752d2d0374b848b826
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: convert to using software nodes for GPIO shared proxy lookup

This commit replaces platform lookup tables for shared GPIO proxies with
dummy software nodes assigned to the proxy auxiliary devices, allowing
shared proxy GPIO devices to be looked up by their firmware node.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index c7893a5ac80a6..2a6889a291bb9 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c

[ ... ]

> @@ -313,35 +314,50 @@ static int gpio_shared_make_proxy_dev(struct gpio_d=
evice *gdev,
>  				      struct gpio_shared_entry *entry,
>  				      struct gpio_shared_ref *ref)
>  {
> +	struct software_node *swnode =3D &ref->proxy_swnode;
>  	struct auxiliary_device *adev;
> +	struct fwnode_handle *fwnode;
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
> -		kfree(adev);
> -		return id;
> +		ret =3D id;
> +		goto err_free_adev;
>  	}
> =20
> +	ret =3D software_node_register(swnode);
> +	if (ret)
> +		goto err_free_ida;

[Severity: High]
What happens if gpio_shared_make_proxy_dev() succeeds for the first
ref in gpiochip_setup_shared(), but fails on a subsequent ref or entry?

In drivers/gpio/gpiolib-shared.c:gpiochip_setup_shared():

	list_for_each_entry(ref, &entry->refs, list) {
		...
		ret =3D gpio_shared_make_proxy_dev(gdev, entry, ref);
		if (ret) {
			gpiod_free_commit(desc);
			return ret;
		}
	}

And in drivers/gpio/gpiolib.c:gpiochip_add_data_with_key():

	ret =3D gpiochip_setup_shared(gc);
	if (ret)
		goto err_remove_irqchip;

When gpiochip_setup_shared() fails partway through, it only calls
gpiod_free_commit(desc) for the current entry and jumps past
err_teardown_shared in gpiochip_add_data_with_key(). Does this leak the
auxiliary_device, gpio_shared_ida ID, and registered ref->proxy_swnode
from earlier iterations (as well as requested descriptors from earlier
entries)?

Because ref->proxy_swnode is embedded in the persistent struct
gpio_shared_ref and remains registered in swnode_kset, wouldn't any
subsequent attempt to re-probe the GPIO controller permanently fail in
software_node_register(&ref->proxy_swnode) with -EEXIST?

> +
> +	fwnode =3D software_node_fwnode(swnode);
> +	if (!fwnode) {
> +		ret =3D -ENODEV;
> +		goto err_swnode_unreg;
> +	}
> +
> +	dev =3D &adev->dev;
>  	adev->id =3D id;
>  	adev->name =3D "proxy";
> -	adev->dev.parent =3D gdev->dev.parent;
> -	adev->dev.platform_data =3D entry;
> -	adev->dev.release =3D gpio_shared_proxy_dev_release;
> +	dev->parent =3D gdev->dev.parent;
> +	dev->platform_data =3D entry;
> +	dev->release =3D gpio_shared_proxy_dev_release;
> +
> +	device_set_node(dev, software_node_fwnode(swnode));
> =20
>  	ret =3D auxiliary_device_init(adev);
> -	if (ret) {
> -		ida_free(&gpio_shared_ida, id);
> -		kfree(adev);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_swnode_unreg;
> =20
>  	ret =3D auxiliary_device_add(adev);
>  	if (ret) {
>  		auxiliary_device_uninit(adev);
> +		software_node_unregister(swnode);
>  		return ret;
>  	}
> =20
> @@ -350,9 +366,19 @@ static int gpio_shared_make_proxy_dev(struct gpio_de=
vice *gdev,
> =20
>  	scoped_guard(mutex, &ref->lock) {
>  		ref->proxy_dev =3D adev;
> +		ref->proxy_fwnode =3D fwnode;
>  	}
> =20
>  	return 0;
> +
> +err_swnode_unreg:
> +	software_node_unregister(swnode);
> +err_free_ida:
> +	ida_free(&gpio_shared_ida, id);
> +err_free_adev:
> +	kfree(adev);
> +
> +	return ret;
>  }

[Severity: Low]
This isn't a bug, but include/linux/cleanup.h recommends not mixing
goto-based error handling labels with scope-based cleanup helpers such
as scoped_guard() in the same function. Could gpio_shared_make_proxy_dev()
avoid mixing goto labels with scoped_guard(mutex, &ref->lock)?

>  #if IS_ENABLED(CONFIG_RESET_GPIO)
> @@ -457,23 +483,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct de=
vice *consumer,
>  }
>  #endif /* CONFIG_RESET_GPIO */
> =20
> -int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_=
handle *fwnode,
> -				 const char *con_id, unsigned long lflags)
> +struct gpio_desc *
> +gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwn=
ode,
> +		      const char *con_id)
>  {
>  	struct gpio_shared_entry *entry;
>  	struct gpio_shared_ref *ref;
> -	const char *dev_id;
> -
> -	if (!consumer)
> -		return -EOPNOTSUPP;
> -
> -	dev_id =3D dev_name(consumer);
> =20
>  	list_for_each_entry(entry, &gpio_shared_list, list) {
>  		list_for_each_entry(ref, &entry->refs, list) {
>  			guard(mutex)(&ref->lock);
> =20
> -			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
> +			if (!ref->fwnode && consumer &&
> +			    device_is_compatible(consumer, "reset-gpio")) {
>  				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
>  					continue;
>  			} else if (fwnode !=3D ref->fwnode) {
> @@ -484,49 +506,22 @@ int gpio_shared_add_proxy_lookup(struct device *con=
sumer, struct fwnode_handle *
>  			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) !=3D 0))
>  				continue;
> =20

[ ... ]

> +			struct gpio_device *gdev __free(gpio_device_put) =3D
> +					gpio_device_find_by_fwnode(ref->proxy_fwnode);
> +			if (!gdev)
> +				/*
> +				 * A matching entry is there but the associated
> +				 * controller has not been registered yet.
> +				 */
> +				return ERR_PTR(-EPROBE_DEFER);
> =20
> -			return 0;
> +			return gpio_device_get_desc(gdev, 0);
>  		}
>  	}

[Severity: High]
Can gpio_device_find_by_fwnode(ref->proxy_fwnode) match an unrelated
GPIO controller when ref->proxy_fwnode is NULL?

ref->proxy_fwnode is NULL before gpio_shared_make_proxy_dev() finishes
initializing that ref (for example, while gpiochip_setup_shared() is
iterating through refs after setting GPIOD_FLAG_SHARED, or if a consumer
has multiple shared GPIOs with the same con_id on different controllers
and an earlier entry in gpio_shared_list belongs to a controller that
has not registered yet) and after gpio_device_teardown_shared() clears
it.

In drivers/gpio/gpiolib.c:gpio_chip_match_by_fwnode():

static int gpio_chip_match_by_fwnode(struct gpio_chip *gc, const void *fwno=
de)
{
	struct device *dev =3D &gc->gpiodev->dev;
	struct fwnode_handle *node =3D dev_fwnode(dev);

	if (IS_ERR(fwnode))
		return 0;

	if (device_match_fwnode(dev, fwnode))
		return 1;

	return node && node->secondary =3D=3D fwnode;
}

When fwnode is NULL, node && node->secondary =3D=3D NULL evaluates to true
for any registered GPIO device that has a primary fwnode and no
secondary fwnode (or device_match_fwnode() matches if dev has no
fwnode). Instead of returning NULL and deferring probe with
-EPROBE_DEFER, wouldn't gpio_shared_get_proxy() return descriptor 0 of
the first such unrelated GPIO chip?

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
> +			software_node_unregister(&ref->proxy_swnode);
> +			ref->proxy_dev =3D NULL;
> +			ref->proxy_fwnode =3D NULL;
>  		}
>  	}
>  }

[Severity: High]
Should this loop in gpio_device_teardown_shared() acquire ref->lock and
check whether ref->proxy_dev is NULL?

In struct gpio_shared_ref, ref->lock protects proxy_dev and proxy_fwnode,
and both gpio_shared_make_proxy_dev() and gpio_shared_get_proxy() take
ref->lock when accessing them. Here, software_node_unregister() frees the
struct swnode backing ref->proxy_fwnode and auxiliary_device_uninit()
drops the last reference to ref->proxy_dev before the pointers are set to
NULL, without holding ref->lock.

Since gpio_shared_list is global and gpio_device_teardown_shared() is
also called at err_teardown_shared in gpiochip_add_data_with_key() before
gdev is removed from gpio_devices, could a concurrent
gpio_shared_get_proxy() or gpiochip_setup_shared() observe a freed
ref->proxy_fwnode or ref->proxy_dev?

Also, if ref->proxy_dev is NULL when gpio_device_teardown_shared() runs
(for instance, if a controller registered before gpio_shared_init() is
later removed, or if multiple gpio_chips share the same controller
fwnode), wouldn't auxiliary_device_delete(ref->proxy_dev) pass NULL to
device_del() and dereference a NULL pointer?

=DB=8C=D9=86=DB=8C

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-gpio-share=
d-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com?part=3D2
