Return-Path: <SRS0=iP7n=DA=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63D5C4727E
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Sep 2020 08:56:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E2F220756
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Sep 2020 08:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgIWI47 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 23 Sep 2020 04:56:59 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33054 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgIWI46 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 04:56:58 -0400
Received: by mail-oi1-f194.google.com with SMTP id m7so24286593oie.0;
        Wed, 23 Sep 2020 01:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jaZY2VGrfOfgteqzRX9fhMLVMs898ToBHKtkON5YHdY=;
        b=GI7Ef+sDSDYVrtv7ZDjlexOPBKk4zgMS7viL08DbKehWhVsVIoqtTkDuiIydGTyl7l
         A4C34gwhBBv7sOZik1I3BqWAvvSEDcd/bFX9vINY+B/zgFv4xgGmIgV0N4fLTItIgaB/
         GmQfat/Y3SQIRYV354OLZWoz7shxcZyefSRWchDXJkHHXd4lIBerPZu6c8xwPD3QkZPp
         MF8ygET4E/GMb0Dae0TDSi/Cylm6JyPtds5/WEIKB/jnGpVevXLq6/kSvtjeGmEu61ay
         +Jp3pV5XU0UwsLBrd7J9ngKOBgqQ4kBYTuhUnz/wbOLHNTZlGhAR1DZvQo8O2+hWzlFF
         csmA==
X-Gm-Message-State: AOAM531riexZU0MX/TEYfdXVTkSIykrb+WGvPUH5B3nM09uj5wbuXOTm
        Jhh1J4QLNV2MGMzHt5s6wcabwhZthP6MhocH8tw=
X-Google-Smtp-Source: ABdhPJyDmqT9myuYXjzrqNEkRcWSI00833/w4FaxYSMwmEpBmp4YLuBhR0jeIMTAApp/Jwsj756/kgHSurShm07kbsg=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr5108320oib.54.1600851417838;
 Wed, 23 Sep 2020 01:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200917195924.20384-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200917195924.20384-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 10:56:46 +0200
Message-ID: <CAMuHMdWNHbHE2pSJ2uO=8pi8XrZ43Q2d4kGyUG79aWJYMFsYNA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: renesas: r8a7790: Add VIN1-B and VIN2-G pins,
 groups and functions
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Thu, Sep 17, 2020 at 9:59 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add pins, groups and functions for the VIN1-B [data/sync/field/clkenb/clk]
> and VIN2-G8.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
> * Included vin1_data4_b, field_b  and clkenb_b
> * Renamed vin2_data8g to vin2_g8
> * Rebased patch on latest changes
>
> v1->v2:
> * Added complete list of VIN1-B pins
> * Renamed vin2_data8_g to vin2_data8g
> * Sorted vin1_sync_b pins

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
