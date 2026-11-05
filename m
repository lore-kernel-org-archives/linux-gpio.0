Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852953;
	b=SRnLG6iCmxMdw1R/xZvVbWta62V/o3Gfxo0W0Dqtfix9i10qB5r972BYxHZp/Pmf/WeT
	 6S+c9L+o8zkc0BffHoyn1ijqskaOBET+n9cZevl1lI1ugqSoeOxf1zl+ovW449j0hQWb2
	 pSWu/4XxOCzmvfKR6dBT5pKGsnY2aoVu7GZGUUeSRLFQl7FCbmuaM7DbdxzZEO6/BWvXm
	 o+0Mfuucvg2uV2F+ZkV6kDO3v9vlmU0DlguewfBs/kwCSxrHto+KVhuq/oFNaB0nxPWUu
	 Pb7TLRFDl6NSSl1PXCHJ6gj65bdr9t75Y2F/qcPEPtyGv8eNBleLUwzBsutU6MREgxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JMo4bIblf20Ox/wHcnXswTyrH1vkkJSSvlX7wiz1Kyg=;
	b=KYG3UPF+EG6OkHmiLJwxP5nvKgHZZ+HU6X4/MFtUsB6muNrn5OHsYb+B59mAP7biN6yZ
	 1duHEehqkLBlPNt29LzaHlM0M54rfpayahgvYV8gtEUUkOjYdLto4QmaKJcMUblBS5zmo
	 v1+9XdelHBqgJWS/xG3dE3dtpfWF8bamW0zBYVlffFe92aNV3GGpMrfdQD1WwQiJuXXZb
	 1PxB3LCYcDsOlaln1iQM+TxBJoMiDx44uQXgAdjQk2A6yn4BDqvJaJVjHScBvoUgdMHZX
	 +zdPJ7B0ZJlzu9PPWgYZ7xN+HmBpNGOfaNFfK/YsHql3IB5B1Vl1CvqtXF8odbhqrUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tof0ZRuF;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3003F606A329
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 04:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3003F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tof0ZRuF
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb5d64fb9dso40031a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 20:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793852952; x=1794457752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMo4bIblf20Ox/wHcnXswTyrH1vkkJSSvlX7wiz1Kyg=;
        b=tof0ZRuFm308akvK86pHS8lOvkDLODF7X76iDUMsZeoOAL5PeMPvKicgb+VR7eA8CE
         CDZC4KeK2881mFNc4MHX8cmbbUI2qbshedQ/ofBO8Mq5HF4rC2Z+moQTT0ckFab2R5JR
         fAPGQIoEe7N94vCvCdMy3q7kKIbMV3/p0/vvankyrxL6JVdvhKLjZ8BJCqAe8sDx5zDF
         xsjq+wFej52YMT6lCH6GXSplD8aF8FkG7ure/XRkcPVwjxaXKUKuPuiSFPTLRnW4M5b/
         gQ/Q8blQ6krBTOD7JQYVAhoGoHVRLdaU+XTeTnuOJrm0uaKCo/o0A3l5PAkQofZGm437
         8nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793852952; x=1794457752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMo4bIblf20Ox/wHcnXswTyrH1vkkJSSvlX7wiz1Kyg=;
        b=azgz5HOVvBqVBU0KTNs6+Xrs0LRtKZ0vdErsOtN9cx/9e9Fz4leqky3mGxeISLdj7f
         6WKrIWmWPMufziprvu2ILconp20iA3EfqZ3Lnt3YxECITjDFkavlY/Sabxcww/lN3VW8
         Y/ke3d91TudZlZk0LofjLZhjIFt2xRiRjYqvCYFuqkbPWm0oT5E/WurRtXYGgRCuM2+9
         tyZsnLrISm3zAlaibbSgLHB1F+5PR3ZhME5ZwDydSF9WRi9m7oqEakEtcnVvHhHvT3hA
         8rk2ZtJhWsaIWfWbRwtU1hcirMudmhZ71hEdOynza558yuRK3PG69e0+BLiB75tXuQJV
         mVoA==
X-Forwarded-Encrypted: i=1; AKwUvBw3+u/onHPe5byrDHlSU54+sKT70CDitUiBuujzO+75jR/ySL9nUDPKh+7UJp/ZkaqH7V7UDvWfiLnX@vger.kernel.org
X-Gm-Message-State: APuU4Z/VDOagwbxQ0g51iMwN7lEiN4pnFUfbx1H5yGIqGGkQkgabsCA5
	qm21D4FVjAoQI4ASxSQC98M7zHGMY32bs2z8JzPytNcgn8VYarRyCENr//rtuw==
