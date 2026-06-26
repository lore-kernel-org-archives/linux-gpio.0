Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176123F9F2B
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 14:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485288; cv=none; b=KYbuPfNWukWpYkfmk5lbjqdQj9HBMj0xs2NaS19s0IuDkOw9Ob4frGOpKV/f1CPNEzfZSGuduWb0H0KJqpu/GVcKuan9tPkxz8/lKobf8xr1s+xDggdUM6+NjN2nZ92rt2/H3I61En3uis7kzfK1OwKsYBnBJro10zYI+T4+u0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485288; c=relaxed/simple;
	bh=q4L5tEc11ihfQ9ESEXTsBG7QsSTcgbOiW5gpcNQ/xug=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSGXid16Ec7Rl3c41yNyd4zOjLWvY5cDFIdRt3viuVpqynToeYn2dYhD4KuPGaANdCbvleOMWKOfT67k593gdBYE8Nb5hjaGOODqM9D2dHGj3FMESX0F5t9Kd8IWdmZcr6uFomMjM5pOB5xk+I4NKMgwQcbf3eYebsCCFOPcle4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsD6lXOX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsD6lXOX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1AE1F00A3E
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782485285;
	bh=UdRpwrOaaRjrnQHkn8gCCooh0xVjwEaGW5EGRqe/Jv8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=PsD6lXOXa07iSRlcfwt8MDmhOsq1zZs4pkUUikDl28aq06rppi4t88izrAU10T4lC
	 KVXuLEMmxxEjupNQ5Ibpsyb0SxpNJmIKXaafPjPnLLccPYmreRD73K2tBlpoG7j5sd
	 RDoiyKfJ/OxDgmgFPVtOgPTKiiMaWeNLAMyNPCUEsj9zRx5o0QxyiIe+Ko0axh8iOk
	 6BefI4hV4M89G54NmQyl/RtSNe9BOT9tfxxtzWRmgANAewbcN71SYxepB9m8tepwhw
	 lVZkraEX7O+9TvVVdYyAP5nrvqj2qqY8M6XGohNaq+YMHGnIiJtVI8icyJdJToiyTE
	 b8FJICHsaKuAQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39957d210f4so11242471fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:48:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrbrgX5K8g4RI+50xceceFhksLc8tiZdm0YyysV5IWZUYolVFdHj7eMcKObIfxbbcEulc1VdsOHHY4+@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/0Sz3XRg1k23FoYo2cB6ZEGi4d8J0QW43nIQhULV2JmDDk3T
	ljUEwjMbDzRFda8SWfgvX329ZJkWbpTZVjGnQ0dtMMYIvsYqLbyJWNXz5z62aBGufzDDUzQmLSZ
	EpUJFVt24qhEQXIQ4fzxrxlfjUXRc96pGfrRIDUzf3g==
X-Received: by 2002:a2e:bd03:0:b0:39a:e1c5:6f38 with SMTP id
 38308e7fff4ca-39ae1c570d3mr2163391fa.24.1782485284112; Fri, 26 Jun 2026
 07:48:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 10:48:02 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 10:48:02 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260625115718.1678991-1-v@baodeep.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com>
Date: Fri, 26 Jun 2026 10:48:02 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mcz=GPrjnvQ0Q6VxfqHDO0W3yq7FpRb=bPi-Jxu-GFuqA@mail.gmail.com>
X-Gm-Features: AVVi8Ccrn34D3j7CJ9eL5y0B-K12ypG8-rk1rDfezPbvQfjSrS7D45oeqSJjK0Q
Message-ID: <CAMRc=Mcz=GPrjnvQ0Q6VxfqHDO0W3yq7FpRb=bPi-Jxu-GFuqA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: fix sleeping-in-atomic in shared-proxy;
 restore meson non-sleeping
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2026 13:57:16 +0200, Viacheslav Bocharov <v@baodeep.com> said:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
>
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
>
> This was reported on Khadas VIM3 and worked around for Amlogic by
> commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
> sleeping"), which marked the whole meson controller sleeping. That
> workaround broke atomic value-path consumers: w1-gpio (1-Wire bitbang)
> no longer detects devices, because its IRQ-disabled read slot calls the
> non-cansleep gpiod_*_value() and now hits WARN_ON(can_sleep) per bit.
>
> Patch 1 fixes the proxy locking generically (always a sleeping mutex).
> Patch 2 then restores meson can_sleep=false, fixing 1-Wire.
>
> Patch 1 has a trade-off: a proxied GPIO becomes sleeping, so consumers
> gating on gpiod_cansleep() change behaviour. No current device needs
> atomic (non-cansleep) value access on a shared GPIO -- every report
> (Khadas VIM3, ODROID-M1, my test on JetHub D1+) is a shared reset line
> (eMMC/SDIO pwrseq or PCIe reset) driven through the cansleep accessors,
> which is what the proxy exists to vote on; bit-banging that needs atomic
> access cannot work through voting anyway. An alternative that keeps
> atomic value access (split locking) is possible but adds a second lock
> and new race windows, so this series takes the simpler mutex-only
> approach.
>
> The two are a unit: patch 2 must not be applied without patch 1,
> otherwise the original VIM3 splat returns on boards that share a meson
> GPIO -- please keep the order. I have not Cc'd stable; I will request
> stable backports separately once both patches have landed.
>
> Changes since v1:
> - gpio: shared-proxy: open-code the descriptor mutex; drop the
>   gpio_shared_desc_lock guard and the gpio_shared_lockdep_assert()
>   helper, move the mutex rationale to the can_sleep assignment. No
>   functional change.
>
> v1: https://lore.kernel.org/linux-gpio/20260610153329.937833-1-v@baodeep.com/
>
> Viacheslav Bocharov (2):
>   gpio: shared-proxy: always serialize with a sleeping mutex
>   pinctrl: meson: restore non-sleeping GPIO access
>
>  drivers/gpio/gpio-shared-proxy.c      | 66 +++++++++++----------------
>  drivers/gpio/gpiolib-shared.c         |  9 +---
>  drivers/gpio/gpiolib-shared.h         | 28 +-----------
>  drivers/pinctrl/meson/pinctrl-meson.c |  2 +-
>  4 files changed, 30 insertions(+), 75 deletions(-)
>
>
> base-commit: 840ef6c78e6a2f694b578ecb9063241c992aaa9e
> --
> 2.54.0
>
>

I have no idea what's wrong but I'm still getting two copies of each email
as separate messages to my inbox. I'm not seeing it with anyone else. I think
there's some issue with your setup.

Bart
