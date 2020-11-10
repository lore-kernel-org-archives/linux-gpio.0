Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AC7C4742C
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Nov 2020 13:18:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56101207BB
	for <linux-gpio@archiver.kernel.org>; Tue, 10 Nov 2020 13:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JEU+FpCQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730897AbgKJNSo (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 10 Nov 2020 08:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730651AbgKJNSn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:18:43 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0BDC0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:18:43 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id f11so11184311lfs.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PbtNRUPuQPl2iPHtHsFzIyJlFka3u6ABmz9AweEvBgw=;
        b=JEU+FpCQ4IbiXRB7mCcxfDQmNhCAL3Z7wxJyaND/4hv2laT+z8uY+XF51xWMjgOz3Q
         V71ntAa1mko7FwZr9u6SMprNPIilW9Xj46sh19ntel+CGfwXPxr1UFGpbrXshCAuCrd5
         j75+beOtbw68yN4Y43uvCvvBHyazspeJT0TLMENviP9R2KMTUvJHI12ZB5cLst7m6JEv
         bIS1TR0x1opMRhe1+qgas7wlC4pgz93XK6HBdTZXvydtlhIK5UD6sfgPs8TcE4H6wSeS
         1YAiXStukw9jxytvk7+1oX6P9WPseaZmSrxSAsZHB4osdR+VxBthaIA9sRykzh7eqeXw
         PJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PbtNRUPuQPl2iPHtHsFzIyJlFka3u6ABmz9AweEvBgw=;
        b=mSTs79tgMpXnX3tH75a1rcQLoYKKX4JPCzYNk6cEPx8iHxzOhXgP4Qj5moUJWwsq8j
         /XY7xe4ddU0JRT+uiDxuUhymSQPaKFvZDbtN916J00L90pGgZaF6XOfJDeebZdPdrFlf
         lpEL8yu52XdfV1qG/vLEz+JIFSeYpCv1LWQWgrNnI2Zo9bL6k96VvclpBQ2rDpkHTwIN
         JWpqWqxRvR/oeoUSQihP8ETjWLEgUMpukNIPcKASoAHM/gnW20/KG0Co7bBQo8ybaAvw
         NOhrU4zXuqI/b4qm4qskrR+7smkww8qm/VHudgCLpe8s8fR0k0qaeSPzson5MK46g02A
         Du0w==
X-Gm-Message-State: AOAM533jbWqLUuw9zPxizDprVxhkhve79vhwmw5PqCGdkyyYffwXxk2E
        z5uZHELHawf9lGQtHxdDWWM9nmO5yQAfsUZahKmkAQ==
X-Google-Smtp-Source: ABdhPJxbENFIcFdIy0BtvMJE7at99ADDRfiC2tMAFYrsLb/EWwJPTu+QbDj7QZ2jlNXlZKOAZtK0ok5mUjQbr18UzpA=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr7151465lfm.333.1605014321429;
 Tue, 10 Nov 2020 05:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20201105231912.69527-1-coiby.xu@gmail.com> <20201105231912.69527-2-coiby.xu@gmail.com>
In-Reply-To: <20201105231912.69527-2-coiby.xu@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:18:30 +0100
Message-ID: <CACRpkdb51B-bx3SPHZOeFG=+Qu5Ev-Sv9=wsFqXs3d-ykzcJ2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] pinctrl: amd: fix incorrect way to disable
 debounce filter
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 12:19 AM Coiby Xu <coiby.xu@gmail.com> wrote:

> The correct way to disable debounce filter is to clear bit 5 and 6
> of the register.
>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Link: https://lore.kernel.org/linux-gpio/df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com/
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

This patch applied for fixes and tagged for stable.

Yours,
Linus Walleij
