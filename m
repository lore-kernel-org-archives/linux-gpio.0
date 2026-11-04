Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807577;
	b=sRcCSdji9eZeK5EYL6fiBasouBhZ4ojz/GTFO2vQDcHuyfUM6qk7T9Cbnoa+cl18jGxH
	 62AakZ5tcVDZSLi/azjnkvvzPwOckqF6USYHM/ROcaT2ylIX7Z7JvTVXqNWo2rDGs6oHT
	 yOrlx+/yrNVqxMfDBfgNj5Ff4uL47k8EyjBcOu7nFmqkxhTAq86lDNA84dczzyqXcdPrc
	 RBIjFEMIY4VNFlnLJuhMteFujrOQpu4E79YeHkTI6eigCL7+7Wte7jViJwAyR2quIUqH4
	 KhIHmOPNbdu6czCVrQfZKkaWZMogaUlwaq13VXKrQTw4lTB4cg+rdH2hO1FT7rhZx5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807577;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=stB1Zk65R6Z/tz5KjkCqXBrc9Cv2dpE0g7T06+yrmQI=;
	b=1Gjg6y13SxUPDIogHKNLuAuuEdKDDZAiHbLqr5Htj0sHyaqCLF6HS2VlWnlxOjKXPEEU
	 +KxSUS4q/Or4keOzk2iGfeKCNY8X1S7zNczU3o91mHfP8S7eUxu0zE29/CvU/tkSN5Smd
	 9ER4ZAMTaAGnkS3iHE5HK2kIc59mkAhhgC3QgtnmCa6Ze7A3TC3b/AnrHfzZIXEyOtbyk
	 +P97TY53PYR4ano4g+CbHuq3BQc4ydYSsbG5f3HYjNI5yVVUqNu4ukIiKIEfTSq2wJbDO
	 ToJqMUBMzajBYVONPynNH/0kT80YD0s3Knji7XRGgjzAYSdDizu5jEgQllcr4IEdvGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RIzxcYMq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EBD606A335
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RIzxcYMq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2581F00919;
	Wed,  4 Nov 2026 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793807576;
	bh=stB1Zk65R6Z/tz5KjkCqXBrc9Cv2dpE0g7T06+yrmQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RIzxcYMqwbv9tDNjnCN+7vQfcgLf7x5ZT/4goZY2uRB7KtmItJiBefSRQeLvQvStt
	 ffClYrB00LD+VElSrosWZTy4BOUJCiNrGiq0h/NtsJCougFsze2pMu+eUXYOo9iF5v
	 GeMkkT49fiGaQe3YmOBPWl1RH7XjuSnKM7G0NlHzQaYqhSwi8JRZLphWLKuNnrQXlR
	 EhkUq4RUoIUejT+slzprOuxN9BbjpPhX806rhEPoWlmSD6uPPZaO/gaJtKFSgNq6nk
	 nlax6GhNsx1cxZG8n7/4oetyozPDCZlLygTd0qUQ2Gc8ffBBUt3zBav2aRSujx7cK9
	 HLWQuyE34Pj7g==
Message-ID: <sashiko-outbox-197549@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] gpiolib: provide gpiod_update_flags()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-3-e23cedf619ba@oss.qualcomm.com>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
 <20261104-gpio-desc-flags-atomic-v1-3-e23cedf619ba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 15:52:56 +0000
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
- [Low] gpiolib: gpiod_update_flags() open-codes set_mask_bits()
--

commit ecaf66699b4205d02175949ed385d130f83c667e
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpiolib: provide gpiod_update_flags()

This commit adds gpiod_update_flags() in drivers/gpio/gpiolib.h to atomical=
ly
update a masked set of bits in desc->flags using a try_cmpxchg() loop so
concurrent updates to other bits are not lost.

> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 650a702741dfb..10659ffcf2bae 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -9,6 +9,7 @@
>  #ifndef GPIOLIB_H
>  #define GPIOLIB_H
> =20
> +#include <linux/atomic.h>
>  #include <linux/cdev.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -223,6 +224,26 @@ struct gpio_desc {
>  #endif
>  };
> =20
> +/**
> + * gpiod_update_flags() - Atomically update several descriptor flags at =
once
> + * @desc: GPIO descriptor to update.
> + * @mask: Bits (not bit numbers) to modify.
> + * @val: New values for the bits selected by @mask.
> + *
> + * Replace the bits in @mask with the corresponding bits of @val in a si=
ngle
> + * atomic step, so that no other context can observe a half-updated stat=
e of
> + * these bits. Bits outside of @mask are never rewritten with stale valu=
es, so
> + * concurrent atomic bit operations on them are preserved.
> + */
> +static inline void gpiod_update_flags(struct gpio_desc *desc,
> +				      unsigned long mask, unsigned long val)
> +{
> +	unsigned long old =3D READ_ONCE(desc->flags);
> +
> +	while (!try_cmpxchg(&desc->flags, &old, (old & ~mask) | (val & mask)))
> +		;
> +}

[Severity: Low]
This isn't a bug, but include/linux/bitops.h already provides set_mask_bits=
():

#define set_mask_bits(ptr, mask, bits)	\
({								\
	const typeof(*(ptr)) mask__ =3D (mask), bits__ =3D (bits);	\
	typeof(*(ptr)) old__, new__;				\
								\
	old__ =3D READ_ONCE(*(ptr));				\
	do {							\
		new__ =3D (old__ & ~mask__) | bits__;		\
	} while (!try_cmpxchg(ptr, &old__, new__));		\
								\
	old__;							\
})

Could gpiod_update_flags() call set_mask_bits(&desc->flags, mask, val & mas=
k)
instead of open-coding the READ_ONCE() and try_cmpxchg() loop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-gpio-desc-=
flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com?part=3D3
