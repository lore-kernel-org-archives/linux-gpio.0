Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D72A3BBFBB
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359292; cv=none; b=SSTaJmBkd2djCMMKM9vhj8ySBmVaW9DrQm1KVwizrzB3CwLwrrVTuuAb4Ax6DGKWJl+2Pp1t8+CIi+n2Wcus/SAwFMNipJrzxazpx7LzTE70YcVX628ELSqpsO08zmybJRI7ldpr9KhTF7SKA4N0cE5mfBBNlKwCVCe+SjPbWhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359292; c=relaxed/simple;
	bh=EG2eZEdMcNx/YsjvUGIsIIi2nAhujxq9575KVJIE79o=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElBBkeDZVJduGWYqx5EN8nJ7+imtiwuFmetFslvucsC5kkRKVxwjiMbR1LK8bdTryFmY/gyApmcTpu4ak7SJ5FdjEwT1OwvB/fdoMpwFFVolON4NwrzrCn2zlQbkuQpZfdZgLne5u1K3PSAQFAiKs+908ZQ/pntb4nC5lTxJNFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWta+2fu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWta+2fu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379061F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786359291;
	bh=/BhPQPe7+mQookEICjDQ3vvln0KGg4vFbuMXvp4d2sM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IWta+2fu4lJBhNqZd0NL19nqHp1bx6PukAGADm78+Bz3vto6Vxg5o6SR8KmeeOSOf
	 sMPe9ztbLp1Fwk72wvBSeE2l7o/CESvn9DKRXk67TYO/Q7PS4gj50TmLszFMiydu/L
	 u/Awu20OR2TEPtEacmo/L86B2ZeECJbd/jRYB5WvzWOYYicGmGO/nf5XYzFaGLb3Y0
	 Nhci30a30YU5FZ+VqcJZoyiJmEAVhW6TgX9OSH2fw/MbsvKRbpz8f/7vIUoPdmMQ1z
	 2tRvrkhuvLa7DKWwMbjRgq9ITuhglJDH98JCumC7s4Y763RkoB0J8mZp163QHNb9Uc
	 O1ttkU19NCIyQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b015b2d792so1617005e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 03:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqae14EH7RhnJ+xbETZeQ+hmQ7leuNxcxDsjKMfTztLMEZ67JFw8rS/T8IEF3tzZWsOYMOHmrzRYrCX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/H2Fw7LMXQHVh0xD9uhb4ojAqpcUmbwbCjyZmivApOTB19a5k
	zUHBmK8wVSygzJb0T/lxp0l++ISqwcWCNqe4CT8eyIYDcErZsgCM6/Yvq3dGxkezJT5IJ0iS1jH
	+Zr9DXemPilk19q+8sOR7od10PlxSnMBYgl3UmsQh3w==
X-Received: by 2002:a05:6512:1293:b0:5aa:6c98:a090 with SMTP id
 2adb3069b0e04-5b2f4cc8ddcmr6273897e87.34.1786359289959; Mon, 10 Aug 2026
 03:54:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 05:54:48 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 05:54:48 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260801221008.456426-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801221008.456426-1-dbgh9129@gmail.com>
Date: Mon, 10 Aug 2026 05:54:48 -0500
X-Gmail-Original-Message-ID: <CAMRc=Me4dhtt2YNKo-jncSa0j0254eFKRP-3G5oiV4OfzYfb8Q@mail.gmail.com>
X-Gm-Features: AUfX_mzQOiTVeJi4X_WCJ9dMbh11gjjmVHw6NElG20PStC3kRUGOlJrfNBZUXBM
Message-ID: <CAMRc=Me4dhtt2YNKo-jncSa0j0254eFKRP-3G5oiV4OfzYfb8Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mvebu: Fix optional clock enable handling
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Aug 2026 00:10:08 +0200, Yuho Choi <dbgh9129@gmail.com> said:
> mvebu_gpio_probe() ignores clk_prepare_enable() failures and has no
> matching disable path for later probe failures.
>
> Use devm_clk_get_optional_enabled() so clock lookup and enable failures
> are reported, and so devres disables the clock on cleanup.
>
> Fixes: de88747f514a ("gpio: mvebu: Add clk support to prevent lockup")
>

No blank line here please.

> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>

You should also explain that the binding for this chip does not describe the
clocks as required so using the optional variant is actually a fix as well.

Bart

> ---
>  drivers/gpio/gpio-mvebu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index a010604e5ff7..095881603b75 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -1153,10 +1153,11 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
>  		return id;
>  	}
>
> -	mvchip->clk = devm_clk_get(&pdev->dev, NULL);
> +	mvchip->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
>  	/* Not all SoCs require a clock.*/
> -	if (!IS_ERR(mvchip->clk))
> -		clk_prepare_enable(mvchip->clk);
> +
> +	if (IS_ERR(mvchip->clk))
> +		return PTR_ERR(mvchip->clk);
>
>  	mvchip->soc_variant = soc_variant;
>  	mvchip->chip.label = dev_name(&pdev->dev);
> --
> 2.43.0
>
>
