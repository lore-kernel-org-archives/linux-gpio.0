Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A21DC2D0E4
	for <linux-gpio@archiver.kernel.org>; Tue, 17 Nov 2020 11:00:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC216238E6
	for <linux-gpio@archiver.kernel.org>; Tue, 17 Nov 2020 11:00:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="El6c/aGl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgKQLAJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 17 Nov 2020 06:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgKQLAJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 06:00:09 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB00C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 03:00:09 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id d17so8515911plr.5
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 03:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vMrsJ0mjdfWTMnKiKc/71S+hMwiMC+3w+1OPLxrqsEk=;
        b=El6c/aGlCjhHFWSNIlL/LNsO9pCG/nTv5Qg9AtGePjwo/b2j4QCAEtuV4wefeGxa1D
         Hi/EuQ2YnPJFQ1vNZO08Hqzrg5AetEhW/O2Dy2yLkch+5Qe+GriMBdn1jbmloNmwp0rF
         +ZH6PqJV6jZCTfRI4BeCpAgEA2utLVfd3oWjhwjxs5Sa3qhh0LWITwAXAHHi/XfbLPBI
         JztOQ2Ri7yt3Ji6DTRkX4Zx6NYc0D3ODA8ynt3M20ByL7zuUVIpK1NhTttTxnZn6Njcf
         d1WEROaWRQiUF3sMf2TFC+zzkFk9I91XnAJKFBgjzza5o5LoPUivADZZTXjmce6fZ4Wo
         v+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vMrsJ0mjdfWTMnKiKc/71S+hMwiMC+3w+1OPLxrqsEk=;
        b=R5NMvwwACa9IVI0fzrVoO9umGXS6fbhOQ5+h0ip/pT93mjc8tbfVygA+r6jqBWlFku
         LRH4E1k2QwELAQK86V9cogxsDN3JhPh3N9PlSnS41w//+evRrOcsxpzW8NqdcJ2aiKLj
         k13etlSFWUmpN6IYspP7QwG3oe9hU3lS0U9nrLy/7b7CLfBp30cTCd4OrLZy1we3qViO
         Z/46h3et2hMS2tDzbu+gvCQsOa2VEHwfzvO2E28FxPPVmRxVqp1+GX6RyNt3bfbA/ST0
         8mGXx5SP1uqsT0KJWS1UXCa3Ra0NVXTi18aL1RuOwTrvpwsDl0q6Oc2wWiZmJlRKbSYO
         KhVw==
X-Gm-Message-State: AOAM532BkqLTgGldpb3+AR5TnzT8NOkibsELltEr7zBbPdXdfFdn8T2H
        M5TJnlh/lPHmrvpGa3H939D7eEU/h8H1KfkvyUY=
X-Google-Smtp-Source: ABdhPJxtqMe//nPCwHD4kmzt0FttV4HhPofsQ4x9ACDd33n8tZSz101kvQkVdBLjtlTEI12KP5xzu2nXkDZYp+1h8eI=
X-Received: by 2002:a17:902:ac93:b029:d8:d2c5:e5b1 with SMTP id
 h19-20020a170902ac93b02900d8d2c5e5b1mr16381983plr.17.1605610808535; Tue, 17
 Nov 2020 03:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20201116191311.12477-1-festevam@gmail.com> <CAHp75VcdOUm2vEgUUgUPUcrMwkXOdZ3Q3RWCvagerfQskznC_w@mail.gmail.com>
 <CAOMZO5C-Xoix9NSQLA0rh6eRahTfZdhVq6tZyYVqL3dqUXUeDw@mail.gmail.com>
In-Reply-To: <CAOMZO5C-Xoix9NSQLA0rh6eRahTfZdhVq6tZyYVqL3dqUXUeDw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 17 Nov 2020 12:59:52 +0200
Message-ID: <CAHp75VehOfT70OXJ3Tk4veGuBodhG8LgALXWVoYLNLOm_EGjsQ@mail.gmail.com>
Subject: Re: [PATCH v3] mxc: gpio: Convert the driver to DT-only
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 17, 2020 at 12:55 PM Fabio Estevam <festevam@gmail.com> wrote:
> On Tue, Nov 17, 2020 at 7:38 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > I like the result!
> > FWIW,
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Thanks for the suggestions and review.
>
> I noticed that I will have to change one line:
>
> > > -       if (mxc_gpio_hwtype == IMX21_GPIO) {
> > > +       if (port->hwdata == &imx1_imx21_gpio_hwdata) {
>
> as the original condition was only true for the "mx21" type of GPIO
> and now evaluates true for both imx1 and imx21.
>
> I will change this to:
>
> -       if (mxc_gpio_hwtype == IMX21_GPIO) {
> +       if (of_device_is_compatible(np, "fsl,imx21-gpio")) {
>
> to keep the original logic and send a v4.

Fine with me, you may keep my tag.

-- 
With Best Regards,
Andy Shevchenko
