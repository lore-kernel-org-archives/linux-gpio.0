Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720A451D532
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860456; cv=none; b=VJpCrkeDg81ql/GW+ZbX9ss9N4Ln+tz8ugX452TE8O+SlVAcz8Fvz8J5uiNm+lEo/TYEiMuE2MEXnwVKFlPkStvfo+KLbqEoLSOyczC+0LPnotdQn1uwSoDtp3chFfGZ3kxcj8Y1I4r5Qr/c2UeQVdz6yy9zryX/G11evGT3adY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860456; c=relaxed/simple;
	bh=NAEH1LGodnG1P0/a4VARquMQLIVHTsxhk69mCU/AOnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqNcR0y1MhM3LzWg3NFlrgE/mt6bLME8BxW5mSjdavc/b6WIQz9VZVoBCKk/GK4rbqvHa7714XRjPMCn9tcI/VmYV1s9nz0SqGjspK1uxHHQlfL3f4/yXHhRYY8HtUZp0T+qtGDUt4jOX+7dVAUsPAj+6zb/2rorNIFHSx9h5Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so3386766e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860453; x=1789465253;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PIOsCtPZXn0hdSTkUCaDFtOzu6+1hWf4W/ZSKS9qN6s=;
        b=LzMPXGWUJjahYAFsca9NdGoG1khKCAofy1m+eqK11tsifV57LyuFkXfWv2ccrcb+38
         QOhDg9iCtB6p6rdcvZzIwbFHBUyvPmMTcpuaPt21lKNwKZIzG6RO1733bsWO+G1HnVJM
         nx8xzdNvUFNHJnPPph1htK805xxOXovsRS4XLShictS0ss2DR/H/lP51Jfyrc/7H66G3
         szNQE7unpflSDyK4TmnaBlu3awn1I3+jQXrHjpVHc8GY1RQ1SqG/G3m3ovIJpIZg0xcS
         h/+yw1U460hgvjR0jHHKtoHFanI4glp9rm9h2voS8QKslC1zw7+rRN7tSYCyrEkJgBmn
         RJ2g==
X-Forwarded-Encrypted: i=1; AKwUvByf+RHu9q4dzQSmgd4pcoLif5dsZVVc3cMHeEkGqzbb9CWAamuaGq/glBfDjyjc4c/VEH09V9m3imuH@vger.kernel.org
X-Gm-Message-State: AFuF++lXGKVLpn0IKx1AiD4NgbSbzm1E4F/adKCjL9PR0m7ZfZgqSk9r
	CVSxqCX1D3nSdDRfgyvsjPt+IEyacqqXKfJHYfTKnv4WDJYNucvwfSbU6PEqpQs0
X-Gm-Gg: AYBFou1arn6OjT24HS8VLMv3uZ3Z8yA8FfzwNfmg3BsGkwL6jF1wpThR7w5OkaOj15S
	27Miiaz6R5AA5JcI/4Cb9UEitkSDVUJWT/fuv5+KnBfyGPnuchheKn2/CCrueA7iHIgl2ipFMDc
	xcNvYhEG3FUBw5k4G4rIvoUiTiSE68qRDYvSBZ+w/Hr16NqZb/+lDxhxiXIkOVdQDCiiB6HOEI3
	ZXWfr1nI5dXYwBnJ0ZCXnP/Hn3IMLBcz3WdMHpnBJvrVP32KlBNSfBb4+g3zi3AuWjickUJf+02
	l9o6PmVTlwSxTjUKFOfPsEQxKL+KEbySQYuRT/SkzZFpfWFKy1ThHcu5DW2IDYeGj8bNXT089mG
	C0e5xmP6VsU5Qm6xZfCMzrfonqBrdrJ0EG+og38mAL67kz57sdh6lVwchUxN/vFqWfEh7ILIJEC
	XRmAQda13Mv36aq9dZnwd0ZpyhZAaOiYUmn+mf5r9CTWSNOIAYkPpfSFmlpAeJArfIbQg0bx47Y
	gDqJ2rjKQlDfAEknMZSq3OE0w==
X-Received: by 2002:a05:6123:4e:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c7ed723952mr14011284e0c.3.1788860453118;
        Tue, 08 Sep 2026 02:40:53 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef771sm9366674e0c.3.2026.09.08.02.40.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:40:52 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7542a2ee156so2415153137.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:40:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOpisgDhUxKZKZONubnUr5lNHr5GtKlALQVC7Wkow8bsTeMkAC87mKd1ZvQS+p2B5WPXlsWZTiuzcy@vger.kernel.org
X-Received: by 2002:a05:6102:5803:b0:785:a48a:e3b9 with SMTP id
 ada2fe7eead31-78a4a6a93d8mr11547770137.4.1788860452072; Tue, 08 Sep 2026
 02:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:40:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com>
X-Gm-Features: AcwNN1VVehwPBkszYyC_fDFyLf1R3qYKa3cv4jfVhnkMYrB4AMGqyjOV460-Z5U
Message-ID: <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com>
Subject: Re: [PATCH 3/7] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> When exporting a GPIO using the deprecated sysfs GPIO API,
> gpio_is_visible() calls gpiod_to_irq() to determine whether a GPIO is
> IRQ-capable, which ends up using
> struct gpio_irq_chip::child_to_parent_hwirq().
>
> When using the GPIO character device, it is possible to request a line
> and to dynamically switch between using it as an IRQ or as a GPIO, by
> updating the edge detector.
>
> The current struct gpio_irq_chip::child_to_parent_hwirq() implementation
> makes the assumption that it will only be called with the intention of
> setting up the IRQ permanently, and that it will only be released when
> the IRQ domain is freed.
>
> Since we now know that this is not the case, take the following steps in
> order to properly handle that case.
>
> Implement struct irq_chip::irq_{request,release}_resources() based on
> the default GPIOCHIP_IRQ_RESOURCE_HELPERS implementations.
>
> Move the IRQ setup and release logic inside them.
>
> Keep the mapping logic inside ::child_to_parent_hwirq() to be able to
> provide a proper HW IRQ number, but do not actually setup the IRQ.
>
> Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free
> the acquired IRQs.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -1062,18 +1047,21 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>
>         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
>
> -       *parent = parent_irq;
> -       *parent_type = child_type;
> +       ret = gpiochip_lock_as_irq(gc, hwirq);
> +       if (ret) {
> +               clear_bit(parent_irq - RZT2H_INTERRUPTS_START, pctrl->used_irqs);

irq_idx

> +               rzt2h_pin_write_pm(pctrl, port, pin, pctrl->saved_pm[irq_idx]);
> +               rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
> +               return ret;
> +       }
>
>         return 0;
>  }
>
> -static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int virq,
> -                                      unsigned int nr_irqs)
> +static void rzt2h_gpio_irq_release_resources(struct irq_data *d)
>  {
> -       struct irq_data *d = irq_domain_get_irq_data(domain, virq);
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> -       struct rzt2h_pinctrl *pctrl = container_of(gc, struct rzt2h_pinctrl, gpio_chip);
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
>         irq_hw_number_t hwirq = irqd_to_hwirq(d);
>         u8 port = RZT2H_PIN_ID_TO_PORT(hwirq);
>         u8 pin = RZT2H_PIN_ID_TO_PIN(hwirq);
> @@ -1089,7 +1077,39 @@ static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
>                 rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
>         }
>
> -       irq_domain_free_irqs_common(domain, virq, nr_irqs);

Why is this no longer needed?

> +       gpiochip_unlock_as_irq(gc, hwirq);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
