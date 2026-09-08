Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555FD53A8AE
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869788; cv=none; b=tTlUQ/ICxYWjJt+wUAVE4VtWnE/6Jr7M0lSe7InkpLMHNS1iV0dU7h8WnILOihLLSj8wMC36QPtoC0n2DP5vgSwO3jL79m144imeC6EO6PiY68WXL6nHBHW424/rn5CpC0jdkF6t59k0ifCz5Wpvo5cotLqE3vdSB7cVngp+18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869788; c=relaxed/simple;
	bh=GkAEwkhAh2GYIkLx6cCmw7o1fsF123JG5M31hDK1crM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXKMv8CIVeazaVvImgJnE0RsfYwWbf4LFV65TrePbqwSCP15NYBk+UqxQc107mk61o3of3UsVfMdGh9O8lvkIo4M43+d5OnfO7DwvdaoZXuLfuA87hUlq384tAeeLfwidAEQIFr5xFeZiPttSstLtdxG7ZbfFiJeq7RTVkHx+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97e96666dd6so2647207241.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 05:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869778; x=1789474578;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z3ivAQedapV9TM2nRTd5rbGn+RixfFjk0mtfmMN+Qx8=;
        b=To55WBV/9c8AMnjgIQRBGw24T9FfuOpwniYZDGOEFduHeaMuZs9umBBzCe3tKxgiwa
         28drrP8UC+ldskRaIgyoks5vMvatPYEuWXD0IFmxIpVdZcdiarKNuTnG3gIChbEKPSO9
         IMtFXyBvKD/1o3qptnA9Gxy2R0hCnvf9uk9FWAnezXCAil0h+A7tPHoUGH3zMBYPRp9i
         /MSGf9tIMsoka4HGg8IVeZJqjlQE+3Jp9wK+SxL2bekKdsHQDiLuHlw9P2YseoRVC4BA
         ukPZ2oWtKyAgArgqX6+cKrpO2gRz8ZB+sxYg887DzEAbAJLqDOFMAlZGXhBI1vdQbJo5
         OmHg==
X-Forwarded-Encrypted: i=1; AKwUvBzPE74KF0rY9ov8msBHiQC7TmBZwCrylgW/ecWLs2CFNxzJ4q2u0SUDAQekDs1NIYWFqElI+9ifECTr@vger.kernel.org
X-Gm-Message-State: AFuF++nwRwzll50nhNIBTfAqE9T6L4IVdA/VfD4tpKhtvPW/3v4e8VNZ
	HqRWOzZ4m3J0ZNlnSnmirQFaPZRRpo3Kkuod737eG4Lm3Wm1a86vKAmnAKChJ2H4
X-Gm-Gg: AYBFou2S3odoG4Fmd4bbGhgkWdWz+0v0oc0vSqLijC0Yxb7VpPqLTinLiy0CO9rwKaI
	3s0GZqYzTsnAOuajmphngZEb0PADkJzM6jPUMs7I2yo1XTzozOFisL/l+CM05CZv4890tCCj1n3
	bqJDTv3fxlMDFl+gJ6moO72OTTSOMI3Mhz/BWfzo9upiqbJLIuRs977m1ecU5u06pdoaQtAjh8H
	JqWjykP4pF2nXIuEge+MsObyJ6wUZADGf6eaCd1bz4z9oPrQPjDxlQKBetqUsk10J2EIxaKzcC4
	w1xZSU1t1qIAF+uR157X8lcxfdHbtx83H2EdBTL1mAr/HHSSIZNLinhpbNT5uv0oxlTdzzZSnpj
	AJinzNm5uQ9bH32sUnzmM2hBVgSl7KauJVqpA3nul8IeR01+n0uxjwcHEYXMx7yjh/z6t5QtiEo
	SozuJ3i07pmYCUgDX8X/UrS9J8b2dC0mrgWZzdorm9pnc5RKdDUIm1wbxfqULatRc8+IQXpcYPp
	j68/1XlS5MebXgwkV+K+LEPRuBTILLewZBs
X-Received: by 2002:a67:c797:0:b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-78e1e0feb97mr2034417137.2.1788869778350;
        Tue, 08 Sep 2026 05:16:18 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808edd3d81sm9235050241.7.2026.09.08.05.16.18
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:16:18 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so2391031241.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 05:16:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByT07+mhkJEDEWG1GDa7Jo8MFtuk4FaEC6di1dE8a9r5nL/dxJBrl5qPzTvzbqPuz2sSnw5JXInsGAG@vger.kernel.org
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id
 ada2fe7eead31-78a4a8436b7mr12752699137.7.1788869776751; Tue, 08 Sep 2026
 05:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com> <TYRPR01MB156193BED16FC87EBE4B2008885B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB156193BED16FC87EBE4B2008885B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:16:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNzUJjvzkipZZY7EP+-sCUC-vDndFrjAY50j=HMNB4fA@mail.gmail.com>
