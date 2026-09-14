Received: from mail-vs2-f18.google.com (mail-vs2-f18.google.com [74.125.227.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4D6490BE9
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404735; cv=none; b=Zggoei5aRLfWySb600VwMqhJnR46gGqrkqF5gcQWyvTXfPE/rDNVwcYefTm7sICfT2SLUfb/vhjZ40X7fxrDxubHrSD6r+df6yIw/Gx3WzwHbChxRU0V0FJ4rTAlWkjdnwVeXPWrZigy+PjGlSBnOs5tM2hYnGHU4/BW82jowMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404735; c=relaxed/simple;
	bh=UIWk/mFEONZjdGSVThQcGe22wgnytiwRHqb6WEyzl6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEGqo58C3IT0Bqx7anVy8RthYz/6Yh9LEPP5NnmZumiszVfOLYIkWmftKOipPglJav4D7L0FnQlumCeIE6q/N4d54K+C6mIBEEu25l3Lpn8/MsAG8rq3q7oKnvJb/a9WgleabGXC4y/cnUuYPkDw7sbHmSRcuUvRzBMXUtseF5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f18.google.com with SMTP id 71dfb90a1353d-5c67e5168ceso892215e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404732; x=1790009532;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AvI/QWFHsgVdwtTPxxpgjV2LtpVQ5it1qz0zswhLJPI=;
        b=N3qjGfmcBz1inipBY38zgTIkG95kgREDnbNJ2q1D88FbrThxo8A/xxMvFR6g6RC2Oq
         JO/8eJERrtRKs7uipDMqKjh/lyWlWsgYDJTLhiNbqDLkqzH9f/6kPRYX2G/smxrGX4V7
         tMyfHUj1jWFWUrhS7K2f8+bSym0faI9dICEe2nqsoTVHgboIEDm6r27USlVPfTlGLzos
         ktd/K5CxAp/7bJ9bOi65GB68iXA2W/RpJG1yKs3GDT2gXk3q4iA2IiYwtNYi80gJrbyA
         BlHLqtDQknQhKqz0iiepkMF/AlMTcFRtwTWhfH3NBnhnwUIjMU0wFDVqoQMOl7ytA4WS
         0wXg==
X-Forwarded-Encrypted: i=1; AKwUvBy6W0nNwKaxVztsYSxvZ8PfIUAMiq9d53TC3+V7V4HRu1eDaq9IRzbknrFwlpMa4ub7qre6bby9jWPG@vger.kernel.org
X-Gm-Message-State: AFuF++lcM1N37RS1C3v1Ll1yCUgTWTn8E9gVkkPCAwWKZdMwXL4JPnm1
	TqOdtgZYsi4bF7ymoT6ktrrDlBQwpIzleQI084RzqeHUuytgGjUjFl6SyEIEY3S7
X-Gm-Gg: AYBFou0I0olcflSrDJvFdWM3+WAhxObk2iLFm2OkT2nMb8RM+s/jfJhDxg3zjIkaY7s
	9JzFiAnL5ohl2PcVKU/bZ9AMn6733c+C6p9YNd0QG7sIiVoehMN/fj07NyySRvT62AnrIrzai/p
	OHHUaQtocRk4Nq1czenILNzvBc7p5JYzsG0gUZHU+g3L95cPWOHvgfgOeWCotyu6EaYa2gUuzf1
	b9G+Pu0tD15HSMwANgR8VHdH28sbsqaAAsUo13FsAMSHKJuHH/kAUHY/gEItRPeNCwjKdDciwju
	ZfrN1227SDfHnLlrv209rzU9nMbOkfgKmigWUkCcbpCf/OB7T1DYr8JBfO3ceYISsXOLKthVihJ
	7NCVTVOnjyzdCnXy4O/V0H6SQ2ZUQgy4nTwK139SxVzPz92KxnBKeBHAHsuCMVgmMejDGdwlQVR
	8FczJxbPa/YK7BL4JPB3o6kRCpwx1kElWpxwVFtUYmhMWr/pCXXo0mo44M8ihnzX7F02NghpfAY
	4UKoOUcGxfSp8cEhIbVtYcOc+CenlKwPKpD
X-Received: by 2002:a05:6102:a209:20b0:79d:192d:30db with SMTP id ada2fe7eead31-79d192d3445mr771719137.6.1789404731839;
        Mon, 14 Sep 2026 09:52:11 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79274249c4bsm11476621137.0.2026.09.14.09.52.11
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:52:11 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a176c1so1057166e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIfsh/drK2AwJKTJHLxPbTicYxq38al+EV/ep1mcsZ6AP48U9FFNfygnH2iPugWPmz/ArE+wZyREwg@vger.kernel.org
X-Received: by 2002:a05:6122:d86:b0:5c9:54c6:b4c6 with SMTP id
 71dfb90a1353d-5c981a92cbfmr4262605e0c.2.1789404731378; Mon, 14 Sep 2026
 09:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:51:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpTKXkJFFxgZ5W8Qdb=2YFwTNyjkxKqYFr_kLEsLDWcw@mail.gmail.com>
X-Gm-Features: AcwNN1XFaYKKRap8WdI0zgtlhQNDEsuoN6yL245cXUtWnEuRlQigs7Ay4Kwnzfc
Message-ID: <CAMuHMdUpTKXkJFFxgZ5W8Qdb=2YFwTNyjkxKqYFr_kLEsLDWcw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
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
> Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free the
> acquired IRQs. irq_domain_free_irqs_common() will still be set up as
> struct gpio_irq_chip::child_irq_domain_ops::free by
> gpiochip_hierarchy_setup_domain_ops().
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * no changes
>
> V2:
>  * reuse irq_idx in rzt2h_gpio_irq_request_resources()
>  * mention that irq_domain_free_irqs_common() is still wired up

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
