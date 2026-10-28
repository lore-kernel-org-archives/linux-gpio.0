Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179284;
	b=x1N0M4B53Cw62ckQbfCxD6UaWBr9ESM+6p5GzicB093IKfXO5nLVthKftQcad+bqfvxA
	 LUVpse1o4kWF403YCmL3xqb2BLRiXsd1IhIvU1FTtQZwXTKN0Y1bzxlzRn3PjvCXpfb62
	 npitMJPMeIIFhZuJVdHjlaVbgHqUkeVFfoMvPOVQKj9T1Io33Br1zJx5JB5ojba/TnPlF
	 GHZdkq5UsAFBi8nan/jVyr8xBDe3fllafsaHILpoiGpMyThm74UK3dpWWqo9xMkJ/Txzd
	 yGHg6+UIG7tkH7AcGAyOSXkG5KyQfu5zHO7f/SU2/UyvQLRoohVWSNEKq+qc4wHGdPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179284;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=pWHDga10kmW0MDLVIkUsOtMHzTyMjmDGEDdz+Zojs0I=;
	b=Ze1aGKknJ3GxQxRTRmk+YlQqXBHPW0ztjqilQ5tWU2M6hYVnmMwQXK/RAtJOcNvctasx
	 TTmtMCOFvqWGCHnIH+OV0eEKL7naDxjmxl6Ydj/yhyW7LgSDz2qco+cOlMLffmTNTSqzc
	 maT1u8c//hggBn0TCEyPOgye83pKdKqH5AsDyNSG6KyFv7LQv7XDlwGK8ogCHPrkFwYsz
	 FU981rYD68Bqs4B/QsrHPQ8d5M1Meds0G67N7QQ4VYB83mO5f0x9EyBhIZ1Fko2CsUl4T
	 Bh1nHQfcg3rmJGsj573lVRcja0OmD4UXeN+m0P62B71jTffyL4OsTQ9Toxvoqf3pgDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxEvsllx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C34606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxEvsllx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642121F031E3
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793179283;
	bh=pWHDga10kmW0MDLVIkUsOtMHzTyMjmDGEDdz+Zojs0I=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gxEvsllxhpcnF3kbhzLtmLzCn82LqKIT1LuX/PaT+Xo7aIB7Rjy8Dv3ELHG/xSQU3
	 HQ/S4VH23pajim3H64XGlq8oO5FQpwG31H4kifzpCWOVryqeS6Q4HofbCOhDbf2u1U
	 CNphw1+5RFMs60ENl07TfsuMb+CAz1KvGcg/cVrApat5gURqy9do5FBFjKofU36IuJ
	 DryZa8N1vHgWaZpIFRXiHdV/rqZGpa2ybDeHf+XFscGFzPtyhGIZV2FzLSP0/mWISh
	 Ml3oUu0k7jq59UINbUASNTxqNiYVtfJu2eCqklHJJsAJWciZYfzpVbCe6sHftgKGVt
	 xZEkVA3BuniKQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso4765761fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:21:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzTQoQtclYKZk0cxrfFNE7iX2eLRM8z/QsbiCSIzfSW+uIq30GMvQRxBEjZ1MlyFiEVQnSN4OuTkZ4E@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8oji4wOVWQF+gx4pDbtBhkWOMVd8c6g98T69uNHghRT/SbZWc
	DkSrFIwEohUXvOIqbtOkwfuzSyvNuaYAimF9JQ0xgCKx3Bulz8XmTF9coFJqcrQFG92162H5kwz
	xQoJO+6ZCPuf+6gE2yBCPjPu6rDlwoYO8ZTl7Rj8q2w==
X-Received: by 2002:a05:651c:31c4:b0:3ac:42be:7e50 with SMTP id
 38308e7fff4ca-3ac9cf5b3b5mr3472451fa.14.1793179282092; Wed, 28 Oct 2026
 02:21:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 04:21:20 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 04:21:20 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261028034057.114021-1-rosenp@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028034057.114021-1-rosenp@gmail.com>
Date: Wed, 28 Oct 2026 04:21:20 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeG89HjLc42yK0-f6mWx8E96n6xA4wZ9CKyBa3Kgnn2ZQ@mail.gmail.com>
X-Gm-Features: AclHuK89EM60jjCdfR0SjAa3kzZ0tIN6wpR4VeQqwEqNXM9tUVvgV4iLumJ-xvw
Message-ID: <CAMRc=MeG89HjLc42yK0-f6mWx8E96n6xA4wZ9CKyBa3Kgnn2ZQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v2] wifi: ath9k: don't re-request the LED GPIO in ath9k_stop()
To: Rosen Penev <rosenp@gmail.com>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, 
	Kalle Valo <kvalo@qca.qualcomm.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 04:40:57 +0100, Rosen Penev <rosenp@gmail.com> said:
> ath9k_deinit_device() frees the LED pin in ath_deinit_leds() before it
> unregisters the hw. ath9k_stop() then switches the LED pin back to an
> input with ath9k_hw_gpio_request_in(). For a SoC GPIO outside of the
> WMAC, ath9k_hw_gpio_request() takes a new descriptor through
> gpiod_get_index() at that point, and nothing releases it again. The
> next probe fails with "request GPIO12 failed:-16" and every LED update
> hits the WARN_ON() in ath9k_hw_set_gpio(). That request also runs
> under sc->sc_pcu_lock, while gpiod_get_index() and
> gpiod_set_consumer_name() may sleep.
>
> The input direction was only added for symmetry with ath9k_start(); the
> suspend/resume fix that brought it back only needed the output side.
> On WMAC pins it also undoes the "LED off" level written just before it.
> Drop it, so the pin simply stays an output driven to the off level.
>
> ath9k_stop() still writes the LED pin, so free the pin after
> ieee80211_unregister_hw() instead of in ath_deinit_leds(); otherwise
> that write hits the WARN_ON() in ath9k_hw_set_gpio() on SoC GPIOs. This
> also frees the pin when the LED class device could not be registered,
> which leaked it before.
>
> Seen on a TP-Link Archer C7 v2 (QCA9558, LED on SoC GPIO 12) when
> reloading ath9k.
>
> Fixes: e34f2ff40e03 ("ath9k: bring back direction setting in ath9k_{start_stop}")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
