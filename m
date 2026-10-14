Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B384A4410
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971192; cv=none; b=RV0X2p16UOircMx5PIjKeSOceTZkE+dj/k11xYDJ8k7VDdZNdQtzKAyIxKXBp9tigoTzfn5OGJgmwf4ASPUod/IlyGfzv1F7ruDcaQGnY7IAgfqzUPJ23y5QJbyqVULtoGpbiksXKLK+a2bLRg8cERtDAT9DeAvj9FmX/mBthXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971192; c=relaxed/simple;
	bh=lsHV2FkFM3UjPl5COebP402WmtnDKTJS3X2M0aiK7tA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmbGXtDWocNciJgoQz/OHopNCLEcJOZ3kvmJ28b+NUHt54QWT5s/c0Q9ILQldw87reQEfxEzR9Ngt5WgmAN3BpUNNjQdtJUlX+BNtK5phONeQnaluyO8DiKEO+yfPX1v9ajrXV+WIosa9Uhp0O/kXvDHGNnXIkDj7n7wLcKoAjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orque59O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orque59O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86171F0089F
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971190;
	bh=UkDQoNAZ+TWdVlJmYJhp9PztI9hj/XGGAPlLvhBc8s0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=orque59OvbVzrlvPaLV3mFez09b8iVRZGLSE+uxU4+T9VhvGB6NpKjh+C0oT4T1Qd
	 cZg1YCdOL1txXvIXfr6pxjCA/qzHHzLXAi2bb0Q9r2Uac1zQ3uTwr4NgpWnOAhhmNN
	 c/FOZ7B48FKF9cBUBCKZfb4dAHt4rW6nB592hXhLY4oD3Z/V6MuCoBzbHamNWRURtP
	 AzU26FANtGOAe//2pvZEMTaEJf1sLq3CKATDp2N0XhQdSNtGpOhJS1cNcDwkySE6os
	 LPAimSpdpyNCnjTD3hJYmBJn4AFyQsVnAXgRNSf+qbkxV7G7tg1hu/853C60FsofDd
	 cACSFfD4i3GCQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so2992610e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 02:46:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBye29LdMbYMiaqSi8hGRS3HFKquVLG+4Jl2rahQkTbaxk7PyHgAs3D7dwKoRclsGhnQBb+ndZd07Ymz@vger.kernel.org
X-Gm-Message-State: AFq9FYJIR3EZDQIiqq1d0F4DQCAV7OLO3g9xpeHNfBsyX+QW/MmN325m
	M7t7ZtJ76B8x53/1SKfO2ypaZBwWHBfZ8G58oArlHOcrdU13v7sG9+bAaZbzWyVbDGNLtElrEvd
	4ZNgKlqzoMfG9wQeZDwhPM4v6fWClBsuxO7DOV3gAwg==
X-Received: by 2002:a2e:be03:0:b0:3a9:c416:8142 with SMTP id
 38308e7fff4ca-3a9c55dafebmr40112711fa.4.1791970759712; Wed, 14 Oct 2026
 02:39:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 02:39:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 02:39:18 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <sashiko-outbox-169813@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
 <20261013-gpio-shared-fwnode-lookup-v3-4-4553c1a7d80f@oss.qualcomm.com> <sashiko-outbox-169813@kernel.org>
Date: Wed, 14 Oct 2026 02:39:18 -0700
X-Gmail-Original-Message-ID: <CAMRc=McK=1bepdS+QEPARFm4hRxoqFExfAoj-UpHyLaFHkJJUw@mail.gmail.com>
X-Gm-Features: AclHuK-qHbPkaLE_EbBLaR4_g2nDrnf0UK414Ub6zhB4SKUx7Ba-GnL3rk62GPM
Message-ID: <CAMRc=McK=1bepdS+QEPARFm4hRxoqFExfAoj-UpHyLaFHkJJUw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 15:27:59 +0200, sashiko-bot@kernel.org said:
> Thank you for your contribution! Sashiko AI review found 7 potential issu=
e(s) to consider:
> - [High] gpio: gpiolib-shared: invalid argument passed to ida_free() caus=
ing ID leak
> - [High] gpio: proxy device and swnode leak on gpiochip_setup_shared() er=
ror
> - [High] gpio: gpiolib-shared: invalid ida_free and missing error rollbac=
k
> - [High] gpio: NULL fwnode in proxy lookup returns bogus device
> - [High] gpio: shared: unlocked proxy_fwnode modification causes wrong GP=
IO lookup
> - [Medium] gpio: gpiolib-shared: memory and ID leak when auxiliary_device=
_init() fails
> - [Medium] gpio: gpiolib-shared: software_node_fwnode() failure returns 0=
 (success)
