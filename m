Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB784443315
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520558; cv=none; b=faIASC8C2HXEF1YdPUybXS47m1w8Wbvo1v+ZEreOw3MutAA67/WKr7P+ttTP15Mv48xr0hTBt5h8x45YAHcAFMnnzsxvyreTO9hcBdrfwN9Ih/qv+rZNFiMKOc63BMQ0ofBC+hv03S8uxvism0y5U2vT4wuEckkTB+GUPHX6bBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520558; c=relaxed/simple;
	bh=d6jCA5GVTc0ThXif/CzYvuE2cp2VD9so0DaT8N77OTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cye+MYmqqffUWM6H7kuFaC3MvwZe+BUeHZ6zPgEX/mKS/5b0bh1gyQSK2a/6PoMGY+gyS/CAhKUqE6Lger5fZwSVxRggxdFa4PVxWk7IC+MPt5x34xgmggUKmJvFEzjTY6pasWKgqEKQRakMwO7la6Ln/Z2dMhQ5hx/UbSCJgU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c652293bcdso1084625e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 04:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520556; x=1789125356;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kFRwu393qYqOsEzkDFwmTOKtASNW/fykD0KYaVUIBVo=;
        b=dMatZdHyXzrNFiCmzIRiZPbqfMWyb4GoTeXwzbSwIMeczX/s7z++lmZlN6NJg1MIhU
         f8OlCetAoRdCDy2x0e/jfHJnnrOIg1DzZ8mCwMRFPqaqpNZl9RfFKagMaDm3cgfHf1aO
         W082Z2S/EnAVuPexA6lLvM1m7Zp0tJh6KxMCLOJ6wZDlJufm5YhiWB3d57eo6r3YTJko
         Rbr26yvo1nY+kFZ4O0Lj6zPbi2N4hB6Ee1jrDZtOakRRUU89gHeXC5DAcDMZeEFgtLi4
         Q7pU0DuwbJr7m+hIQuE7IiW/S1hJJ8evUP3QEqzby0JAqLvHRRkhW4zbJdGOPsxLTOMZ
         owOA==
X-Gm-Message-State: AFuF++mNISIio3Yn0Ml+O6GLKIKIeWqCkum7X0Rfl94Qj1fKtD783gGz
	NCjgJav6ym2uDsnzbx67uQ7Fd1nxQy/jSQWPYxdFGL1TWOpRxnmiYvw4h3hj9zabInc=
X-Gm-Gg: AYBFou1PKmrttCBSbYjgfqa6WuUChGZ1QDLbpJtNBqxkPdJZJMRTg7HIfUILT/ql0JK
	QGY2WThRbXltBQ1+pe99gItdGsor1xsfXloQIbNr3ti/KT7rof8mymRIYrwY78TN8+X4/tVRUF+
	cW5da50klg9HCFZwgR75RIBTBWIxX4ZHsedH4McLU/FGfnrbsqg9S5pBMtlnBM0NchrtFeVNeA1
	+lGM1GZwPSOyv7I35OhC3VuP9+Cfg/2nTqmMkBKBoJm6tskcFElLW7Jn0ThnrseDP0XxjNkQuUs
	QQBpBnpOhH/8TwWYuxtN9tKLhbTe/ZUZFsa7QU87HEXrp+RK4JN5yEzYni/cZztNBYq9/AzFy0I
	Gp2EGfLT7PxORlAbafa+S2KNHBAR1iY/2Jp+y0fFyn41BK9465t5G7ifVcS1vsit23QOd4Vy6xw
	x5YRW4Er0sBL2LW9NCzOXKA/LkyPuV7+nVdbqk2O9neB7r/qFvP3defngNgp6YaBNlJ631+PvmR
	i+bU1KxyJUJm8e9tkr8sGgD593pwxJvpkRXqg==
X-Received: by 2002:a05:6122:4685:b0:5c6:58e0:b2e0 with SMTP id 71dfb90a1353d-5c7ed7dc638mr2295666e0c.7.1788520555822;
        Fri, 04 Sep 2026 04:15:55 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec35d85fsm1830041e0c.12.2026.09.04.04.15.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:15:55 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so652347241.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 04:15:55 -0700 (PDT)
X-Received: by 2002:a05:6102:3f51:b0:785:b85f:2aa with SMTP id
 ada2fe7eead31-78a4a648a46mr1803410137.2.1788520554747; Fri, 04 Sep 2026
 04:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org> <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:15:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
X-Gm-Features: AcwNN1WMlLVxDyFWD65pnl1NyThp-Tpg9HdlxV40HKkGt6SB_vBjbsP-zmpppFo
Message-ID: <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 4 Jul 2026 at 17:15, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
> Add support for R-Car X5H, which has slightly different GPIO block
> register layout compared to previous generations. Introduce offset
> remap function which performs 1:1 remap for R-Car Gen1..4 and a bit
> more complex remap for R-Car Gen5.
>
> The GPIO block register offsets on R-Car Gen5 changed and the change
> can be divided into five groups, registers which remained at the
> same offset, INDT register shifted by +0x10, OUTDTSEL register
> shifted by -0x34, INEN register shifted by -0x38 and the rest of
> the registers used by the driver shifted by +0x70 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c

> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
>
>  #define RCAR_MAX_GPIO_PER_BANK         32
>
> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)

IMO passing a pointer to offs complicates the code.  Perhaps pass offs
by value, and return the adjusted offset or a negative error code?

> +{
> +       /* R-Car Gen4 and older do not need any offset remap. */
> +       if (!p->info.has_layout_gen5)
> +               return 0;
> +
> +       /*
> +        * R-Car Gen5 register layout is slightly different and the offsets
> +        * that have to be added to or subtracted from each register offset
> +        * can be divided into five groups, listed below.
> +        */
> +       switch (*offs) {
> +       case IOINTSEL...OUTDT:
> +               return 0;
> +       case INDT:
> +               *offs += 0x10;
> +               return 0;
> +       case INTDT...EDGLEVEL:
> +               fallthrough;
> +       case BOTHEDGE:
> +               *offs += 0x70;
> +               return 0;
> +       case OUTDTSEL:
> +               *offs -= 0x34;
> +               return 0;
> +       case INEN:
> +               *offs -= 0x38;
> +               return 0;
> +       default:
> +               /*
> +                * This here must never be reached, if this is reached, that
> +                * means there is a catastrophic failure in the driver. Skip
> +                * any IO read/write to prevent further damage.
> +                */
> +               WARN_ON(1);

A build-time failure would be better.  I tried BUILD_BUG() instead,
but unfortunately gcc is not smart enough to notice this case is
never reached.  __always_inline doesn't seem to help either.

> +               return -EINVAL;
> +       }
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
