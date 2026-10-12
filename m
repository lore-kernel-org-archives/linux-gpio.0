Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83D427F8F
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813900; cv=none; b=uyNO2Wic6vlQFfU+1RB/PbDGIuhhBoo1Gdw/C5+JgjQ6eEcRrA+O413S/0rZo6lsw1L3R+UnxcaVRosoRlKYOvNaeQo2brFshgEpO1La92fJQAk+CSHJDqrypVXLexsthLGbv4QLrkrFuZfphxsmecZZ62z1HRKzQGG7+rw9508=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813900; c=relaxed/simple;
	bh=IVoNCwbYtbdqmJLmWqe5qBJX0eNW3dKjABPVvJ3fUhY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qQXqnOMqlu2VhA/BVcdIY9m7YCQowW3FnxsUfTG2aOwy1BWqQmqVdsBr5FC5ktbbBWBZGi31rnUVCb8W+BKcw9H57TjC0FN2a9QmH1P5xC2iBtNwu90Y0ttPqOTHpmCHJ9jrFlDPAnwReY69HOglrQO7xH5T46CaL9l2UbKbi/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIxVcK0D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIxVcK0D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21291F0089B;
	Mon, 12 Oct 2026 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791813898;
	bh=jNXURkhCMcrG3DwV1rJz2E5f2SoTWunwuDmfYC1uuwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XIxVcK0DeFj64tHThNF4Tcw1TAHJjv3HhTve+/GmVHa1fknV9txhgUYurWroZrtxU
	 nfOSYJGLe/SOoFgXnzGxfl+1YjdXAfjYnbvdUtsji5A4bPcWB8l8dRme1lY/70jTKd
	 uXE2Y5A/kGsHwRe8wn0s8lYTRybcSzi+zMVCMFTVI/4cU21ZPIt61UFbsiFfGGNG4E
	 n1AcQak5nIUuyoNdNFFC9pxa8Sc7F1zCr9aXRp1+AsD+9VqRzSeA5aQhztzPJ0XZie
	 JBhq21ABZItpQvCziCSeVXkLiQ+iVT7OIMgrjI/vrODggdhvKlmRZvPYY6Eq3HvseF
	 KcVdk+Fz4m2iw==
Message-ID: <sashiko-outbox-168233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver
 refused
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 14:04:58 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: memory leak in gpiod_set_array_value_complex() on error paths
- [High] gpio: non-atomic desc->flags update clobbers concurrent IRQ flags
--

commit 910242af9150f094f4676cb26fb8b58cc8edfa96
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

gpiolib: cdev: don't record a line direction the driver refused

The commit modifies gpio_v2_line_config_flags_to_desc_flags() to avoid sett=
ing
the GPIOD_FLAG_IS_OUT flag before the hardware direction is confirmed by the
driver. This fixes an issue where refused configurations would leave the li=
ne
erroneously reported as an output or input.

> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 5d53bfcdf7268..9bbee3a1f9c9c 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1226,14 +1226,13 @@ static void gpio_v2_line_config_flags_to_desc_fla=
gs(u64 lflags,
>  {
>  	unsigned long flags =3D READ_ONCE(*flagsp);

[Severity: High]
Does this non-atomic read-modify-write clobber concurrent atomic updates to
desc->flags made by the IRQ subsystem?

If a driver or IRQ domain calls gpiochip_lock_as_irq() or
gpiochip_enable_irq() concurrently, they atomically update bits like
GPIOD_FLAG_USED_AS_IRQ:

	set_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
	set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);

Because the IRQ subsystem does not check GPIOD_FLAG_REQUESTED before using
the line and does not share locks with the cdev ioctl, these atomic updates
can happen between this READ_ONCE() and the subsequent
WRITE_ONCE(*flagsp, flags) at the end of this function.

Wouldn't the atomic updates be silently overwritten when this function writ=
es
back the stale flags value?

Losing these flags disables the safety check in
gpiod_direction_output_nonotify(), which could allow user-space to force an
active interrupt line into output mode.

> =20
> +	/*
> +	 * GPIOD_FLAG_IS_OUT is left to gpiod_direction_input/output(), which
> +	 * only update it once the chip has accepted the direction.
> +	 */
>  	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
>  		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
> =20
> -	if (lflags & GPIO_V2_LINE_FLAG_OUTPUT)
> -		set_bit(GPIOD_FLAG_IS_OUT, &flags);
> -	else if (lflags & GPIO_V2_LINE_FLAG_INPUT)
> -		clear_bit(GPIOD_FLAG_IS_OUT, &flags);
> -

[Severity: High]
By leaving GPIOD_FLAG_IS_OUT unset when a driver refuses the output directi=
on,
does this create a memory leak in gpiod_set_array_value_complex() when
user-space subsequently calls GPIO_V2_LINE_SET_VALUES_IOCTL?

Looking at gpiod_set_array_value_complex() in drivers/gpio/gpiolib.c, mask
and bits can be dynamically allocated with bitmap_alloc() for large GPIO
chips:

			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
				return -EPERM;

If a descriptor is not configured as an output, the function immediately
returns -EPERM.=20

Doesn't this bypass the bitmap_free() calls at the end of the function and
leak mask and bits?

The same direct return leak appears to occur if the driver's set_multiple
callback fails:

		if (count !=3D 0) {
			ret =3D gpiochip_set_multiple(guard.gc, mask, bits);
			if (ret)
				return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-gpiolib-cd=
ev-direction-v1-1-aambrozewicz@nvidia.com?part=3D1
