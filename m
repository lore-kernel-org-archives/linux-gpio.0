Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577212;
	b=nrvg+/5VrNglZz6RRBb7URC2wioDjdpImWk/bgye3G0dQiZfIfoSV2YOJJJREhyLYF7m
	 qwyvGF4VU/FNik4Zf3tLkwqnvFbeIWnYNj0wHP9SjcuTJ74H4MnQ1yB4XjP2wkRdaMgih
	 t2TXn85MpKm0Uliz7CJPlc+gNra8aryItAmLAmBIjhi11/ujNxxpA+TMUYMxhvguKajep
	 rOUPp5VjyG7uPvw2P9eCBaAWHIyQCASV5PYXcHpeF8MCSXqWM2/xKJ4Pco1ZR4MznL5zm
	 /vqAQsZKNdUXyIYJDbZ6iQehwD9Y90r/Fl3V36wQzsUhP3GjCyThHkzBXqq3DruCeYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577212;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=ZIeabLWc8/+X+ra1sWD8SHeL20genn2WdJFRc0Rla+4=;
	b=x/+8Zf5z1gImwdtelZDj5XkUtQupBq2ekDw1bqu9crsafKiUfqXgwGhTegQPyz/TdkQO
	 I8LXk3lPdT/3lCiv7/7PMwLrt+3lUhkulihJGxaWDCt8ZONk0Rwab7+Gsxyi4RObtrdcF
	 NuwJ3x6MuxqTl4WeszHlYEvHVleYZsUW2V72feD+BlutgbIQ8f93CFgpPMpFS57rA20cK
	 JFyro6QCK/jGhBYSkQt3f0GO8FOH62is7r1pZ7Ii0yNfChQSp+OH0vF0HV5UedEYrfTPV
	 eaAdItil0xbMFPetyB3g6fgbMi5Jct4zgVXh2V17A+gfV3rV0IyB82LKhT7hJeT9e9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=My+NPPXd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAFB606A32D
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=My+NPPXd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DB51F000C9
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792577212;
	bh=ZIeabLWc8/+X+ra1sWD8SHeL20genn2WdJFRc0Rla+4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=My+NPPXdZzilgi8OU5XGXQa2QWI7Agq9xVcLjDqT6xp/zKF547A6W94nmbklZWwjg
	 rzBYhnKsaVPSSAGbOgdsXGrP5foSTo4jaqPw3swymrzkIYZiq25uiokhyDz+bSCBjB
	 oUTwulDO68uwZXx2+PsfP3JfvtsBH5J7e3Qk/7/x6eGCTzvO5RWW7yjWnNW8u3O7t0
	 gEdGgVqZf7yj9QrugZUbIkrJpTESFLpgW3wyTawItnYm3knuCb7X9MqZA/Wx5ICUyB
	 +WUn/IXuq2OHQFDWydtYc8PPlzEFiYP/iNH7+nlEqBM9ueY5CRR8b66TUuHpOGi8c3
	 tOZxLwWVHvCkQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so308372e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:06:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwMhkHe9OQuQP+cUW5eoz06YlVAPro7TC3pfiaoItWYyvWeKOI4VsWjiygzDI9CGbDwC9Q74BzB17uz@vger.kernel.org
X-Gm-Message-State: AFq9FYISzi+FFJ97n3kGVCh8LNHRWbnquPMU9ro+E0TYxaQ6kiLtjJ2a
	7vQET6433uX6B7X/okl8JXhJilIK95k6WEEwGUKJLaSxZ6jvcqljf7AWtTO+xtDNemnBiHg3/X6
	Isve9Y78KQL830h+j3jfEf4REUM4M1bitssu7To/vUg==
X-Received: by 2002:a05:6512:3d25:b0:5be:54c7:75f5 with SMTP id
 2adb3069b0e04-5bfa1be93b6mr617058e87.18.1792577210780; Wed, 21 Oct 2026
 03:06:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:06:49 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:06:49 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021015004.1537738-2-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com> <20261021015004.1537738-2-dmitry.torokhov@gmail.com>
Date: Wed, 21 Oct 2026 06:06:49 -0400
X-Gmail-Original-Message-ID: <CAMRc=McawKQvXKPHzrSsbjxm3nSmiy5gEGEjfeitBwDX=jBDyg@mail.gmail.com>
X-Gm-Features: AclHuK-DUw-TDKgIDp7kls7bG6fjPSgpfM8RhNNzpQbvwml0tw0TvFN9P4v7edE
Message-ID: <CAMRc=McawKQvXKPHzrSsbjxm3nSmiy5gEGEjfeitBwDX=jBDyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: soc_button_array - use __free() cleanup
 facilities to free memory
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 03:50:00 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Switch to using __free(kfree) cleanup facilities instead of doing manual
> cleanup or abusing devm for allocations that are only needed during
> probing.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