X-Gm-Features: AcwNN1UYRmPMEh1uwkSa9mR-HbOhT0h9W6j5sM8pk6E_tmyyrP47WzL_coSV8xc
Message-ID: <CAMuHMdVNzUJjvzkipZZY7EP+-sCUC-vDndFrjAY50j=HMNB4fA@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: renesas: rzt2h: restore correct pin mode on
 IRQ free
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 8 Sept 2026 at 13:33, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
> > > false leaving the pin in interrupt function instead of returning it to
> > > GPIO mode.
> >
> > OK....
> >
> > > Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
> > > interrupt function after we're done using it as an IRQ.
> > >
> > > rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
> > > previous PM value.
> > >
> > > Save the PM value before switching to Hi-Z, and restore it after the
> > > IRQ is freed.
> >
> > Why is it a problem if the pin is in Hi-Z after the interrupt has been freed?
> > Isn't that the right state for an unused pin?
>
> It wouldn't be an issue if it was actually unused once the IRQ is freed,
> but that's not the case, because you can call gpiod_to_irq() on a GPIO,
> and then request_irq() on the IRQ returned by it. If you then call
> free_irq(), you only free the IRQ, not the GPIO itself. After that the
> user of these APIs should still be able to continue using the GPIO.

OK.

> If the pin is left in Hi-Z after freeing the IRQ, rzt2h_gpio_get() will
> see that the pin is not in peripheral mode anymore, it will then see
> that neither PM_INPUT nor PM_OUTPUT are set, and will return -EINVAL.

That is fixed by "[PATCH 4/7] pinctrl: renesas: rzt2h: fix reading pin
value in IRQ function" anyway, right?

> > > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> >
> > > @@ -170,6 +171,25 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
> > >         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
> > >  }
> > >
> > > +static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> > > +{
> > > +       u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> > > +
> > > +       return field_get(PM_PIN_MASK(pin), reg);
> > > +}
> > > +
> > > +static void rzt2h_pin_write_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin, u8 pm)
> > > +{
> > > +       u16 reg;
> > > +
> > > +       guard(raw_spinlock_irqsave)(&pctrl->lock);
> > > +
> > > +       reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> > > +       reg &= ~PM_PIN_MASK(pin);
> > > +       reg |= (u16)pm << (pin * 2);
> >
> > General remark: the need for this cast is one reason why function
> > parameters should use "unsigned int" instead of u8.  The other reason is
> > that the compiler may add code to mask the parameters to 8 bits,
> > depending on the CPU architecture.
>
> Should I switch the pm parameter to unsigned int for V2 then?

Yes please.

> > > +       rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
> > > +}
> > > +
> > >  static void rzt2h_pinctrl_set_gpio_en(struct rzt2h_pinctrl *pctrl,
> > >                                       u8 port, u8 pin, bool en)
> > >  {
> > > @@ -1023,16 +1043,23 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> > >         struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
> > >         u8 port = RZT2H_PIN_ID_TO_PORT(child);
> > >         u8 pin = RZT2H_PIN_ID_TO_PIN(child);
> > > -       u8 parent_irq;
> > > +       u8 parent_irq, irq_idx;
> > >
> > >         parent_irq = rzt2h_gpio_irq_map[child];
> > >         if (parent_irq < RZT2H_INTERRUPTS_START)
> > >                 return -EINVAL;
> > >
> > > -       if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
> > > -                            pctrl->used_irqs))
> > > +       irq_idx = parent_irq - RZT2H_INTERRUPTS_START;
> > > +       if (test_and_set_bit(irq_idx, pctrl->used_irqs))
> > >                 return -EBUSY;
> > >
> > > +       /*
> > > +        * rzt2h_pinctrl_set_pfc_mode() sets PM to Hi-Z before switching to the
> > > +        * interrupt function, losing the previous PM value.
> > > +        * Save it so it can be restored when the IRQ is freed.
> > > +        */
> > > +       pctrl->saved_pm[irq_idx] = rzt2h_pin_read_pm(pctrl, port, pin);
> > > +
> > >         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
> >
> > If rzt2h_pinctrl_set_pfc_mode() would return the old PM value, you
> > could drop rzt2h_pin_read_pm(), and write:
>
> The main function of rzt2h_pinctrl_set_pfc_mode() is to change the PFC
> mode. Returning the old PM value as a side effect would mean the
> function does two unrelated things.
>
> The extra register read this avoids only happens on IRQ request/release,
> not a hot path, so I'd rather keep the two concerns separate if that's
> okay.

Fair enough.

>
> >     pctrl->saved_pm[irq_idx] = rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin,
> >                                                      PFC_FUNC_INTERRUPT);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
