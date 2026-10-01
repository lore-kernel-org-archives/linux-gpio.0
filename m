Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2565494800
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856369; cv=none; b=ZosM8RtewNZ1PqN4npcOBGAdQ+15KGJXHKLq7f3N81BnaOmdNNKTfx78QdUrvyZ18ebEbqMce6yqjDBJqA3ulNXjvVJHpCPqXwkg1XUMPM1PJJAKJRVybofsvQeJBJiYeWVY0Tyk3wRbnfboosuFzXo/CIxosAJb8O0HhiMGGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856369; c=relaxed/simple;
	bh=thlMrSAfZjJdaePwpmv4u4sZ/CzX4mYkiYj7X3E0Toc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqC0CJAayCpxjB+etBFT2yJR0HE/GhA2WnGflqHoZK434ej4lOF4IV26sn4rJEQdUoX0OfpW00mY31e7VrQmYHS4EvyL6n19ddMl/oBGkfwwlysoljZ27iGMfgSnOrghB+1WSHXpoertmCnoS0J7+5tlbedcRSy+ziI02R3djxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyX5P91v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyX5P91v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1781F0089C
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856360;
	bh=oFflTVwPFgB5wC1sBWWWQyP2hcLqKZXoXqnWK6jB09I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NyX5P91vzbFhZN0U9vod7AAB3LWbMk0HZEqkXoUBF5HXDkw5sYemUmd/UbuefNcOq
	 gCKRb67oKrelFaOIFra81n5va1cR3oPq7hmPFx5OO0YotIiw5P5ZgSkukv73b8uy+j
	 oP+gTucqufGnSIYUgz/4YzNXHCquafhqk1uPW9ghF7kEcy4yVrqTmtjmNg551p8jgz
	 GUbE+mxI1I94RMkSzSnNGUSYpcAY+24Qwjh8P3kViddZyWTgLlKyB0duYyuS45Phk5
	 p6pwpWdq6ieSVtlszgIWoy9qFdLq717gPQcNbweqMVM2ywOeleHmqYNyS5TaWr6RII
	 xIf/J6vx6jHnQ==
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-4938dd40902so3988862fac.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 05:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwtCp3ArMsfVb/U52CE0jdyqBgd/wJDppjzm+lWGugRl0Z4sO/W3tnruMEi5TLBa6vKAyakxw3DEZl4@vger.kernel.org
X-Gm-Message-State: AFuF++nA8dZYpZQv8FAfpo66I5W1/UW9VZMwuLy6/6WqEGSsDMFXzjUF
	Bep76oSG91TaeGlPBCBm2RPQKysIhK5873UGvFqDlbRQxry3HQcgGh7mDxQVZUSQsQnws6x68jB
	Lhc8inisAcnBTiRP1aZMtPQWGXtsOYS4=
X-Received: by 2002:a05:6870:3226:b0:448:89e3:4c58 with SMTP id
 586e51a60fabf-49ddd47f26fmr4458014fac.18.1790856359785; Thu, 01 Oct 2026
 05:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com>
In-Reply-To: <20260929203634.32998-1-pmazzini@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 14:05:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJidyettiPkFAh9BNaPVKMxyJzgNnaH8qfMc9=HutaQQ@mail.gmail.com>
X-Gm-Features: AclHuK_kjtaxNY-Iy7s6smCT08kvmYV1w1aOxLf8dIwxCcC_POGl6GaEEQo_Grk
Message-ID: <CAD++jLkJidyettiPkFAh9BNaPVKMxyJzgNnaH8qfMc9=HutaQQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 10:37=E2=80=AFPM Pablo Mazzini <pmazzini@gmail.com>=
 wrote:

> prepare_function_table() assumes the first pin is in bank 0. On the
> A523, which has no PA pins, every IRQ bank is numbered one too high:
> the last bank writes past the end of irq_array,

Why don't you add a patch to protect against that?

Something like this (completely untested, not even compiled)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 31cd142ce0f7..c0c90d9e3215 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1632,9 +1632,10 @@ int sunxi_pinctrl_init_with_flags(struct
platform_device *pdev,
        else
                pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;

+       pctl->irqs =3D IRQ_PER_BANK * pctl->desc->irq_banks;
        pctl->irq_array =3D devm_kcalloc(&pdev->dev,
-                                      IRQ_PER_BANK * pctl->desc->irq_banks=
,
-                                      sizeof(*pctl->irq_array),
+                                      pctl->irqs,
+                                      sizeof(unsigned int),
                                       GFP_KERNEL);
        if (!pctl->irq_array)
                return -ENOMEM;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 8bd00c6ff628..9e0ed9c0c1ee 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -176,7 +176,8 @@ struct sunxi_pinctrl {
        struct sunxi_pinctrl_group      *groups;
        unsigned                        ngroups;
        int                             *irq;
-       unsigned                        *irq_array;
+       unsigned                        irq_array[] __counted_by(irqs);
+       unsigned                        irqs;
        raw_spinlock_t                  lock;
        /*
         * Output latch shadow, one word per bank.  Seeded lockless at


> and interrupts are
> looked up at the wrong offsets.
>
> Count the IRQ banks from the first bank that has interrupts.
(...)
>         irq_bank =3D 0;
> -       last_bank =3D 0;
> +       last_bank =3D -1;
>         for (i =3D 0; i < npins; i++) {
>                 struct sunxi_desc_pin *pin =3D &pins[i];
>                 int bank =3D (pin->pin.number - pin_base) / PINS_PER_BANK=
;
> @@ -221,16 +221,14 @@ static int prepare_function_table(struct device *de=
v, struct device_node *pnode,
>                 func[1].muxval =3D 1;
>
>                 if (irq_mux) {
> -                       if (bank > last_bank)
> +                       if (last_bank >=3D 0 && bank > last_bank)
>                                 irq_bank++;
>                         func[lastfunc].muxval =3D irq_mux;
>                         func[lastfunc].irqbank =3D irq_bank;
>                         func[lastfunc].irqnum =3D pin->pin.number % PINS_=
PER_BANK;
>                         func[lastfunc].name =3D "irq";
> -               }
> -
> -               if (bank > last_bank)
>                         last_bank =3D bank;
> +               }

This looks reasonable.

Yours,
Linus Walleij
