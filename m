Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C55C433E6
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Jan 2021 10:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5310520739
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Jan 2021 10:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbhAVKvj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 22 Jan 2021 05:51:39 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:33236 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbhAVKu5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 05:50:57 -0500
Received: by mail-ot1-f45.google.com with SMTP id 63so4674875oty.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AD7rq1YcOLeIrT103POfqeDgDdGOhFclqC3IRgPT1GI=;
        b=a1K5M6XP7iqPhyyhfc5FA4o/GVWB8GzJ4M0Td+tMwh1hTe5LSw1nSx4NDJMN5HkMcy
         Ru9t/O9cRvJEf4k36Dk8H6lYWmeHZ2XBYrQ+rTX/CqPaOwQWAKRk8k8Ip/tVECNzNmta
         5nnEow/xDdSM6nuovjJZfPxJEocrmVfFeAEZWlf8ETRNnKaDBoOpWnC8HwqklMvsfuwF
         K3j4fd20X9cta+Eog2slVtZmV4zdNhA/e5xO4wzYptmZXqcyT+pc8d96yfEeTLLNZQd9
         Uj7Btvmp4jh1PgQ66jHdlpAhGeqLGIV5cxKIwscJT1dAQnkJcfY7y2DegcyY42V+hu41
         xhRw==
X-Gm-Message-State: AOAM531vERKl0bNfpunNjoojHHC8AwcZJIlDqOtEJe4TonOhEqb5edP9
        QaCLgBeuHCnXzQPVERD/Nk6Kb3gUPFIKT2tTM8w=
X-Google-Smtp-Source: ABdhPJz9nLlSH9lFvMNOooiY03+Xjiru6xdkosD+iJl0C1kIxu5CY329hKkWpIpj5QUoMhxg/K/cxhmVWl2oFAmw3Oo=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr2845695oth.250.1611312615787;
 Fri, 22 Jan 2021 02:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com> <20210120214547.89770-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210120214547.89770-5-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:50:04 +0100
Message-ID: <CAMuHMdWd3zRnMJNWwJN8u6XwXmwKdj7zD80ogqCRp2y3P9Ej2w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] gpio: aggregator: Remove trailing comma in
 terminator entries
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Remove trailing comma in terminator entries to avoid potential
> expanding an array behind it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