> --
>
> commit bf7ac17bfe223ebd18a727bb416b2d9a07ea42a7
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> gpio: shared: convert to using software nodes for GPIO shared proxy looku=
p
>
> This commit reworks the GPIO sharing mechanism to use dummy software node=
s
> assigned to proxy devices instead of platform lookup tables. This allows =
finding
> the target GPIO device by its firmware node once the correct reference is=
 found.
>
>> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared=
.c
>> --- a/drivers/gpio/gpiolib-shared.c
>> +++ b/drivers/gpio/gpiolib-shared.c
>
> [ ... ]
>
>> @@ -313,38 +314,53 @@ static int gpio_shared_make_proxy_dev(struct gpio_=
device *gdev,
>>  				      struct gpio_shared_entry *entry,
>>  				      struct gpio_shared_ref *ref)
>>  {
>> +	struct software_node *swnode =3D &ref->proxy_swnode;
>>  	struct auxiliary_device *adev;
>> +	struct device *dev;
>>  	int ret, id;
>>
>>  	adev =3D kzalloc_obj(*adev);
>>  	if (!adev)
>>  		return -ENOMEM;
>>
>> +
>>  	id =3D ida_alloc(&gpio_shared_ida, GFP_KERNEL);
>>  	if (id < 0) {
>>  		kfree(adev);
>>  		return id;
>>  	}
>>
>> -	adev->id =3D id;
>> -	adev->name =3D "proxy";
>> -	adev->dev.parent =3D gdev->dev.parent;
>> -	adev->dev.platform_data =3D entry;
>> -	adev->dev.release =3D gpio_shared_proxy_dev_release;
>> -
>> -	ret =3D auxiliary_device_init(adev);
>> +	ret =3D software_node_register(swnode);
>>  	if (ret) {
>> -		ida_free(&gpio_shared_ida, id);
>> +		ida_free(&gpio_shared_ida, GFP_KERNEL);
>
> [Severity: High]
> Does this code leak the allocated IDA?
>
> It appears ida_free() is being called with the GFP_KERNEL constant instea=
d of
> the allocated id variable.
>
>>  		kfree(adev);
>>  		return ret;
>>  	}
>>
>> -	ret =3D auxiliary_device_add(adev);
>> -	if (ret) {
>> -		auxiliary_device_uninit(adev);
>> -		return ret;
>> +	ref->proxy_fwnode =3D software_node_fwnode(swnode);
>> +	if (!ref->proxy_fwnode) {
>> +		ida_free(&gpio_shared_ida, GFP_KERNEL);
>
> [Severity: High]
> Does this code also leak the IDA by passing GFP_KERNEL instead of id?
>
>> +		kfree(adev);
>> +		goto err_swnode_unreg;
>
> [Severity: Medium]
> Since ret is 0 from the preceding successful software_node_register() cal=
l,
> does this jump cause the function to return 0 (success) instead of an err=
or
> code while leaving ref->proxy_dev as NULL?
>
>>  	}
>>
>> +	dev =3D &adev->dev;
>> +	adev->id =3D id;
>> +	adev->name =3D "proxy";
>> +	dev->parent =3D gdev->dev.parent;
>> +	dev->platform_data =3D entry;
>> +	dev->release =3D gpio_shared_proxy_dev_release;
>> +
>> +	device_set_node(dev, software_node_fwnode(swnode));
>> +
>> +	ret =3D auxiliary_device_init(adev);
>> +	if (ret)
>> +		goto err_swnode_unreg;
>
> [Severity: Medium]
> If auxiliary_device_init() fails, does this code leak the allocated adev
> memory and the IDA? The err_swnode_unreg label unregisters the software n=
ode
> but does not free adev or call ida_free().
>
>> +
>> +	ret =3D auxiliary_device_add(adev);
>> +	if (ret)
>> +		goto err_dev_uninit;
>> +
>>  	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
>>  		 dev_name(&adev->dev), gpio_device_get_label(gdev));
>>
>> @@ -353,6 +369,13 @@ static int gpio_shared_make_proxy_dev(struct gpio_d=
evice *gdev,
>>  	}
>>
>>  	return 0;
>> +
>> +err_dev_uninit:
>> +	auxiliary_device_uninit(adev);
>> +err_swnode_unreg:
>> +	software_node_unregister(swnode);
>> +
>> +	return ret;
>>  }
>
> [Severity: High]
> Does this new software node registration cause a permanent leak if
> gpio_shared_make_proxy_dev() fails for a subsequent reference?
>
> In gpiochip_setup_shared():
>
>         list_for_each_entry(ref, &entry->refs, list) {
>             ret =3D gpio_shared_make_proxy_dev(gdev, entry, ref);
>             if (ret) {
>                 gpiod_free_commit(desc);
>                 return ret;
>             }
>         }
>
> If an error occurs midway, the function returns immediately without rolli=
ng
> back the proxy devices and software nodes registered for previous referen=
ces.
> The caller then jumps to err_remove_irqchip, completely bypassing the tea=
rdown
> path. This permanently leaks the successfully registered software nodes a=
nd
> ensures that future attempts to probe this controller will fail with -EEX=
IST.
>

