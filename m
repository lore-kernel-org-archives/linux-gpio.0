Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13E539FCCD
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853771; cv=none; b=ulK6Krgt6SQOQCtXzE2Z5x2H4cHzawTiBVvfkALztb454/vyMGbBwqJTWFjqRRpnFC4vj5WBGOQnmBaJ/3VuXB6uslLYAxeQPC8RYPuDljkmS/AMa+Z+iY/nehnMc7mlcnRBYVG3vuDsFA/Dzxei7RJm7mlYRW8YJqj9Kg4WsZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853771; c=relaxed/simple;
	bh=w/a+1msjGoAq5RLfsEPT89FQwvNcgfDXVDAMK+BH8PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgrY1amcT8MMHMykHWplb5p2G9iQQWj0oJg+mnOyQP14q5pkpHSn7D3M3wtEpLRDu1+0LNyGT+TxVDSGetU2DrjhQfEqzAwJc9Lgcy3CjXmfxtpCal9lk0jL8w1vpY6f7FAgpY2j+VaZ1TvIys3Lylg6i5m/FVfIgyv1ko9okzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c66eefc868so4326258e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 00:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853769; x=1789458569;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jvWdv2bTFNskO/RaDsnSTq+0xZGM/I73gHnrYZO6XAc=;
        b=shrpVd7Ee+ApI/ZP2mSkobpuX/ih6cr7UtuF8EwlQ77JEO3h4YYzDHVWpUXn7qBTjO
         bjFcvh65g2izMr5eiUOOur8oxv8l2wJ2p5Lu5ZMzfn6Af1TMAWFU4tlAi4i6UrRJKrgF
         S6pb4u1rErLvmlHf9f0I1nqIk879R9mLHa6VIMdA4fOt0rW2NxfZQOKYQC8TlVV+PYKO
         U0px3uDwTtnUGKehUTOfIKBUvlfKBf7iBR8DvFOsFX9mIBcTNAxjIoXwbUKMQFRvAQmy
         Dhi+KMVl59ELgQ6DWoKmCey4TUpVeR1Q1wldygtDtoYRLycbMeWqczK/W4K+djJ0L4UG
         JAKg==
X-Gm-Message-State: AFuF++nvDOUKCa1qBIRJoT44qrqXclnMl21AM7Ta8sefCj1lDlzmdoW7
	kwmhYeaYqsPF7HGzKBAuFCzadw2GlXHFhI/tvMYpjAo3u6Xkm8x96HB1J+Y0Ua36
X-Gm-Gg: AYBFou1J0XMDrBKDM+MnWqY7ammhS6BJPskKJCLXak63mPK14ZLxplx/1OyHenxv3DX
	kPEeNcjKZOU5jL3cMyVB0zdNYJXFMAnF82v2EN23kqTuznx0jNbMKHZHKlbIrzFelVipV0G/HWO
	5t5Bh4q02PRcbzoGe52FuqAPjyPPM/bgTfLyjA8lF755GECy2IK7VzKcUGFoKwT/5BaeAljs4sh
	DdlQTl+ww33fETs/JIKWIR8zSMH/cYKMISZpqbTPVH2GvCCA+E/ZlsMnLE5cpIHbYsuepxh3uYv
	4NyYLtiR5JwgBwITgr17M18IKBCaBv5Qcy5mD9mliLshXTcYRzyPq135auFh3UdvCVfuZfolwYw
	JCBel/asEjlWXN80JsphyBMjRgzZJjTdfERRlMKXEEx3VqkdCjCSqTVRB2WcGG4nOIrYZLZVx1J
	+fjOUBrQ3bk95jOucInBt7B9v77qYcY6+jMUJoHVf6ZxeyHI83IfkgO2Q2SuDlKBdHANHwAWPZu
	frze+nKvM+URfR06Y5CX4IDiA==
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id 71dfb90a1353d-5c7ed846723mr14906857e0c.8.1788853768636;
        Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm9186223e0c.10.2026.09.08.00.49.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-779d18ef706so3067242137.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id
 ada2fe7eead31-78a4a9c3a45mr12132706137.8.1788853767856; Tue, 08 Sep 2026
 00:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org> <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
 <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
