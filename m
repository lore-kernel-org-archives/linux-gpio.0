Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425344FD789
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898081; cv=none; b=SWI+5iu/nxnrFk/FcoKx+hhni6WGndAhSaMivUrIUmjau3gIbFgek/anRufzydzLDxZT+66LDZmE4KAZyHzyJE5oF7MlEWaT1asz7Yh3se+ppM7eun+/p/OtQ8ZeA/Ap0lZVcCZ6HaqfPMkGOAvgayz8CFLr+12FlS/QjqDCLkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898081; c=relaxed/simple;
	bh=k3z71n1GIX6AI1MTLWv5HT0WiEyhmwQwU26MdiE4FC4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KJ1jLZicyVpzF00fT6sseZlBeKLqpWyeQUZaqh7fT3yaNO/ks6Be0pS5w1QTjvZEySg1BdvfsaVlpACC8DyIyc/G+2YbQquMA9+ubE7EP8OphnSIVYpKcJ7YwshfTWa592RWs+9ABcxaoqJbOWIScnBCVrJSHTTzo4RmIvRtZ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hm+d6W62; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hm+d6W62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C391F00893;
	Tue, 13 Oct 2026 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898080;
	bh=27SeKWiC97Sq9OnVeyaRQGiwdAHErUTjmYBszeJmUdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hm+d6W62kHFkim7AIdxEHQgbJJeOA9aroOHmsyOimd9hE/vFaJmoE5GHwJ8IxHu0J
	 alVngeVwnUu6rYaoJFC1pdNFCBjEiXmxBO2VtM//l1gsOJxghJ/ZcO8NaOMvbp+EjD
	 J/z05jK0Vcd3YOJ6oEx+NBG700bvC9urD5Hjb+gcg7+N10K4QWizxbPcdFDWvXZUOf
	 mQlz9R5nK4j+FnU+cLrogrl1w03PVD9ZZ8OaU0H4eQoVajkrSyADuGz7FDuA0QNl7C
	 4b9A+CIxrLXh9gQColnrsr8Iva8jIZAsZyEy0vuYGKl2SygRtvUn2eOFA4gHMW7w1t
	 CzqNcT2npTORw==
Message-ID: <sashiko-outbox-169813@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] gpio: shared: convert to using software nodes
 for GPIO shared proxy lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261013-gpio-shared-fwnode-lookup-v3-4-4553c1a7d80f@oss.qualcomm.com>
References: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
 <20261013-gpio-shared-fwnode-lookup-v3-4-4553c1a7d80f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:27:59 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] gpio: gpiolib-shared: invalid argument passed to ida_free() causin=
g ID leak
- [High] gpio: proxy device and swnode leak on gpiochip_setup_shared() error
- [High] gpio: gpiolib-shared: invalid ida_free and missing error rollback
- [High] gpio: NULL fwnode in proxy lookup returns bogus device
- [High] gpio: shared: unlocked proxy_fwnode modification causes wrong GPIO=
 lookup
- [Medium] gpio: gpiolib-shared: memory and ID leak when auxiliary_device_i=
nit() fails
- [Medium] gpio: gpiolib-shared: software_node_fwnode() failure returns 0 (=
success)
--

commit bf7ac17bfe223ebd18a727bb416b2d9a07ea42a7
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: convert to using software nodes for GPIO shared proxy lookup
   =20
This commit reworks the GPIO sharing mechanism to use dummy software nodes
assigned to proxy devices instead of platform lookup tables. This allows fi=
nding
the target GPIO device by its firmware node once the correct reference is f=
ound.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c

[ ... ]

