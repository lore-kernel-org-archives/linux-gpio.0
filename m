Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5347044B
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 10:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059026; cv=none; b=j5Rx03XcorMbe0O/emiX/0l+QqZevnzIgwvxT6EPgv3EMmjyHLW1T3a2v57gEZmChM1//GQt6qYgreACzoZbcaspNrpF/k5EIOnvfqWXRjHmoA193HDRHe05LI70FmXG+lfefVZnkCcEwmoina4kDBlUe/Py+UJ1yJmRHXHhkuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059026; c=relaxed/simple;
	bh=9R6PmOOy2pJcDsKeh20BUb0EVH2cQVGkzfzBC35nZCQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FU3Iylx9WNRptSSAQxPxFtH4P0jBfe1tOlX15I/6WMjFddluOCIy4Mwdl+n/idU5YJO8WFdkEn1P4YQm4z7eZPrxO7+MiJg5wR/XK1v5TF1y53tJg7Vxsa9MPQ4C+1ZvgQ+IFvLG5lIbN4Xav8XWHES/1V83lKHM+XpwYAAZAw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STR8H/kf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STR8H/kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAAC1F000C7
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792059023;
	bh=iVD6DVgrrmWtPCKZuLRYBe58wCwR82Aw5cFa3tQXsTU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=STR8H/kfDMSr+DWDoq48sXSduiYpF29cDZUyK7Fdcw20EHdZ/VWLhPjfrERXtda0k
	 PXafGPzINOa8Y9a3SPaTqAQWZjdj/31fGC8BnkqNY8TW5IF+P9Wk8dvXTHeedTbeO8
	 yi5/06I9GkPZ5BjXXSOuLBA0DHupRYFnp2OSgc9Gubb7Vc/yzoNmN0esApKdN1oOFN
	 qNp/XG0tWLx2SidhXAU/bdihsyyYtM5v+m4cO6i4TmYMF5qQ6gn6meXwLlmZQeIlLL
	 6QSLQ9iCMlf1isA7F9rVgEurWYpX1rc4MNYPwcasw1Z62JIE8VwDxb7Jj+YRelA+S3
	 c1Mdl2MNORU8g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcb2ecebb4so4110220e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 03:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzO91a2F3FnKWI03j4rpvoMzC+28hR11/h4RiPKed+m1t1aCVTFrnYyEft/O36Nskr6c32jtdsOU3A@vger.kernel.org
X-Gm-Message-State: AFq9FYJql578vR7+6qRn1GKI2S9LqhjETaeR18wqBc9rmw8tQgJgTZPX
	Gq/yeEOHNjgXOVai1DlR+f2dYgG9oY9CAQq4Iqs2tfuwHu68CCPgcO+tRcf1LlvUmg8nGjZw2dQ
	ndrNaRdzyfrLdr1OBoUoXyaA9J2fqT2vlH4z7VjDrtA==
X-Received: by 2002:a05:6512:3e24:b0:5bc:b091:ea4f with SMTP id
 2adb3069b0e04-5bcde8c154cmr6665182e87.38.1792059021797; Thu, 15 Oct 2026
 03:10:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 06:10:20 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 06:10:20 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261014204331.15383-1-jayarajdmit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014204331.15383-1-jayarajdmit@gmail.com>
Date: Thu, 15 Oct 2026 06:10:20 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfir4zVZENbq8zJuvo8Acq3ZxUTy5E74ZzqHYVmPH8fog@mail.gmail.com>
X-Gm-Features: AclHuK-iPK_M1R-OIfN-ytjpEWR5PdRs3K3ZQbAWqipplmC2--vh1bUa1mLFQ3o
Message-ID: <CAMRc=Mfir4zVZENbq8zJuvo8Acq3ZxUTy5E74ZzqHYVmPH8fog@mail.gmail.com>
Subject: Re: [PATCH] gpio: lpc32xx: check devm_gpiochip_add_data() return value
To: Jayaraj Devaraj <jayarajdmit@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 22:43:31 +0200, Jayaraj Devaraj
<jayarajdmit@gmail.com> said:
> lpc32xx_gpio_probe() registers each gpio chip with
> devm_gpiochip_add_data() but ignores the return value. If registering
> a chip fails, probe still returns 0, so the driver binds with a chip
> missing and no error is reported.
>
> Check the return value, print an error naming the failing chip and
> return the error code. Chips registered earlier in the loop are devm
> managed and are removed automatically on failure.
>
> Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
> ---
>  drivers/gpio/gpio-lpc32xx.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
> index 37fc54fc7385..014eb8bc70da 100644
> --- a/drivers/gpio/gpio-lpc32xx.c
> +++ b/drivers/gpio/gpio-lpc32xx.c
> @@ -510,7 +510,7 @@ static int lpc32xx_of_xlate(struct gpio_chip *gc,
>
>  static int lpc32xx_gpio_probe(struct platform_device *pdev)
>  {
> -	int i;
> +	int i, ret;
>  	void __iomem *reg_base;
>
>  	reg_base = devm_platform_ioremap_resource(pdev, 0);
> @@ -524,8 +524,12 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
>  			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
>  			lpc32xx_gpiochip[i].reg_base = reg_base;
>  		}
> -		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
> -				  &lpc32xx_gpiochip[i]);
> +		ret = devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
> +					     &lpc32xx_gpiochip[i]);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to register gpio chip %d: %d\n", i, ret);
> +			return ret;

Please use return dev_err_probe().

Bart

> +		}
>  	}
>
>  	return 0;
> --
> 2.34.1
>
>
