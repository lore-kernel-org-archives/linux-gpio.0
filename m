Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594746;
	b=Pc3MdvWcnClIMBc9xOAVAbZeGMPRNGZd/R/LK3fKh9FVc5pCVUAU/IEw0Mud6sKJK6Qw
	 cemDC9vqtJmkZyNymHjtOPxGFtBGB9PieRGF5KlWIiz6d+Vj0Fqz8kFilBvxv8W/xazfJ
	 Wh7phNe+QNMsPiNq3PisdvKvOn0RyugvL1W6dYn/QPSvXToHpcDQGgKkirffIboURM8P9
	 5BWue1wJmVqEEiF+y+PUE9pUVdLFn7rT9IXOrrqjvbUbOzu8g+UhcgbBiUgUDowKhPf8D
	 i6u1LExqxbtjO5hnfZyr9Hex75ZLSGNHkvWbZWn25LG98zijYh5HHQXd4KbPCV3Phbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594746;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VPlOUogt8WfaBg+Sr1cMWQp+Y4wTaNQGVuKQZBEAlI8=;
	b=Dv4bwnaU9KcUrQF8kt9OA5h3ZPKIejQVb4fC21p2tmbk+N+yINo+9aT7OJoI1wFFVBu8
	 7OyJ4gLqOJ3b4nx9cAA71OKPt2xtzg57TJahVXo/jqplBAnSByGCTUAslESeNuU8vOjAz
	 2vEd062GQHItzwsXt4IJj4QGXantUvvqRbKmX9QycpvoEr05USJQknGt+ABqt5GeK47dK
	 cVaULNc1v/YzcbsFFSrQzkkZy/HcazgWNcvVYznEGpzOb2cHvf19LDjz9ChzncIqWEkH7
	 sxF6lv4nQ65HT3pe3LNZAa+yppZK1thlDFj5mlXB8vIkUdf/H2RF8yp/Fu3SP7ML3jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4NODWJQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB66606A31B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4NODWJQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D738B1F000C3;
	Wed, 21 Oct 2026 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594746;
	bh=VPlOUogt8WfaBg+Sr1cMWQp+Y4wTaNQGVuKQZBEAlI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N4NODWJQiaW2KQIIvdrhoGZHkhsHK2EwHBZBIIL2BMN5q2Bi582qPtwUFKhsRn7o5
	 nqgnNy8I5jab39gOhhudgyKS9BmC5UtzXdv+h5zzmOPTMG0T5IES8MxFN3WBAfPr40
	 YbWlzQ3F5xwlHc0FaBstbj2d6BqUrqcRSFMKBDvArIQxRKtaEwk+vEy9QT0cTJMNqX
	 c7SBruoSLDFMRy8UgdH7dUIhSd0lZl9So9sojIwYgThdDpyeMahXvTJgWZqC8E6nLe
	 y4w5bHF+k2MMM18KFHyb1Wqu5OkU4+5EuF1yvGe9PG0ahqRC7dtui8dLZTMQSu4hFq
	 b18yhf85Wz+WQ==
Message-ID: <sashiko-outbox-180406@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] gpio: shared: convert to using software nodes
 for GPIO shared proxy lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-5-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
 <20261021-gpio-shared-fwnode-lookup-v6-5-6af7d8eefd25@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:59:05 +0000
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
- [High] gpio: shared: false-positive NULL fwnode match in gpio_shared_get_=
proxy()
- [High] gpio: shared: unlocked proxy teardown and NULL fwnode match in loo=
kup
--

commit c9587b1290500bb02f98bc321f73e9b020833797
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: convert to using software nodes for GPIO shared proxy lookup

This commit replaces platform lookup tables with software nodes for shared
GPIO proxy devices so that shared GPIOs can be looked up via their proxy
device firmware node in gpio_shared_get_proxy().

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 3ed25609cae10..71f16105f7a5c 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c

[ ... ]

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
> @@ -484,49 +506,31 @@ int gpio_shared_add_proxy_lookup(struct device *con=
sumer, struct fwnode_handle *
>  			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) !=3D 0))
>  				continue;
> =20
> -			/* We've already done that on a previous request. */
> -			if (ref->lookup)
> -				return 0;
> -
> -			char *key __free(kfree) =3D
> -				kasprintf(GFP_KERNEL,
> -					  KBUILD_MODNAME ".proxy.%u",
> -					  ref->proxy_dev->id);
> -			if (!key)
> -				return -ENOMEM;
> -
> -			struct gpiod_lookup_table *lookup __free(kfree) =3D
> -				kzalloc_flex(*lookup, table, 2);
> -			if (!lookup)
> -				return -ENOMEM;
> -
> -			pr_debug("Adding machine lookup entry for a shared GPIO for consumer =
%s, with key '%s' and con_id '%s'\n",
> -				 dev_id, key, ref->con_id ?: "none");
> -
> -			lookup->dev_id =3D kstrdup(dev_id, GFP_KERNEL);
> -			if (!lookup->dev_id)
> -				return -ENOMEM;
> -
> -			lookup->table[0] =3D GPIO_LOOKUP(no_free_ptr(key), 0,
> -						       ref->con_id, lflags);
> -
> -			ref->lookup =3D no_free_ptr(lookup);
> -			gpiod_add_lookup_table(ref->lookup);
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

