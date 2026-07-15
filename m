Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19A30CD80
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108392; cv=none; b=J1XELFrItz4oQu/NMiytUj2+wVJWCpcMK6TM7/j5fANTwAjYotJlpBNTrKGVvokLjCZWH8qbZWrLeilUbcegbUxwTP96S/vwffPxWSJioqhCJuQHsKa6DpjHD9RoE6Xw0jgXhEK928xue4WwxdjgRnst8UCGrCOaEPqicnbB4tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108392; c=relaxed/simple;
	bh=Qz3sYTsIi1/xJ6sQjJpB8d/Dlyku/yQ8I5SmQ6xascA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDTYN0un0QfWc6G5gHNp4VCZt0O0eiOXckAoY1F35AadeWei/UmDezBDjipqyNWzi9XvNH/O42x6+jNI7eMYkqcZwhW0ScJ+UC3no9Y0QBk6tAe++0TBOTqO0AuDzmlytpQ5ouRjVm76vAwgVqYzmCn3CMMY4PcvQUYuh4ZfME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYO1jeM4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYO1jeM4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899A21F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784108379;
	bh=vgP1ciFHHEy2aNX8fdXiSkbeB9jhlrSut/HtS4LRTiQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NYO1jeM41wwN6HWceYVuKj0b1Cd9a2bRnQX9tuTArr02xM4nwvjlCcayOUyc426Cb
	 /x/5zwvH2xjxnYpgY9KpK+iCGs1MUwJmTxaofOJ2M1Xy8bu6Kpd/I/vBfCxl8/iw0B
	 CEpcsiqI0ub78bGkrY92DiJQ+r/ftetLOS0lsp4/66vNMnFYUHSoOAaQRHtbtzB083
	 0fjFAkAF4qgtZlDVDMw8PkOwj2hZ9WKE/bUG0e8RIJ3fSwOyoxMpkPVXp81CBrmqmW
	 8FAC0ai8uhNxhBMp/6Nd7ejo2z8eV5Ta624kJDGffWN1mfk+t6Z1OqcJawrpaDM+QD
	 aGhoH6yQil2FQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b01910b499so1721031e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 02:39:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpzWIGhJbWDTZIU6k49wNQfQ2wkjzYwUUWWbcI55I6ofrSb+t6JDjZk6WZPIi8v/e8EIdN3WVhduB8w@vger.kernel.org
X-Gm-Message-State: AOJu0YwAdfoILPMkBkX4o/3ZMsF1eThrFkp/a1o3coGY6LdiKfxJYrZZ
	PYcrIzJsD3PDOzxmND6yhMhT3gxGQi3qZCz5bSXmDs+tv9rrv25s/pdStqBLMFsYpSMofn8hfof
	DTFzGxOTbbfTgEl4tdU+N3Etw/eIZeO4+wR9bWn6Jag==
X-Received: by 2002:a05:6512:1383:b0:5ae:b62b:68b2 with SMTP id
 2adb3069b0e04-5b01c3e61f9mr5225339e87.2.1784108378264; Wed, 15 Jul 2026
 02:39:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 02:39:37 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 02:39:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260710183439.996923-3-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710183439.996923-1-adilov@disroot.org> <20260710183439.996923-3-adilov@disroot.org>
Date: Wed, 15 Jul 2026 02:39:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=MddZxoi_=QCFYp1PM8OwsWbz-Tsmoa7TMkQ1bh+qf-pdA@mail.gmail.com>
X-Gm-Features: AUfX_mxMp8HTvBCGjbXg4xiW_glQFNWxFavr5ZgIi8rTBWEzgus20rE8H7XP2fw
Message-ID: <CAMRc=MddZxoi_=QCFYp1PM8OwsWbz-Tsmoa7TMkQ1bh+qf-pdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: realtek-otto: decide bank_read/write by device endianness
To: Rustam Adilov <adilov@disroot.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 20:34:39 +0200, Rustam Adilov <adilov@disroot.org> said:
> In order to have a working gpio controller with SWAP_IO_SPACE,
> the way bank_read and bank_write are defined must be changed and
> separated from GPIO_PORTS_REVERSED flag. That also includes the
> flags parameter used by gpio_generic_chip_config.
>
> To achieve it, use the device_is_big_endian() to decide the
> bank_read/write parameter and the flag.
>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
>  drivers/gpio/gpio-realtek-otto.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
> index 491fde846d46..f96072fbce92 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -393,16 +393,19 @@ static int realtek_gpio_probe(struct platform_device *pdev)
>
>  	raw_spin_lock_init(&ctrl->lock);
>
> -	if (dev_flags & GPIO_PORTS_REVERSED) {
> -		gen_gc_flags = 0;
> -		ctrl->bank_read = realtek_gpio_bank_read;
> -		ctrl->bank_write = realtek_gpio_bank_write;
> +	if (dev_flags & GPIO_PORTS_REVERSED)
>  		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
> -	} else {
> +	else
> +		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
> +
> +	if (device_is_big_endian(dev)) {
>  		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
>  		ctrl->bank_read = realtek_gpio_bank_read_swapped;
>  		ctrl->bank_write = realtek_gpio_bank_write_swapped;
> -		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
> +	} else {
> +		gen_gc_flags = 0;
> +		ctrl->bank_read = realtek_gpio_bank_read;
> +		ctrl->bank_write = realtek_gpio_bank_write;
>  	}
>
>  	config = (struct gpio_generic_chip_config) {
> --
> 2.55.0
>
>

Can you look at the sashiko report? I think it's right about this change
possibly breaking existing devicetrees. Can we keep big-endian as the
default?

Bart