In-Reply-To: <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 09:49:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
X-Gm-Features: AcwNN1V14nvpkxMTS1YJ9lEZFP5Wka8HrashHqoyW3yt83iI5VS79ckl8xfvtwY
Message-ID: <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 7 Sept 2026 at 18:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/7/26 9:53 AM, Geert Uytterhoeven wrote:
> > On Sat, 5 Sept 2026 at 23:57, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >>>> +++ b/drivers/gpio/gpio-rcar.c
> >>>
> >>>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>>>
> >>>>    #define RCAR_MAX_GPIO_PER_BANK         32
> >>>>
> >>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>>
> >>> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> >>> by value, and return the adjusted offset or a negative error code?
> >>
> >> I want to avoid that, since if I only return error value, I can then do
> >> simple:
> >>
> >> ret = gpio_rcar_remap_offset(...);
> >> if (ret)
> >>     return ret;
> >>
> >> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> >> sites of this function.
> >
> > gpio_rcar_read() and gpio_rcar_write() do not return error codes.
> > I was thinking of
> >
> >      offs = gpio_rcar_remap_offset(p, offs);
> >      if (offs < 0)
> >              return 0;
> >
> > which is almost the same, but avoids passing offs by address.
>
> Is there any benefit to it, compared to keeping the value and return
> code separate ?

Naive me (I am not a compiler writer) thinks the compiler may have a
harder time to optimize the code when addresses are involved.

> >>>> +{
> >>>> +       /* R-Car Gen4 and older do not need any offset remap. */
> >>>> +       if (!p->info.has_layout_gen5)
> >>>> +               return 0;
> >>>> +
> >>>> +       /*
> >>>> +        * R-Car Gen5 register layout is slightly different and the offsets
> >>>> +        * that have to be added to or subtracted from each register offset
> >>>> +        * can be divided into five groups, listed below.
> >>>> +        */
> >>>> +       switch (*offs) {
> >>>> +       case IOINTSEL...OUTDT:
> >>>> +               return 0;
> >>>> +       case INDT:
> >>>> +               *offs += 0x10;
> >>>> +               return 0;
> >>>> +       case INTDT...EDGLEVEL:
> >>>> +               fallthrough;
> >>>> +       case BOTHEDGE:
> >>>> +               *offs += 0x70;
> >>>> +               return 0;
> >>>> +       case OUTDTSEL:
> >>>> +               *offs -= 0x34;
> >>>> +               return 0;
> >>>> +       case INEN:
> >>>> +               *offs -= 0x38;
> >>>> +               return 0;
> >>>> +       default:
> >>>> +               /*
> >>>> +                * This here must never be reached, if this is reached, that
> >>>> +                * means there is a catastrophic failure in the driver. Skip
> >>>> +                * any IO read/write to prevent further damage.
> >>>> +                */
> >>>> +               WARN_ON(1);
> >>>
> >>> A build-time failure would be better.  I tried BUILD_BUG() instead,
> >>> but unfortunately gcc is not smart enough to notice this case is
> >>> never reached.  __always_inline doesn't seem to help either.
> >> I had one more idea -- how about we convert the driver to mmio regmap,
> >> use opaque register numbers throughout the driver to identify registers
> >> to the regmap (maybe not a great idea), and then implement .read/.write
> >> callbacks in the regmap_config which instead of doing plain
> >> readl()/writel() for register IO would instead do this remapping ?
> >> Regmap could validate that the opaque register numbers are only the
> >> expected register numbers and reject all the others. Maybe the opaque
> >> register numbers could instead of Gen4 register offsets. What do you think ?
> >
> > That's similar (but more complex?) than the array look-up
> > in drivers/tty/serial/sh-sci.c I pointed to before.
> > drivers/i2c/busses/i2c-riic.c uses the same method.
>
> Those do not use regmap (drivers/base/regmap/), do they ?

No they don't.

> > I.e. just convert the existing register defines into an enum, and use
> > that to index a table with the family-specific offsets?
>
> Are we back to the table look up discussion instead of remap function ?

Yes, I think that's the simplest and best-performing solution: one
extra table look-up (array indexing) in gpio_rcar_{read,write}(),
compared to an extra function call to gpio_rcar_remap_offset().

As a bonus, storing -1 for a non-existing register in the look-up table
would let us get rid of the four existing .has_<reg> booleans, e.g.

   -        if (p->info.has_both_edge_trigger)
   +        if (p->info.regs[BOTHEDGE] >= 0)
                    gpio_rcar_modify_bit(p, BOTHEDGE, hwirq, both);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
