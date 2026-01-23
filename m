Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6541891A9
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 19:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769196439; cv=none; b=LtuokvavZ3ketU8oirpld60ocmZ3k62BEM54h9IkADde58eXk3ecMGW7Yxw8w6fwbz18eCzA9v95TP/tWGx1Net3RfYyO2mHG7y5yIxOsnogVzcBs1z/raMTHL/ko0DZupBh46NeQRPobq9Dwk/J7yCqGsohBhrb/EdPukhcaXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769196439; c=relaxed/simple;
	bh=pIOjdspmv4mVKi5jWqfseDeXVzFTwtYPpKoKsC16Joc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UClA+v2QIfN8insyn5AYxIOWBrVl1hK55sBXmA7attUikYqypzjzLOJnQU/jlOuar5ZiqV7pgOHafMR9eSoR3Qix4Zkidnk7eUJ0+9s7PWCYQnCa6AYJZr18UpVEv7BsRoCmf92tyS/kRS+xOELPUxKfE0SyTIfPBUEKaUXfvMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHnmOeOY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHnmOeOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A1AC2BCAF
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 19:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769196439;
	bh=pIOjdspmv4mVKi5jWqfseDeXVzFTwtYPpKoKsC16Joc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZHnmOeOYRdh1IBJMz8YI6GASYt6es1tB5i3Utnma3wd0m9eb9pSB1pl/unxMCpCda
	 ym0d0c5EPQRTQLS88HWNTlL7LnEE/rrlDJnWw2f2nJYB12uQcC5Dvc4NpJH0b3X6Wv
	 22uA83fwgn62Z/5az8/HNo3Pt5pIdwknQvkA1jNT0/pJnViudxrEnhDI3yOPh0jJOP
	 q1HV8xe9ymGJWeUXHYFd1I0WprLVeySEe2D0ublqs7CTL29VHjPZ8+qMMLJTYgw3Ty
	 e/bWNk40/mQ8pX642IBjwph2LW1uXuBqydTb5oytTC4xkSmSXAchk4TdV7C61x2cM2
	 jenPu/PTcjHZQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-382fb2bb83dso16659921fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 11:27:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkzfH/9pyHmxJ/gl/avmvxg0Kn9vIpilBZwVSDfHk/D4vgftjFsQCN3YDG9y5DD6qrQPBdbRUC6dd2@vger.kernel.org
X-Gm-Message-State: AOJu0YyE9lctKrLMQPseqO7JX1xpAAJswUSwxrV89uHGjLhs+B9OXk4l
	Tm3uS/UbG3WJzEc/2gWV5XrQ3m0CLVrInIxZK5Qomq0kOVn/bL6YtjKK0m4i8/viwmiXnuqqYyd
	nirpUHrRYCPYtZJ5dhYO78Tw0UIf7+LUyjlYHP4lnmw==
X-Received: by 2002:a2e:a884:0:b0:383:1704:2203 with SMTP id
 38308e7fff4ca-385e1bbf407mr7131441fa.27.1769196438100; Fri, 23 Jan 2026
 11:27:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <aWGSQYCXP4R08koQ@venus> <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
 <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
In-Reply-To: <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 23 Jan 2026 20:27:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
X-Gm-Features: AZwV_QjQbGS9oFegdz7_zzo5pejoUBgMNWZYbLLOHYRKiiTOeEXbzmNqH6cpZ_E
Message-ID: <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 2:27=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> >>
> >> It's not a big issue for the hdmirx driver specifically, but I wonder
> >> how many more (less often tested) rockchip drivers use GPIOs from thei=
r
> >> IRQ handler.
>
> Yeah, seems this finally reached my distro kernel and now the kernel log
> on one of my boards is totally flooded from gpio_ir_recv_irq()
> (legitimately) calling gpio_get_value()... that's not really OK :/
>

This has always been a sleeping driver. The driver does not know the
firmware configuration it'll be passed and - as I explained above -
depending on the lookup flags, we may call .direction_output() and
descend into pinctrl which uses mutexes. Ideally, we'd make
GPIO-facing pinctrl operations not sleeping but this is a long-time
project and quite complex. Telling the GPIO core that it cannot sleep
is simply incorrect - even if it worked for this particular use-case -
and has an impact on paths we're choosing.

Can the GPIO reading in the gpio-ir-recv driver be done from a
high-priority workqueue by any chance? Or can we make it a threaded
interrupt?

Bartosz