X-Gm-Gg: AYBFou0jUknJun9nKUlcbmrTUotDyXvIfdh3tskXgc+CfJNtjPJa+Wkr95XZWcNEaW2
	lmYYObSPOkqlAoPXMjvJXMuhQW54v+jJl6T4Him2ZtdDvLMFLp7ZzcrGMmr7W2wrFgvr/+S8c5n
	o/FqFY8CCSBPtG+Yf1tHjYS8CHxsZIXJk2HZ57lJjLJr7aVp5qis0wL9UoZsABMOBWOH+HvrksE
	RfJafzCyPsVNM+qMKIGi+HOFWBINd0A4eJ0pfeHoYcjbTSRb6HH0Q3VtfJozFuZRwYdqyDf+oyV
	OtwhA8kYDvpiSEBUPZL+EkY3av0ofTTl+l6ps3yHTDR/XugNNIg0j+AuReckhm6SIDiRreQ1p9H
	MJCVC/s9MJbfIwk4XX8xiRhygLdizEQEy2mM7elGhDMhQNldI/UzvUYZYLlPfWfuM8yu9jMxs2i
	0L5wA2eQaynyQCM92qrMOEUqqPAZSlySiR/l+c+TOOHaIO+YxxPSjVBvtova71enGaBPkDHZD3k
	JFEEqry57qcsk0y24u5mXNchBYFMdm0vhQN89JDqCVLD2zKs7FQGxZVNDXIbXFUAUS4PyoBGtBe
	TR7R8vVz7fbX0yh8O7FExvqtQkK5lsPBQa0Tk76EtaJYMueO
X-Received: by 2002:a17:90b:224f:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3ae8983cf4emr16977504a91.53.1793852952411;
        Wed, 04 Nov 2026 20:29:12 -0800 (PST)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32812a6sm1611635a91.11.2026.11.04.20.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:29:11 -0800 (PST)
Date: Thu, 5 Nov 2026 12:29:05 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 4/5] gpiolib: don't overwrite the entire flags field in
 gpiod_free_commit()
Message-ID: <20261105042905.GB8436@rigel>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
 <20261104-gpio-desc-flags-atomic-v1-4-e23cedf619ba@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-4-e23cedf619ba@oss.qualcomm.com>

On Wed, Nov 04, 2026 at 04:36:59PM +0100, Bartosz Golaszewski wrote:
> Use gpiod_update_flags() to clear all request-related flags in one go
> instead of risking racing with concurrent users and overwriting any
> changes they could have done between READ_ONCE() and WRITE_ONCE().
> 
> Cc: stable@vger.kernel.org
> Fixes: 35b545332b80 ("gpio: remove gpio_lock")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpiolib.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 63b65b646fbcfa9ea0f724d1d3e1ac22ba28f638..28d4cf0cef70f437dc4271f82975d09dc55125ea 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2693,23 +2693,23 @@ void gpiod_free_commit(struct gpio_desc *desc)
>  		if (guard.gc->free)
>  			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
>  
> -		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
> -		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
> -		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
> -		clear_bit(GPIOD_FLAG_OPEN_SOURCE, &flags);
> -		clear_bit(GPIOD_FLAG_PULL_UP, &flags);
> -		clear_bit(GPIOD_FLAG_PULL_DOWN, &flags);
> -		clear_bit(GPIOD_FLAG_BIAS_DISABLE, &flags);
> -		clear_bit(GPIOD_FLAG_EDGE_RISING, &flags);
> -		clear_bit(GPIOD_FLAG_EDGE_FALLING, &flags);
> -		clear_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags);
> -		clear_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags);
> -		clear_bit(GPIOD_FLAG_IS_HOGGED, &flags);
>  #ifdef CONFIG_OF_DYNAMIC
>  		WRITE_ONCE(desc->hog, NULL);
>  #endif
>  		desc_set_label(desc, NULL);
> -		WRITE_ONCE(desc->flags, flags);
> +		gpiod_update_flags(desc,
> +				   BIT(GPIOD_FLAG_ACTIVE_LOW) |
> +				   BIT(GPIOD_FLAG_REQUESTED) |
> +				   BIT(GPIOD_FLAG_OPEN_DRAIN) |
> +				   BIT(GPIOD_FLAG_OPEN_SOURCE) |
> +				   BIT(GPIOD_FLAG_PULL_UP) |
> +				   BIT(GPIOD_FLAG_PULL_DOWN) |
> +				   BIT(GPIOD_FLAG_BIAS_DISABLE) |
> +				   BIT(GPIOD_FLAG_EDGE_RISING) |
> +				   BIT(GPIOD_FLAG_EDGE_FALLING) |
> +				   BIT(GPIOD_FLAG_EVENT_CLOCK_REALTIME) |
> +				   BIT(GPIOD_FLAG_EVENT_CLOCK_HTE) |
> +				   BIT(GPIOD_FLAG_IS_HOGGED), 0);
>  #ifdef CONFIG_GPIO_CDEV
>  		WRITE_ONCE(desc->debounce_period_us, 0);
>  #endif
> 

Not directly related to your change, but the debounce_period_us is
protected by the GPIOD_FLAG_REQUESTED flag, so it should be cleared
before the flag, else it could potentially race with a new request.
Not sure if you want to fix it here or in a separate patch.

Cheers,
Kent.
