Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E40F27E07E
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 01:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744070; cv=pass; b=kf1oalkoqNva8f2HsRASziNN9LM/ylvhTVgy9mkBAXJI5ywf4cLCoO6z8K6fq6qimNox16zyf9wkQOHW3LpgoPKudY30tyDUX7lEgoyQm3mwNx9/tRxaLg7nxlgaSIZL+IT2zYoszfwmpZfvdiumxFv1/GhG1NFnB9DZ2Bzfhbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744070; c=relaxed/simple;
	bh=dLy4e1qHLcvoLadjjzsNDriWy6dgQR+5gciIFi63BmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQjdqPQGjiio/e/5I6N6BiNLJ85vkWNhak3Jqw30dGchPJqGS12zntzL8Q0hXHAHo6WJTUxwuLzIIAm5sH5omxt5cjh6YvBQw2a1C61+UMK8FxrChzJV1yWWPQGGOwxq2DCTbcfWs2OeULmufeXmkijHfKEROPmI9krlVDNOEjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSfE/pg3; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSfE/pg3"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so4946971a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Sep 2026 18:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788744067; cv=none;
        d=google.com; s=arc-20260327;
        b=n7AfgXgsV+hdq7SZ2R0QnKUvtbAeS49ffD/67hsObY1kBojHwFw2nc6jqHeSuvzaJn
         kEKJ0C0KbCDr89nMHPBxV9aIiVGEMYA+vk6vc1XIL3XoaMrhM3BwEcV9P8sstkk/67tc
         aVxFJeG24lGw18qHSoR++MI1kCqAOxmHFQHhw+DQwsC/V86hgBNiFiTCzkwrk9UuNOf8
         EIAOqcLeZLQIqSOEToWmEw985V8GPPdNcpG30WLdk278zJEqzQuTXeDPqbTsfigb6g6S
         yb/yuMFg1B0lpVaHFLPC2PM4M4bz+DULcqZF6XE8GtbLTmvCOjCpyjflv2g5w1OI50i5
         5XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EJdnZa7puyaFnP7aZ2zyhYbn4tJFzehkq2tCfsTQdIc=;
        fh=OKKkL1UFC3MjWXwz/Dr1P8kAQJyBhVBnHKkKtxcVhYE=;
        b=HBulqp7LXIqfAZR5M7cKAYBAE/kedQqug5xWEsG+w6GfvcjN2OyzP+U4ypv5DbYDcx
         W1MaHMCeXNGEnGbcQzuX+KlgTsp0KdoFMiABZLpnWO90q2uUTVgLQKThYyvYbRJWH4bv
         eUOJTybyG8ZkDRVRScxNAu/8t9fMdOmCwkw4KeS2ptD1l6G77arPeOGC8ncT1VyuveoD
         krmpY/EfJfj3t335y4T+AoQFmCQ87yiKh4nEv3cWwR3zChUPChygSY+m8D/IadCagCjd
         PRcA2dqv75Qy8X6m5TT+/aUJaIWucqO+qv27mlcX4fuE7aAUlUz1zoXkNYGcOSEvARDq
         qXyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788744067; x=1789348867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EJdnZa7puyaFnP7aZ2zyhYbn4tJFzehkq2tCfsTQdIc=;
        b=CSfE/pg3v3t1UmDVqGC1Nf5YSCDwr2TzUaSV2BmkIt9K5eR9eI+ntyZ9GFJb3cFsUx
         OSgAkhz16/5x45UaBypYBWBHUT/Mnm9ThI1ZokzRqKwTCT3ZrH3KJkn+NG4DlPHP3IRT
         2D7vV4PbTHZ9YkpZLjzoaTtFLt5KpB7Y264FdJooAAjGEh2wAozY5cHCGUQ7mKma4S7h
         Y68YzQtBejsvH7T1yGn9s95glb/vq9is3pwlcebIs1CWef08YoF5EtX2YuDXhqhst66a
         VIJp4v3q3v/vWfJiufFKpqvmoLb+SscF7P0JzDFESClYJoN5hNn7a2+Km6LN1RFs1Qxr
         HYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788744067; x=1789348867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJdnZa7puyaFnP7aZ2zyhYbn4tJFzehkq2tCfsTQdIc=;
        b=NSL868JSWWOqXbud8J9rWQ1/h7HSrA7wyUUC/Gm09Hnik5ErqQmEhja/IsKI/lKlar
         qnXEftFWYDDrIBncxkxg6RSbVuVdX20b10KCJw6aESJ6ecT9mqa05XX5Uz65pTTA2fIF
         yCPQjGcx6MzGpudkPyN4wsT6G8mBDqwF2hNAJw7+cjVqX71I0WFJzS0f0bu/zQD+QiVc
         YEfW2R/dlrmAQIWdSyDMFHBwiBaIreViX9GdFutb/UJNIKWIgzHhe6UbRspBixmwUR6B
         vV9O3Wuap/nm/BbFmmsts6VHPdvzhqgplqfxM4U4ZKThwCv3ZgsCy7HgbvIH2PZdQ5ye
         JLHA==
