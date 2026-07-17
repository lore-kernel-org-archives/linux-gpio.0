Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442413AE185
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784274090; cv=none; b=QGNjqzHjcJ93+HxyKkFmGcIhDUCjR7eUHBxx74ENw4Z5FCfB9qV9Dmrl/Hzq0XVMiFjvefH0u4pLyA6hT0t14U3p9K1pjh3CXjRXPpqRugYX8jhn2kndlEEMvD7bVkqQy/q8nuV0f0xUnzwFmSii/LksmJS9OIlnC6cLNHXLbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784274090; c=relaxed/simple;
	bh=Gbt8AAEZ2+OoVkZqGOUFGJ1glUjuYYPOXFOlTCeRvWo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijlDjMJCBkIIN7hmpb/85nWiNVm6QzNcfzi+4K/GOnuuCFbe5wYJH/LHKUbP3NbiWZsf+2wKaMd9m2ZT3KaHfRtJgglhX6Jqs3PGYZMykuDYk5/7pf6ZPyQ9IbbktHjm2FTR/1DLi7znaFgAd347VtQ8c1EzOQoqTsK7/hnBgYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpnzBQqS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpnzBQqS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3311F00ACF
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 07:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784274082;
	bh=O33LBv121cI3446+fALTqMiAlHo2my8xGCUrTRDo3IU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VpnzBQqSU2+aYIUXnkuJKpv+UStrbyyXbtwUDkYcu7mS80/z+9uIN72kTYhkA1FLv
	 c6gQJgpV0nG8LOAMkzh7tToNhJhcaw5O8Pv4AY9klzgkL69iVosZO+xpcl754X4Fhq
	 8Bi6jkdwMd2T0IIKX0rGCa4O4Tm/vNnkGUfknW2RTNWGjlYWDMt6GQxfQbkajQhm2F
	 JeN0yyMVnSQlb859olgZDUM3U70xFBUGPtBRhdRncL3jyW/0D8+8+KjJVAKV9gOD2x
	 jEut/hFjwx/yr18ayqGO+r3ouBNOGQ+DGn9yaiSOxDGBcrDcMy32qroyux44n9QBxo
	 N7kwiNAmCiUZg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aec6360133so5982044e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 00:41:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoaW/bqwTcAftw+ZBscn0KpPLsFCTiGMa2HwqayltydWuNPYq5lSvJVw6kyc+KNBx9+bgRtINCL5Uet@vger.kernel.org
X-Gm-Message-State: AOJu0YzoguShnqnVn4MWsjw60AAEV62hUdRmMYFliD0tOwj174MxY0Qk
	HQIoPCG92UYNBM9AXnzdDBN2+X0yHF0Wi1RgpSDXkkswgBPu0cFi8yhf7NaP38en44kzVAbsSgo
	D56V4VfwYG5QR8Vj4GDXiv7vfaoe/4SV2m9WQlVMevw==
X-Received: by 2002:a05:6512:63d1:10b0:5ae:b0aa:8f07 with SMTP id
 2adb3069b0e04-5b28f8742cdmr256639e87.16.1784274081030; Fri, 17 Jul 2026
 00:41:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 02:41:19 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 02:41:19 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260716210813.2582826-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716210813.2582826-1-hugo@hugovil.com>
Date: Fri, 17 Jul 2026 02:41:19 -0500
X-Gmail-Original-Message-ID: <CAMRc=MerwHnK5sdw7JRyzkhrRZF_2vSjcpOJ6R=Lz9rbKGE5JQ@mail.gmail.com>
X-Gm-Features: AUfX_mwRwl5xhGKjVcL6rRS5fp6CK4RLwoUeOyI0kRluQd6smz7Yf4G_2u2wFj0
Message-ID: <CAMRc=MerwHnK5sdw7JRyzkhrRZF_2vSjcpOJ6R=Lz9rbKGE5JQ@mail.gmail.com>
Subject: Re: [PATCH] serial: sc16is7xx: implement gpio get_direction() callback
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jon Ringle <jringle@gridpoint.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 23:08:09 +0200, Hugo Villeneuve <hugo@hugovil.com> said:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even when the direction is tracked in
> software. The GPIO core emits a warning when the callback is missing
> and a user reads the direction of a line, e.g. via
> /sys/kernel/debug/gpio.
>
> Fixes: dfeae619d781 ("serial: sc16is7xx")
> Cc: stable@kernel.org
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
> Inspired by a similar patch for max310x: commit a483b1a91b33
> ("serial: max310x: implement gpio_chip::get_direction()").
> ---
>  drivers/tty/serial/sc16is7xx.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
> index 2498f9da2bf77..943be318de410 100644
> --- a/drivers/tty/serial/sc16is7xx.c
> +++ b/drivers/tty/serial/sc16is7xx.c
> @@ -1273,6 +1273,17 @@ static int sc16is7xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
>  	return 0;
>  }
>
> +static int sc16is7xx_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct sc16is7xx_port *s = gpiochip_get_data(chip);
> +	struct uart_port *port = &s->p[0].port;
> +	unsigned int val;
> +
> +	val = sc16is7xx_port_read(port, SC16IS7XX_IODIR_REG);
> +
> +	return val & BIT(offset) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> +}
> +
>  static int sc16is7xx_gpio_direction_input(struct gpio_chip *chip,
>  					  unsigned offset)
>  {
> @@ -1350,6 +1361,7 @@ static int sc16is7xx_setup_gpio_chip(struct sc16is7xx_port *s)
>  	s->gpio.parent		 = dev;
>  	s->gpio.label		 = dev_name(dev);
>  	s->gpio.init_valid_mask	 = sc16is7xx_gpio_init_valid_mask;
> +	s->gpio.get_direction	 = sc16is7xx_gpio_get_direction;
>  	s->gpio.direction_input	 = sc16is7xx_gpio_direction_input;
>  	s->gpio.get		 = sc16is7xx_gpio_get;
>  	s->gpio.direction_output = sc16is7xx_gpio_direction_output;
>
> base-commit: da7b5fd4e17f8e44c5590f2d603c01d499f056e6
> --
> 2.47.3
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
