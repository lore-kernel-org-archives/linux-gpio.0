Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08A54BE43C;
	Mon, 12 Oct 2026 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827632; cv=none; b=upQZI3Nl0vFm63eyIpqxrp9TyLdZY7e6JYAmncO/jaDZDWX6+c+hkihJ7Mvg9g9s+lZ/+cwOTZzu85jdikr6RTfG7Oo8GdwUtcET6msL0P6F2RE4W8H6YQ+tKoMietOYSgiBl6UCSSk80bsLjCPmcTNjAb2bblvSS6K8IVxJ6dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827632; c=relaxed/simple;
	bh=1o1LPZO/w9z9Pcz+eTlh4NL4KqhNxq8a1W0kA8SSiGU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fjG1tMfydSu4X8Ijjj07yr7iuFX1kM36p7N+N3r2ikchbZeRZi+sEjDHagfEIrJwJzY1QO3KoI8iDEd6dDsOpJWovk6NPc3qVwvyAYCQ5UlEumISywCvD/F+xgunbt4vFhmgK1TBShncVx0qIM5xtEJzYzsCXAUkXouqJe2Bp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeLgJMhn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeLgJMhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6141F0089B;
	Mon, 12 Oct 2026 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827631;
	bh=O9H6Dybojv7962kPuHVGzyFkL2J+y84pJdoL1zVLmKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PeLgJMhn8Q+nMpOL++rz3IKmUbNl2TZ02Lane9JO7K8AoAdJvSsvCKTeGnSq/1C5T
	 35TIP/SCwUUocL6vq2QWPjF6f+TidgWEn04NHOsHv0dXoZVji6s0nmi8h+AY5ldXKo
	 1LxxsaLRnWPLtJgE1bfoBo5/60/HCR5ZtIFq8kA+yrZhijUhmbY+iuABGK/HY0I6O5
	 v9j4ic+Xr2bMMUAQL7LESnYOieEaimMVWHRihYwPv7nrtbgwh0DBScIaDwkgwhZqZO
	 2nJgIQanCgnWcls68Pi95VoehUwDVxTI9xAN8LSa+JKZvxkS9Vw4sZsq8aoqa+zDXU
	 N+L4Q99gCSm5w==
Message-ID: <sashiko-outbox-168501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/11] gpio: Add NVIDIA LSTP GPIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-6-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-6-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:53:50 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] core: module unload race in lstp_gpio_leds_release() waking module=
_exit
--

commit 4aeddbd8eb4f935f2de9273a79a09c2407988002
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

gpio: Add NVIDIA LSTP GPIO driver

Add a driver for the GPIO channels of NVIDIA LSTP USB adapters. Each
channel is registered as a GPIO chip with an interrupt controller for
its pins. Pins the firmware reports as LEDs are handed to the LED driver
as an auxiliary device.

> diff --git a/drivers/gpio/gpio-lstp.c b/drivers/gpio/gpio-lstp.c
> new file mode 100644
> index 0000000000000..cc988a09582b0
> --- /dev/null
> +++ b/drivers/gpio/gpio-lstp.c
[ ... ]
> +static void lstp_gpio_leds_release(struct device *dev)
> +{
> +	struct lstp_leds *leds =3D container_of(to_auxiliary_dev(dev), struct l=
stp_leds, auxdev);
> +	struct device *parent =3D leds->ch->dev;
> +
> +	kfree(leds);
> +	put_device(parent);
> +	if (atomic_dec_and_test(&lstp_gpio_live_leds))
> +		wake_up_var(&lstp_gpio_live_leds);
> +}

[Severity: High]
Does this create a module unload race condition?

If a user-space process holds an active sysfs reference to the LED auxiliary
device, the device release callback is delayed until userspace drops its
reference (for example, closing a file descriptor). By this time, the rmmod
command could be executing and waiting in lstp_gpio_module_exit().

When lstp_gpio_leds_release() wakes up the module_exit waiter, the rmmod
thread finishes and the kernel unmaps the module's text memory. However, the
thread running the release callback is still executing the epilogue of
lstp_gpio_leds_release(), which resides in this module.

Returning to unmapped memory causes a kernel panic. A device release functi=
on
must not wake the module_exit thread that unloads its own code.

[ ... ]
> +/* The unregister unbinds every channel, which deletes its LED child. */
> +static void __exit lstp_gpio_module_exit(void)
> +{
> +	lstp_auxiliary_driver_unregister(&lstp_gpio_drv);
> +	wait_var_event(&lstp_gpio_live_leds, !atomic_read(&lstp_gpio_live_leds)=
);
> +}
> +module_exit(lstp_gpio_module_exit);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D6
