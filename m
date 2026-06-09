Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1029E413D76
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008797; cv=none; b=KO2jX2puP3bxp8qU/gZ+pI0/2gbSbu0IE1W9+cSj8LoPqZzPMg/NjGc6GQrpbcgKiwMG1gjMhQh6TCazm6SsSW0kO+sWdCl8AYbzhApu2NurDeqo9fwuOLVYpnt8buS5wcRcw0dFLsv5iz6d9STGijDqTpHIkebGGyWhE08bwc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008797; c=relaxed/simple;
	bh=7JphHASUUim9UtjENrCIBT+xMDKTbk7upU93W/JtgY0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeHvuuZL8y39eJORr8lHBp57DuEP9vQL2+7ygpH4uFtwxJKBcRmOyEowOWgaHvLVFsczhzx3TGSx/9TYuIKvZ7qqh4le6dgcq5EU+9v21LmqD3mgtYpC1aNUDkBJw3ByKL2CONWJWg28tIM3m4ZFl0INKUct0CjrXqBi+ecrgOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dK1g7AQT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dK1g7AQT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993B21F0089A
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781008795;
	bh=Oes17d4y2SsUvjGMdR6eWKDxHCGNkh3ruoJZHgWYwRc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dK1g7AQThBGrs3F0CW3ea3cG63zK3xJ9Fz7YkOCV5mbOgNFhTynB98GVFyu8Tea7s
	 udLTlj8FxbkcqMfIFTG8I0bJW3D5ofVsw+RFcrQZF2JwjvZ5LL5asxmlgvVUFBziZZ
	 0Zaxii9T2Vg7LM4lbSCu0uu/sCoAinbuHvn6xViPvr3Xe6bj+nEQJl8MNSq/+P2viz
	 CyNh+WCimTntR95BJ+9AzHWOiH4rSGImX5y+lF3rfIohDVg8phNzSIlpYpqOk9qazS
	 d+gaAQF2poEULs5owJ8zuhdK0IkvJX1LTRSGs503gZ2+uU+V+wBdxDVoNJSiQLH6md
	 ZUHknX2LWZM3w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa68dbb38aso5115148e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 05:39:55 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyy1vwBoeHZhyzqYHBlTO28/L/B4Cj4PrehRyENk4w5GMM8VxQZ
	DFtoLs7h807S7MQA+/jGgaYZh0RpjRGWkT5a2oJGgIFj1iG62IbPyxt7VB80iDx50XDXXqABDMN
	U26bziAXM39k2/77v3H+SnBmNthTwL/0OAzlEz1fn2A==
X-Received: by 2002:a05:6512:1301:b0:5aa:6946:6e4d with SMTP id
 2adb3069b0e04-5aa87b7da75mr5112133e87.19.1781008794127; Tue, 09 Jun 2026
 05:39:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 05:39:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 05:39:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608210108.36248-1-dan@reactivated.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608210108.36248-1-dan@reactivated.net>
Date: Tue, 9 Jun 2026 05:39:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfUd3nwpjgz-87hrpQ9AV6T8_1zwCm+tfYFurkYHKoKTw@mail.gmail.com>
X-Gm-Features: AVVi8CcKUtKWU4WYjIkAgXWTZXMdY_uS6sJr43g7KMrfeztXk2T4EHB-6stkVEU
Message-ID: <CAMRc=MfUd3nwpjgz-87hrpQ9AV6T8_1zwCm+tfYFurkYHKoKTw@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: handle gpio-hogs only once
To: Daniel Drake <dan@reactivated.net>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linusw@kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2026 23:01:08 +0200, Daniel Drake <dan@reactivated.net> said:
> Commit d1d564ec49929 ("gpio: move hogs into GPIO core") introduced a
> behaviour change that breaks boot on Raspberry Pi 5 when using the
> firmware-supplied device tree:
>
>   gpiochip_add_data_with_key: GPIOs 544..575
>     (/soc@107c000000/gpio@7d517c00) failed to register, -22
>   brcmstb-gpio 107d517c00.gpio: Could not add gpiochip for bank 1
>   brcmstb-gpio 107d517c00.gpio: probe with driver brcmstb-gpio failed
>     with error -22
>
> gpio-brcmstb registers two gpio_chips against the device tree
> node gpio@7d517c00, one for each bank. The firmware-supplied DT includes
> a gpio-hog on RP1 RUN, and this gpio-hog is attempted to be applied to
> *both* gpio_chips. This succeeds against bank 0 (which hosts the GPIO)
> and fails for bank 1 (which does not).
>
> In the previous implementation, failures to apply gpio-hogs were
> quietly ignored. In the new code, the error code propagates and causes
> probe to fail.
>
> Closely approximate the previous behaviour by using the OF_POPULATED flag
> to ensure that each gpio-hog is processed only once. The flag was
> previously being set before the gpio-hogs were processed, so as part
> of this change, the flag now gets set only after the gpio-hog is actioned.
> The handling of gpio-hogs on a DT node with multiple gpio_chips remains a
> bit incomplete/unclear, but this at least retains the ability to apply
> hogs to the first gpio_chip per node.
>
> Signed-off-by: Daniel Drake <dan@reactivated.net>

This needs a Fixes tag.

> ---
>  drivers/gpio/gpiolib-of.c | 5 -----
>  drivers/gpio/gpiolib.c    | 8 ++++++++
>  2 files changed, 8 insertions(+), 5 deletions(-)
>
> v2: move OF_POPULATED flag setting to happen after the gpio-hog has
> been applied (otherwise all hogs were considered already-applied
> and never applied at all, oops!)
>
> This bug is only exposed by the RPi5 firmware-provided DT that has the
> gpio-hog. The DT shipped in the mainline kernel does not have the hog
> here. I'm not sure to what extent Linux cares about supporting the
> downstream firmware DT.
>

We care about not breaking working setups, I think this should be fixed.

> I'm also happy to consider other approaches. This multi-gpiochip setup is
> a bit weird and gpio-brcmstb could perhaps be converted to register only a
> single gpio_chip covering all banks. I verified that the other drivers
> that obviously follow this same multiple-gpiochip pattern
> (pinctrl-amlogic-a4, pinctrl-st and pinctrl-stm32) do not seem to be used by
> any board DTs that include gpio-hogs.
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2c923d17541f..813dbcb91f6f 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1066,11 +1066,6 @@ int of_gpiochip_add(struct gpio_chip *chip)
>
>  	of_node_get(np);
>
> -	for_each_available_child_of_node_scoped(np, child) {
> -		if (of_property_read_bool(child, "gpio-hog"))
> -			of_node_set_flag(child, OF_POPULATED);
> -	}
> -
>  	return ret;
>  }
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 1e6dce430dca..b02d711289d0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1031,9 +1031,17 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
>  		if (!fwnode_property_present(fwnode, "gpio-hog"))
>  			continue;
>
> +		/* The hog may have been handled by another gpio_chip on the same fwnode */
> +		if (is_of_node(fwnode) &&
> +		    of_node_check_flag(to_of_node(fwnode), OF_POPULATED))
> +			continue;
> +
>  		ret = gpiochip_add_hog(gc, fwnode);
>  		if (ret)
>  			return ret;
> +
> +		if (is_of_node(fwnode))
> +			of_node_set_flag(to_of_node(fwnode), OF_POPULATED);

Sashiko correctly points out that on errors, the state will be corrupted. We
could maybe move the clearing of the flag to gpiochip_free_hogs() and track its
state when processing fwnodes in order not to clear it incorrectly?

>  	}
>
>  	return 0;
> --
> 2.54.0
>
>

Thanks,
Bartosz
