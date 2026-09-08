Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC14F4739
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859543; cv=none; b=p+IKKDEAiuUzx+Rd4ibjAec0V9ul2wp/rSwj+qAcMYNIpo2VsxizP3EqUXYNt5yUR4GX405Kqtd57+6UxNhP5fHqbWMSsiOyiDOSU4XheoBXjJDgoYYIRu0otjbRE2fSQSCIKwFLDRMahVyWgUJ3mIPy9LCAnA91QQJKEVbTIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859543; c=relaxed/simple;
	bh=dElApXNmnOgx2LivlVvzaqjoFojUK7t4I4aO8fOopz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6Sn2CNybzc7BOBgDrKLU4OYq1poh9iLgxts5ZgjDd1S+Cp4DdeFfEDxVbESYuXLdqpR0oKJ90NgV5WAnFcPcmIpMsf8Ev0duIuTixnwZ/N7/Eq8gkG7cRjywhk11IKpg8MjuDutzYHksrYb2Z+axIoSfjbQf4QUvQn8vq6eLP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-777c2d69446so3058504137.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859541; x=1789464341;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uNDZ4Z9RQ9wXrVcNuo/xPMTuBK+T4DwJPmnnzMm2S6s=;
        b=csrkhIaB+Ey0e0W8iiSkTMMcioIS0zccS6suT7rUstVpRQvf+6yRRf257XDKyoREZ6
         QGxOjjpzIKaM7DDx3zmAN4zK1U6R6GfpO9n3kZGidnVS2TKO9XzQGz9d/kU7zTvVfhnG
         zhe02KQ6y4qLbcWstOdQS56suJ+KznHZW+ocM4ayMZLgI0AH4u3VQ+j4ti2jKQD78u6d
         ldHkinhhe5fyc6qlOGu31VQHWUBfJRczrKYxodpZ8drvcYrWEKtWXfIIdgHGIiuN4B8R
         +upF3qm0TqxNeRVxXLAHQCeXMkyQdmurfY0cx/0/IgdVaaQ1Ay1O8p5L4F4eppm5hEge
         DXxA==
X-Forwarded-Encrypted: i=1; AKwUvBxKS6CKuFRN/G121i1lb5giD9uOO7AWjy0cFVr3LFBd/yCa0yyIiEB+c3NltQq4afU0fHq3LO7CxxLP@vger.kernel.org
X-Gm-Message-State: AFuF++lUAdekpikuFNIkg7rBQx+6t6zH2PanBAiYN93PxErASr2Lvj+r
	slpRH/WYE0Q57nzMOrM+rxGm/weZ3QtXK6m+mb62bW1wtAJIGV0xZsYzsLyePR8F
X-Gm-Gg: AYBFou0mhj9uXuekF75hZSPgz2JQ+94mTFlcxjjxJ4fLpZeRMZHp7EJ4NtDnNeNF4JS
	E7ohfOgBQdlK6edpySqADcmWukp+vx4qpvHVUMghneaChq6C3K59hwWOpo49+TA/+noqp1z29ot
	sm7CA5ky5BqTg7gSnx3a4TQSfCS6sZCNE4B5dlPT3EjMujDP4Qvlr1SqNnqzJCzJf5igveuI9my
	04iHBEMsrIpk93lsESfpU9rgdCxVmT90mz8hbBUHkiyASRVhtec9Nw/rrbgX2b5/nskxStv0wSC
	lpkxLfPGa6R4WwnxF6+YF2/U+GQpF4AJJtzPWyC+dZlKLLpJwwMWYv43gNy8mdkf7sx0d+kASHT
	Bs0JvxzOJfJuQ853AgscmA4mcdWULBXlh9e0fAJqH/jtTTl9+7THYuhyDic0oLfl1LSAgDDwoiN
	RplQA6At5EXqmTN31Peh43wtExZpvnDxkiix2MRAiM6p2oafpPEDxnXSE4etc6J/nmvQK06lHmk
	3VO3cyKoGY2n/8ZKI9Sk9+wTw==
X-Received: by 2002:a05:6102:50aa:b0:77f:9278:af6e with SMTP id ada2fe7eead31-78a4aabb472mr11106797137.9.1788859540892;
        Tue, 08 Sep 2026 02:25:40 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980d774ad5dsm2136578241.9.2026.09.08.02.25.39
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:25:39 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-777c2d69446so3058483137.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8rUx1bL4Y4xdEQ5GbesD9Tm+pQuBr9N1i/WlHfblPJf29VP4N6PdY9jB3dSg4Te8uII2dtSFSnZSZ@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id
 ada2fe7eead31-78a4a90fdd3mr12719938137.2.1788859539059; Tue, 08 Sep 2026
 02:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:25:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com>
X-Gm-Features: AcwNN1USGKMY7TKVnAkjjakrGwhuoyRY6EMfvN47yRnI9dkrkdtdSzBeKR52XOc
Message-ID: <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: renesas: rzt2h: restore correct pin mode on
 IRQ free
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

Thanks for your patch!

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
> false leaving the pin in interrupt function instead of returning it to
> GPIO mode.

OK....

> Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
> interrupt function after we're done using it as an IRQ.
>
> rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
> previous PM value.
>
> Save the PM value before switching to Hi-Z, and restore it after the
> IRQ is freed.

Why is it a problem if the pin is in Hi-Z after the interrupt has been freed?
Isn't that the right state for an unused pin?

>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> @@ -170,6 +171,25 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
>         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
>  }
>
> +static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> +{
> +       u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +
> +       return field_get(PM_PIN_MASK(pin), reg);
> +}
> +
> +static void rzt2h_pin_write_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin, u8 pm)
> +{
> +       u16 reg;
> +
> +       guard(raw_spinlock_irqsave)(&pctrl->lock);
> +
> +       reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +       reg &= ~PM_PIN_MASK(pin);
> +       reg |= (u16)pm << (pin * 2);

General remark: the need for this cast is one reason why function
parameters should use "unsigned int" instead of u8.  The other reason is
that the compiler may add code to mask the parameters to 8 bits,
depending on the CPU architecture.

> +       rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
> +}
> +
>  static void rzt2h_pinctrl_set_gpio_en(struct rzt2h_pinctrl *pctrl,
>                                       u8 port, u8 pin, bool en)
>  {
> @@ -1023,16 +1043,23 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>         struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
>         u8 port = RZT2H_PIN_ID_TO_PORT(child);
>         u8 pin = RZT2H_PIN_ID_TO_PIN(child);
> -       u8 parent_irq;
> +       u8 parent_irq, irq_idx;
>
>         parent_irq = rzt2h_gpio_irq_map[child];
>         if (parent_irq < RZT2H_INTERRUPTS_START)
>                 return -EINVAL;
>
> -       if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
> -                            pctrl->used_irqs))
> +       irq_idx = parent_irq - RZT2H_INTERRUPTS_START;
> +       if (test_and_set_bit(irq_idx, pctrl->used_irqs))
>                 return -EBUSY;
>
> +       /*
> +        * rzt2h_pinctrl_set_pfc_mode() sets PM to Hi-Z before switching to the
> +        * interrupt function, losing the previous PM value.
> +        * Save it so it can be restored when the IRQ is freed.
> +        */
> +       pctrl->saved_pm[irq_idx] = rzt2h_pin_read_pm(pctrl, port, pin);
> +
>         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);

If rzt2h_pinctrl_set_pfc_mode() would return the old PM value, you
could drop rzt2h_pin_read_pm(), and write:

    pctrl->saved_pm[irq_idx] = rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin,
                                                     PFC_FUNC_INTERRUPT);

>
>         *parent = parent_irq;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
