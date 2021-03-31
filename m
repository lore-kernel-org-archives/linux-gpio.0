Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B33C001B3
	for <linux-gpio@archiver.kernel.org>; Wed, 31 Mar 2021 12:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9776B61A48
	for <linux-gpio@archiver.kernel.org>; Wed, 31 Mar 2021 12:31:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235314AbhCaMbZ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 Mar 2021 08:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235458AbhCaMbN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:31:13 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CFFC061574;
        Wed, 31 Mar 2021 05:31:12 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v186so14103486pgv.7;
        Wed, 31 Mar 2021 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EA3BksYoWUwDpWXfwob/BjbORZtBEbr57FHVgHn33lA=;
        b=QKZL8ZTBDHj4T9d0oHHetihGUztCDUbwKe3r0gOUDzG97gDt10rgix4RcfQx1Gxuzt
         cXJn4tjqe+ghZzOby+c1tJkct1VG78ZZryezhUU/rOFFWI0deMlGzd5ctO4zudw4uagH
         kzLzU4ctQGyxefS8ajhe0Q3W+I7qZz59+JmtqqrRNQVBGZL5lBeh2kUgu/nfLYRJgamF
         uiVSTDDgQUUXUIXcdDN9EKRcOt8glo0/3Ob/J0o+BLYpZhMsrst2bUn1AcFqKsa1DISj
         mSVwfLzZOs9JISe2K070naXwo3Qsdlrx1havRcwzbjL+jENQtThFUABMFzL111DZbiU7
         ei/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EA3BksYoWUwDpWXfwob/BjbORZtBEbr57FHVgHn33lA=;
        b=tkBHvsneorDsHh2Owx9+ywS1rRUC2kIPwyy1YkAxJN9pLEq6ksQbCwTV+n87xLwDnl
         5jvx9/T2dPrSxdY3oazFtLTpACrUa0NQfdL7lKdU1qf+a1CaWpC4iZCc6obDqeFIMHOB
         9q/keMvPk72MablnClwOpip9rFOKQpP7cvj6M3QsVYklNTYFPuKpPLCxoqmMMAdP1Lwd
         5AOhXOQydM8jIMk+5rl/mnOlrU4jOiHZMjfZNJvkIszuZ7DRNzHT3Vocz8Zm9omDl+3V
         gHbqKtD+vN4w3ADZ7DVDiJMZp7f6Te8Ptc3YTDUX7vlelHdBfgSJrXuBUmiL9MmR1wLr
         nnIw==
X-Gm-Message-State: AOAM531COGIrChQ142dIF9N2XTACTFsnd3tGfs7Jb//H4SeEKv5YSIPE
        +IFIA03GBQuR8Th73ZaZ/dzACXLh4ylInolwu5A=
X-Google-Smtp-Source: ABdhPJye3qo7n+pc6V1hv7tiiSujP4SVYulRSEF09xCWZsTwhDd+bkBSq0kDB7v0JUKOFa+VY92525dvlrxLezVKW5s=
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr2996644pga.203.1617193872532;
 Wed, 31 Mar 2021 05:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com> <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 15:30:56 +0300
Message-ID: <CAHp75VdXJd8h+56AxXgzSYXRfx6+NxCXNjb0sFwCR1GBHdp_UQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: tqmx86: really make IRQ optional
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 2:37 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> The tqmx86 MFD driver was passing IRQ 0 for "no IRQ" in the past. This
> causes warnings with newer kernels.
>
> Prepare the gpio-tqmx86 driver for the fixed MFD driver by handling a
> missing IRQ properly.

Also you missed a Fixes tag.

-- 
With Best Regards,
Andy Shevchenko
