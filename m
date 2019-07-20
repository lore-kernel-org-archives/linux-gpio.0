Return-Path: <SRS0=i7jU=VR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F330AC76186
	for <linux-gpio@archiver.kernel.org>; Sat, 20 Jul 2019 19:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1DD820823
	for <linux-gpio@archiver.kernel.org>; Sat, 20 Jul 2019 19:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPXXCaub"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfGTTpF (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 20 Jul 2019 15:45:05 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39488 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfGTTpF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 15:45:05 -0400
Received: by mail-lf1-f67.google.com with SMTP id v85so23911912lfa.6
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2019 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6zi7BGBWDPGh6+puaMo5hMFaiBo8zOmKwcrHdzWtJnI=;
        b=WPXXCaubYskoj0QPIylH3h/PU0qkADg9GQ2CMh1s3TeaDb9Mgl1E01DxhMDDCzfcEk
         IfG1v0WAhQ+ftspq3X0DbR5rN1MZfa2xvlsk8S6EkrTyl+3PYZXmy49Snfl1aSMSpmwK
         F492Yh4bsXqn4dvNqD/XpdVhdcLp0ys1809+ocqvQ3dva/O6m5M8d4BWH6l8i5NEr1MB
         HUfkHYhufQG0ULYI8pgFsD+XV6G9zn/taapi4j5dDeFahwKWCaYbwLesuxBCzlfep4ZN
         WmUX/MjGIQzD41kmM5hnkw8stXamB70KsxaAP7colBGs6YTtK3R9urmFDIXsNdeXmuNC
         pluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6zi7BGBWDPGh6+puaMo5hMFaiBo8zOmKwcrHdzWtJnI=;
        b=GrxwNCaRvageUmezKnb/G5C+ZxdflOIBJocA8E1jSxiw7ttV2Qick5cSPN1K832t7e
         tOnYIlAQnD0UcpGPIaKGGhrrIE3zn6qOt3AUyOxt23owuaLRXp9Dikc/9kadneO2oicF
         YANSGBEDkgnWDRqIes0b5yP38Qj1WhVkD7SJFPRV/XAU9nDXsxYHWqTe60/OtUgT0Qdi
         2VCL4FI21yiqtIkx7Nn9PQjZSrfU2uy0z+GlCfQGllJjBILFEBS1b3ejXhlvwuIoSo/e
         OsShbw0TlRE5gDT7a09Al3eG36AJgDBQa6/9kgNNxn37iNlVD23lydNOnAKzZO66KxPj
         qK3Q==
X-Gm-Message-State: APjAAAUDe++B+1FU6rsjxG2s+9wjcMLzTQA1BQWnKRfz/hY+6v/blInl
        rTW/J/EyVQ1uPUb2HZphBAz6qtlaMNn82VVnKb2EFw==
X-Google-Smtp-Source: APXvYqzb3bkDxrmC1HJ9+imxHHXo9dcFetsG7dzHr+D7Yh2y0AVltjBSzjJnf420eKfj0dcdWKcRWI5Ipg10zWVFyfI=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr28037262lfc.60.1563651902910;
 Sat, 20 Jul 2019 12:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190708082343.30726-1-brgl@bgdev.pl> <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
 <CAMRc=MfB9R70QDqtjG5a5Roq1roeL78Ss5noytrY-7P=tY1OHA@mail.gmail.com>
 <CACRpkdaiZgK1EoaUxDtbm_GJHVjZU56e_qBQ-OF0mmwb5W8+tg@mail.gmail.com> <CAMpxmJWDTkhuWhfSJ-fkJ6r+7a3kErXafQ_sJLVgMf=cA=1+aQ@mail.gmail.com>
In-Reply-To: <CAMpxmJWDTkhuWhfSJ-fkJ6r+7a3kErXafQ_sJLVgMf=cA=1+aQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jul 2019 21:44:51 +0200
Message-ID: <CACRpkdYkp0OnyEiUX_VQF_nu5JumkupdsX9fG4rWCf0apNtX5A@mail.gmail.com>
Subject: Re: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Claus H . Stovgaard" <cst@phaseone.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 20, 2019 at 8:03 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> I'll apply it to my local tree and send it for v5.3-rc2.

OK! Do you see it as bug fix so it should go in the rcs?

It pretty much needs to be a regression to go in there,
because this stub stuff blew up in my face before :/

Thanks,
Linus
