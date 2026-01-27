Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CF4200C2
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769506175; cv=none; b=P5fr4FSSBC4LrCo1U/RwGtrYOFPqvPgSl4jSc4ivQQBXmrY5Emolt2QQbJQVBgWY6EWIwiGum4zmWYkoNAXRJnQyeX6DrZZGF/6J84SbxeMIi2syyeywi3E5gFy/YpWb5D8J2WZV99w4q79zaM/AgkVhIA2ltbUtINeYU9zQ/BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769506175; c=relaxed/simple;
	bh=ieVlVvoMsZSn15zBQGDeCdYIVgUxFuPAAPjfaNlism4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qp9NxM5TiF+T2WEisWbjD2N22+OyA4gR2nU2/yxocrzTwBzs1U5j8otIAN+2JtOzO3BWTYXFdMr7gMTUk9O/fTTm/D1tuSppz30chiEIeDfjSaOgklWM13tE7J7kAF3HIyXLfRzdUhEomjfYE6zObHddFYnoru3zJAYhLBl9vo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSZMQahk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSZMQahk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A886C116C6
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506175;
	bh=ieVlVvoMsZSn15zBQGDeCdYIVgUxFuPAAPjfaNlism4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZSZMQahkxCmNCs8y1W44QzWtAgAU2LkNUZLDIP8uvSJ7ReaEOGTbAbBex5W61nE3n
	 F60bDbBQfOgtgJ9D8H9V6CUdlNNrfLjewBq7j7wbNg1R6uJyvmvV41NlcV2hMpaPj9
	 fuBstJksHKowPB6Vk+d5PB0OKT9WdI5NdvYhcLxP2eYI22Tr3xJHyau1ZGD8Kb/vom
	 fOxMKBqYQSfCQLZ2ji/CBEAH3r+IB683RUNEiY6ePhAPOaaBYefT2TStLwEgGCUmfR
	 oU6leXWGg1kPYrqj0qrP6qEVFIEDwBcTs0fBYauW2tFpAM+69mUQ6ipNX7ZHbqlIdr
	 vULBWsgHCWnCA==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-649523de977so5000873d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:29:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtXP4xVifAUKeGxSFuJEsTgXY8xwi4gtIzWEcpBACycOyRfptej/Qic4Dlr+VXC1mLyD2GQ9Jr1LZ3@vger.kernel.org
X-Gm-Message-State: AOJu0YyL72QEw87sDdl+IApkDszfw2+NwCjX1nMbObjIV3L6ucjZE8HY
	tGf+u0UBb6PbmH9agDQoVgHozbFZZDEm+xZxmvgtfuKyIUoTn9GwieLAPlTmEY4W4LBlOeakP0W
	XEiCVqJxyewlzV9flFJ4WipwVYJmvoxA=
X-Received: by 2002:a05:690e:400b:b0:63e:30d0:61a0 with SMTP id
 956f58d0204a3-6498fbf598bmr639114d50.26.1769506174869; Tue, 27 Jan 2026
 01:29:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121125631.2758346-1-martin.larsson@actia.se>
In-Reply-To: <20260121125631.2758346-1-martin.larsson@actia.se>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:29:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLmOjdiDfLPqAA+6SmK2mfddh6O2YoPD10gkBbo=dCOf9Q@mail.gmail.com>
X-Gm-Features: AZwV_QifA5ldhGZna5IhDhcfJXT865aAF-PTyxYWBs08x4GbfaeOBXu7FQk-cHY
Message-ID: <CAD++jLmOjdiDfLPqAA+6SmK2mfddh6O2YoPD10gkBbo=dCOf9Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: mask interrupts in irq shutdown
To: Martin Larsson <martin.larsson@actia.se>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Roth <mail@mroth.net>, 
	Francesco Lavra <flavra@baylibre.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Maria Garcia <mariagarcia7293@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add a few recent developers to CC, this is a very widely used GPIO chip.

Emanuele was dealing with IRQ storms and may want to look at this.

On Wed, Jan 21, 2026 at 2:12=E2=80=AFPM Martin Larsson <martin.larsson@acti=
a.se> wrote:

> In the existing implementation irq_shutdown does not mask the interrupts
> in hardware. This can cause spurious interrupts from the IO expander.
> Add masking to irq_shutdown to prevent spurious interrupts.
>
> Signed-off-by: Martin Larsson <martin.larsson@actia.se>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 8727ae54bc57..f93a3dbb2daa 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -914,6 +914,8 @@ static void pca953x_irq_shutdown(struct irq_data *d)
>         clear_bit(hwirq, chip->irq_trig_fall);
>         clear_bit(hwirq, chip->irq_trig_level_low);
>         clear_bit(hwirq, chip->irq_trig_level_high);
> +
> +       pca953x_irq_mask(d);

It makes sense to me.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