> @@ -313,38 +314,53 @@ static int gpio_shared_make_proxy_dev(struct gpio_d=
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
> -	adev->id =3D id;
> -	adev->name =3D "proxy";
> -	adev->dev.parent =3D gdev->dev.parent;
> -	adev->dev.platform_data =3D entry;
> -	adev->dev.release =3D gpio_shared_proxy_dev_release;
> -
> -	ret =3D auxiliary_device_init(adev);
> +	ret =3D software_node_register(swnode);
>  	if (ret) {
> -		ida_free(&gpio_shared_ida, id);
> +		ida_free(&gpio_shared_ida, GFP_KERNEL);

[Severity: High]
Does this code leak the allocated IDA?

It appears ida_free() is being called with the GFP_KERNEL constant instead =
of
the allocated id variable.

>  		kfree(adev);
>  		return ret;
>  	}
> =20
> -	ret =3D auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> +	ref->proxy_fwnode =3D software_node_fwnode(swnode);
> +	if (!ref->proxy_fwnode) {
> +		ida_free(&gpio_shared_ida, GFP_KERNEL);

[Severity: High]
Does this code also leak the IDA by passing GFP_KERNEL instead of id?

> +		kfree(adev);
> +		goto err_swnode_unreg;

[Severity: Medium]
Since ret is 0 from the preceding successful software_node_register() call,
does this jump cause the function to return 0 (success) instead of an error
code while leaving ref->proxy_dev as NULL?

>  	}
> =20
> +	dev =3D &adev->dev;
> +	adev->id =3D id;
> +	adev->name =3D "proxy";
> +	dev->parent =3D gdev->dev.parent;
> +	dev->platform_data =3D entry;
> +	dev->release =3D gpio_shared_proxy_dev_release;
> +
> +	device_set_node(dev, software_node_fwnode(swnode));
> +
> +	ret =3D auxiliary_device_init(adev);
> +	if (ret)
> +		goto err_swnode_unreg;

[Severity: Medium]
If auxiliary_device_init() fails, does this code leak the allocated adev
memory and the IDA? The err_swnode_unreg label unregisters the software node
but does not free adev or call ida_free().

> +
> +	ret =3D auxiliary_device_add(adev);
> +	if (ret)
> +		goto err_dev_uninit;
> +
>  	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
>  		 dev_name(&adev->dev), gpio_device_get_label(gdev));
> =20
> @@ -353,6 +369,13 @@ static int gpio_shared_make_proxy_dev(struct gpio_de=
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
>  }

[Severity: High]
Does this new software node registration cause a permanent leak if
gpio_shared_make_proxy_dev() fails for a subsequent reference?

In gpiochip_setup_shared():

        list_for_each_entry(ref, &entry->refs, list) {
            ret =3D gpio_shared_make_proxy_dev(gdev, entry, ref);
            if (ret) {
                gpiod_free_commit(desc);
                return ret;
            }
        }

If an error occurs midway, the function returns immediately without rolling
back the proxy devices and software nodes registered for previous reference=
s.
The caller then jumps to err_remove_irqchip, completely bypassing the teard=
own
path. This permanently leaks the successfully registered software nodes and
ensures that future attempts to probe this controller will fail with -EEXIS=
T.

[ ... ]

> @@ -484,49 +503,22 @@ int gpio_shared_add_proxy_lookup(struct device *con=
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

[Severity: High]
Is it possible for a concurrent consumer to enter this lookup while
gpiochip_setup_shared() is still initializing the proxy devices?

In gpiochip_setup_shared(), the GPIOD_FLAG_SHARED bit is set before calling
gpio_shared_make_proxy_dev(). A concurrent consumer requesting a shared GPIO
might see the shared flag and call gpio_shared_get_proxy() while
ref->proxy_fwnode is still NULL.

If gpio_device_find_by_fwnode() is called with a NULL fwnode, it seems to
fallback to evaluating node && node->secondary =3D=3D NULL in
gpio_chip_match_by_fwnode(). This could return the first GPIO device in the
system lacking a secondary fwnode, providing an unrelated GPIO descriptor to
the consumer.

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

[ ... ]

> @@ -628,15 +620,11 @@ void gpio_device_teardown_shared(struct gpio_device=
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
Does modifying ref->proxy_fwnode here without holding ref->lock introduce a
data race?

A concurrent reader iterating the global gpio_shared_list in
gpio_shared_get_proxy() could read a NULL ref->proxy_fwnode if it encounters
a reference currently being torn down. As noted above, looking up a NULL
fwnode might return an entirely unrelated GPIO controller descriptor.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gpio-share=
d-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com?part=3D4
