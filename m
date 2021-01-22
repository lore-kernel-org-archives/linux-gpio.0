Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA199C433E0
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Jan 2021 10:45:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60B0522DCC
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Jan 2021 10:45:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbhAVKo6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 22 Jan 2021 05:44:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbhAVKkQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 05:40:16 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E03C061797
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:38:52 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id w1so6927004ejf.11
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e3DouesvZQi7NDprULxAHaPbqcBI6rl6oPqO3bsAvcs=;
        b=LwTntAJItH6vUwW4po6DmaPmrMskpMAJ2PicjpA0PP8rNdxU8P4+6ZyMwyIt0iSPmD
         MOidqVQ0kn9f/uUGQ7Hsl8/laF6ZJfVbhUjtPrMObZfyABW0x6StmXq04oC7uG2/roFh
         JMDeUzxQRa4Ry7m8EK+KtuiJS1dUkantKgEYxSUxhsNOgpAMwMgYcm7J2f5e70zpYZDj
         e24ESdcRubLawx1EJuJzWRcA4Y+kZocivEW4aB44gLbXDMgrEc7nljWPWD2/iRkVRcQh
         W+V1LUZRCS2ZMo8vlMw9Np2oTZZOZTDBimPeb4qc4TnVlczQ03lhTSqRpqQ3q2GYChCM
         5yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e3DouesvZQi7NDprULxAHaPbqcBI6rl6oPqO3bsAvcs=;
        b=WitQVCqt4gB1HCpke/D1+eZxIhsGMP9+2gx5t77eUDK+2y+ABeyW8PtjLhaVDrOugX
         j1+/8+zRGBkgRNRIP7roY142bRlTlTsoEaxbV6w4ZMOFDknG3+y8jcF4bCyxnoydPa2P
         GT8Vw3sPizSMKan1lMgUan27NU3Om6CLcpIql2WxbFTC10vSDDFWMrfEwktbSoW2XxnY
         iqNZ1NBN7uGbKUX425Oxl5oL0Fzkz4gvxbeXgw4Zj3K38TVdIzkifVB6ExlP8z4I1jZL
         tXuTAnpLw7d4Zu7M57NoWDdBaDtyT5VMnqY63SHk8jtf7HmwT3s065jwhsW+r9zRMF9x
         /m8w==
X-Gm-Message-State: AOAM530F4E4QeqkJ08Ox/ZDjCh3fYQMeNmeXKem3Y12UmTkjLqstoOJg
        3O2p0DpbZWtWp/XEwODwKTO35Em4teV71y0nrLN+gQ==
X-Google-Smtp-Source: ABdhPJzM/Q2vzYPXFR3mjBikbUJSBxHl9Hmy/en54CimR9SepJ9dEPeV4YG+4DO1zogAKtCnnK5v6lhYTk/3HBM+JfY=
X-Received: by 2002:a17:906:2617:: with SMTP id h23mr2560181ejc.168.1611311930778;
 Fri, 22 Jan 2021 02:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20210120132045.2127659-1-arnd@kernel.org> <20210120132045.2127659-2-arnd@kernel.org>
In-Reply-To: <20210120132045.2127659-2-arnd@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 11:38:40 +0100
Message-ID: <CAMpxmJWrxfcLjqm9F-7_wAb1=qftU8OQ3hc6AUo1PzkUGnxFKg@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: remove zte zx driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 2:20 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The zte zx platform is getting removed, so this driver is no
> longer needed.
>
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!

Bartosz
