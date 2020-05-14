Return-Path: <SRS0=kxZy=64=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9A3C433E0
	for <linux-gpio@archiver.kernel.org>; Thu, 14 May 2020 14:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B33382065D
	for <linux-gpio@archiver.kernel.org>; Thu, 14 May 2020 14:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzNKDoBh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgENOVr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 14 May 2020 10:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726051AbgENOVq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 10:21:46 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C388C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 07:21:46 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a21so3674422ljj.11
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LygMeb3xw2M+fYo9Y148BP6Gr75CtgMVBn0ooIfMe/Q=;
        b=bzNKDoBhuqkF+xVqWOHEYBqbN1w3pu9TzjOcEidsS0ILqixCnxG3B93lud+ForQ8OB
         nWaLYBBJ9dO9LsraTSGYDx911jXUnN1e6sazIdcKBq3LzOIF9ipctzW2B/Onl1241nnz
         x4ukE9wNVGxWPCJoeTjrS+AK3D3qof/ZDd+IQoUo/cytfC5wxzkfJcCqimRZDD7NtOWE
         3mh//3JSXvqw5hJcyeF16GfBiDCgBY3ijz7MF+Z83CYHhFU+b4/rMWPPuA2WK9yNbUj9
         o2wtYYTceFQ6fBKngfK9WBL4swDsPTBzkM/3G1ul2BrSqvI2bm5b+QrshY3i09zFONOE
         Q3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LygMeb3xw2M+fYo9Y148BP6Gr75CtgMVBn0ooIfMe/Q=;
        b=EQ7GdcnDfjrFa8YRO6xspelVjwQ9lcjdGZBtIiufNBQjAA32UaeSzlhzvwwu5OwOX+
         yMVBpsj6eTke55wIHVIpzboWuk68WvR8ZUzqsNh2Vd88GPXevCzBSXTC8Zt27nnnkKGy
         c2/grRjmuiX4r8eC5jwrwkFGJGJoLdbC3e28hOC4zEKzz38lY/xQYmPv/vKrK2u8UsKW
         A7fbvKW2IHjZ8PHn+QkKu3D1jYe1jjU/uPVi8jhFstcuuEV8+HMZ2Ylan9wdkE8o8+9X
         kF3BwwDbXCp5LIdXOdgqGUbaTyd2PDBr2/Uu9EdTGXSk/+yZzDQtlxOz1tjB4nWSV8CE
         FJXw==
X-Gm-Message-State: AOAM531KZ70dm0KkX3sWqNKxTQ1eRQwn+1rQJXmiRKircxIU0zxVDJM9
        cXZRWhph91BOaWEdnsbdcw995oSL5ZvirU3V5vdl+A==
X-Google-Smtp-Source: ABdhPJz2B1WHv92YojzIzpiSQyDh13GNgVXy0ur8d6Xg59K64GUOG2yL+wHOtX1tTKsgeuZR7xf/CZJ4ZmMHHflWo1k=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr3075442ljh.223.1589466105014;
 Thu, 14 May 2020 07:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
 <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
 <CAMRc=MdwSpWkgLTHN+6cOdG7aBAWWYFBC4+tfSNtA2HgX6s_3A@mail.gmail.com>
 <B0E9AFA73AF60B42B6D323E0C4FEB06F01AFAC5A@dor-sms-xch01.digi.com>
 <20200430145844.GA28588@sol> <CAMRc=Md5-OgNySDG+XHKow0YSzcZHNtWWPwbmd159fpWL8YAJA@mail.gmail.com>
 <20200507033954.GA13974@sol>
In-Reply-To: <20200507033954.GA13974@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 May 2020 16:21:33 +0200
Message-ID: <CACRpkdaUOEqzU6ByfOnvoqpsn2V1qb+PB1YpzjQPfK8gTtrWFg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "Bujanda, Hector" <Hector.Bujanda@digi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 7, 2020 at 5:40 AM Kent Gibson <warthog618@gmail.com> wrote:

> > This would of course add a lot of cruft to the uAPI code. I'd start by
> > moving it out of drivers/gpio/gpiolib.c into a new file:
> > drivers/gpio/gpiolib-cdev.c. This way we'd have everything related to
> > the character device in one place. It would make it easier to: a) add
> > a config option for disabling it entirely and b) add a config option
> > to disable the v1 of the ioctl()s.
> >
>
> Ok, that is widening the scope of the change again, but I'm still willing
> to have a go at it.

I'm very happy if you work on it because you did a great job
with gpiolib so far!

Yours,
Linus Walleij
