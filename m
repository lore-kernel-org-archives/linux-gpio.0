Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF3830BB8A
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972108; cv=none; b=oa3yTqfpU5JU7yT/bxtThEk4jlsoS/oWAZYtHflobae2uC92UZGU/aIo4Um84rDvp74ij6jJbnKMzdvePQ49ONrbsYeDHCxFc1jVdAnrIM5suHq0tMq7xGglgpHTlsq9QtoGFt0sE+AhNDUVeDxrOFUQ6Q8x4QDISSvhsOOKfhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972108; c=relaxed/simple;
	bh=chC7yJ3t/3LDriSLRM9gX8sdZAQ6+V2ug7cNrqhOAJc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XzWZ7HnLWHaGYRkraGaukIJVMlVItWpR2n/bg1rdn0UFvIPcUTfWMkxc8+xu9YBei9t4GO2caK9O357KLtzfm6l4ELnx8VizIaEG7Hj1DExfTsHvRr7Uzg9Ho44dVnENVkKQrhI57Yp8lzoW82SPckhWm++/1lPK2KvhXaaP6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouPo0EJF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouPo0EJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D398E1F000FF;
	Wed, 14 Oct 2026 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791972107;
	bh=vtrYbFHU/OIri90dyL+kabcdFBgqqF/SdtmvdDsA0rk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ouPo0EJF2oNz0H2iT/laku8SQQnxceZhh/1GQ1eKJRoU7iHB5EMq5wHo/DuFsbh17
	 3DXUsosKvwpgUxfQNyeQJYKih1HxFW6HBiBkMSwZZhRIl+/y1HsZjL8Zrp357gVUFC
	 ZfUOH7iXNQe1UpdFHaK0oPBOLU5HLnt7ggXqXSbgexyvucWfpzLaViYgR3Mx8F00iQ
	 fPc8hTA+W48ecxjsuD6ao2fuYGFHIL2Tnyq3sgyYOHIRQhtq4q18uX6qubpoQQa+Rf
	 EI/EGaKd0FCbok/nz6PaQZnX6SnU04FT/CWaEtRsjmV3pxyEQ+Fcys3CNXyGJt3dO5
	 7WDh9Ev0dlzFg==
Message-ID: <sashiko-outbox-171116@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] gpio: shared: detach the proxy device from
 struct gpio_shared_ref
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261014-gpio-shared-fwnode-lookup-v4-3-2253ad645fd6@oss.qualcomm.com>
References: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
 <20261014-gpio-shared-fwnode-lookup-v4-3-2253ad645fd6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:01:46 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] gpiolib: logic bug and UB falsely matching parentless chips as sha=
red proxies
- [High] gpio: NULL pointer dereference in teardown of early-probed shared =
GPIOs
- [High] gpio: proxy devices and descriptors leak on setup error path
- [Medium] gpiolib: memory and IDA leak on shared proxy setup failure
--

commit f0939e1241bcddbe2c589891db8c55a92fef6474
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: detach the proxy device from struct gpio_shared_ref

This commit moves the auxiliary device struct out of the shared reference
structure and allocates its memory separately on proxy setup to prevent
memory corruption if references outlive the parent's teardown.

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
> +	auxiliary_device_uninit(ref->proxy_dev);
> +	ref->proxy_dev =3D NULL;
>  }

[Severity: High]
If a GPIO controller containing shared GPIOs is probed early, its proxy
devices might never be created, leaving ref->proxy_dev as NULL.

If the controller is later removed, gpio_device_teardown_shared() will call
gpio_shared_remove_proxy_dev(), which unconditionally passes this NULL
pointer to auxiliary_device_delete() and auxiliary_device_uninit().

Will this result in a kernel panic when the driver core attempts to
dereference the NULL proxy_dev?

> =20
>  int gpiochip_setup_shared(struct gpio_chip *gc)
> @@ -527,7 +539,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
> =20
>  	list_for_each_entry(entry, &gpio_shared_list, list) {
>  		list_for_each_entry(ref, &entry->refs, list) {
> -			if (gdev->dev.parent =3D=3D &ref->adev.dev) {
> +			if (gdev->dev.parent =3D=3D &ref->proxy_dev->dev) {

[Severity: High]
Before a proxy is instantiated, ref->proxy_dev is NULL, meaning
&ref->proxy_dev->dev will evaluate to NULL.

If a newly registered GPIO controller has no parent device (such as virtual
controllers like gpio-mockup or gpio-sim), gdev->dev.parent is also NULL.

Does this cause the condition to falsely evaluate to true (NULL =3D=3D NULL)
and erroneously identify generic controllers as shared proxies, breaking
their setup?

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

[Severity: High]
If gpio_shared_make_proxy_dev() fails and returns an error, the function
returns immediately without unwinding any proxy devices that were
successfully created during previous iterations of the loop.

Additionally, in the caller gpiochip_add_data_with_key(), the error path
jumps to err_remove_irqchip, bypassing err_teardown_shared.

Are the successfully registered auxiliary devices, their kzalloc'd memory,
allocated IDA slots, and committed GPIO descriptors permanently leaked on
this error path?

>  			}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-gpio-share=
d-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com?part=3D3
