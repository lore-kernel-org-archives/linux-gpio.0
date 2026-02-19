Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D257E2F12CF
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498095; cv=none; b=K/l5EbbBta98g5jgRum9IUp8Zb5aGGwGmVRT+wMQ9i/bO++Y+DzVzI+yY8ncWlXeH8l3cWIaVJRPCCx+8D8gZRm4lqPlb5XxRgJnGi2hDhzVKAu9cmNevo9YlC2nIJGM/sDg54y/FuJvUtx5gytFJZ3neb2G8X6csTHoHhrDkKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498095; c=relaxed/simple;
	bh=EQLG7dk7RCT5qRYDu9dhxJCxHBJ2mxG7SkYqZQeFsLo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isz2BI9BOMk1zTf7x3iWMkZU0ObZCguG6e4uNNGxPU7mE3u/ZDR31Ik083kZE9qIo913s55ruL911dJQ/acEe3j6jFoWzIFk9m+caPcDL5heipUAgj+KDTdSg1qxfWIauFg6mHbGuzd+qarUtw/shjeE5Ws6ShqgHytWYbCLJyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNETWzzh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNETWzzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833CEC2BCAF
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771498095;
	bh=EQLG7dk7RCT5qRYDu9dhxJCxHBJ2mxG7SkYqZQeFsLo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=RNETWzzhPnact2fZwoYemaJDTlOQIjpeYPaEHE0OAeJq/vglwrxV86/VwCUgnmByW
	 VGw56BINjtBhOKAlrv7L4hmQwuZOc79/KM/Bl02Utiq+4NcX7qVs0rlJMJ/wrQ6x+R
	 qDmCCvwSjJMNt4mTLiCssK5Vinp+2AT1VCYP251PEYyimQX/3+cOm42WZn42e6TzMi
	 D+YQ/JQ8BW34TQfWJS6LWZuBce/UNChtie4kRXgUUL5G+U8A4S/n/ac/EzG0GKabHd
	 fFL5dgg/neeLThSefAjvyik3hZh0CR4mM+TumN3TrivFDO72xlsq1RJymkzq6IdPFX
	 ACLEROiDZkNPg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59de0b7c28aso956139e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 02:48:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdAt92ubezONxaluvN/kKTb+9J5w0Loq/yN/rQ5/p3n2vgCnsCHdZakW9VdrTMPWyctxgbKmFFWa2W@vger.kernel.org
X-Gm-Message-State: AOJu0YywKn2NQxNMBFjS4RezivTKx8CMaXcZSibOmmYqiftN/ofXWpLg
	0mjPNBkqGCmxbKWt7/2J3B9n0lUZq1Ph6IsTbFKV83F2KgJddo1dtDkYMMBvvkPAukneOZRKwAZ
	30wQ8MpVajYOOuys0Yn25MOijuKADwBM5Wo8Ff9kewQ==
X-Received: by 2002:a05:6512:238f:b0:59f:6947:d072 with SMTP id
 2adb3069b0e04-59f83b97d14mr1773283e87.7.1771498094107; Thu, 19 Feb 2026
 02:48:14 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 05:48:13 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 05:48:12 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZYmtq2CAWhMo1Eb@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYmtq2CAWhMo1Eb@google.com>
Date: Thu, 19 Feb 2026 05:48:12 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mcsa0tpg9KWnnunpxU+Wuy3cpCX0=84jmVHP2pYiyPLPQ@mail.gmail.com>
X-Gm-Features: AaiRm50EvJxRDcS2E9XQtnn1RNYpQr6jqiKi_Yky6FYDprYsmibAwaaoOrFwcNc
Message-ID: <CAMRc=Mcsa0tpg9KWnnunpxU+Wuy3cpCX0=84jmVHP2pYiyPLPQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: max9286: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Feb 2026 21:53:48 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by max9286_gpiochip_get() is
> normalized to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/media/i2c/max9286.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index e6e214f8294b..ac0712ce1e65 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1205,7 +1205,7 @@ static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct max9286_priv *priv = gpiochip_get_data(chip);
>
> -	return priv->gpio_state & BIT(offset);
> +	return !!(priv->gpio_state & BIT(offset));
>  }
>
>  static int max9286_register_gpio(struct max9286_priv *priv)
> --
> 2.53.0.335.g19a08e0c02-goog
>
>
> --
> Dmitry
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
