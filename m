Return-Path: <SRS0=Y/fG=X5=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82ABC4360C
	for <linux-gpio@archiver.kernel.org>; Fri,  4 Oct 2019 21:27:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AE2321D81
	for <linux-gpio@archiver.kernel.org>; Fri,  4 Oct 2019 21:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ha6lkOgw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbfJDV1T (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 4 Oct 2019 17:27:19 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39530 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728812AbfJDV1T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 17:27:19 -0400
Received: by mail-lf1-f67.google.com with SMTP id 72so5425651lfh.6
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 14:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TmpGrwSq0XPnJhwom/TVm/5c5N1P1jlAi5DA1JlEF1g=;
        b=Ha6lkOgwkTpL5AMiiK4IECKVOL0pcN9MTeXWPS7e8RxpVDW7M5swL4KQa0dTtrLyu3
         DS72wkeVbSerc5JEVwnIS/UXzbtS1L9oFQlmzCorY8I0vlBZeSk1qnu/edYfQmNklhbx
         TfWYAxCfb/y1zApmj3ShaHheHplRkHqzVGd3CCiJgJqTXAhGZ6EmIvhuW4XemXP3v9wF
         YzVJteyPL+lKrmvVGpMIfzncPgv3zQHKMu9BCdJ/DlNAwdmOeHydBxhErJ9TO/cJdPgj
         TvW7NPP1erd6PD3Oka5hDjuLJRhKgKT5hKfRRotzYzH/UlIUezp0iq8WCQMwcuZlM9v+
         atrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TmpGrwSq0XPnJhwom/TVm/5c5N1P1jlAi5DA1JlEF1g=;
        b=UB88uVdseDKyFCANusfswM1PRjWUYT4WhxAr6VQJ2S7UgyKMu4nFOOPdNR12HnjM2o
         nQl1e6dGVGxrVKeUUerFQgem8/49s4Qfu/Rdrgqmz3uYo8HlIs/f1TLeCfVyOyyQXVX/
         MRR+hQzNzPQWEgGLgSUcYrFZodxq6Db7zzLoTJZmOMMt0waiQ750C8YQs2sfM36lhZPM
         UU2+WNQb05UoQDQ8soeoHCwNN949QbtvXg9n5hKrsJXbzQfNyL/ZF49h7LHZ5mUC+sHd
         2H0hTo39RyVJ69PmNJiPKDr1WcZUfUHu+WHCy7xmE1hs5alKGDWUMV7P4m7XWYMTgt19
         918g==
X-Gm-Message-State: APjAAAWJtROicTVzjV9dVwvhX7lmfoLFjzax5mb6WvO4uEF9Dq97kBab
        mRMbrqf7AnSeQOnlfeadw3ecnaLoWzm5IZby57gmXw==
X-Google-Smtp-Source: APXvYqy1iXUFswdxVf7v5hts0g+S2c4fvXDUV5/d2xpEaHizj7JznUIXFYBa+srWPaWsj3gelqZqN3ypEP9s4wr/g24=
X-Received: by 2002:ac2:46ee:: with SMTP id q14mr9393307lfo.152.1570224437094;
 Fri, 04 Oct 2019 14:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190923142005.5632-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20190923142005.5632-1-linux@rasmusvillemoes.dk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:27:05 +0200
Message-ID: <CACRpkdYTD9x0TH0sxNatxRA_nedcXt13QfWRS=_7+rmRGT=_hQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: devicetree.c: remove orphan pinctrl_dt_has_hogs()
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 23, 2019 at 4:20 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:

> The helper pinctrl_dt_has_hogs() was introduced in
> 99e4f67508e1 (pinctrl: core: Use delayed work for hogs), but the sole
> use then got removed shortly after in 950b0d91dc10 (pinctrl: core: Fix
> regression caused by delayed work for hogs).
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Patch applied with Tony's ACK!

Yours,
Linus Walleij
