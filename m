Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C7A4F30E6
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861386; cv=none; b=ijBPUXtMHu9K7RBqbLPuxSyaT4hDM2nosdVJKEJR0MM/uZQao/tG2HuJNIvRzqR5O9eaSwW/kP6l5mjdsaR8qLKDYeXRREA2cBZrRIMSTPUw+16oNYOC1/29VKmPBNAB/1JUNWm8tDhCyxB51o1CbO10u5k55cZHd4co7soX9kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861386; c=relaxed/simple;
	bh=NXZNmgvu0XequOW0h/JSVE4Z5uMg/YTzszCCImTyPlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ko7QcKUetIGBFq4l99D7p0k/O2U0TFLlG+E41pqXDhGT7HVWEt4dWRyCqqzeWKzmFnUASe/fxLuBGh5i5i++giP+VwgTpAkVVD/P5wxYB+hBE1mTA8Ncz4uOxD7YZsCzcWeYjys3Gv/xhHeSc9puvYjIRwbWklR+zE6D3ZcrVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bf959b820cso3976391e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861384; x=1789466184;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Frf4CDKY0g6g3QawhbxdAbsjmWIQZS7SHxphY7Ve0uc=;
        b=iV2VBxDrHK0Arpqv0j5MsK3qdoRUuhKZyYJViiwhmLD7GAcFK266f6kIfjV2Qqz2FA
         XfsAMaW0fwhrbID1v7hUtAUaP60Sjq0vBbgISLosN8kaKnFB6GZ7zsieaKFcJDCU++rv
         uCmnnRV8BRFrtOOC/9sNIzQ1eCcg1EyqXUsYhf9c+0Uq4d4VNvcyGpXuD5ddl4Xk4B8l
         BjjNfMpg+7ReAeYpEOrJLFGzlPhhauGutQlSqet2HO90DbdmynKoOimjZFFF/XnO3DRb
         IEiTGLso7mE/N+pqh0kxIbPZQdWj7s1qNEKjCiUbZZEe88ia68ZJmt4OQgxZJ+25skWg
         fMTw==
X-Forwarded-Encrypted: i=1; AKwUvBxDhoKuB5Cx8rn/nf5p3wwKhfsXIYU60CxK+QHbiV14TVT3qcoTTMw+M6TKMBULryy/8DEOMnnh2AMf@vger.kernel.org
X-Gm-Message-State: AFuF++ndoD4CB6CN7kiGPtTvXRYk1/kop/1mQPnWgWhwLE1LeBDk0N2q
	xEE1zr3t438rvVzyF5KpydCbbgHdvTO4hzqo180W6ZBjWUyCjQDFx7cJjEhHRPPu
X-Gm-Gg: AYBFou3oMRIn68LSY/+EvEMBiYWHPqHXsuiVIeVnLDUHNwE6iHDbtavdBQZMiP77M1f
	FVFSRw/49YdCERs3LwejVfklJpY8rA8yHq2yQvdwrUhQ2wEdD/byRBD4KWmhiIUSDOchljm7095
	6Z5wm+3yRrKOg8DM+uQyB9d3iU4vPUHAGwEyjPuq0tpzzQwg20e9FngCZ1TRXVmXqmGjpcwcPXj
	ijBOEOCNDgycf9kXhHlaq4JWNizpDs5ZfRPdf/DUiFsAZ/oWtem5qcVrVF0d2Ps9hPuWJxaJVM4
	oRIcO7sg3mf70tOgr2wW7Y6WtWzBGFQpJq54APjWGeC2kECNVRFpWhmXqk3IZZ9Ql7LcehoHK7N
	/Y7zjV3yqxmhzwA7a9lSwWUtzEghhnBQG29Fqq4DyMyy4gLsn9mTS0sslneGFZ+wXjWN3WDComT
	gCLQBTehPJeSf7ih2UKsq6LnA5ugzm6YB6IDVJXB3jT4cFK2G91I26s/IzYzQ+ZHHxsd/LxlwWX
	lSiCkwmVeszqiMzxzaQjzI4og==
X-Received: by 2002:a05:6122:6213:b0:5c5:ad20:1fc3 with SMTP id 71dfb90a1353d-5c7ed7671b2mr13479257e0c.5.1788861383693;
        Tue, 08 Sep 2026 02:56:23 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec23d459sm9423291e0c.9.2026.09.08.02.56.23
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:56:23 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97e9c0da212so2712835241.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwpXjS/u3C6/2hGk6WB9auaCLLn/TxSICyv1XJmkzArEbroHdxY9mxlOyy0A2cBqPOoxcHukB+CXpmK@vger.kernel.org
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id
 ada2fe7eead31-78a4a72eac3mr12923163137.3.1788861383206; Tue, 08 Sep 2026
 02:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:56:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHAXzRiODL9hphVTjqKOHNVUe8cOygXESWF6_r7Ou2yw@mail.gmail.com>
X-Gm-Features: AcwNN1V3nOK0dJ3UvwLd7mgfKmiEg244M-OC0mkyJDzXDnUsNESnG0OLJvnPvSU
Message-ID: <CAMuHMdUHAXzRiODL9hphVTjqKOHNVUe8cOygXESWF6_r7Ou2yw@mail.gmail.com>
Subject: Re: [PATCH 4/7] pinctrl: renesas: rzt2h: fix reading pin value in IRQ function
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_get() only reports a level for pins in input or output mode
> and returns -EINVAL otherwise. When a pin is requested as an interrupt
> it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
> value can no longer be read.
>
> gpiolib calls gpiod_get_value_cansleep() to determine the edge's
> direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
> Non-zero values are translated to a rising edge, zero to a falling edge.
>
> Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
> returns -EINVAL when the pin is in IRQ function, every edge is reported
> as rising.
>
> When using the IRQ function, the input buffers are enabled and the PINm
> registers reflect the live state of the input.
>
> Report the input level even when the pin is used as an IRQ.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -171,6 +171,23 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
>         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
>  }
>
> +static bool rzt2h_pin_mode_is_peripheral(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
> +{
> +       return rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit);
> +}
> +
> +static u8 rzt2h_pin_read_pfc(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> +{
> +       u64 reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> +
> +       return field_get(PFC_PIN_MASK(pin), reg64);
> +}
> +
> +static bool rzt2h_pin_read_input(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
> +{
> +       return rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit);
> +}
> +
>  static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
>  {
>         u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> @@ -847,6 +864,13 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
>         u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
>         u16 reg;
>
> +       if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit)) {
> +               if (rzt2h_pin_read_pfc(pctrl, port, bit) == PFC_FUNC_INTERRUPT)

Section 17.4.5 ("PINm : Port m Input Register (m = 00 to 35)") states:

   "The PINm register is valid not only for general I/O mode (PMCn = 0b)
    but also when peripheral function is selected (PMCn = 1b) and it works
    as input."

this is not limited to PFC_FUNC_INTERRUPT, so I think you can drop
this check?

> +                       return rzt2h_pin_read_input(pctrl, port, bit);
> +
> +               return -EINVAL;
> +       }
> +
>         reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
>         reg = (reg >> (bit * 2)) & PM_MASK;
>         if (reg & PM_INPUT)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
