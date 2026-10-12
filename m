Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FE941F5C7
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813950; cv=none; b=d5sXjFS5yLYJLyT931BgzPmRE7hoUvAVCl3/av41eNvIJ2w7yjYHqAjeTBEJXf7P9eVsk0aZfFjk7MX1Slr8ZquBRn0fWqpHC8bRZYoraFlEZjmmKaOIHQuazaNIYaUDDMSzIS2cRYXX6eYwpi0VnHbVAa62QGhGZOYUcVHAvws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813950; c=relaxed/simple;
	bh=gNUGSSztcHeUx1zrlUBucf+1oBoV8oVVYShW6mTlq4s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mw/Yo0kXZ3c4E9PLKzEfeuugXGIlFEjV49NBFewVii6bVhDYkG7//CCuQk35BNaaTL6pkIzxwbIt4FYPKEGJm4eRCo3b2N4Uda+DR2pzgbJb9tM7lSLrT0Sc6w3Suu0mYIrSFRPm5cdjxn+U4xk7hjl210ELT3o23CrjJw9fkug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfhYv+tn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfhYv+tn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DCF1F0089B;
	Mon, 12 Oct 2026 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791813949;
	bh=L3m6CLgvLlskuEumVZFBQjQxzq1Q6AL5C+eQK3zlDa0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OfhYv+tndrCAwC+Umpf9Pv5Jj0Pkk2IdRXV8nGlh2UJlMSKopo1DfbYuN6gHCn8t8
	 /f6bZT0CLIMf8hT7qoTxwQKnZhtsj+RtwT9Z6XKATFqjPepQJhQeYtPZKhSX7wv++i
	 /5kXXqnN6Z6awEhdFcWH8zuVGztgJgW2baXrJWU5QmwO8Kso3UCnD+OzA4YZqDm9OA
	 guwXSkuFa5iv2euBBNOKJWrriZDxecc3CFVteY7txwzLMDwCILFYQkPo849wAnelnV
	 fPyPrfpKgXCi2EbX7kBLfyJ69p9OWiMNAY24nqY7simjoevuFgUvA++vDUgDhdRXiJ
	 vWU87boj/7IEQ==
Message-ID: <sashiko-outbox-168236@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpiolib: clear the event clock flags when a line is
 released
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com>
References: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 14:05:49 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: data race in gpiod_free_commit() causes debounce corruption
--

commit 9516d6cf1c2a072b1bec8e797ac66548d0323b06
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

gpiolib: clear the event clock flags when a line is released

This commit ensures that the GPIOD_FLAG_EVENT_CLOCK_REALTIME and
GPIOD_FLAG_EVENT_CLOCK_HTE flags are cleared when a GPIO line is released.
It modifies gpiod_free_commit() to clear these flags alongside others so
that they do not leak into the line info for a freed line.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 772c6f04f489b..c6cee872e4ae5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2679,6 +2679,8 @@ void gpiod_free_commit(struct gpio_desc *desc)
>  		clear_bit(GPIOD_FLAG_BIAS_DISABLE, &flags);
>  		clear_bit(GPIOD_FLAG_EDGE_RISING, &flags);
>  		clear_bit(GPIOD_FLAG_EDGE_FALLING, &flags);
> +		clear_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags);
> +		clear_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags);
>  		clear_bit(GPIOD_FLAG_IS_HOGGED, &flags);
>  #ifdef CONFIG_OF_DYNAMIC
>  		WRITE_ONCE(desc->hog, NULL);

[Severity: High]
Does this code cause debounce corruption by clearing ownership too early?

In gpiod_free_commit(), the ownership synchronization token
(GPIOD_FLAG_REQUESTED) is cleared in desc->flags via a WRITE_ONCE() before
the function finishes cleaning up ancillary state (debounce_period_us) and
emitting the GPIO_V2_LINE_CHANGED_RELEASED notification:

drivers/gpio/gpiolib.c:gpiod_free_commit() {
    ...
		WRITE_ONCE(desc->flags, flags);
#ifdef CONFIG_GPIO_CDEV
		WRITE_ONCE(desc->debounce_period_us, 0);
#endif
		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
    ...
}

This allows a concurrent request (e.g., from GPIO_V2_GET_LINE_IOCTL via
linereq_create()) to successfully acquire the GPIO line:

drivers/gpio/gpiolib.c:gpiod_request_commit() {
    ...
	if (test_and_set_bit(GPIOD_FLAG_REQUESTED, &desc->flags))
		return -EBUSY;
    ...
}

It can then configure a new debounce_period_us:

drivers/gpio/gpiolib-cdev.c:edge_detector_setup() {
    ...
		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
    ...
}

The original freeing thread then resumes and overwrites the newly requested
line's debounce_period_us with 0. This completely breaks software debouncin=
g,
causing a 0-delay software debounce that will trigger its delayed work
immediately on every hardware edge. This could lead to an interrupt storm
and CPU soft lockup.

Additionally, this sends an out-of-order RELEASED notification to userspace
for a line that is currently fully requested and active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-gpiolib-ev=
ent-clock-v1-1-aambrozewicz@nvidia.com?part=3D1