This is currently handled in GPIO core by calling gpio_teardown_shared() on
failure.

> [ ... ]
>
>> @@ -484,49 +503,22 @@ int gpio_shared_add_proxy_lookup(struct device *co=
nsumer, struct fwnode_handle *
>>  			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) !=3D 0))
>>  				continue;
>>
>> -			/* We've already done that on a previous request. */
>> -			if (ref->lookup)
>> -				return 0;
>> -
>> -			char *key __free(kfree) =3D
>> -				kasprintf(GFP_KERNEL,
>> -					  KBUILD_MODNAME ".proxy.%u",
>> -					  ref->proxy_dev->id);
>> -			if (!key)
>> -				return -ENOMEM;
>> -
>> -			struct gpiod_lookup_table *lookup __free(kfree) =3D
>> -				kzalloc_flex(*lookup, table, 2);
>> -			if (!lookup)
>> -				return -ENOMEM;
>> -
>> -			pr_debug("Adding machine lookup entry for a shared GPIO for consumer=
 %s, with key '%s' and con_id '%s'\n",
>> -				 dev_id, key, ref->con_id ?: "none");
>> -
>> -			lookup->dev_id =3D kstrdup(dev_id, GFP_KERNEL);
>> -			if (!lookup->dev_id)
>> -				return -ENOMEM;
>> -
>> -			lookup->table[0] =3D GPIO_LOOKUP(no_free_ptr(key), 0,
>> -						       ref->con_id, lflags);
>> -
>> -			ref->lookup =3D no_free_ptr(lookup);
>> -			gpiod_add_lookup_table(ref->lookup);
>> +			struct gpio_device *gdev __free(gpio_device_put) =3D
>> +					gpio_device_find_by_fwnode(ref->proxy_fwnode);
>
> [Severity: High]
> Is it possible for a concurrent consumer to enter this lookup while
> gpiochip_setup_shared() is still initializing the proxy devices?
>
> In gpiochip_setup_shared(), the GPIOD_FLAG_SHARED bit is set before calli=
ng
> gpio_shared_make_proxy_dev(). A concurrent consumer requesting a shared G=
PIO
> might see the shared flag and call gpio_shared_get_proxy() while
> ref->proxy_fwnode is still NULL.
>
> If gpio_device_find_by_fwnode() is called with a NULL fwnode, it seems to
> fallback to evaluating node && node->secondary =3D=3D NULL in
> gpio_chip_match_by_fwnode(). This could return the first GPIO device in t=
he
> system lacking a secondary fwnode, providing an unrelated GPIO descriptor=
 to
> the consumer.
>

Pre-existing, added to DODO.

>> +			if (!gdev)
>> +				/*
>> +				 * A matching entry is there but the associated
>> +				 * controller has not been registered yet.
>> +				 */
>> +				return ERR_PTR(-EPROBE_DEFER);
>>
>> -			return 0;
>> +			return gpio_device_get_desc(gdev, 0);
>>  		}
>>  	}
>
> [ ... ]
>
>> @@ -628,15 +620,11 @@ void gpio_device_teardown_shared(struct gpio_devic=
e *gdev)
>>  			gpiod_free_commit(&gdev->descs[entry->offset]);
>>
>>  		list_for_each_entry(ref, &entry->refs, list) {
>> -			if (ref->lookup) {
>> -				gpiod_remove_lookup_table(ref->lookup);
>> -				kfree(ref->lookup->table[0].key);
>> -				kfree(ref->lookup->dev_id);
>> -				kfree(ref->lookup);
>> -				ref->lookup =3D NULL;
>> -			}
>> -
>> -			gpio_shared_remove_proxy_dev(ref);
>> +			auxiliary_device_delete(ref->proxy_dev);
>> +			auxiliary_device_uninit(ref->proxy_dev);
>> +			software_node_unregister(&ref->proxy_swnode);
>> +			ref->proxy_dev =3D NULL;
>> +			ref->proxy_fwnode =3D NULL;
>>  		}
>>  	}
>>  }
>
> [Severity: High]
> Does modifying ref->proxy_fwnode here without holding ref->lock introduce=
 a
> data race?
>
> A concurrent reader iterating the global gpio_shared_list in
> gpio_shared_get_proxy() could read a NULL ref->proxy_fwnode if it encount=
ers
> a reference currently being torn down. As noted above, looking up a NULL
> fwnode might return an entirely unrelated GPIO controller descriptor.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gpio-sha=
red-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com?part=3D4
>
>

No, we can't get here concurrently as the device has already been neutered =
on
gpiochip_remove().

Bart
