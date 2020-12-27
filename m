Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB06C433E6
	for <linux-gpio@archiver.kernel.org>; Sun, 27 Dec 2020 21:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 054DA20659
	for <linux-gpio@archiver.kernel.org>; Sun, 27 Dec 2020 21:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgL0VRU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 27 Dec 2020 16:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgL0VRT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 16:17:19 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAEEC061796
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:16:39 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id l11so20118115lfg.0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GHA52hpeNhfsc6lYY553O6SKD7NWsjET+INvz3i0oks=;
        b=cAXQe7zGXrn5Ggd8p7VLdtu1xQvMMOOJAMWxmNFQq8dIIjkKjs/Tuw3jFpmy12wNaG
         aNMcI6SHIQ0WmPbOqITt8jmJy++dGHXy6ZXIQES36X7kb2uNJas9pW2uDVvUEWwWCV1n
         vG1ZBZ7AHpo6H47W7xbZt/Q3vo8btS7D5TT/i2nNihrGdJ6JAFB0oLYXWMDd0NLCVtC3
         +FcwSD1YMTLhDGtb3vomj5jTQ2gP8wquijDB4u7/waekA1hu+MfWkVOIZOFx1hCOE/26
         EZ1+HH6Gmvtg58tsYmErly9H1jOYQvL8/vFjwQ52rvCJcCw3HvFxXMhIJC4HcWYDT9XQ
         AnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GHA52hpeNhfsc6lYY553O6SKD7NWsjET+INvz3i0oks=;
        b=htCflup8kbxzYU0cxVKEOPCLRztqUtASDTsQHk9WW9DhAgIujxWa9TFAhS/UOZaD3C
         u2/NLU52OmWMaFo/QadwFvEZ+5lY6heDVCWY1iYLLtlxbVzJcoNhDdVOeFDBpN8zs8pM
         NCMRbZnfMOgTvq/nq8z2TuF+FFL6oy51KO4TqzKt21F9Di8OZ5fLfzR73++qDlrW/s8U
         MEHzNaj7H/bfczW4Hjl0hHWc5avLH5GMk/5KQaleNVkoHEEmw4gqXtY20Oxs2aqR1M1H
         psoiYfXKWhe5YnyJ4bG4BEHWMmPtRbtpOqOCA97oBDqmPum6pdt3UtfjNB1+7euHL3wj
         Wb+g==
X-Gm-Message-State: AOAM532zHVCB7y0nbCrA5cl9qLbTsLGMa5LZeQRQtQ0HQHvvox7kJ/Sp
        SDcMNyFg1Ew1mWJf0FwShV+wpU3k5RKiEq+bdP1HBw==
X-Google-Smtp-Source: ABdhPJw8tWJODRP92VyA2n4t1a1c4F2W75dmcujyE3C61i1j8crUTIS0eN6A86WC4MlfYW/tOwoihem5gZCAToIVFxw=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr21435937ljj.326.1609103797976;
 Sun, 27 Dec 2020 13:16:37 -0800 (PST)
MIME-Version: 1.0
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608718963-21818-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 22:16:27 +0100
Message-ID: <CACRpkdaDFgoaLnqmPFSnXe3KyNrGnpQObb0t7d2X_btU7VWD5w@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] gpio: bd9571mwv: Add BD9574MWF support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 23, 2020 at 11:22 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:

> Add support for BD9574MWF which is similar chip with BD9571MWV.
> Note that BD9574MWF has additional features "RECOV_GPOUT",
> "FREQSEL" and "RTC_IN", but supports GPIO function only.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

This looks like it compile-time depends on the other patches right?

Yours,
Linus Walleij
