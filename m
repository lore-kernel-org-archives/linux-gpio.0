Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780EC3C585E
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937818; cv=none; b=XkhNLdj9Dlk3MlpXq67pVALJdy8204JjperRlJH4n4c6WAE/rlTCHxJpQRNQE3MtSk1xPPXLDFonkx9qkCX6QQOyl2KJEK1s3wUiGlXPL2tQ1pzA4+WX77jfm0ACtdpusj25pdz4M6Xhst/q8aNFmWMLRkz1Kfn2VlX7U3UQqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937818; c=relaxed/simple;
	bh=xtvAdc18ghBTpVdh52XHh10xl6bE+yFY3X/qpW3LJN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMhoGnFz8U8LWdS9CTd6XOAJQXt6lhc+OMqcD1/fa5QWk6udyIfkO3Ia3iOhMfwXQhZyO/t9fnfA5m1Zf6NWy5BMCFMF54TJX9fwsCeLQwI7iS+3b5eyFAEbe46sm3YO45xXkjU2m+qfZPGSBlqtAH7s1CNdZgKJKtHSa1NK30M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so3654119241.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 00:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937814; x=1789542614;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MbiU+Gmg7tt4Ds22WMmgVMp5D6+AnMt3i1Pvl+3BP1U=;
        b=C1DgPyGNRC8mfqj29q9FU7bv4aEF4DYqByh98t5Qj/Ku8TLmchFEcPe6bFZOfkO9PW
         ne/vGP3LVp+Ai57blvTEjdb2hn7G8/D+3F1pnCgA9yOPiXItFYBOOGdW7TfDSXjf9mAg
         A+H+EWUrvdwcDvwG6sfryhMB4rrQ9unoiEnnc/xqiXZB4mWqRn9P6RCGhKhJ3if8bSNH
         xmEwLaqQOYTMpjML7N7FOc7fRJtkIVOYSzVHCgva5czJJOXK5kMU64h39tG2A2PsXI+C
         zM681b4m6g0R3UWtMy+sgrv6RxFY21LZ8jplwAaqgZ9xCM+8GOVoucLBWi3064+bAbG8
         kC+A==
X-Gm-Message-State: AFuF++mIMp3+b2KKZYcjCt68kNtLKZqGptLmecUl5qbFIWyhXYNSOIsE
	mlW3E5RacOp1nQxRiTZbd1qweuuD1xtwUPqLfHdI4f6y23nyqY2UwtzssHfLTkPg
X-Gm-Gg: AYBFou1LM07THyJ+SuKTFY2mefc1X9TE04J9db3ZcFsNh3z3kbFWc/R2G+8Z84skn4Z
	w8DRaoXMgxkKFQ7OcwyGrPWQqkQIQ4cyLVaZr/YYhaIBbpPxGlbwJibyyqMNWzAgmEEMw4eue6X
	r7+deKJmXn+EKzAzqQBVcoLohYXHsLDzZXiF3zWbLMlo4DkwCUvhm5aY8DN/Cn1SidCfcF3IaHo
	exRixAOgoMBtNhLZKEL3Er7MUtG5qvkVkID/xXLv/IiJJSvs8fHFJlBpvBBrDv3ecDy5aHA3/PJ
	AjML0EuJLHl9556WgGLJAVkz4Dv8BB9sNemS/r1/csPeybgn7CqAY2r7+lEHeDkGdFa6lqt7WPj
	OClYn3aCBzOL94LGKsOoLrnETuayHiISLlN8intLEJmQ3j1MNvCxak9OVZrt0uqriqWFty3dLLd
	HR5Z7vcdSZ6Ruq0cBRgN1zJ3uOAm5pw4HvUxU0oywv4i34i4r9C8t91pvXNyTEqD1b+Lr/5KrrE
	WzrdpIxr5B5gAicIBuKh48FAUwEl5QMxJ5x9MC7z1mo1+M=
X-Received: by 2002:a05:6102:c49:b0:78f:fee6:832 with SMTP id ada2fe7eead31-78ffee60869mr380330137.12.1788937814111;
        Wed, 09 Sep 2026 00:10:14 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98097de57d4sm10062200241.10.2026.09.09.00.10.09
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:10:10 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-78a338fe106so4413699137.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 00:10:09 -0700 (PDT)
X-Received: by 2002:a67:ce08:0:b0:78f:efcb:23dc with SMTP id
 ada2fe7eead31-78fefcb246dmr362053137.13.1788937809146; Wed, 09 Sep 2026
 00:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org> <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
 <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org> <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
 <b837e41d-ba6f-40bf-89db-b62ccd2be467@mailbox.org>
