Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C57262B
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715087; cv=none; b=IkCPG0dRHoDvZqfUrZBTLbpEl/bjfmwg5hQjMQuEczOBVLUIWvVvnuTxG2WAXyi8o/61sWY3LWQpfMG22PsTd7ju5gVDvjsCoR1Qc7nGpVZzhsvrHbFx9N2B/WWTyqmClBQPq3BzqAOiy2+YVvCKahLEdaWPGsSOzqyTgoUAMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715087; c=relaxed/simple;
	bh=gCYriCdIB1meR7M+a/ecxm5sBZGJmTBcbuWltT//9xM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1vDyS9QpZc8wG9xDbqf3NwNDefFOGQyfW0Drz/pjWhlHCmlxQ5LYPrecsA4kOilJmpsgEMfMabM4TAUxUi8Tar4zVfSNa3WleItw/zcte+HCqv3UpJvfc2uCjmcbKqNrWFeBc4OI6VivIWoK0x+3sFHYws5iilgqrMUpT6BPYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvEeYm8M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvEeYm8M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC391F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 10:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784715084;
	bh=oPFiMF6/pMiI3r2wAx6AlXUMmiC3MeKAMoSlUvo9Nog=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=HvEeYm8MN4A+8jo6qyM51DWJnz/mHrlaxkZWpDZXiIrY1uy9meSyp58QDLEqR7RiF
	 EOooUQLQkCdAjAzRycNZYjOqAU0rnC2Zo7UcqnA7q6XFkezo6E1iMdsf+H+k6/f4BD
	 wY958s4L+3YqDogtM8XPzTdloDqpWcI9fIKtmcYiyl93h3bvXo63m3AtwPpyvCs2iL
	 7BAWDetYGzTw3Nts5KoDgne39sjRgdhTZXksoH7nPVoWvckl6kqN5uzaMTq+CFN15a
	 vQYmLvcOTfz2XIhdc3V4QiaKC5b01UQanH9U62S8EoVPjyc1v/KnQGqip2SDGHTv91
	 owrXK0ZSzTnpw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so104584651fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 03:11:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YyMpzhk7TLqj837KvGhlLvqp3YbSdSazoRpVIGYU97HeP7Xxb8e
	1tWxyGNu/NLFQbCPdjDV+zVf1nQX9Wr99JSuz3gysj3ZmX0i/gdfWgI8jel0EI+JKC1gRkv+F2Z
	rQbn15Mp/Gu4rIkqW4rE8JTyOze0HPwHNoDDWHh/OjQ==
X-Received: by 2002:a2e:b896:0:b0:39a:f1a0:5e3d with SMTP id
 38308e7fff4ca-39eb28e2427mr39037141fa.34.1784715083437; Wed, 22 Jul 2026
 03:11:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:11:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:11:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260718041311.2605172-3-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718041311.2605172-1-dmitry.torokhov@gmail.com> <20260718041311.2605172-3-dmitry.torokhov@gmail.com>
Date: Wed, 22 Jul 2026 03:11:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfBc532i56pMvvO0KEoW0a3pBVVGF40Xde27O6jewJT8Q@mail.gmail.com>
X-Gm-Features: AUfX_mwf5qRHWfumwS-CqvXRYlxUzCoGilqKwx_fcjSM-LWjQetKxDoPPwgeVX8
Message-ID: <CAMRc=MfBc532i56pMvvO0KEoW0a3pBVVGF40Xde27O6jewJT8Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpiolib: of: add a quirk for legacy name for TWL4030
 external mute GPIO
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Jul 2026 06:13:07 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> The legacy property name specifying external mute GPIO of TWL4030 audio
> coded is "ti,hs_extmute_gpio". To allow converting the driver to gpiod
> API that requires names ending with "-gpios" suffix, add a quirk to
> gpiolib.
>
> Note that we a custom conversion routine is used as compatible check is
> needed on the parent node, and name of the node ("codec") is also
> validated.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index f4ea7ca27296..67a36e3851a4 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -676,6 +676,35 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
>  }
>  #endif
>
> +#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
> +static struct gpio_desc *of_find_twl4030_gpio(struct device_node *np,
> +					      const char *con_id,
> +					      unsigned int idx,
> +					      enum of_gpio_flags *of_flags)
> +{
> +	const char *legacy_id = "ti,hs_extmute_gpio";
> +	struct gpio_desc *desc;
> +
> +	if (!con_id || strcmp(con_id, "ti,hs_extmute"))
> +		return ERR_PTR(-ENOENT);
> +
> +	if (!of_node_name_eq(np, "codec"))
> +		return ERR_PTR(-ENOENT);
> +
> +	struct device_node *parent __free(device_node) = of_get_parent(np);
> +	if (!parent)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (!of_device_is_compatible(parent, "twl4030-audio"))
> +		return ERR_PTR(-ENOENT);

I think sashiko is right in pointing out the compatible is actually
"ti,twl4030-audio".

Bart

> +
> +	desc = of_get_named_gpiod_flags(np, legacy_id, 0, of_flags);
> +	if (!gpiod_not_found(desc))
> +		pr_info("%s is using legacy gpio name '%s' instead of '%s-gpios'\n",
> +			of_node_full_name(np), legacy_id, con_id);
> +	return desc;
> +}
> +#endif
>
>  typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
>  						const char *con_id,
> @@ -688,6 +717,9 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
>  #endif
>  #if IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO)
>  	of_find_trigger_gpio,
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
> +	of_find_twl4030_gpio,
>  #endif
>  	NULL
>  };
> --
> 2.55.0.229.g6434b31f56-goog
>
>
