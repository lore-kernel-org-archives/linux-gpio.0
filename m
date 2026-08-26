Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662340B6E2
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756822; cv=none; b=JkqD7mrMT5mORduEVp7tRoNFiOdopxSzPWhjMNiVhFjeoKOwbKI7IX8EImBQ1yJcLd/xaAMWzsinnUBwxJ/K1iGTc3yNu1/CSENB8IGY4shmZRgSUsAgKvOXNLuzZJOuKZhGm/d76HHl73Il5ygZWKNJZrMICYxAZobLuMyMycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756822; c=relaxed/simple;
	bh=9HwWGZNlQQx9aThkp1U5qXNMOWuuT1TXLlltrjPd004=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olzZre7OpBjKR/uOSsmrWOgpEHEQIII1Ztfep7LvlZV9a8zuNPrkdQl0jHlLzJYu2r+fezYiz7g9Nqrc75lBvUWOKgglkGjlr4xFLSv8HewCELedGuWzpI+DfPGUoVyVQvSuGPPk3rCHK7MHDvA4XExXlbjdBWj907S+0v2c0lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMS57k9y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMS57k9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD991F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787756820;
	bh=bWy/hsEmThLurhqInVdnKwmSy2HFYQcbkQaYbiG48EI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZMS57k9ym6NOunB+19jDohO/sz9nerAiqh2ogqTeg/UAiHfkKT+GcFSosPENdA2VY
	 kCj1HlmwMLHDWzIKBQUjq5V/5qronGob8WkqPCqeoqKzX7ft1iUomza1UoVag9DJNe
	 kLCf3ptKKXiR+3WctO54UBCeEp1WayRlrufsH3fZJM0wvtWVT0xcM+v0JpCBKUAjsc
	 0xbNrurmrvvYbDpdGqIzFcOWpePjSrjZJQVjVkf2+G9m9K/uUDvEA/4keTorpVrIrx
	 pBJs0nF60uq60ZmoX6TT+rZsn/xOhnA4UnjkJ3QpubUDZw2aJPb9FEfXlVdv6HOigc
	 OWBjUAE+W+55A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aec201b582so1044818e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 08:07:00 -0700 (PDT)
X-Gm-Message-State: AFuF++kYEL4eC/hlaG8ODRpCEqjw4nVoPuPgprMn/eOCyvmayK/Q5Q/H
	pwJEzDrtqwkuNX6fEgBMsmvEJbdx3jklo5Wz6ZR2bbQNEDWDeXe3Uem0VM4doI5VZZ8DaQlRV3a
	yj44L46OE2VCivlgVUPGWbMRs5Lao8uDJtjGwhgfZVA==
X-Received: by 2002:a19:5507:0:b0:5ae:bbd3:27e3 with SMTP id
 2adb3069b0e04-5b4a900a129mr1641968e87.5.1787756819502; Wed, 26 Aug 2026
 08:06:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 08:06:58 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 08:06:58 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260820111234.1085436-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813193715.2346477-1-mehmet.fide@gmail.com> <20260820111234.1085436-1-mehmet.fide@gmail.com>
Date: Wed, 26 Aug 2026 08:06:58 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeCeGDEGbDMtHZXGuiPQV-QBYfNW50MmiJ0ke=De2_nVQ@mail.gmail.com>
X-Gm-Features: AcwNN1VUFsp2lcDBnVUwH3wjnXiuWBQ9e9uP6rtiiIJvG2kr5VnZcvhrG4KG9dk
Message-ID: <CAMRc=MeCeGDEGbDMtHZXGuiPQV-QBYfNW50MmiJ0ke=De2_nVQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: return quietly from gpiod_get_direction()
 without .get_direction()
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 13:12:34 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
> Hello,
>
> A gentle ping on this one, sent a week ago and I have not seen a reply:
>

Yeah, this is August in Europe for you, I've been OoO and will be until the
end of this month.

>   https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/
>
> To recap: gpiod_get_direction() warns when a chip has no .get_direction(),
> which is a legitimate thing for a chip to lack. On vf610 the direction is
> not in the GPIO block at all, it is a bit of the pinmux pad register, so
> the driver cannot implement the callback and every caller that asks for a
> direction produces a WARN.
>
> Happy to respin or take a different approach if you would rather solve it
> elsewhere.

I would rather implement the missing callback in gpio-mmio. We already call
into pinctrl if needed when setting direction, could we call
pinctrl_gpio_get_config() here and read the direction from the underlying
pinctrl driver?

Thanks,
Bartosz
