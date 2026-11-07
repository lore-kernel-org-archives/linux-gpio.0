Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794091728;
	b=gvsO6JCOLAVPyJJzXRklljvcPEM+yjEf/I97ViQzLUqbjuD6QB5P5NjYt1TcwjlxN0Zs
	 8jdxzZ7XOO9L6RAaBIkceC2orKGDWMU+kEHzaltzeNwJ3uFaD8NaxK1700d6FkAdYPf/M
	 eaPwjDNKWJNkHKlO7fZGm6y/FQfahOs1tyOOjmwZmppFypB+EcB/XT3OkEnytH3JCY1Q+
	 16T/HtC5CdBesE9p2R+5NdhuY4HENrPqP4i+1VWzGIRh+iLnq6iimIvFbFqbClxIzmaEI
	 jg9cHYPfOrwUGCPhIlKj4El1VsQlGKESfwX/bymUUPKxazbB2bQt8QeM/aIt3snkvSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794091728;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QuLhFEvmmpbdFe5TBed4DD8fUH5b/6o6JMrvceQqWs0=;
	b=IS1BMlMr+zY7cw8TFxeIJR4qj8Qn9hwvjSi33lA8t78RC52jtW72wkeZlps78cNX11f4
	 9eTJRBG/0oVnSJh0JAFTzLYW5uLIOb+X+NedqH/qcPSIQRPOvGViTfESaEVbNs92yhA9R
	 JXOBYbmzW7sroTGwjD++9CaBCFF0TpjaoHVk7gHmIIdQXBquNZux9dG3Vo7un/KsYvoZc
	 8B12JifEqzY+o4LeBepQ0WiSd5qXoxTBO8K0j6NsTMddJfxt2KNHoWrFsl+AcEZnbAo8D
	 /b+HhhBieMbB8xNREBJyYZL5QuoynRC5h9z0R3oNsTSI/vDj/evcGrczCu4EQD9l3vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iHJdESOf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5424606A32D
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 22:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iHJdESOf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664C41F008A1
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 22:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794091727;
	bh=QuLhFEvmmpbdFe5TBed4DD8fUH5b/6o6JMrvceQqWs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iHJdESOfGkXUhxi+nej8FX8ZZVq7o3gGEAX9jKFPXoGubpeHyJqqMooG0NG+yeqO0
	 KJTkGkUDnh3MrkPRD2JWUAzHOz6hLip8FKVeA/SxiDtn6RLkYs9mFYygIOSJQWEJDv
	 ahKpcMy92jx8GhxTuoKVy0vsyHToqnZoDkCBYoXyowaJ9KNJfFscbClVLq9SNadxzz
	 YISPSKjQdhbC5c525MeY8zTRB1PHxQiUpIOGtvVPJ7cB2crSiFYXuHnI71acuPTeh6
	 IeC7IVxDxBf1iiMtnvibfpH3azhzoUvB65/uTkfKAa3CA4znN/rvHDaFAo5J3wzOfJ
	 qn7yCHXQ2zCWA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso56063e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 07 Nov 2026 14:48:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFFfgnJ+w3Id6mwVPknnp7zpTka9Wcs4cBa86Y7jZX5C2laF6c7FqaIiwuD/mZf7aDs5yGSnaB74xOj@vger.kernel.org
X-Gm-Message-State: APuU4Z+xQCgxUV/h0bVM2nnWeejohlQMnqdv+e2qOPXXmZylvTzFRmjU
	s9Fgty3qg7b4sJ5mHb0YQO+p6MdF2D0Su52ZxtGL+nI8KIw5tNyqcFkUBjbXNtfQKLm/xs4tcjU
	n5mo5IfiMgD8w26tYjWJXls5eIc4igZc=
X-Received: by 2002:a05:6512:1048:b0:5bf:cabe:23b6 with SMTP id
 2adb3069b0e04-5c003a9c26emr1737966e87.33.1794091726181; Sat, 07 Nov 2026
 14:48:46 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpiolib-of-hog-uninitialized-v1-1-fcaeaccefab6@oss.qualcomm.com>
In-Reply-To: <20261105-gpiolib-of-hog-uninitialized-v1-1-fcaeaccefab6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 7 Nov 2026 23:48:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL=xWDA=JsD+JmX+1i6fs3dRXztUk13mcTvKcnO9Lq7tqg@mail.gmail.com>
X-Gm-Features: AclHuK-twRwCMVL7cQuNhWiRM9_Y2ubKODxjVoSRNRTWzU9h1XAiKR4cV_MVtR8
Message-ID: <CAD++jL=xWDA=JsD+JmX+1i6fs3dRXztUk13mcTvKcnO9Lq7tqg@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: fix potential misconfiguration of hogged lines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:37=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> In of_gpiochip_get_lflags() the local variable xlate_flags is declared
> without being initialized before its address is passed to
> of_xlate_and_get_gpiod_flags() when processing a devicetree gpio-hog
> child node. If a driver uses an of_xlate() callback that doesn't update
> the flags argument (like gpiochip_fwd_delay_of_xlate()) we'll end up
> passing that uninitialized value to of_convert_gpio_flags(), potentially
> misconfiguring the hogged GPIO.
>
> Initialize xlate_flags to 0.
>
> Cc: stable@vger.kernel.org
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Closes: https://sashiko.dev/#/bug/linux-2bb44847-fd6e-406c-878d-9739da2cb=
8b5
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Right! Good catch from Sashiko there.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
