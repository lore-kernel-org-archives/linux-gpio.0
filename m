Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFBC3BBFD6
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986913; cv=none; b=mx2VgOBJnJeiEU6nRrqNK6S+ImBgbp8cmKuXIb1Q3CWYXilIEs3dITRCwGx5TA6+2mc3VZPny1Fc8V3glqE8GtfIGtDka9ECtReXC5COA2bcpiaPRTtIwSQK87zMnooQjMeLYoGvTLwzTiV5pwrycdNHZRxxUQyh45jtX74lfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986913; c=relaxed/simple;
	bh=EOrTycvPaTgtJNwbvItqQE20ImaT9FxfEnEhBk/abZg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLZLiAnchragFBrUF9srfuCnrNNtQvELSGSl2myE43NSzQCh2V2vZzzHhBN5Dajan3t9ZAwpfXumSbHYmq6nOhUSUpHlSmhB+BgUHM73n59WmIU2PNx3sCtIECcZ868bR/xMU9SdZpwvjf5t1IKNAoDyYkftjwNIynlYbftHELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orNUCASL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orNUCASL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D5A1F0089E
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 10:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789986911;
	bh=uf7K0+ckYfZ1RE4IQEUJIKlulg/YWQPSFrPzeeWpU08=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=orNUCASLJXrta2jQAt3DZfNJXG64yPkECzsZxCKUcdNrEr8sYKbeFrvYhVt6pvxRn
	 XPaVfFVj0LFVmn5txFq7ujldG6HlnD1PJchdDGytX3zXACi0HoHW8G1xpjuJMcFjpw
	 g5lFmheLNbd2i0jgKrnpoOmOHqlX9qQXBTw+plQvtCN2xAIQ6yXieA8FnmBr2ziQuN
	 o5rtdr/TamlhcRr+eXDKTARMiyUoClUwvTp6zljHDD+uU4/6YMMhcu9AQtD2CmS3nz
	 mxqFNI2wO1mm3TUpmUi6agq2nTJmbuj6wOQ+ND6sa/5ghz8haPxdfrt1ZSAhIvkz3V
	 XBCHb0kNekbZg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a36de66c0dso26796371fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 03:35:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPxqscMVE66XfTv/ajHwD8VjOBmjtkgPX6KzGpiFOdotnmQWs2uX+4OwkZJNGLEI5+wWt6mLAs0DEn@vger.kernel.org
X-Gm-Message-State: AFuF++mf1pGREZkzmFETpgC/DqK8SfU+paNYD4e38vjiPqOZKb6gd5Aw
	8gpB2BXdsj1HGS4SE5DESR+vwL1S0JugkaeP8FLwJDuzol748YpMAPFrDHyw4lhFS6SwD/JZuM+
	vg+b4uzQgjkiHiN7NMK+H3Sh/EkPkfaRfOz3dKwjA5w==
X-Received: by 2002:a05:6512:3e1a:b0:5b8:b419:b90 with SMTP id
 2adb3069b0e04-5b8c197b251mr2961808e87.67.1789986910027; Mon, 21 Sep 2026
 03:35:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:35:08 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:35:08 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921-cv75-v5-v8-9-282ff5d98dda@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-9-282ff5d98dda@ambarella.com>
Date: Mon, 21 Sep 2026 06:35:08 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf7dtxvxBUF1fOuKw0mxdhCYPj=J4ckySPZUvcZ7a6cbQ@mail.gmail.com>
X-Gm-Features: AcwNN1VMqVgF7bm9abckTPi2_jaxdRsIFb-CjJ1kvLYDiK7JhcmYHE-hjU9EtD0
Message-ID: <CAMRc=Mf7dtxvxBUF1fOuKw0mxdhCYPj=J4ckySPZUvcZ7a6cbQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/18] gpiolib: regmap: add gpio_regmap_get_chip()
To: longzhao@ambarella.com
Cc: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 06:23:28 +0200, Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> said:
> From: Long Zhao <longzhao@ambarella.com>
>
> Let drivers that implement a custom irqchip retrieve the gpio_chip
> after registration.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 6 ++++++
>  include/linux/gpio/regmap.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index fbd4c753525a..21e0993b89e2 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -295,6 +295,12 @@ void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
>  }
>  EXPORT_SYMBOL_GPL(gpio_regmap_get_drvdata);
>
> +struct gpio_chip *gpio_regmap_get_chip(struct gpio_regmap *gpio)
> +{
> +	return &gpio->gpio_chip;
> +}
> +EXPORT_SYMBOL_GPL(gpio_regmap_get_chip);

Please provide a kernel doc for all public APIs. It should explain that this
must not be used outside of a GPIO controller driver context.

Bart
