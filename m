Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200238;
	b=ZJLEb6sqSPjZey8hFAWt5p8mmbmSo5RBmCSQx1dpgoIwxd6lW+5YavJedUvE5dBqPuBa
	 wjulnhshy8/rFL2OxPtgb/20xHvamfIobzPmPrl/qUr6B3N7iHimJe8lGGmpWsdc4fXu4
	 eZBR7FDjxFJ83X0Ko5xgJzFOjD5qE3iBe3vA0PmaGLp0Z9mzeWtEqBasS+RF39ytRL6Re
	 o/8z4Hv/dSCbr1h0XeBhmhTOdCO5LDxPAiy3/W7tLyL2lwunUzGA4DH94xeCVOObkBmA+
	 ZYSZh14toUHioNVAe1OsvF6nsjhzjE4jFNYtKvH2PdWpgH/BZ2MfC6Rpm+Xht+iYETg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200238;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6t9K1JNrCXKFJA/OsqVCR/X3akEz1b2d1qj0DHUwW6k=;
	b=ArgwXKJuLixVROlZmceLprWcXLY3KyaNEkU2oWwxPFK3nJONvDgzQOHtq5OSND2Dzx7/
	 p+UuvAE8U1Zp1lhmO7YR8+R2EAzpZQD40tEFbmhBi6F4c6cO74ak3RNAEdg8oLhJgGaoo
	 AiKa0Mc4P8RNoBCDbLYRpiVCohpkLOalyirTG+pe7ooLe74NhDrCVcIpmKE+h3XnFe+Sw
	 ImNgz9I6N4ok1o1k5Lht9xGZgy2lynHx604UKKPUaJbp09Liqj8jeoHalxrWBkgckptbV
	 fIz3q6PZMPg4wOd1Kdc5OuwVIe8Vuan7AILbpF4X/shGHvicK+3Sm1nB7+9bN9cHFgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mADB6hVf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B4606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mADB6hVf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51571F01825;
	Wed, 28 Oct 2026 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793200238;
	bh=6t9K1JNrCXKFJA/OsqVCR/X3akEz1b2d1qj0DHUwW6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mADB6hVffC5bE5fXWM0e/NoDk0OX1pdAA0U3diu9MjHHtzFQdxmTgsML7uMy13elQ
	 qn5OvqMRWYKc7ZMUZrciXF4xZGe8DkUluMT1h8jUHSH+96jmLsL7nNh5NxlALniKH4
	 V6AjQn/48J8u3N+EtqbGrNUqJRRZWy6VxJ28eeGKmTkdrdNGhGkpDC2BuEqkA03PNU
	 bexaSBczFjZfVOxOIdxCG/2TH3djclSPjbEq5+d5u6lmI4bQzhI1saGjlD/9xfG6m5
	 osHQhaVdOKrmWIMIjeQ8J91QvrhWSIMo4tBi7DswDlsJn+AsMFOPW1zgFlMalmv6Qs
	 5HD3JJlT6XfaA==
Message-ID: <sashiko-outbox-188040@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/5] gpio: shared: convert to using software nodes
 for GPIO shared proxy lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-5-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
 <20261028-gpio-shared-fwnode-lookup-v7-5-acb453b6fbd5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:10:37 +0000
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
- [High] gpio: shared: use-after-free in gpio_shared_remove_proxy_dev() on =
swnode teardown
--

commit 8040c150f4a36d793af070d87bfa19010fce092d
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: convert to using software nodes for GPIO shared proxy lookup

This commit replaces platform lookup tables for shared GPIO proxy devices
with dummy software nodes assigned to the proxy auxiliary devices. This
allows looking up the target proxy GPIO device by its firmware node even
when no consumer struct device is present.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index c0e2a1207cccf..4f5ecdfcc63ac 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c

[ ... ]

> @@ -529,6 +540,8 @@ static void gpio_shared_remove_proxy_dev(struct gpio_=
shared_ref *ref)
>  	scoped_guard(mutex, &ref->lock) {
>  		proxy =3D ref->proxy_dev;
>  		ref->proxy_dev =3D NULL;
> +		software_node_unregister(&ref->proxy_swnode);
> +		ref->proxy_fwnode =3D NULL;
>  	}

[Severity: High]
Does unregistering ref->proxy_swnode before deleting the proxy auxiliary
device cause a use-after-free of the struct swnode during device removal?

In gpio_shared_make_proxy_dev(), software_node_register() allocates the
struct swnode with an initial reference count of 1 (and swnode->managed
set to false), and device_set_node() attaches its fwnode to adev->dev.
When auxiliary_device_add() registers adev->dev (and when the proxy driver
registers its gpio_device), software_node_notify() increments the swnode
reference count for each device.

In gpio_shared_remove_proxy_dev(), calling software_node_unregister()
before auxiliary_device_delete(proxy) drops the initial creation reference
while proxy->dev is still registered:

gpio_shared_remove_proxy_dev()
  software_node_unregister(&ref->proxy_swnode) -> drops initial ref
  auxiliary_device_delete(proxy)
    device_del(&proxy->dev)
      device_platform_notify_remove(&proxy->dev)
        software_node_notify_remove(&proxy->dev)

When software_node_notify_remove() runs in drivers/base/swnode.c,
swnode_put() drops the last remaining reference and frees the struct
swnode, and then immediately reads from the freed structure:

	swnode_put(swnode);

	if (swnode->managed) {
		set_secondary_fwnode(dev, NULL);
		swnode_put(swnode);
	}

In addition, because swnode->managed is false, proxy->dev.fwnode is not
cleared, so acpi_device_notify_remove() in device_platform_notify_remove()
immediately dereferences dev->fwnode->ops on the freed swnode.

Should software_node_unregister(&ref->proxy_swnode) be called after
auxiliary_device_delete(proxy) and auxiliary_device_uninit(proxy) (or with
device_set_node(&proxy->dev, NULL) before unregistering), matching the
error unwind order in gpio_shared_make_proxy_dev()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-gpio-share=
d-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com?part=3D5
