Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FC7411F80
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767598; cv=none; b=jTBYHSj1IKrZf0H66SC1nP0VHHwGjeeoULoEEVbq6bdJH7kFTflSNah/x8UD9Ft8P/kfBjP917V/FzehMf+JaRB5Z3d4eUFI0WkxNbBfcQsyOGbfPRdd8hxudAGW8fskbODxDZHWSGs4LsNhOHjOhlBNHqROB+2IV/v9xXOBbv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767598; c=relaxed/simple;
	bh=smhBSOCgTJhbT/0tl4vdE8GcuFKDdQa/HesmddcZaEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/HLZbBfwY5GKnKNXyOI3sID04FzrcpX1szC6j/474zKNLl5f4eMmfd60P/EaWMUyvjJ9bcsmwgB8mNqha/C8G3vHbJPiVAjq0NBDZLwrPzP4zGO1aBZZx9jEogfNz3qMbFdh/jjT5NurkehhoWL0X5U5mdf9opn1ZiyleP/nFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso1827218e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 00:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767595; x=1789372395;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xuQ9W/PlY4yeKBUrhKIeC1+yJYAlbcdcEFZm5XOVUho=;
        b=IXSevZA9x0tPI91VhvxMf8GT6E+Z9NpmoCGRCIF6EiSI6o+QBW+vHcJ6tDZ88K/n/9
         Xu5SHAyVgMAs7FdVW6Q7exFKSUZmwupkTPk+PgwaWl+KmbpBhF6g+XTn1HJhunYiaITt
         YDgwoJouWk5mzq/WKLt4zNnG4ydtVquJAMwpvA419kQt3XDPzf0gwYYeJSTPF0Ngl7K8
         CaOD7Q0/BscBdl/Dns47c6UxGmVZeP04ciTDNgOwcCDIP71GLrqOYjw/bsw/pyIl4QGP
         sPW1sDsxedbNH7X5Hg+10SHYt5jR86lBOgDW3fBs2Byx317/K5KSxZ0QbrcLzyF3REFs
         H2aA==
X-Gm-Message-State: AFuF++lJJMLOBVdfYVbtvnVIMxUYeVQWvJHoE1LNSbWrBQKhRhn7ioCB
	XLMQ2OZfp9bSIZPdk1+tiFnJvXDLNRPrS0OGVT9v/1lSbVy4+EUA+6bae9auNfa6
X-Gm-Gg: AYBFou1RKbCf60JDChoZF0kGgLlPhBhxZbY2jHd9o4c6yaZ7OlOoAYr59ef2z6TPDkN
	yjb3nH19qGWoxduwlQGzJH9gFQhKZ3JMEH4QWVY0XbtfPZlOZBkl2Mr/88sGlaj83ZzTrp1/C3t
	q/d+tUoCRQ0LPEFBIg71aIJtGdshym6GS99MMsHkB46VeJE/XSarDY7GS6aDdCUytvNEDONZKUJ
	V/3hpL+aFkOKVbUXeSlt3AMUMcF0YOdSAn4KOt2E61gdB0PdPcExm2rIylocUw5Rwe3Ac/m1YAL
	CeZ2nCmI+lnSzq35ExWHyFeY/Jrft8g2wgJf/BgC3YkqS50doiV9pi0ISCOUfeiCAOgTHREK8mN
	Rh5z64ZOfUt/QZFTe2A7zNTRLD4k1Gp4FQ6qG/X9SiJxTrIGd01t7Km+KTeVUr176zRAOwcWGwW
	Gv4UJO7ETKd28FA55EzwsLc7S5j6IyyrAg00j/KPHP526oZiRGwBbYum/He6+/rLOpj4a8MjDqW
	eSPNNH/mpsjz1oY201v9npC6Q==
X-Received: by 2002:a05:6122:1d47:b0:5c4:1f03:a1fe with SMTP id 71dfb90a1353d-5c7ed298c90mr7978754e0c.1.1788767594968;
        Mon, 07 Sep 2026 00:53:14 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097e5sm7363855e0c.2.2026.09.07.00.53.14
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:53:14 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-785d603efdeso1049228137.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 00:53:14 -0700 (PDT)
X-Received: by 2002:a05:6102:160f:b0:781:210d:28aa with SMTP id
 ada2fe7eead31-78a4a8be7c5mr7302331137.2.1788767593777; Mon, 07 Sep 2026
 00:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org>
In-Reply-To: <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 09:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
X-Gm-Features: AcwNN1WhmE54lrhOaJPOpMY7QFz8OZQIiZjO28-2Vei5FzrroiSGFpU4hWAgaFM
Message-ID: <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 5 Sept 2026 at 23:57, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >> +++ b/drivers/gpio/gpio-rcar.c
> >
> >> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>
> >>   #define RCAR_MAX_GPIO_PER_BANK         32
> >>
> >> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >
> > IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> > by value, and return the adjusted offset or a negative error code?
>
> I want to avoid that, since if I only return error value, I can then do
> simple:
>
> ret = gpio_rcar_remap_offset(...);
> if (ret)
>    return ret;
>
> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> sites of this function.

gpio_rcar_read() and gpio_rcar_write() do not return error codes.
I was thinking of

    offs = gpio_rcar_remap_offset(p, offs);
    if (offs < 0)
            return 0;

which is almost the same, but avoids passing offs by address.

> >> +{
> >> +       /* R-Car Gen4 and older do not need any offset remap. */
> >> +       if (!p->info.has_layout_gen5)
> >> +               return 0;
> >> +
> >> +       /*
> >> +        * R-Car Gen5 register layout is slightly different and the offsets
> >> +        * that have to be added to or subtracted from each register offset
> >> +        * can be divided into five groups, listed below.
> >> +        */
> >> +       switch (*offs) {
> >> +       case IOINTSEL...OUTDT:
> >> +               return 0;
> >> +       case INDT:
> >> +               *offs += 0x10;
> >> +               return 0;
> >> +       case INTDT...EDGLEVEL:
> >> +               fallthrough;
> >> +       case BOTHEDGE:
> >> +               *offs += 0x70;
> >> +               return 0;
> >> +       case OUTDTSEL:
> >> +               *offs -= 0x34;
> >> +               return 0;
> >> +       case INEN:
> >> +               *offs -= 0x38;
> >> +               return 0;
> >> +       default:
> >> +               /*
> >> +                * This here must never be reached, if this is reached, that
> >> +                * means there is a catastrophic failure in the driver. Skip
> >> +                * any IO read/write to prevent further damage.
> >> +                */
> >> +               WARN_ON(1);
> >
> > A build-time failure would be better.  I tried BUILD_BUG() instead,
> > but unfortunately gcc is not smart enough to notice this case is
> > never reached.  __always_inline doesn't seem to help either.
> I had one more idea -- how about we convert the driver to mmio regmap,
> use opaque register numbers throughout the driver to identify registers
> to the regmap (maybe not a great idea), and then implement .read/.write
> callbacks in the regmap_config which instead of doing plain
> readl()/writel() for register IO would instead do this remapping ?
> Regmap could validate that the opaque register numbers are only the
> expected register numbers and reject all the others. Maybe the opaque
> register numbers could instead of Gen4 register offsets. What do you think ?

That's similar (but more complex?) than the array look-up
in drivers/tty/serial/sh-sci.c I pointed to before.
drivers/i2c/busses/i2c-riic.c uses the same method.

I.e. just convert the existing register defines into an enum, and use
that to index a table with the family-specific offsets?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
