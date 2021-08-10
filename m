Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48DEC432BE
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Aug 2021 09:16:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A09866108C
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Aug 2021 09:16:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238753AbhHJJQr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 10 Aug 2021 05:16:47 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:39875 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238742AbhHJJQq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 05:16:46 -0400
Received: by mail-vs1-f41.google.com with SMTP id e9so4041130vst.6;
        Tue, 10 Aug 2021 02:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mQPok6ABDLyMto7y5aBYiNY0G2sTo/eQyruSr59xtxU=;
        b=ofOdUuHjei6uAtPckoFMAgv+M6joTnHeyqgLBc6sdoJE98udYUOn1S8U0sLr+P4tfL
         oUaoenQ2O8/yrWUahughkL1EsHbrOnmLbFXQdWDjSHezPgboHPy4XWPwRqh7LMNc1zFk
         YbAnmXgspxjJ9LwlPbhsXyMj5zQHYOGLe1DWkj1UZdH1flQfxGilfAj+igxtEWTJex03
         vwaosJp0+5hZ/PPCBmIRhZXa+x3DO0L9kNintJzRUoMXpsXRSYZmKa4/uV9n5G67Lpwy
         0ARqyK/6cH1dIJz5BBQ3b+QxONQNk1SwlmQVu0R3EPy1oXC+3inrEbqfIq2LncLR9lb+
         k0xA==
X-Gm-Message-State: AOAM533VSEUWJVchOIxh1v4RTF0jg1hEvoAtSs+4t7LnAxGkVmehwcMx
        uAgcdgds2pQjiLAmA7F8RVkkmiZyoQhBGluy/xY=
X-Google-Smtp-Source: ABdhPJwvYQclfu1l0xzx4C/lfSrFYrVc+THkQt8ilfmS6eT+DFIk6mXjRpKiFUnjvbGEAGu7CDtbOxQrlOOoejkW5Sw=
X-Received: by 2002:a67:e2c7:: with SMTP id i7mr20053085vsm.3.1628586984598;
 Tue, 10 Aug 2021 02:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210727112328.18809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210727112328.18809-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210727112328.18809-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 11:16:13 +0200
Message-ID: <CAMuHMdVAzU=tfW4ZHaFP1oyewSMJ+zMeOSQhLJ1gvnm3uCraSQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: renesas: r9a07g044: Add pinctrl node
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 27, 2021 at 1:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add GPIO/pinctrl node to R9A07G044 (RZ/G2L) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
