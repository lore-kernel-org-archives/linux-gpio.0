Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3DC43FD05
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 07:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938699; cv=none; b=J18lmGz/Ta4YknCRl8pebCj9GOVnn6raLPbHW81VXq8SdCn+AvfrdNKQ6JPgNQ0e29RLj6rBSIKMUiXm51YkFTRl8zAZYX6yaJ9i4Lmm6TRkFSQNSg4GlVrgUvPSsw310ZxpDB+6AU2Q69NvNns5qXhqLFOB6pfxR1rMyKefE54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938699; c=relaxed/simple;
	bh=ArGUM4EWHCEJAPbMFplmlG+j+5FUg/R6HSCILtpRD50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSCfx6GlEZAI92iJ3sRZhGc5WeiRhEpBobPDqgxCGBrblbBRzMJQuasfBI2NwWdzRN+G5PoowNdGH+NMRETkgsQ7wy9dFfcENXeM0DIjqNWc7qfANEopo8oIhfIlf3CvxuA61MjHZCvtOqWMFWbFOES8hNpzj75a6Q79fERn46o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so2978784241.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 00:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938696; x=1789543496;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2MgyCyfPa8QdumBUXGZFVv9KoFPRiHKDsH3R3M+FtDc=;
        b=KMgXLzwSKqpRYEAghdi5cTX3clwqPZ9ye9En6J1y9qVLDBaJL1BXVwWTXCzjWYrKGE
         uEgiDU54d/oF9PVvpjg22css0PenxeKzm/fNDGmyx0d1YekDX9evHYiAaxbMRD3uCLAD
         3bIWzZWQ/T+e1Sv33TjlTA5f+nPJcE1Qo3mmqNQByJVdB4UclRf2e8Lw2UTRj30aQN8n
         ZpAYkYfxzZyTf5mybCcmbGR7C6C9Hkx3QR5ZKvxmHpBNCLWSaldoVifVBJcMJWFrH4Jd
         7ctm6+DBDPc8jOkkiLiT6spGax3r6r2C4rAGZEPKHKD+9M6Rn22l+Wjey0kfS4ISEChK
         T//g==
X-Gm-Message-State: AFuF++nfvc2Ef3d0lYIiZhTCOseETQOKRDkhU4V+Dtho0wR0szci2ERY
	iu31NwY39AWHN/JtHzs5P6pwReSg45t/Gv/XvNK5/wklEEWLe8FfS8ClkP1jbE+l
X-Gm-Gg: AYBFou0cWOes2d+MlxSi/mL1+666e1R7zuaM+SzIolnaLxKLtdTBkbKG/xf7TNYXMbz
	M9lXSeOO/KuGxdYPgP5c8eQHcoqCFss19KYMjtdAlaM3h+DUufOKzbLAfaoI7jz6AeW3j6hLNf7
	32ogPH7GcB6YJI1czRHnCkg6sAIZWeR/r1jtRJF6u49lRgvMfYX9dPYTGVMsZQKr7lo1XbN5YBT
	W8V5QZ2kyPhIucZPGmv/ujdZKSCpoXDQchyjLzDdSfENligN1Vt17j4QmFH8LLTyjRcuguMOQ78
	F/+fZ1srx5jm4aM0t2zt98RYi+QiB/ZA1WuIoxFfugt8lVERRzfJdBvT5oOQmhjqc+/kmX2t4ar
	UYpXdDEfCR8yVAVnuahWkVNdVmh5Y+bHrVHWmny6P72aFCqd4vsdHubp2pHx9HZLTMWWq+GyUQr
	DSd8IVtqBVN78AJdo3BP4wnTcH1VHwV/RVvo7ijTZESSFaQY+AlHMhF+WAcQ+XC5DFDTHg2Lz2O
	cSzj8TCoO3V1LakoMv/BZfPQ1S8XlXLortb
X-Received: by 2002:a05:6102:6495:10b0:734:54fa:971d with SMTP id ada2fe7eead31-78a2ee06a31mr7801911137.7.1788938696181;
        Wed, 09 Sep 2026 00:24:56 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee8039csm11487561241.11.2026.09.09.00.24.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:24:55 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-78a220b5778so4341707137.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 00:24:55 -0700 (PDT)
