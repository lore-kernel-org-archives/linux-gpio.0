Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E16C4332E
	for <linux-gpio@archiver.kernel.org>; Mon,  1 Mar 2021 17:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CA516510A
	for <linux-gpio@archiver.kernel.org>; Mon,  1 Mar 2021 17:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237710AbhCARPR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 1 Mar 2021 12:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237656AbhCARM6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 12:12:58 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837D9C061793
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 09:10:22 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u11so10286565plg.13
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8yj/u9DZvgsD4rWcutSZdFZSClNz9WQtizXOJWHy0CY=;
        b=Zjtw0rGizztjymDxc8AtSyCQuFkymUgQdnsPc4V+vaui5KY/IE7NmPjH77gdY6jQjG
         pIHNzTrc2Vk/CJDPxSN9q4TctoWngu6tlU8qRbE2kEumTEIXp5lQho0ZPo0HWCMNpHVM
         kJ2VtWLBm+BLVZyz0kT/pnpGNyv+hMaWudnjLg4H63f+oGA7LsVzJ+vWms81MKSxYxbh
         4xJeWpbMVG3A8400haCrBn7oTWtkeiNhQd/U3uSkWuEFAfwj/xjTXzYbExJrahEZkBmF
         VBxBR/ZlbryIjuoVmyZNBIPBXb+6t66fzishVBtebgHwgXaDKJh3iFfaJqeiStGQAUlC
         KQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8yj/u9DZvgsD4rWcutSZdFZSClNz9WQtizXOJWHy0CY=;
        b=Exs36Fqb0wjdp17H3h3iT0frl2BNOYV7IEYmKuuv5fmdPGtsY+yc9DUjdYRQyQZNyB
         tVpUQYStuJX3PtyUDUCzU5kAmHXz5CQ13XRkdiOiFLLYDvnoVC9YX/gpPwJwNK54owNe
         jHMc7HUw6gWYsOghQJpu5B3NU2dLVh4bWAoc+A0nUTHJd7Ko7ANNpgORyBNXdBA7o82c
         iBEgs7roarIEXplB3JX5MJqv/MwnN6GPGV7BOgIUFMBMl414RmVnLRud6rABblIfmf7u
         jICJnbolIdESEWCGG5rtTgbfuAUU7rD9wVmYSm4qnS414E6FHpWm0b3q56eZGrGQw4/f
         qlSQ==
X-Gm-Message-State: AOAM531AjLWlgPMgBCnHbaqSIaTkMPtUb1k/h1hoReBeG0UeJLxv0KzQ
        m4dsWztlU/4XTaAxjnp7jRc2IfZ4/6ARV4V+aLA=
X-Google-Smtp-Source: ABdhPJx/mDIwcc1Hn3fG/YowJb1LwqAsj4oJIu3A+bLtVdXcwSB9N6h/r3QGOqwt65oUlwardDBs7jdpsTgeUmG3Ha8=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr19250826pjx.181.1614618622154;
 Mon, 01 Mar 2021 09:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20201012154709.68521-1-andriy.shevchenko@linux.intel.com> <YDZRTiQ3pLfk1/Z0@smile.fi.intel.com>
In-Reply-To: <YDZRTiQ3pLfk1/Z0@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Mar 2021 19:10:05 +0200
Message-ID: <CAHp75VfbxA+u+mY4h2opGZa6n6e6u-yj+3HcumvQR1=wTmb6ew@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: Drop ARCH_NR_GPIOS definition
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 24, 2021 at 4:21 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 12, 2020 at 06:47:09PM +0300, Andy Shevchenko wrote:
> > The conditional by the generic header is the same,
> > hence drop unnecessary duplication.
>
> Any comment on this anybody?

+Cc: Linus and Arnd, maybe you can help to advance this to somewhere?

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  arch/arm/include/asm/gpio.h | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/gpio.h b/arch/arm/include/asm/gpio.h
> > index c50e383358c4..f3bb8a2bf788 100644
> > --- a/arch/arm/include/asm/gpio.h
> > +++ b/arch/arm/include/asm/gpio.h
> > @@ -2,10 +2,6 @@
> >  #ifndef _ARCH_ARM_GPIO_H
> >  #define _ARCH_ARM_GPIO_H
> >
> > -#if CONFIG_ARCH_NR_GPIO > 0
> > -#define ARCH_NR_GPIOS CONFIG_ARCH_NR_GPIO
> > -#endif
> > -
> >  /* Note: this may rely upon the value of ARCH_NR_GPIOS set in mach/gpio.h */
> >  #include <asm-generic/gpio.h>
> >
> > --
> > 2.28.0
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
With Best Regards,
Andy Shevchenko
