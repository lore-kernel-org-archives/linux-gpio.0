Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254192;
	b=c04KDI1iCQdzarHWZRJ7MfOImDlE4DYsWXXDTK39A77eDs8XY5goE24+hY9AzAFpI4wh
	 YHUU3AsB56BTj9FdSzDsgkJp4nqRWhAxCT3Zic4rB8CR+OU76Da0djr/EWV20lOxeOtUQ
	 tJ2wh4QwwGzKYaz5sReQ0crOZEwA+1qXp0RU4Tv+2nML09wrMypwztzkNsJvicC6AX3el
	 j/lUdH42tczAexlMi2ltT1VqybKcGQrwCKjDxaz6We4KreuURRMnfuIZl4FKhs9jVyxvd
	 G76URnJbWGAPD24NwhEMBLaFVSiZo0w8Qn09bKQna/IgkzJrKnGyxMPD1ynRHjaOS6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254192;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8F+mAEdpvLGOPdYUSKldeB+OY5bCfWe1ZeK2ZdA8+lU=;
	b=kwMG4ZyuAfJ2u2qWd/AkFA7T/3D4BbFywjpsJSFCYiUF2e/WQW2pdt5lePomLu+hA/DH
	 cehv3ivvzzjmdFXiziHNEiFq5L1OCEwSrvA9atZ46+VrffWd4XoktHpEapljcdNN9Lkg6
	 4/oBJEq1pLkBaGo3xuU3U8TrEFImJVYMGFBo11gZAEbJHJ2wSwrsSGj1aM/N7pmmk4bUT
	 aPhxF8/EVuxEfC27BKC0hpJIg+Qom8gc8LxEpfdp7nYTuIRwwSVGuTwBAl0/kPSUsXpS0
	 vMhFK8qCPV1JHJlzXxzBDG+X319vCz6CHKylD+4YlpdFvI8pQ37+kVe3YMaImZ2LHKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7XMUHW5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052FB606A326
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7XMUHW5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73ABE1F008A3;
	Mon,  9 Nov 2026 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254191;
	bh=8F+mAEdpvLGOPdYUSKldeB+OY5bCfWe1ZeK2ZdA8+lU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M7XMUHW592Y6PXIEFtorb54WHMoopXe1YYmSpbgwgutP9CIuvy8LsLSyoOOspeS2z
	 vRdoqegq098lY235M43OqFr08/kld6/Oa7VTedGT8MYRpSn1l6ju0ZcuJ34JZpdq5j
	 JLuJTJB1T3znr/K+dn5VfWI9KlqEa64IYqOB7I6QCSB1MaUnQsj6yQw3CqJ5ghwri2
	 JuakWOPK9aVJsrLcto4qGLQC+dbaMK/rk1hEQ0tnaxMtsLA9DobsDbZ8n9KhANE7mI
	 sKBcAKnScCtDOXZmOpz1qBs6+YvyBhKspIsgkuTSPDU2n4wq4TTwK6EwZoDdytqmC2
	 0aC0M1ZE42aBA==
Message-ID: <sashiko-outbox-205512@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: shared: fix a race in shared desc release path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261106-gpio-shared-refcnt-race-v1-1-79c9167505ab@oss.qualcomm.com>
References: <20261106-gpio-shared-refcnt-race-v1-1-79c9167505ab@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:56:31 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] gpio: shared: missing mutex_unlock() in gpio_shared_release()
--

commit 5cfdf2552fd680712c24f5438a69c1cd0f6f788d
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: fix a race in shared desc release path

This commit switches gpiod_shared_put() from kref_put() to
kref_put_mutex() so that entry->lock is acquired atomically when the last
reference is dropped, and removes guard(mutex)(&entry->lock) from
gpio_shared_release().

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 8c9ac9d933049..f6cf298e28b08 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -635,8 +635,6 @@ static void gpio_shared_release(struct kref *kref)
>  		container_of(kref, struct gpio_shared_entry, ref);
>  	struct gpio_shared_desc *shared_desc;
> =20
> -	guard(mutex)(&entry->lock);
> -
>  	shared_desc =3D entry->shared_desc;
>  	gpio_device_put(shared_desc->desc->gdev);
>  	mutex_destroy(&shared_desc->mutex);
> @@ -648,7 +646,7 @@ static void gpiod_shared_put(void *data)
>  {
>  	struct gpio_shared_entry *entry =3D data;
> =20
> -	kref_put(&entry->ref, gpio_shared_release);
> +	kref_put_mutex(&entry->ref, gpio_shared_release, &entry->lock);
>  }

[Severity: High]
Does gpio_shared_release() leave entry->lock locked when the last
reference is dropped?  kref_put_mutex() acquires entry->lock via
refcount_dec_and_mutex_lock() and requires the release callback to call
mutex_unlock(&entry->lock), so removing guard(mutex)(&entry->lock) without
adding mutex_unlock(&entry->lock) causes any later caller acquiring
entry->lock, such as devm_gpiod_shared_get(), to deadlock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-gpio-share=
d-refcnt-race-v1-1-79c9167505ab@oss.qualcomm.com?part=3D1
