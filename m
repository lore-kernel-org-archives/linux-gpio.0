Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4592D46CE
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744621; cv=none; b=HB5bXa4/csGQoeFAGKi3zWWCUyHNwJSjErZHF+uiORALiDBrvH1o1+4lr9MU0rCEGDhUgO+peS1OLrBZECXivHCzQQ9S58PtMOjABivq+QK+VRlABhwvEodBGh9Fsa08cl0BL1efHIO84f+EohatsSmMwCk7ZAp6TUBsElqXNA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744621; c=relaxed/simple;
	bh=zBeHtVdFm4TpuvWo/Z1ESxVIHYVmX/W6V+DGMX60zvU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzmLHpbU4cdsJAZ3Tyb4O8r2rgzPngBEjdPir7lYEHQMEuQr4a48jP8b3U8yC9LKZicAm9LWbDuuk1HCtpsF5Y42eAPJ8wa04Ngo6URZxeLNpv3IBJthdhFwozJj3DQPNzv+2ab34hhLIIrdofKLDB1m026VxFpL8JiEHRQYHQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnrzHatL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnrzHatL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8E9C4CEF7
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775744620;
	bh=zBeHtVdFm4TpuvWo/Z1ESxVIHYVmX/W6V+DGMX60zvU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=qnrzHatLfwTp0BUHvvKnqsD0R2oJXZRdeiRREfxUeB04R4hB6vaKtFnq+OCMuHBeQ
	 9k/s8Vj9s7Dd0MBaFBigeobHdc/AKiIYsBWbPZXxCSOiWho/ZAgZU7E8nwbNE/8v27
	 CTl6yp3gydnPjTdqwAj+m93Dl0/ih6/TO7bV+AjGSlao1gRLI3Myfr0AXWoxtgD4MS
	 PwMlx3raTVK0V/H0iFt3IGsDeEmSIn7Z99Si9Tx5tDJU6zolf8Du0HISI0S00YIrmo
	 XhjlqcWdfSEu9g6nkjGAtPbZMwd4PyBZrYmKICnhXO8sx2JvF3jMzqjPhud20weSlo
	 HohQFXS2egIHQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38be5e86918so8704641fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 07:23:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIiwq4L6uMsN3rdXGbKcTKHt6u7+RGO1n3sWofdKERanm2iomrZfsJP3c1LeaWZ5rrH/DSt/Sy96P/@vger.kernel.org
X-Gm-Message-State: AOJu0YxhkMa1aYRGy7efyE7HiJ4JOdgZA4XWPkuGP19B2qWtmcSEGNYl
	Ipnu7KvWvk+ZqnxV0nKyGS7N/jZm0J6VLHvONpZ/VFnK5DOzT2WSyWaa58AcSnj+tpwsf/L4x2v
	KexAUvvkK/+ejUqjoX9BXiRZ+n8HazSTV4IK09WLvWw==
X-Received: by 2002:a05:651c:54c:b0:38b:d4a7:fee5 with SMTP id
 38308e7fff4ca-38d8d38127bmr76966811fa.11.1775744619067; Thu, 09 Apr 2026
 07:23:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Apr 2026 14:23:36 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Apr 2026 14:23:36 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260409132724.126258-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409132724.126258-1-linux@fw-web.de>
Date: Thu, 9 Apr 2026 14:23:36 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mdh=P8ABX2kO-j9hp0oy=1-9rJZUYwZR4APNz1qK9FVcQ@mail.gmail.com>
X-Gm-Features: AQROBzBojIHyh6ij-bhM7h7LoaBI_Xezqn1PT_cOwwYyo5cbIeWtn5wivfjzZcA
Message-ID: <CAMRc=Mdh=P8ABX2kO-j9hp0oy=1-9rJZUYwZR4APNz1qK9FVcQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: fix trace on missing gpiochip->get_direction callback
To: Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Apr 2026 15:27:23 +0200, Frank Wunderlich <linux@fw-web.de> said:
> From: Frank Wunderlich <frank-w@public-files.de>
>
> if gpio_chip.get_direction callback is not implemented (e.g. pinctrl-moore) there
> is a bunch of traces because of this.
>
> Just remove the WARN_ON to avoid traces and restore previous behaviour but keep the
> sanitization active.
>
> Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 86a171e96b0e..302cbd7989f3 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -420,7 +420,7 @@ static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
>
>  	lockdep_assert_held(&gc->gpiodev->srcu);
>
> -	if (WARN_ON(!gc->get_direction))
> +	if (!gc->get_direction)
>  		return -EOPNOTSUPP;
>
>  	ret = gc->get_direction(gc, offset);
> --
> 2.43.0
>
>

I prefer GPIO drivers to just implement get_direction(). Looking at the code
it should be pretty straightforward for this driver.

Can you test if the following works for you?

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c
b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 70f608347a5f6..071ba849e5322 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -520,6 +520,23 @@ static int mtk_gpio_direction_output(struct
gpio_chip *chip, unsigned int gpio,
 	return pinctrl_gpio_direction_output(chip, gpio);
 }

+static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc;
+	int ret, dir;
+
+	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
+	if (!desc->name)
+		return -ENOTSUPP;
+
+	ret = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &dir);
+	if (ret)
+		return ret;
+
+	return dir ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
@@ -566,6 +583,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->parent		= hw->dev;
 	chip->request		= gpiochip_generic_request;
 	chip->free		= gpiochip_generic_free;
+	chip->get_direction	= mtk_gpio_get_direction;
 	chip->direction_input	= pinctrl_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;

Thanks,
Bart