X-Gm-Message-State: AFuF++kSl5+du7AmPqmrXMFb9f0/wWe8WtPAahAGpI3DgJijgFAGflK6
	nkTMa+e51JlQttjNLBClIGhviDxppddj2KgadssfgbOp+EsTRvuPxVwv1DC2lea/7dIITwBy9gA
	3iDW61ROzTzd+dtaK6afyYhssIIqx8QYIDA==
X-Gm-Gg: AYBFou0Vag5MFz48qy01jjWlCCzZOPdGGugvSdMq83y9RIcsTRtqA6HDX46VJtw5a3t
	aF+91RYM5Nqo6e3uLCU2UHYbZN983m3g3k1x6s0h372ZcOxEc1t7znsGq6/EJj/8XH80m/es55e
	6kP/e8jyO4oj6A3qfeV8yqfjPNLqxMTc7mcJbvRdVqGmbhzLpsMGFU1w8IqToGfmH/ExpTjSW/o
	lffNSzAM2FhyHnhc0LDNWBHhC7MMbydf2wt9tnD51eU+dqfqqiApdslzFyuwg/n7Xkyqr21M/rI
	uaZf4c0kYa+YGhwdsj0OtjAyncEYI3Dau0SkZ4weFyAVj1VvVwH7DuwzshPzr+pocqhHisR9K1c
	mndln/BAGMb3kug2OD2g1NvwsdSsq3U1N1PV6FhMVIWPDDhMrFFlEhat2DRc3TZjHS/+aYIS16N
	b2Aw3LYf5U7huRARdMjO77rj4dFwZd1h2t47mUB/+zYk/RRVm996xGZBk=
X-Received: by 2002:a05:6402:454d:b0:6a6:7305:2dff with SMTP id
 4fb4d7f45d1cf-6a7e8e95808mr5594031a12.12.1788744067371; Sun, 06 Sep 2026
 18:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710070704.60680-1-rosenp@gmail.com>
In-Reply-To: <20260710070704.60680-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 6 Sep 2026 18:20:56 -0700
X-Gm-Features: AcwNN1Xq_5QVaYhUhaquQ0B-Wpws9p3xwYr1tiY25wcmZty-OeFp50QPfSbK6uQ
Message-ID: <CAKxU2N8uVimJ09aaRz2o6pY+yh7VpE0G6fBXdERnquoTPYcYXg@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 12:07=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> The driver uses the legacy .suspend/.resume callbacks, but sets
> IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
> runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
> interrupts, and only then runs dpm_resume() which invokes the driver's
> .resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
> mask registers).
>
> This ordering means interrupts are unmasked while the hardware is still
> in its reset state, potentially with incorrect polarities, causing
> spurious level-triggered interrupts before local IRQs are re-enabled.
>
> Convert the driver from legacy .suspend/.resume callbacks to noirq
> callbacks via dev_pm_ops. The noirq phase runs before resume_device_irqs(=
)
> on resume and after suspend_device_irqs() on suspend, ensuring GPIO
> registers are restored before interrupts are unmasked.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: add __maybe_unused to fix compilation
Should I resend?
>  drivers/gpio/gpio-mvebu.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 7094ab34020c..bd31acf779e6 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -979,9 +979,9 @@ static const struct of_device_id mvebu_gpio_of_match[=
] =3D {
>         },
>  };
>
> -static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t=
 state)
> +static __maybe_unused int mvebu_gpio_suspend(struct device *dev)
>  {
> -       struct mvebu_gpio_chip *mvchip =3D platform_get_drvdata(pdev);
> +       struct mvebu_gpio_chip *mvchip =3D dev_get_drvdata(dev);
>         int i;
>
>         regmap_read(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
> @@ -1031,9 +1031,9 @@ static int mvebu_gpio_suspend(struct platform_devic=
e *pdev, pm_message_t state)
>         return 0;
>  }
>
> -static int mvebu_gpio_resume(struct platform_device *pdev)
> +static __maybe_unused int mvebu_gpio_resume(struct device *dev)
>  {
> -       struct mvebu_gpio_chip *mvchip =3D platform_get_drvdata(pdev);
> +       struct mvebu_gpio_chip *mvchip =3D dev_get_drvdata(dev);
>         int i;
>
>         regmap_write(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
> @@ -1339,13 +1339,16 @@ static int mvebu_gpio_probe(struct platform_devic=
e *pdev)
>         return 0;
>  }
>
> +static const struct dev_pm_ops mvebu_gpio_pm_ops =3D {
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mvebu_gpio_suspend, mvebu_gpio_resu=
me)
> +};
> +
>  static struct platform_driver mvebu_gpio_driver =3D {
>         .driver         =3D {
>                 .name           =3D "mvebu-gpio",
>                 .of_match_table =3D mvebu_gpio_of_match,
> +               .pm             =3D pm_sleep_ptr(&mvebu_gpio_pm_ops),
>         },
>         .probe          =3D mvebu_gpio_probe,
> -       .suspend        =3D mvebu_gpio_suspend,
> -       .resume         =3D mvebu_gpio_resume,
>  };
>  builtin_platform_driver(mvebu_gpio_driver);
> --
> 2.55.0
>
