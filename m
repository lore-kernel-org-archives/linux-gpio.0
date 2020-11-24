Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E5CC56201
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Nov 2020 08:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECC0220782
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Nov 2020 08:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lN5cc08a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730757AbgKXInn (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 24 Nov 2020 03:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730492AbgKXInm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 03:43:42 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42233C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:43:42 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id j205so27708772lfj.6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AaOgVY3DT0axuPXm6Wf+nM+h8FcaH7ypPyzww8UGHiA=;
        b=lN5cc08a6CagxJpTMEus4nk8yN3LrNsf+6Fb1xG5jouQm5lQ9g0JNVT3AHjCbW1gGc
         QZkNd5wSRX8H/RmI0c/v09Ybd/WNDgtW0kdaD+AgYuFVr8nmG3xf0OnUfQYzhIUoBqcJ
         58A6Es0AU2RwJdzQ6Orj1gQLa5+/TmY8nOPDyKFDS6qPBMf+VEf8q37y8s87PeJ3/zaX
         iw6Pk8tGJZ7z6d1jfUBwNgdYEpQALn309O3FCy8sp9marTgkYzjLRqK8dVeMeCFJLX35
         PROf7S91HkoVlyMjJfFPWGroDxuBaltHv6OTVKyUJDYOEXywsQ1ze9tfB76Oh+0Q260U
         c9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AaOgVY3DT0axuPXm6Wf+nM+h8FcaH7ypPyzww8UGHiA=;
        b=RzIBe2QSWaxpGtgJvb2KR+8XTxgqAGILxBcqUADnVO240GxqmG/gDqujW6T8pXS6wf
         v1c+TlIsxY4ZxhGSoWkfe3Cd9JCza97r8+7iRZVxyaLgJ1moNB0ivLDdrove1sZrj4JX
         X3unew5nncv00z05CN95+kWyIc8TUrgQCMYIjuZ0/KcfP/IOfQq7gNWmLRRVHi0fOdO9
         SnLnLTWGPI7nmg45U9j45CcbNbDUpx8wqppX2qt4iXKcI2dpAYCxgiW/ZY48AhzqZJ8Y
         4+HEGqZYpOdBqgWgaKFjKuCY9aKKuVvG9pHVs2NrlUIM1pb+m/B3a/XCs71cdlt9UeBb
         sUTA==
X-Gm-Message-State: AOAM531Fwn7TTWwrEH/GNgv+LC6XLPQOR3uHV4cvnd5nu4liAEi7vRjq
        aWwVkL/7GfQ+te2kx1RXQ9Q70Us84YcVlxCXbj/0lQ==
X-Google-Smtp-Source: ABdhPJwfslqVfk1bAlpxvLALOaiPyZkEzCXcFjklOgHwERbpK3OuBSxE/8+9JiCpkPggMPoqlydmwwG1XchrhzX2p5A=
X-Received: by 2002:a19:8686:: with SMTP id i128mr1245870lfd.333.1606207420757;
 Tue, 24 Nov 2020 00:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com> <20201107081420.60325-21-damien.lemoal@wdc.com>
In-Reply-To: <20201107081420.60325-21-damien.lemoal@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 09:43:30 +0100
Message-ID: <CACRpkdZhOxz5NhrkFxZ5G4aOrmBoAcQodOvqzNROQtXpHVQGDQ@mail.gmail.com>
Subject: Re: [PATCH 20/32] riscv: Add Kendryte K210 FPIOA pinctrl driver
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 7, 2020 at 9:15 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:

> Add the pinctrl-k210.c pinctrl driver for the Kendryte K210 FPIOA
> (fully programmable IO array) to allow configuring the SoC pin
> functions. The K210 has 48 programmable pins which can take any of 256
> possible functions.
>
> This patch is inspired from the k210 pinctrl driver for the u-boot
> project and contains many direct contributions from Sean Anderson.
>
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

The kernel build robot is complaining about this patch so I'm waiting for
a new version.

Would also be nice if the maintainer could add some comments?

Yours,
Linus Walleij
