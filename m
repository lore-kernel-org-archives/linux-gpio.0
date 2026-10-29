Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293958;
	b=ZcYVtCWkhnS+8UMxK4LCZoOOo5VV27W6smDABrMw0PhVwf54luUkFFUOCFEPkOzmaV43
	 tS/B8TK7VKIHyx5MJIdmyB9CdHVJTaCUEUv73wCInxgLffCDj0XUdlFypMwHUXwrcPn+e
	 /Z9lW8i/C2OeXXGoa/WvqWi3Z/cSKmbrYV86n89HlCHBJZtwB9CAOYZhmhCjrgNf9jr2J
	 cKgC9Yd49tdd1c6d0oKXKa8I6l6ldkHyy7Hkbo7W917S7V2Q2v1suRLj5cuChOxO28XdX
	 WwXPVqvQtaD+hcGOTjMapA9gD/rmNX/baJ1tF19Tx0207VJKq8hkq6D7xtugX3L+/9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293958;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r9fNoRxPSH9l1ZD0u4hFzdCHFO1TzmAEFYvepbGOv/4=;
	b=zXsiztH5r5bcWSQVp71OZP136L2nLFJEC3+c7iNNkzuyqfQL8Wd23oS5qbIp8uAohSDt
	 7gCQJIhYDW+APbXBgpgiG1ePYVLNYT62/T3an2aaBp24ZDGW6Y3Paj7PYd4n329KiCrnd
	 CekhOYfE4KUxRutqmw/uNwkyDV0VUeQiDICXve73psPMxEdoZ9n7jicWCWYsmPkhUjcU3
	 rOAn+FvXN+OsJspzVk2It8KquoOeW0WvUPgbgoq/XnE/aCQ5H0/osISbryQRYB7sy/sw6
	 5U022UXQ5Fh39cyatzJInWAZjPWa8IPl/KRaJs89nFce5QPwDmlTMm2M4nRzf0GtOgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BI/f93HV";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCBC606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BI/f93HV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8EF1F031E9;
	Thu, 29 Oct 2026 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793293958;
	bh=r9fNoRxPSH9l1ZD0u4hFzdCHFO1TzmAEFYvepbGOv/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BI/f93HV7r+aEoDh491lwbw6tLO6wPwbqEpu98qZ3w/wyqrqjg9h30YQ721KNXX0I
	 Px9GjF6CSnmnHepERw8SqZKcfS8UxHL7onrzohTAz7Oo0sNY+6qdtwZCm6ZfTspwFD
	 sR6O+pTxLZ3B+sqCo+dFaHelpZuJrMQJDvzgJILOsI0I57j53hSGAaMAZ7o6L+7EB5
	 EROCxOrNH/3QLlAoayuzzFy9QIx8PoJz1FrRcRLhgOPVMVJ2moHpWpY2xk82FTcd3Q
	 EqjU51I/ZlF/srspYpYql3XJa4E/RX9gHf+FGDCwaJsDU0b3+5NgmsTfkeyb/WwiX1
	 8xDFu13cma73g==
Message-ID: <sashiko-outbox-189723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] gpio: shared: convert to using software nodes
 for GPIO shared proxy lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-5-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
 <20261029-gpio-shared-fwnode-lookup-v8-5-d15d75cd560f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 17:12:37 +0000
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
- [Critical] gpio: shared: use-after-free from embedding software_node in g=
pio_shared_proxy
- [Critical] gpio: shared: use-after-free from premature software_node_unre=
gister()
--

commit 0a2fa40980d92969568b8b100eb268910f6d88f6
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: convert to using software nodes for GPIO shared proxy lookup

This commit replaces platform GPIO lookup tables with dummy software nodes
assigned to shared proxy auxiliary devices so that shared GPIO descriptors
can be looked up by firmware node even when no consumer device is present.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index c0e2a1207cccf..75529336c6cd9 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -27,6 +27,12 @@
>  #include "gpiolib.h"
>  #include "gpiolib-shared.h"
> =20
> +struct gpio_shared_proxy {
> +	struct auxiliary_device aux;
> +	struct software_node swnode;
> +	struct fwnode_handle *fwnode;
> +};

[ ... ]

