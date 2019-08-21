Return-Path: <SRS0=6Eea=WR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961D9C3A59E
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Aug 2019 12:50:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 721A22089E
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Aug 2019 12:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbfHUMuu (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 21 Aug 2019 08:50:50 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39156 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbfHUMut (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 08:50:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id 16so1463368oiq.6
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2019 05:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eB9Y7GSD2lMz5Mb3FDfKXaxScvB7T0KEMWr3yabBvgA=;
        b=Vu8th5YyGc74XADuXfuVPWpM/cI5WPy0Tsk81Wa5v1g+PjAJTDGS+lvZy7fbi92Yln
         TWjelamP1rhtpdhnchJ2MtDzUphMeTV6On5fxGSVzqyYvvVNiR7POvLW6STFXPTRgaN0
         TL04u6SQ80xQ7k8lxQu7dJlS10Ku4QXuIlTr414EAqNCHdNSf5a36EIhamuJHc4cdAVF
         v5K1MM3/KnkDfbFd5mAVQBXmqO8Eyd0CkMOv8hsSHBzXDwAfkvR++GeoPCkDw1QBgu8w
         2OAUkSS//vc4x4rn7BFh1DRAMb1YIHlXOZLfyz3R+k9MLoxyauM6xAve5ImMM0ffgEd1
         hRRg==
X-Gm-Message-State: APjAAAWoqJpbuDFSqTFcBed8sQX3CAlZnSJMWGjMJGiCY8KBBvKE8Wm3
        t2WMw+ZyZ4qwrLirUfIPbuEF57E8shmxm5F0hOyt2g==
X-Google-Smtp-Source: APXvYqxSszbpnh2FZ3MXBxxBTE7dzBQLwWsftHrMb6y+uTiST6Vzyo/BkwFNccMFTx6xarh3dSwpDgvlN3qG7x0Vlbc=
X-Received: by 2002:a54:4618:: with SMTP id p24mr3367840oip.148.1566391848876;
 Wed, 21 Aug 2019 05:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190821070923.687-1-linus.walleij@linaro.org>
 <CAMuHMdWF1GXYtFbjrALRMObqzezd-cBwDPAqhC-9d=RbrLxNyQ@mail.gmail.com> <fb01f312-5cc5-03a1-a1a5-a12819e2ff7b@linux-m68k.org>
In-Reply-To: <fb01f312-5cc5-03a1-a1a5-a12819e2ff7b@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 14:50:37 +0200
Message-ID: <CAMuHMdVsqKqppkvXYm=NiGeikhC_i99hH+Y2ecjQfr3S2-BTZA@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: Include the GPIO driver header
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Greg,

On Wed, Aug 21, 2019 at 2:22 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 21/8/19 5:19 pm, Geert Uytterhoeven wrote:
> > CC Greg (coldfire)
>
> Thanks Geert.
> I am happy to take it via the m68knommu tree if you prefer?

Sounds most logical to me.
Thanks!

> > On Wed, Aug 21, 2019 at 9:09 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >> The Coldfire GPIO driver needs to explicitly incldue the
> >> GPIO driver header since it is providing a driver.
> >>
> >> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >> ---
> >> Geert can you pick this up for m68k?
> >> ---
> >>   arch/m68k/coldfire/gpio.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
> >> index a83898426127..ca26de257871 100644
> >> --- a/arch/m68k/coldfire/gpio.c
> >> +++ b/arch/m68k/coldfire/gpio.c
> >> @@ -9,6 +9,7 @@
> >>   #include <linux/module.h>
> >>   #include <linux/init.h>
> >>   #include <linux/device.h>
> >> +#include <linux/gpio/driver.h>
> >>
> >>   #include <linux/io.h>
> >>   #include <asm/coldfire.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
