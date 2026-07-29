Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B734582DE
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326711; cv=none; b=MS0P0YERdQrhFzC/ZoZ6oZCP34itGb2byGeUPqc9OtxSriyM/LU5P0PrADreMMdXkA6WOaTwpol6VBkDPjup2bI3N+DuHNLQEYyeFatDb40wwZ053viEoP9LozBU4IGKomyb00zUoOpI2UOe7zDCr8KoLA0Cd/Bu2T7MSj48FbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326711; c=relaxed/simple;
	bh=GMc8rxJ/KjL6rphVFdTqYUh1ZMQzfUxb7/IFgKvy6S8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNe5MVkuqRBvyTF96jjF0vvQRBfzeXeZbf2BaHsCY8aitccwt3ivXLnFb5msPBZAehuPuOTpIEDRCtVintyuwgr3dpuRN+gQzDYre/kScS2IjX0LWxSMKtcP+265TIIKfBlOCjRZRUKjvYdpeFa0hjoAsvCilLjM+5Khe1AKtNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1QQ5q3T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1QQ5q3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE041F00A3A
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785326709;
	bh=GOMKQKK8qMkZBpt81UGEM/4x78s7SDOI8h9FLDwWwVI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=K1QQ5q3TgqwoV1ia8hWc5pSw5Q+OHVWZPXX0hrXGZrcXcZF4WO7EUy1ReP2nR2Ajh
	 XtORVQ/b0nRrRSvrireGbD8oQbx9M2FfAodXQlNXB8+8HnWBmtX4ijs+sJGAXVd7yR
	 Qy28SyyWX6e82MfbdzgjU0B5xfKavuSU3f03CP22FeW5gpJaTiyNoBbiKSmdulO5O8
	 SVVQhHqnZDLCZZl5nNOgYKD0RW5jlIT+p/CqKPnofBsgD3S6nwlngvgq44lUQH9Fg1
	 RxrPZ71Pfm5RMrI6QIUAJr9uOvTk/YIqC6oZHF1qi3HeOWZYcNdcX2VDDv32tyLatq
	 qM4BdEiUwdByg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so1037015e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 05:05:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roya8YigUOy3ox0Lll99IpyYxsCKr1g6nbfpVtah1m+DVOpAaprMkXq1J27QxA2YtRP+caJrGWhIIQw@vger.kernel.org
X-Gm-Message-State: AOJu0YyzfGL0skhLaLRVTIknsAsbAEHDBU7MgrGLSJF3A5yIGz79Vmd1
	4Lvh6mWC/0FJZDQWw3awFpoGwx65rb8ToHJeqTtuP3rwUwvU9hj/eyBC3ROQQDSR932gqVQXIym
	7noYBCPEEOvnqAT57gbrhdK9aVZK2fjjU20yk4sM4tQ==
X-Received: by 2002:a05:6512:158b:b0:5b2:a919:f9fb with SMTP id
 2adb3069b0e04-5b2d02232d4mr1407054e87.22.1785326708196; Wed, 29 Jul 2026
 05:05:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jul 2026 05:05:06 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jul 2026 05:05:06 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <c6eb70aa0e1ba6e15f947c827006aa79edace05c.1785318836.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2565e33e629d16d9e33086570834146bb1c962db.1785318831.git.chleroy@kernel.org>
 <c6eb70aa0e1ba6e15f947c827006aa79edace05c.1785318836.git.chleroy@kernel.org>
Date: Wed, 29 Jul 2026 05:05:06 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdpYBZqTVeME2Bd6+6e76f8pU04PWiidbsfGCPSy65TtQ@mail.gmail.com>
X-Gm-Features: AUfX_mzq7ZVpTopgcSr4EblAUlv1nRkcH2m8kyb6qKgG3g-yIZi9OofmPCxKQ4w
Message-ID: <CAMRc=MdpYBZqTVeME2Bd6+6e76f8pU04PWiidbsfGCPSy65TtQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: implement get_direction() in cpm2
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, 
	RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jul 2026 11:56:48 +0200, "Christophe Leroy (CS GROUP)"
<chleroy@kernel.org> said:
> The lack of get_direction() callback in this driver causes GPIOLIB to
> emit a warning. Implement it.
>
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
>  arch/powerpc/sysdev/cpm_common.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
> index 07ea605ab0e6..b5d200e3ad68 100644
> --- a/arch/powerpc/sysdev/cpm_common.c
> +++ b/arch/powerpc/sysdev/cpm_common.c
> @@ -181,6 +181,18 @@ static int cpm2_gpio32_dir_in(struct gpio_chip *gc, unsigned int gpio)
>  	return 0;
>  }
>
> +static int cpm2_gpio32_get_direction(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
> +	struct cpm2_ioports __iomem *iop = cpm2_gc->regs;
> +	u32 pin_mask = 1 << (31 - gpio);
> +
> +	if (in_be32(&iop->dir) & pin_mask)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
> +}
> +
>  int cpm2_gpiochip_add32(struct device *dev)
>  {
>  	struct device_node *np = dev->of_node;
> @@ -199,6 +211,7 @@ int cpm2_gpiochip_add32(struct device *dev)
>  	gc->ngpio = 32;
>  	gc->direction_input = cpm2_gpio32_dir_in;
>  	gc->direction_output = cpm2_gpio32_dir_out;
> +	gc->get_direction = cpm2_gpio32_get_direction;
>  	gc->get = cpm2_gpio32_get;
>  	gc->set = cpm2_gpio32_set;
>  	gc->parent = dev;
> --
> 2.54.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