[Severity: High]
What happens in gpio_shared_get_proxy() if ref->proxy_fwnode is null when
passed to gpio_device_find_by_fwnode()?

In drivers/gpio/gpiolib.c, gpio_device_find_by_fwnode() uses
gpio_chip_match_by_fwnode():

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

When fwnode is null, both IS_ERR(fwnode) and device_match_fwnode(dev, fwnod=
e)
return 0, so the final check evaluates to:

	node && node->secondary =3D=3D NULL

This matches the first registered gpio_device that has a primary fwnode and
no secondary fwnode, causing gpio_shared_get_proxy() to return descriptor 0
of an unrelated controller instead of returning ERR_PTR(-EPROBE_DEFER).

Because gpio_shared_get_proxy() scans gpio_shared_list matching only
(consumer, fwnode, con_id) without checking that the entry matches the
descriptor or index returned by gpiod_fwnode_lookup(), this can be triggered
when a consumer has a multi-element GPIO property scanned by
gpio_shared_of_traverse(): if the second controller is registered while the
first controller in gpio_shared_list is not yet registered, requesting the
second GPIO matches the first entry where ref->proxy_fwnode is still null.

It can also happen if gpiod_find_and_request() resolves desc in
gpiod_fwnode_lookup() under gpio_devices_srcu while
gpio_device_teardown_shared() -> gpio_shared_remove_proxy_dev() clears
ref->proxy_fwnode.

Should gpio_shared_get_proxy() verify that the entry matches the looked-up
descriptor (or index) and check that ref->proxy_fwnode is non-null before
calling gpio_device_find_by_fwnode()?

>  		}
>  	}
> =20
>  	/* We warn here because this can only happen if the programmer borked. =
*/
>  	WARN_ON(1);
> -	return -ENOENT;
> +	return ERR_PTR(-ENOENT);
>  }
> =20
>  static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
>  {
>  	auxiliary_device_delete(ref->proxy_dev);
>  	auxiliary_device_uninit(ref->proxy_dev);
> +	software_node_unregister(&ref->proxy_swnode);
>  	ref->proxy_dev =3D NULL;
> +	ref->proxy_fwnode =3D NULL;
>  }

[Severity: High]
Could gpio_shared_remove_proxy_dev() race with concurrent readers of
ref->proxy_dev and ref->proxy_fwnode?

In struct gpio_shared_ref, ref->lock is documented as protecting proxy_dev
and proxy_fwnode, and both gpio_shared_make_proxy_dev() and
gpio_shared_get_proxy() acquire ref->lock.

However, gpio_shared_remove_proxy_dev() does not acquire ref->lock, and it
destroys ref->proxy_dev and unregisters ref->proxy_swnode (freeing the
backing swnode for ref->proxy_fwnode) before clearing ref->proxy_dev and
ref->proxy_fwnode.

Similarly, gpiochip_setup_shared() reads ref->proxy_dev without holding
ref->lock:

	list_for_each_entry(entry, &gpio_shared_list, list) {
		list_for_each_entry(ref, &entry->refs, list) {
			if (ref->proxy_dev && gdev->dev.parent =3D=3D &ref->proxy_dev->dev) {

This appears reachable in several ways:

1. In drivers/gpio/gpiolib.c:gpiochip_add_data_with_key(), if
gpiochip_setup_dev() fails after gcdev_register() has registered gdev->dev,
err_teardown_shared runs gpio_device_teardown_shared() ->
gpio_shared_remove_proxy_dev() before err_remove_from_list removes gdev from
gpio_devices and calls synchronize_srcu(&gpio_devices_srcu):

	if (gpiolib_initialized) {
		ret =3D gpiochip_setup_dev(gc);
		if (ret)
			goto err_teardown_shared;
	}

	return 0;

err_teardown_shared:
	gpio_device_teardown_shared(gdev);
...
err_remove_from_list:
	scoped_guard(mutex, &gpio_devices_lock)
		list_del_rcu(&gdev->list);
	synchronize_srcu(&gpio_devices_srcu);

2. A consumer with multiple shared GPIOs under the same con_id can call
gpio_shared_get_proxy() and visit an entry whose controller is concurrently
being torn down in gpiochip_remove().

3. Another GPIO chip can concurrently run gpiochip_setup_shared() while a
shared GPIO controller is being torn down or unwinding a failed setup.

Should gpio_shared_remove_proxy_dev() and gpiochip_setup_shared() guard
accesses to ref->proxy_dev and ref->proxy_fwnode with ref->lock, and clear
the pointers before releasing the underlying objects?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-gpio-share=
d-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com?part=3D5