X-Received: by 2002:a05:6102:cb:b0:784:a925:3f0c with SMTP id
 ada2fe7eead31-78a2ea9acfcmr7265518137.0.1788938695217; Wed, 09 Sep 2026
 00:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909021354.135899-1-marek.vasut+renesas@mailbox.org> <20260909021354.135899-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909021354.135899-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:24:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhCf00CWba5hjNpSM1BGZix-DuVtGKBZOOshGm9oS2Hg@mail.gmail.com>
X-Gm-Features: AcwNN1X-NF44ou7FYcKcKHvL8TOawdQrAM7HFDb_w67a6oZ3uHtHjht2RmO_OIc
Message-ID: <CAMuHMdWhCf00CWba5hjNpSM1BGZix-DuVtGKBZOOshGm9oS2Hg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 9 Sept 2026 at 04:14, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:

It's getting late/early ;-)

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
> ---
> V2: Rewrite this into a table look up

Thanks for the update!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -49,31 +50,48 @@ struct gpio_rcar_priv {
>         struct gpio_rcar_bank_info bank_info;
>  };
>
> -#define IOINTSEL       0x00    /* General IO/Interrupt Switching Register */
> -#define INOUTSEL       0x04    /* General Input/Output Switching Register */
> -#define OUTDT          0x08    /* General Output Register */
> -#define INDT           0x0c    /* General Input Register */
> -#define INTDT          0x10    /* Interrupt Display Register */
> -#define INTCLR         0x14    /* Interrupt Clear Register */
> -#define INTMSK         0x18    /* Interrupt Mask Register */
> -#define MSKCLR         0x1c    /* Interrupt Mask Clear Register */
> -#define POSNEG         0x20    /* Positive/Negative Logic Select Register */
> -#define EDGLEVEL       0x24    /* Edge/level Select Register */
> -#define OUTDTSEL       0x40    /* Output Data Select Register */
> -#define BOTHEDGE       0x4c    /* One Edge/Both Edge Select Register */
> -#define INEN           0x50    /* General Input Enable Register */
> +enum {

enum gpio_rcar_reg

> +       IOINTSEL = 0,   /* General IO/Interrupt Switching Register */

You can drop the initializer.

> +       INOUTSEL,       /* General Input/Output Switching Register */
> +       OUTDT,          /* General Output Register */
> +       INDT,           /* General Input Register */
> +       INTDT,          /* Interrupt Display Register */
> +       INTCLR,         /* Interrupt Clear Register */
> +       INTMSK,         /* Interrupt Mask Register */
> +       MSKCLR,         /* Interrupt Mask Clear Register */
> +       POSNEG,         /* Positive/Negative Logic Select Register */
> +       EDGLEVEL,       /* Edge/level Select Register */
> +       OUTDTSEL,       /* Output Data Select Register */
> +       BOTHEDGE,       /* One Edge/Both Edge Select Register */
> +       INEN,           /* General Input Enable Register */
> +       REG_COUNT

Not needed (even harmful, see below).

> +};
>
>  #define RCAR_MAX_GPIO_PER_BANK         32
>
> +static volatile void __iomem *gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int offs)

s/int offs/enum gpio_rcar_reg reg/ (everywhere), so the compiler knows
the valid range.

> +{
> +       const u32 offsetmap[2][REG_COUNT] = {

static ...

> +               /* Gen1..Gen4 */
> +               { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24, 0x40, 0x4c, 0x50 },
> +               /* Gen5 */
> +               { 0x00, 0x04, 0x08, 0x1c, 0x80, 0x84, 0x88, 0x8c, 0x90, 0x94, 0x0c, 0xbc, 0x18 },

Please use C99-style initializers, for both readability and safety.

> +       };
> +
> +       BUILD_BUG_ON(offs < 0 || offs >= REG_COUNT);

Not needed.

> +
> +       return p->base + offsetmap[p->info.has_layout_gen5][offs];

Please store a pointer to the table to use in priv, so you don't need
to check p->info.has_layout_gen5 over and over again.

After all of that, this function has become very simple, so you can
just inline it below.

> +}
> +
>  static inline u32 gpio_rcar_read(struct gpio_rcar_priv *p, int offs)
>  {
> -       return ioread32(p->base + offs);
> +       return ioread32(gpio_rcar_remap_offset(p, offs));

return ioread32((p->base + p->offs_table[reg]);

>  }
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
