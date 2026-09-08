Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE754855A
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871534; cv=none; b=N/Wt4zcLOnSMlmlJoT4PHIbPQtNhtxh0yQB+9yWpEW3URzT4pL5envxXldL/thhaNb/5bI5BV4worss+iuZwIgeYsIXT1WtJ02z80JYkEzkm+5QhJn8HVxxXfkj1fgc/74ASWEqb19kcCG9HbO+VqKGdyyHURZ8RVUb+F+9VTwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871534; c=relaxed/simple;
	bh=cefWH3zZ7K3vDSf+fLZ09nXocZembIWvzYOmUwp+oTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWn1V7FF9bdPxOHYQRVZZcBhYBLDpRZ5UbrZpSzOATAl0Inz83ulw4ljYyHLzMzqZX1WiUDaV0AnqL7LWE2H/fwBUSfjtSSQeQELyBbVhY3OIQPa1yob/4RA0H2r8bjULarivdeCQW2PbU5x0MyT0nwk6gfdBu4Wn3MkqAdLeG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so1001126241.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 05:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871531; x=1789476331;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sWfYxxbbZLcnhPJrqJjUWtl71HlCnyMUS3wjMmJ9wMA=;
        b=VY58ZiNkir9O2fazw/VX3GoiZJsO1pnYJ5naI+r1Wt4s+bJke+0TNZsR0W0Grl/Wv8
         JoTFcXeXL+Lr+vhgL13C7rKGLrICHigTW5ICXboTRWXaxeRNtLrce7iSAJjoXwF2qYa5
         dpAYxc9kLyUVt/MWq3ZiVtWMfX+MoXW4iRHRsfU8n8xXQ95KzwZkl/Dp24slgR4RAtQS
         QMkks/FwyJQNpN9pi/DY0wYMz4x0Pt0yy/+iI7b9jBFWwc/qsqZ5nGuzWE9LmIAkuRLY
         qF1ktT35xApvxA/EYmwVhgRGiOtZyREINj6eOAP5dY44Iihe/D/EYVIczfGJqBCHQaLx
         uJ0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxj0emnJOXTcZA6lELWJ6yBZXscX9SDbyjnqFdkXje2cwqYnhsADJhmBozqN5xAU34jnzxDGlhRnc9r@vger.kernel.org
X-Gm-Message-State: AFuF++nV3B9l7c+1rrLkTvQDGDO2cOoy/cSpHv0dM26NBF1FmfXHw76C
	TKxEEYJqHsO7nuxr6W6gaS3vU2WrUQI2yHzFlJgi7N87kbkLZB08fhe/aDNWg9tQ
X-Gm-Gg: AYBFou24pzsvRUWp9beDMDpfk7M2UbMJCoaaoU+s6+cFxZp/0csNlqAeLN1SY/KYTTx
	DuBxoDt34q4EHDjU9pzSgXo7nbmSyjUojmYZUnMCAq6DYXDl5daq/w6qyQj5ipr+6S2bMnSlHM5
	wnZCNct9d7TqOhfjtxXhY1Sq1voQc/K916QasDsxeB72h0MLDKtvM2sTjcLMx/tP8wMDFkuN2ff
	LYNlEAdV4lVpOukRwQpbk4M9skxJ33J1tqxFeFaQrUvgWxygqxD3w0dVjuO33q9rWElEOf9JVpP
	2lBxCmwLcwBeDV7GU5CCYAXhzbp8ofrbVpEaN4ABvO0A66ItHnaJFTi0MfDZUyzfbkjkPnWneXX
	PVbNvIS1w2vc9Mhk4dndElG0fg2PF+Nqdlz/+Yzm8qTX3W43qY0ScHCgfM+Pm7v8arHqtauZrmz
	n09nkDdRpgDWu5YPIAKVZ88h2mFL38c1PONNa4wFMe8GVSfJasSftsSN0Bm3CNWbotOjTtSdvJa
	SXtFKbYrNvFHNdSLLFabYpO4A==
X-Received: by 2002:a05:6102:38c7:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-78a4a727bccmr9823688137.1.1788871530764;
        Tue, 08 Sep 2026 05:45:30 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808edd3d81sm9300607241.7.2026.09.08.05.45.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:45:29 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-963f63fe025so1248010241.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 05:45:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzrfbTJf2NWKZHi7m7dtEOprh+FxtoqtX9Pzvs5GElWvytgwZmNCZzzkT7NL1nNrZJyeH1uv7aik0+j@vger.kernel.org
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id
 ada2fe7eead31-78a4a9106f4mr9231211137.7.1788871528665; Tue, 08 Sep 2026
 05:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com> <TYRPR01MB1561960BD76ABAAAEF5AA13B385B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB1561960BD76ABAAAEF5AA13B385B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:45:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+qcwEd0r5_WZEb42DKgEBMWAngjD08BWsc2bZoVf65w@mail.gmail.com>
X-Gm-Features: AcwNN1XD1CUmhUYt-WGNvcOw7i9qN594qU3UZvFGN3lson5FhCOp_jfcJ-nsAHg
Message-ID: <CAMuHMdX+qcwEd0r5_WZEb42DKgEBMWAngjD08BWsc2bZoVf65w@mail.gmail.com>
Subject: Re: [PATCH 3/7] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 8 Sept 2026 at 14:23, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > When exporting a GPIO using the deprecated sysfs GPIO API,
> > > gpio_is_visible() calls gpiod_to_irq() to determine whether a GPIO is
> > > IRQ-capable, which ends up using
> > > struct gpio_irq_chip::child_to_parent_hwirq().
> > >
> > > When using the GPIO character device, it is possible to request a line
> > > and to dynamically switch between using it as an IRQ or as a GPIO, by
> > > updating the edge detector.
> > >
> > > The current struct gpio_irq_chip::child_to_parent_hwirq() implementation
> > > makes the assumption that it will only be called with the intention of
> > > setting up the IRQ permanently, and that it will only be released when
> > > the IRQ domain is freed.
> > >
> > > Since we now know that this is not the case, take the following steps in
> > > order to properly handle that case.
> > >
> > > Implement struct irq_chip::irq_{request,release}_resources() based on
> > > the default GPIOCHIP_IRQ_RESOURCE_HELPERS implementations.
> > >
> > > Move the IRQ setup and release logic inside them.
> > >
> > > Keep the mapping logic inside ::child_to_parent_hwirq() to be able to
> > > provide a proper HW IRQ number, but do not actually setup the IRQ.
> > >
> > > Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free
> > > the acquired IRQs.
> > >
> > > Cc: stable@kernel.org
> > > Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > > @@ -1089,7 +1077,39 @@ static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned
> > int v
> > >                 rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
> > >         }
> > >
> > > -       irq_domain_free_irqs_common(domain, virq, nr_irqs);
> >
> > Why is this no longer needed?
>
> We moved from using struct gpio_irq_chip::child_irq_domain_ops::free to
> using struct irq_chip::irq_release_resources, so free is no longer set.
>
> devm_gpiochip_add_data() ->
> devm_gpiochip_add_data_with_key() ->
> gpiochip_add_data_with_key() ->
> gpiochip_add_irqchip() ->
> gpiochip_hierarchy_create_domain() ->
> gpiochip_hierarchy_setup_domain_ops() ->
>
>         if (!ops->free)
>                 ops->free = irq_domain_free_irqs_common;
>
> It will end up being populated automatically, let me know if you think
> we should set it explicitly.

Thanks, that's the part I was missing.  Please document in the patch
description that irq_domain_free_irqs_common() is set up automatically.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
