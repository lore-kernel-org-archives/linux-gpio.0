Return-Path: <SRS0=mvGR=DG=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D668EC4727F
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 12:34:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B2B320C09
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 12:34:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgQtrl2m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732295AbgI2Mdx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 29 Sep 2020 08:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729398AbgI2MdF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:33:05 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9757C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:33:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o8so14731885ejb.10
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LwN+tW4YIDNglL1uEsQtV8XVDTZbKrSyxnBbfw4N/uI=;
        b=kgQtrl2m4TPFmZ5a3GUkvTSaZs36KvSvYRY3cYHJDVc9qZI6MIjLB/y3Kyay1Aec2x
         eUHp9fRm6M6Gmd3tkK3W5l2Eh2dXmuBJYhsF8NMLXlKtEQdD32hyvz1qGDYB7unvhh5b
         TuUEQCtGUlMPLvEZ3KxZeGGrtLbkL8eYm/NGrWWdCReozbiUMby9pG4cKxrSFn7TR/DR
         YpGMx/aZIUKAvvpxbMAW+1bI1EFGemlkYX8kieBUd02WgM8TW7LDoDNnNGURE415GL3p
         pJGYwtnEJzTSeqGKj8PuwFki7U9aN7ZZj7vtoGhiuyhbquWWi05nMnlDMO5jirmD2Ior
         s3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LwN+tW4YIDNglL1uEsQtV8XVDTZbKrSyxnBbfw4N/uI=;
        b=bI8eVpVmxRUNUx4izjVxJ50lM6vii5fWVGz0aqpSXCyQlVSgoMsvZsghoO/sTUPZ9+
         LrrF5Je0682RkHdX7XRDvH1sEYXxFAX9AI5Kd/441dXsW9a5QX/OnHAC3LcOdtUITnNr
         E/4S26CQTdr+9VcLxEt3MVpDOUoUbyZAxIcI3jXAFmLZOKy3k21dW7phYY3/lDE46KaB
         JBWECpO8e+x9Wpt9fV7EUNAMi1MGX9nc3oMUWPe6xY0doKGXNS75iW8SAR5jv+WUw5+P
         +B4kqTuQOEEdnJop8/giuRuVfdlal8mZtEQZq3KSqFS671pLZhNr/AxyvcrQHh+v15Dt
         s/cg==
X-Gm-Message-State: AOAM531SLpZTqxH/IbIx3xcmv+xpOSqupdR7zCEXd24tHdg+oSZjKvra
        lb4ZBRIf+xgXZYcpKkgrd2VbisEx7sJqBuoeCtjJbQ==
X-Google-Smtp-Source: ABdhPJz8GtXJOmzDg3LWtI0E6cXdgeLdjPw3GUdl8/im0e9dQ6kzxE7UFs+NkfPDaVs8g67w9qEZV++0mlEBaswlVUY=
X-Received: by 2002:a17:906:3553:: with SMTP id s19mr3542393eja.178.1601382783388;
 Tue, 29 Sep 2020 05:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200915125816.47148-1-andriy.shevchenko@linux.intel.com>
 <20200917075920.GA1512423@sol> <CAMpxmJXQ0bJAjgdfTLpd6gUTe5ga=xTj7sXXUyLCS_o2RX87Kw@mail.gmail.com>
In-Reply-To: <CAMpxmJXQ0bJAjgdfTLpd6gUTe5ga=xTj7sXXUyLCS_o2RX87Kw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:32:52 +0200
Message-ID: <CACRpkdbzwRe134t-aNFW6X4qEF_pqhBmo9=8=uEXbC8UqOpqNA@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: Fix line event handling in syscall compatible mode
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 12:04 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Thu, Sep 17, 2020 at 9:59 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Tue, Sep 15, 2020 at 03:58:16PM +0300, Andy Shevchenko wrote:
> > > The introduced line event handling ABI in the commit
> > >
> > >   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > >
> > > missed the fact that 64-bit kernel may serve for 32-bit applications.
> > > In such case the very first check in the lineevent_read() will fail
> > > due to alignment differences.
> > >
> > > To workaround this introduce lineevent_get_size() helper which returns actual
> > > size of the structure in user space.
> > >
> > > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Tested-by: Kent Gibson <warthog618@gmail.com>
>
> Patch applied, thanks everyone for the patch and QA!

I'm also very happy for this fixup even though I didn't even comment
a single time, thanks so much folks! This is community at its best.

Yours,
Linus Walleij
