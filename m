Return-Path: <SRS0=NuT+=B7=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4045BC433E1
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Aug 2020 14:00:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A341207DE
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Aug 2020 14:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgHUOAL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 21 Aug 2020 10:00:11 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:42356 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgHUOAL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Aug 2020 10:00:11 -0400
Received: by mail-oo1-f65.google.com with SMTP id a6so355391oog.9;
        Fri, 21 Aug 2020 07:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzLgt5x2gh935WH9ejxwlqBEhmqgKtx1ZIoL8UIlqD4=;
        b=C/KXc1VmxFxK+TJfIoZhdS0vDjkoePyJN0c23a3jtAYM+IeQDwR7tTlhtU7Ds+fnty
         ICdHCuuz2IHLWG/tW4ZABwEJg9v6qrFNuL+D53KYJ7nH3v7q83Pup/OdmjTjmZeyfSdt
         72kdIoizjXKFnVDZ4vfQQaLSMa2H/QrxjaiGBZG4nMAwrvpWmGaPiK5M63c+jArte//W
         gF4jS9XBtH2DfcqSxipXtxaGqlMgZpGZeK2DZEQoivtgn7IEKMLqi0XKk1FAyX8OVh8s
         McIB0Lk55rXijsoiUpqQULNNmmXEvR3UPbnQ87J0e10J3/saZSkDC8KSj2mNHmWrZJU6
         KBWg==
X-Gm-Message-State: AOAM5321jrSABLUAZvJt9pwwyJuEcP4WrW+KN5chfBiEgDJql/tLJZ1o
        0Qnrnrz6Ejlma47XBwYGbYmpZMNv5bSegI18q+Q=
X-Google-Smtp-Source: ABdhPJx2f+v8f+vNLreByhakjQWer1XOx/0PwU/hUs2lI9/uxYS5USBCgDe8j7RFCj7hcnLc6cr18CJHzhyKfZZkP70=
X-Received: by 2002:a4a:6c13:: with SMTP id q19mr2209281ooc.11.1598018410086;
 Fri, 21 Aug 2020 07:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <87r1s5hoht.wl-kuninori.morimoto.gx@renesas.com> <87o8n9hoez.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8n9hoez.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 15:59:58 +0200
Message-ID: <CAMuHMdUG3qZAWrWrGY7AWvJssyti7xUPPfM_i2vJXZYrkR5HaQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: sh-pfc: align driver description title
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

Thanks for your patch!

On Mon, Aug 17, 2020 at 6:46 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Now, Renesas Pin Control drivers are under menu,
> but current description are not aligned.
> This patch align these.
>
>         - Emma Mobile AV2 pin control support

Oops, that must be an old typo in the PFC subsystem => EV2 ;-)

>         - R-Mobile APE6 pin control support
>         - R-Mobile A1 pin control support
>         - RZ/N1 pin control support
>         - RZ/G1H pin control support
>         - RZ/G1M pin control support
>
>         + pin control support for Emma Mobile AV2
>         + pin control support for R-Mobile APE6
>         + pin control support for R-Mobile A1
>         + pin control support for RZ/N1
>         + pin control support for RZ/G1H
>         + pin control support for RZ/G1M
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that your patch does not apply to v5.9-rc1 or my sh-pfc branch,
due to the addition of support for RZ/G2H.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