In-Reply-To: <b837e41d-ba6f-40bf-89db-b62ccd2be467@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:09:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt8LQbpXfPB_MVhPP0Ro_n3L8VkOJCs1oF=WNe8MkcAQ@mail.gmail.com>
X-Gm-Features: AcwNN1VSSE2fLPvAgm84NJgnwSpTg-UVtPnuSPQuKoRSOCrHArKIFOH_BqKYQOA
Message-ID: <CAMuHMdVt8LQbpXfPB_MVhPP0Ro_n3L8VkOJCs1oF=WNe8MkcAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 9 Sept 2026 at 03:34, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 9:49 AM, Geert Uytterhoeven wrote:
> >>>> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >>>>>> +++ b/drivers/gpio/gpio-rcar.c
> >>>>>
> >>>>>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>>>>>
> >>>>>>     #define RCAR_MAX_GPIO_PER_BANK         32
> >>>>>>
> >>>>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>>>>
> >>>>> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> >>>>> by value, and return the adjusted offset or a negative error code?
> >>>>
> >>>> I want to avoid that, since if I only return error value, I can then do
> >>>> simple:
> >>>>
> >>>> ret = gpio_rcar_remap_offset(...);
> >>>> if (ret)
> >>>>      return ret;
> >>>>
> >>>> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> >>>> sites of this function.
> >>>
> >>> gpio_rcar_read() and gpio_rcar_write() do not return error codes.
> >>> I was thinking of
> >>>
> >>>       offs = gpio_rcar_remap_offset(p, offs);
> >>>       if (offs < 0)
> >>>               return 0;
> >>>
> >>> which is almost the same, but avoids passing offs by address.
> >>
> >> Is there any benefit to it, compared to keeping the value and return
> >> code separate ?
> >
> > Naive me (I am not a compiler writer) thinks the compiler may have a
> > harder time to optimize the code when addresses are involved.
>
> Will the compiler generate code that is worse in the end ?
>
> >>>>>> +{
> >>>>>> +       /* R-Car Gen4 and older do not need any offset remap. */
> >>>>>> +       if (!p->info.has_layout_gen5)
> >>>>>> +               return 0;
> >>>>>> +
> >>>>>> +       /*
> >>>>>> +        * R-Car Gen5 register layout is slightly different and the offsets
> >>>>>> +        * that have to be added to or subtracted from each register offset
> >>>>>> +        * can be divided into five groups, listed below.
> >>>>>> +        */
> >>>>>> +       switch (*offs) {
> >>>>>> +       case IOINTSEL...OUTDT:
> >>>>>> +               return 0;
> >>>>>> +       case INDT:
> >>>>>> +               *offs += 0x10;
> >>>>>> +               return 0;
> >>>>>> +       case INTDT...EDGLEVEL:
> >>>>>> +               fallthrough;
> >>>>>> +       case BOTHEDGE:
> >>>>>> +               *offs += 0x70;
> >>>>>> +               return 0;
> >>>>>> +       case OUTDTSEL:
> >>>>>> +               *offs -= 0x34;
> >>>>>> +               return 0;
> >>>>>> +       case INEN:
> >>>>>> +               *offs -= 0x38;
> >>>>>> +               return 0;
> >>>>>> +       default:
> >>>>>> +               /*
> >>>>>> +                * This here must never be reached, if this is reached, that
> >>>>>> +                * means there is a catastrophic failure in the driver. Skip
> >>>>>> +                * any IO read/write to prevent further damage.
> >>>>>> +                */
> >>>>>> +               WARN_ON(1);
> >>>>>
> >>>>> A build-time failure would be better.  I tried BUILD_BUG() instead,
> >>>>> but unfortunately gcc is not smart enough to notice this case is
> >>>>> never reached.  __always_inline doesn't seem to help either.
> >>>> I had one more idea -- how about we convert the driver to mmio regmap,
> >>>> use opaque register numbers throughout the driver to identify registers
> >>>> to the regmap (maybe not a great idea), and then implement .read/.write
> >>>> callbacks in the regmap_config which instead of doing plain
> >>>> readl()/writel() for register IO would instead do this remapping ?
> >>>> Regmap could validate that the opaque register numbers are only the
> >>>> expected register numbers and reject all the others. Maybe the opaque
> >>>> register numbers could instead of Gen4 register offsets. What do you think ?
> >>>
> >>> That's similar (but more complex?) than the array look-up
> >>> in drivers/tty/serial/sh-sci.c I pointed to before.
> >>> drivers/i2c/busses/i2c-riic.c uses the same method.
> >>
> >> Those do not use regmap (drivers/base/regmap/), do they ?
> >
> > No they don't.
>
> What about my regmap suggestion ?
>
> >>> I.e. just convert the existing register defines into an enum, and use
> >>> that to index a table with the family-specific offsets?
> >>
> >> Are we back to the table look up discussion instead of remap function ?
> >
> > Yes, I think that's the simplest and best-performing solution
>
> The performance benefit of the table look up was never confirmed.

You think a single array element retrieval would be more expensive
than an out-of-line call to regmap, involving function pointers and
(oh yes) a table look-up?

> > : one
> > extra table look-up (array indexing) in gpio_rcar_{read,write}(),
> > compared to an extra function call to gpio_rcar_remap_offset().
>
> The function is inlined by the compiler. The table look up will likely
> suffer due to non-locality of the data in cache.

It is not inlined by gcc 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04.1).
The table needs 13x2 bytes, which fits in a cache line on anything
but m68k.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
