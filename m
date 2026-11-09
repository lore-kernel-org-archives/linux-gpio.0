Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220345;
	b=tS11kgOf08j8vuXziaJpcNcztWrqdYEHRHrZVay1o7AG9t6M+v+2mdxGwNrrGdFCjbJd
	 Q7psAXbzrX0tGbwuUz/CmkyL8LeUjcfiVOsBEdNS9ZvFYUxD/EdeTZyJVXNZBr8M/cVFO
	 b75LBDqgWcKfh+KJCk2cNBVpSPrfemC5UFvjcUsKJhceg/Md8z13fOXcFooH2l72ul90V
	 1iMDplJu67q2B4YaHIBTWKqhu+ruYoaJAD2PHz++wDz8gY/eFJBl8SMJLgC1VvXqiFAmH
	 L0RSlaUUIieAnuEVsFKyvumOAL3VNlYDb9OqbLZmdN3t09KTO3w5dWm3FdOFYPXPYFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220345;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=igeXPOEMBd4xJX3cNT5i3udmvQxAYvV0dvwtXJVSjvM=;
	b=h8xeghbqjKKS8LXBWHOMZVM4DaktGvSQEfduy0SViMmQ1ysluVuD3nfH5OyMID2eQDU7
	 8AaiCZfEsD27+kFUQG2SnnOuAYVKKolQQEm2BT0hQGMaXIQH6ZZBA3UOigO9UbwavFdX4
	 V8P+BPfix51fnniPjX/actflW9A3aVYWyGkVuQpEetEx4V2lD69jmHeFuXyJBCB0De1Q3
	 71IzSBtlrcaOzozDZyiXGD0EDL4IL1X+ZfmJeaB30xFx4x4OMfzMmYP1komIt0DJCz9yi
	 EivD0WtaJZ1XDhI1C56FwEOPCtq/zprRK9vj7yba9FJ/3HJ5dHsc5tA/pJBuX8EFqEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSiJ0Rv8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A608606D804
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSiJ0Rv8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051771F008A6;
	Mon,  9 Nov 2026 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794220345;
	bh=igeXPOEMBd4xJX3cNT5i3udmvQxAYvV0dvwtXJVSjvM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fSiJ0Rv8HYTMOllzN2jU0lslHlib4jPbUD4wgNmoH38ynulEr3byAp7P8VKy7Fa0T
	 bmN1f1c2jTAxYvZ9QpjrMBtfYeN2GAGlIlkMwUEgJ2VFXXwLS7tWtfl+8sPh/79/+q
	 /or/yPDDvtgUJ90sYR5pyjtoDJAJb8tR+W4mMPWM2KmJhDjsLm44ZplrDEZecMuy8L
	 8gmnly6iUPipgz0NqadLG9UFzxq2oLGSoyxP7S3EJ51ZRBKlrz8ixU2xG1KEBKenHZ
	 1GbEQDGH8HU9q0yAihIhzGySWp4Kb+e+N7G9s/5uHCVtidcAzNW5QOIyD38b622VXQ
	 KI0rR4bQGIuuw==
Message-ID: <sashiko-outbox-204825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] gpiolib: don't overwrite the entire flags field
 in gpiod_free_commit()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-4-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
 <20261109-gpio-desc-flags-atomic-v2-4-c4c54b476628@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:32:24 +0000
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
- [Low] gpiolib: commit message and indentation reference
  gpiod_update_flags()
--

commit 8c916355e1aeab892f0c8dc4d52c44c7d5dcf4e9
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpiolib: don't overwrite the entire flags field in gpiod_free_commit()

This commit replaces the non-atomic clear_bit() sequence and WRITE_ONCE()
on desc->flags in gpiod_free_commit() with an atomic set_mask_bits() call.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index af2d67d977f49..4c9c524389ca1 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c

[ ... ]

> @@ -2696,24 +2697,23 @@ void gpiod_free_commit(struct gpio_desc *desc)
>  #ifdef CONFIG_GPIO_CDEV
>  		WRITE_ONCE(desc->debounce_period_us, 0);
>  #endif
> -
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
> +		set_mask_bits(&desc->flags,
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
>  		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
>  	}
>  }

[Severity: Low]
This isn't a bug, but the commit message says gpiod_update_flags() is used
here, whereas the code calls set_mask_bits().  The BIT(GPIOD_FLAG_*)
continuation lines are also still indented to align with the opening
parenthesis of gpiod_update_flags() rather than set_mask_bits().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-gpio-desc-=
flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com?part=3D4
