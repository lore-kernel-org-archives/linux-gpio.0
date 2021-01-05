Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A96C433DB
	for <linux-gpio@archiver.kernel.org>; Tue,  5 Jan 2021 23:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FC5A22EBE
	for <linux-gpio@archiver.kernel.org>; Tue,  5 Jan 2021 23:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbhAEXYv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 5 Jan 2021 18:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbhAEXYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 18:24:51 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3B0C061798
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 15:24:09 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id x20so2374178lfe.12
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 15:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gYDYLwA0CU2C39pcNPUPSiChNSTDuoRLPS28E4qVjsE=;
        b=uxF+ypfoGPw+W7h6//9Gi0A29aDwutWtIKVjDheQYrzwdeRQh8fcLWGLnNvwOvgv2r
         EunjL4QxnQUvZDqzTKi+cl3GPXrX7Y/jd8iGQJCehxuhxy2UYLtbSJk40vn+CZLzHnKE
         fhjLEaU4NVjTEbBPmvHLEU4fwkRTiz6ZcoabY+nl37I70GToFl/7lGSTSNhJqRqCHxgC
         r0MNi6HwXfgk2fdayiwpRa/uRxQbP8QS24Rud4GgqhJ25aVfzZe0p4SSJXDj6vFTUFoV
         /vYnX9o9DbU1tEO0jQJ4oj65zpiohe5nLUPQAxtTBuewSgcu25lYTqjy25K9G/n0FlP7
         AI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gYDYLwA0CU2C39pcNPUPSiChNSTDuoRLPS28E4qVjsE=;
        b=orbjEBmoln5ZMhJ+kV+X++WPdnWpMyH/k5JN2+OioVw5DRcuu/4D2OIdJcmX955xR/
         ovlIdIA4gOGRAaHQXUPQskZwgvFUxzaxZPflinFVK9iPSmB4NlUONPXtaUmPSByRqOsF
         BBLnWoFV6FNpayxNsMLH3ErwfMwC6VP3ENVq886bF83AilFhMZtU1EwRcGribXIJshe5
         xQLI5NYy8wQgiKZHl3P/pugqqerHsQ8Mbkch2lM227++vSC4zw2+VA+yeGJTKbC2FeGI
         6ONctO7pnc4VEYjZST0b1lYEJzRk9M33A8iogFs6Vi7c254kdnjTGCE5TsEDI+KTDQQs
         0LUQ==
X-Gm-Message-State: AOAM530ef0dMAvASYWw4g9dPTTpalgHijmVdUbDep8HVtS0gqAsXkcsg
        4+a61QOeNUA5l3DnGVO4evgrfgHBN/S8Z8a3le+xsQ==
X-Google-Smtp-Source: ABdhPJxSkW5xbMafXFWi5lQBf2KI0ddrnwV1vBqnY483QaktUXcpavXlvfB6I0ieC9voQF1b3ho2Evr3iJl2lv+4Yek=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr858602ljo.368.1609889048435;
 Tue, 05 Jan 2021 15:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org> <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
In-Reply-To: <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 Jan 2021 00:23:57 +0100
Message-ID: <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 5, 2021 at 6:28 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Jan 5, 2021 at 10:31 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > We need to make this namespace hierarchical: at least do not
> > allow two lines on the same chip to have the same name, this
> > is just too much flexibility. If we name a line on a chip,
> > name it uniquely on that chip.
> >
> > This does not affect device tree and other gpiochips that
> > get named from device properties: the uniqueness
> > per-chip however affect all hotplugged devices such as
> > GPIO expanders on USB.
>
> ...
>
> > [Dropped warning for globally unique]
>
> > + * - Allow names to not be globally unique but warn about it.
>
> Is the second part of this sentence still ture?
> Maybe I missed a warning we are talking about here?

Oops old text, Bartosz if this looks OK otherwise can you fix
this when applying? (Just delete that line.)

Yours,
Linus Walleij
