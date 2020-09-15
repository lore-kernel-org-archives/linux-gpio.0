Return-Path: <SRS0=1Vb2=CY=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C90DC433E2
	for <linux-gpio@archiver.kernel.org>; Tue, 15 Sep 2020 22:53:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 685E820795
	for <linux-gpio@archiver.kernel.org>; Tue, 15 Sep 2020 22:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM3vKSgY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgIOWxn (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 15 Sep 2020 18:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbgIOPjm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 11:39:42 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D4EC06178C;
        Tue, 15 Sep 2020 08:29:41 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bh1so1527051plb.12;
        Tue, 15 Sep 2020 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bk8FHoNYavjQaDMXukfCSYNC7rOp0MBvdAbTSFJ9/og=;
        b=LM3vKSgY2UgkNKUQYWyLUW3BKLsSq+62daDFWAUjlul9vZzWf4dzoBZ90heTZum4QG
         MghPqoe0FtuJFRhPz0Xc3khKfOsoGWKeHTX/T4fTeVCe16wj/R0bgzOcluhVJDyx2Jzq
         5CS4QyXxh4BwcJ5mmGUmlU2z2Tr/0N1MdeQLGcDIksOcKxsIyMp0s9dYEqVbtoCzXCRP
         TymqMryLPlGrEOQuD5YbuYMP9xtaKuO0nkiBODXXKDA4BR1d49aGFVJ8SrN2qQamDtT0
         2QdE+lo3mfc0XEHYv6HTeEKVvW4OqQjVd6r6dzxD4eHFs32rzrNKiNT50+1DLG9JEWV7
         1hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bk8FHoNYavjQaDMXukfCSYNC7rOp0MBvdAbTSFJ9/og=;
        b=IdXvRi6ALTqw9kccGpE9tOOUYz1RktAsifSwKRG2ATJKxW99QioZz1Dz7HjTMWRjJZ
         uqBqmv7VhWf9jjFUx02XtNsGAQAD76+G+vn7VgARRxDpxamSfm09PeFhmZiqAFWhFaR6
         OY6vzCF8gsZN5eO1B/5ssD8W3dmSvEnFlYNWQBLogkLgpWQVSj/vkoG4KkIqa7nfTQvv
         UpDFqWbV9JjCxAV6I187XhiQkhtSYRZLuziVWmPPaFU42DxRbzg5xPX+LEzXBvfAV2SX
         M24uag9D2bdfhZOrZZo7LXHoE+w29ZZmhjJ6E9P+vhwoaOXQnkzrfPEngoVuGOKcsr+k
         qVjA==
X-Gm-Message-State: AOAM531+PL/d5UmtfTcO9uu9ohUBTs5F32E0XQyg70JWzEq66SGIuidR
        Hvz0k41l1EDtDKmBRhWk/8XUzohd3VOVz5UFxCx3lHJKh7N6OQ==
X-Google-Smtp-Source: ABdhPJxKjhiVblnEJ+XgcD+hNUOkCKuxtSDTmDTGsfu64NbYz0Yrj+ANymccEQG44AElxPbr0SwISTERfqm9I8z5NKc=
X-Received: by 2002:a17:902:b7c7:b029:d1:cc21:9c38 with SMTP id
 v7-20020a170902b7c7b02900d1cc219c38mr8557505plz.21.1600183780761; Tue, 15 Sep
 2020 08:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200909102640.1657622-1-warthog618@gmail.com> <20200909102640.1657622-8-warthog618@gmail.com>
In-Reply-To: <20200909102640.1657622-8-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Sep 2020 18:29:23 +0300
Message-ID: <CAHp75VcJjPverHO9JxTBPfTn+L8rZnc2u=bhjJh63ZKbO1MPCA@mail.gmail.com>
Subject: Re: [PATCH v8 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 1:35 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
>
> The struct linereq implementation is based on the v1 struct linehandle
> implementation.

Seems I have reviewed v7 of this. According to the changelog most of
the comments are still applicable I think.

> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> The linereq_ioctl() is a simple wrapper around linereq_get_values() here,
> but will be extended with other ioctls in subsequent patches.
>
> Similarly, the struct line only contains the desc here, but will receive
> the edge detector and debouncer fields in subsequent patches.
>
> Changed for v8:
>  - fix BUILD_BUG_ON conditions and relocate them before the return in
>    gpiolib_cdev_register()


-- 
With Best Regards,
Andy Shevchenko