> @@ -304,43 +309,62 @@ static int gpio_shared_of_scan(void)
>  static void gpio_shared_proxy_dev_release(struct device *dev)
>  {
>  	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> +	struct gpio_shared_proxy *proxy =3D container_of(adev,
> +						struct gpio_shared_proxy, aux);
> =20
>  	ida_free(&gpio_shared_ida, adev->id);
> -	kfree(adev);
> +	kfree(proxy);
>  }
> =20
>  static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
>  				      struct gpio_shared_entry *entry,
>  				      struct gpio_shared_ref *ref)
>  {
> +	struct gpio_shared_proxy *proxy;
>  	struct auxiliary_device *adev;
> +	struct software_node *swnode;
> +	struct device *dev;
>  	int ret, id;
> =20
> -	adev =3D kzalloc_obj(*adev);
> -	if (!adev)
> +	proxy =3D kzalloc_obj(*proxy);
> +	if (!proxy)
>  		return -ENOMEM;
> =20
> +	adev =3D &proxy->aux;
> +	swnode =3D &proxy->swnode;
> +
>  	id =3D ida_alloc(&gpio_shared_ida, GFP_KERNEL);
>  	if (id < 0) {
> -		kfree(adev);
> -		return id;
> +		ret =3D id;
> +		goto err_free_proxy;
>  	}
> =20
> +	ret =3D software_node_register(swnode);
> +	if (ret)
> +		goto err_free_ida;

[Severity: Critical]
Does embedding struct software_node inside struct gpio_shared_proxy and
registering it with software_node_register() introduce a use-after-free
regression when the proxy device is released?

In drivers/base/swnode.c, software_node_register() -> swnode_register()
creates a separately reference-counted struct swnode kobject on
swnode_kset->list with swnode->allocated =3D 0 and stores the raw pointer
swnode->node =3D &proxy->swnode:

drivers/base/swnode.c:swnode_register() {
	...
	swnode->node =3D node;
	swnode->parent =3D parent;
	swnode->allocated =3D allocated;
	swnode->kobj.kset =3D swnode_kset;
	...
}

Because struct swnode does not hold a reference to proxy->aux.dev, when
gpio_shared_remove_proxy_dev() or the auxiliary_device_add() error path in
gpio_shared_make_proxy_dev() calls auxiliary_device_uninit(&proxy->aux),
put_device(&proxy->aux.dev) triggers gpio_shared_proxy_dev_release() and
immediately executes kfree(proxy).

If swnode->kobj outlives proxy->aux.dev (for example, due to an active
fwnode_handle_get() reference, an open sysfs attribute under
/sys/kernel/software_nodes/, or delayed kobject release), swnode->node
becomes a dangling pointer into the freed proxy slab while swnode remains
linked in swnode_kset->list. Subsequent calls to
software_node_to_swnode(), software_node_find_by_name(),
software_node_register(), to_software_node(), or fwnode property accessors
will then dereference freed memory, and a new struct gpio_shared_proxy
allocated at the same address can fail software_node_register() with
-EEXIST.

Would using fwnode_create_software_node(NULL, NULL) and
fwnode_remove_software_node() (which sets swnode->allocated =3D 1 so the
software_node is freed in software_node_release() when swnode->kobj reaches
zero references), or matching the proxy gpio_device directly via
gdev->dev.parent =3D=3D &ref->proxy->aux.dev, avoid tying the software_node
backing memory to the auxiliary_device release callback?

[ ... ]

> @@ -515,18 +534,27 @@ int gpio_shared_add_proxy_lookup(struct device *con=
sumer, struct fwnode_handle *
>  static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
>  {
> -	struct auxiliary_device *proxy;
> +	struct gpio_shared_proxy *proxy;
> =20
>  	scoped_guard(mutex, &ref->lock) {
> -		proxy =3D ref->proxy_dev;
> -		ref->proxy_dev =3D NULL;
> +		proxy =3D ref->proxy;
> +		ref->proxy =3D NULL;
> +		software_node_unregister(&proxy->swnode);
>  	}
> =20
> -	auxiliary_device_delete(proxy);
> -	auxiliary_device_uninit(proxy);
> +	auxiliary_device_delete(&proxy->aux);
> +	auxiliary_device_uninit(&proxy->aux);
>  }

[Severity: Critical]
Can calling software_node_unregister(&proxy->swnode) before
auxiliary_device_delete(&proxy->aux) cause a use-after-free in
software_node_notify_remove()?

In gpio_shared_make_proxy_dev(), software_node_register() creates the
struct swnode with an initial kref of 1 and attaches &swnode->fwnode as the
primary fwnode of proxy->aux.dev via device_set_node(). When
auxiliary_device_add() calls device_add(&adev->dev), software_node_notify()
increments the swnode kref to 2, and when the gpio-shared-proxy driver binds
and registers its child gpio_device (which inherits gc->parent->fwnode in
gpiochip_add_data_with_key()), software_node_notify(&gdev->dev) increments
the swnode kref to 3.

In gpio_shared_remove_proxy_dev(), software_node_unregister(&proxy->swnode)
is called while both devices are still registered, dropping the initial
creation reference first (from 3 to 2, or from 2 to 1 if the driver was not
bound).

When auxiliary_device_delete(&proxy->aux) then calls
device_del(&proxy->aux.dev):

1. bus_remove_device() unbinds gpio-shared-proxy and deletes gdev->dev,
   where software_node_notify_remove(&gdev->dev) drops the swnode kref from
   2 to 1.

2. device_platform_notify_remove(&proxy->aux.dev) calls
   software_node_notify_remove(&proxy->aux.dev), which drops the final
   reference from 1 to 0 in swnode_put(swnode), freeing struct swnode via
   software_node_release(), and then immediately reads swnode->managed from
   the freed struct swnode:

drivers/base/swnode.c:software_node_notify_remove() {
	...
	swnode_put(swnode);

	if (swnode->managed) {
		set_secondary_fwnode(dev, NULL);
		swnode_put(swnode);
	}
}

In addition, because device_del() does not clear dev->fwnode, both
proxy->aux.dev.fwnode and gdev->dev.fwnode remain dangling pointers to the
freed struct swnode for any remaining lifetime of those struct device
instances (such as when a consumer still holds a gpio_desc or /dev/gpiochipN
is open).

Should the software node only be unregistered after the devices using it
have been deleted or released?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-gpio-share=
d-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com?part=3D5
