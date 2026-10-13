Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23D34EFFA3
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898315; cv=none; b=Pz6IudQwOoOn+hQvAwFl70sYqUxNeDtpyLH/djEnLmtoKXkPdwOv38BRiQimlVmjD+WOIXj7AJMEFVw5ylmfaTlx+c0vU2bvf+2QiQ/Qiau6GF4TxrfNCa/y42+8wGs+D3KFSFK7vF5iH0TPwNSx4JxW2a8jAQd7OAW7b8DiMU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898315; c=relaxed/simple;
	bh=wFNTQ2nZU4QtHU6goZz2SAYzf9BglrIMy6umwPUf+no=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JOEf9XdiZIwhoPdOK71ju0UnwtHrh65bFZMXuTT9elY2Pe/MNGBfbsFGzeJEFZcT3zjjNE8gvqLJdSSoz/pE6o70M09dmCs6jUy7XpZ6YclcRtB4MqaLuACxbmuqWlXj+a/CCeZrTMMXrkelC6Jaij2Lmlqe/JFvmPHlVPl8XrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4pBx1VF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4pBx1VF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E27A1F000FF;
	Tue, 13 Oct 2026 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898314;
	bh=RNsq8gmeEDqi+oHIeRIiruP67TLPE+IQSYMJq4kmA7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4pBx1VFMdv+8qRmtfWSTFTh78uCWXwJjxw5hU6DDG10M6KU3dkHYgKriyQwacEuQ
	 zYRROdhiG6oyNog1+QDVcOZ7yoZ0CTcePSwNXQ55j9nHh+nKYIazICJHkfO+OfkmvM
	 gb/wyCR8n1+B10jzMYjOwid3yvIgkJQDTWH+wvXVcPAfJn588QKqo2vMClL6B56BVp
	 cf3cA2cgLzbno7jHmy6OmdzOvtOspUBkcqSGUJusOixGQ/lgRUMiwG2ke/VzXjtghC
	 9PQGA+CfxXN28Lnl+8kZnc1MnHP2RF3o9VuJgsDzPUdInp1Z0LjMyomChNZjsIPZRV
	 YEI5gFF/bQwiQ==
Message-ID: <sashiko-outbox-169821@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] gpio: shared: detach the proxy device from
 struct gpio_shared_ref
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261013-gpio-shared-fwnode-lookup-v3-3-4553c1a7d80f@oss.qualcomm.com>
References: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
 <20261013-gpio-shared-fwnode-lookup-v3-3-4553c1a7d80f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:31:53 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] gpio: shared: race returns wrong GPIO desc on uninitialized pr=
oxy_fwnode
- [High] gpio: shared: teardown unconditionally dereferences NULL proxy_dev
- [High] gpio: shared: NULL pointer evaluation misidentifies virtual chips =
as proxies
- [Medium] gpio: shared: memory leak of dynamically allocated proxy devices=
 on error path
--

commit 5669c21b32e82fcb8daf60473942426be156bbb3
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: detach the proxy device from struct gpio_shared_ref

This commit moves the auxiliary device struct out of the shared reference
structure and dynamically allocates its memory during proxy setup. It also
renames the field to proxy_dev to better reflect its purpose.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 8c9ac9d933049..a57a2dd5ca00e 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
[ ... ]
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

[Severity: High]
Does this code crash if ref->proxy_dev is NULL?

If a shared GPIO entry has 1 or fewer consumers, gpiochip_setup_shared() sk=
ips
creating the proxy device, leaving ref->proxy_dev as NULL. Alternatively, i=
f a
GPIO controller probes before gpio_shared_init populates the list, proxy_dev
remains NULL. Later, when the controller is removed,
gpio_device_teardown_shared() unconditionally calls
gpio_shared_remove_proxy_dev().

Because dev is at offset 0 of struct auxiliary_device, &auxdev->dev evaluat=
es
to NULL, and device_del(NULL) dereferences NULL->parent, causing a panic.

> +	auxiliary_device_uninit(ref->proxy_dev);
> +	ref->proxy_dev =3D NULL;
>  }
> =20
>  int gpiochip_setup_shared(struct gpio_chip *gc)
> @@ -527,7 +539,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
> =20
>  	list_for_each_entry(entry, &gpio_shared_list, list) {
>  		list_for_each_entry(ref, &entry->refs, list) {
> -			if (gdev->dev.parent =3D=3D &ref->adev.dev) {
> +			if (gdev->dev.parent =3D=3D &ref->proxy_dev->dev) {

[Severity: High]
Can this evaluate to NULL =3D=3D NULL and incorrectly identify virtual cont=
rollers
as shared proxies?

Because ref->proxy_dev is initially NULL before setup, and dev is at offset=
 0,
&ref->proxy_dev->dev evaluates to NULL. If a virtual GPIO controller like
gpio-mockup or gpio-sim probes with no parent device, gdev->dev.parent is a=
lso
NULL. This early return would abort the actual shared setup.

>  				/*
>  				 * This is a shared GPIO proxy. Mark its
>  				 * descriptor as such and return here.
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
Does this leak memory and IDA identifiers if a subsequent consumer allocati=
on
fails?

If gpio_shared_make_proxy_dev() fails, the function immediately returns
without rolling back the dynamically allocated proxy devices from earlier
iterations in the loop. Also, in the caller gpiochip_add_data_with_key(),
a failure here jumps directly to err_remove_irqchip, bypassing
err_teardown_shared and permanently leaking the auxiliary devices.

[Severity: Critical]
Does setting the shared flag earlier in this function expose an uninitializ=
ed
proxy to concurrent consumers?

Since the provider is already on the gpio_devices list, setting
GPIOD_FLAG_SHARED before creating the proxy device can allow a concurrent
gpiod_get() to enter gpio_shared_get_proxy().

Because the proxy and its fwnode are not yet initialized, the consumer will
read NULL. It then calls gpio_device_find_by_fwnode(NULL). In
gpio_chip_match_by_fwnode(), the condition:
    return node && node->secondary =3D=3D fwnode;
evaluates to node->secondary =3D=3D NULL, incorrectly matching the first GP=
IO
controller in the system that has a primary fwnode but no secondary. This
could return an unrelated GPIO descriptor and cause cross-device hardware
corruption.

>  			}
> @@ -624,7 +636,7 @@ void gpio_device_teardown_shared(struct gpio_device *=
gdev)
>  				ref->lookup =3D NULL;
>  			}
> =20
> -			gpio_shared_remove_adev(&ref->adev);
> +			gpio_shared_remove_proxy_dev(ref);
>  		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gpio-share=
d-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com?part=3D3
