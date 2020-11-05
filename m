Return-Path: <SRS0=WQsA=EL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FCAC55179
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Nov 2020 13:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A6192078E
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Nov 2020 13:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rI4ESeXM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730917AbgKEN55 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 5 Nov 2020 08:57:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730676AbgKEN54 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 08:57:56 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417DBC0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 05:57:56 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id l2so2445420lfk.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 05:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hI0UzcPlzM3Z+TT8BLCsTb4B4PaVfW/TF8pw2jZ+3SI=;
        b=rI4ESeXM81khgcgR6VhCZFZCkhrDyz3SIB12oAg7aevlhKQnfwxm9DRbitflnAvySF
         b1+dCx0m83TOzFMQGZwu7zNhPOmY3mmvUQhzRTdKxLNkVT7kcXUsbga9iaNUP94wqONn
         HcOpAPayUbys/sx7e+1QFzx1rG6ppvxwBQnsLb8WXkR0i+wuTc6bKp4xVgOzX+k4uMox
         gcQMpeuLqq5aD/5FfogyW5ppol6/4UXTiW39v/24AqNx2otBT+thZL6nOfGhJDC7YXLT
         6XF/Eu4jZQ0GCf4aMXgOyA6B19+xP20CWGHGAj6oyWL+z5BNUpKQK26HmLXEAsMDKFOp
         Z46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hI0UzcPlzM3Z+TT8BLCsTb4B4PaVfW/TF8pw2jZ+3SI=;
        b=fsJCKWyuStwNOp/W3muMzYx0FwtxW3fFonSNjEPl0/HUgs2suS5OSAp8mrFpM0y2ZC
         r1CztvD0tgVDHnXfAe5nfYBop7ziedWZbjD8QgtfEO+y9MV6Ic+TZfWUM3T2EiNB6Lp2
         ii+nwVsTgEylcue0SbccE/4DTD2elBSz/mgLE/i9LbCsLW64r6zuf555/lRk/CsDPJsw
         15Q95OhWIeOQAGcbMAY4l3MHDqtm1jhUHeRZhv4SEDPcBEJHAM/N1oaZUgvhAe4QLmcI
         HpbThNqO3r9gMsI5tq6uy0I5RGcaDuFIF+og1nHo8aMfsJPhrihM3Um9RvHxDaZEZDrT
         C9/g==
X-Gm-Message-State: AOAM5333ZibUgKY9eQdcUUnS/+4fHGvNZkwmVMtKOb5/H23hp0AqN3JB
        CEKApUGwX2FjjxNLIQCXfBKhU2hx14CZdiHZPEqsRw==
X-Google-Smtp-Source: ABdhPJylKuZVTDjj0TM1vn3dfgBS2xLU+0Zy/JEB0e0mx8z3Xl+Cke+L0nZBl0FCSalSQ25Ca/7WB9cpgUs4vwTFDQg=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr983249lfm.333.1604584674765;
 Thu, 05 Nov 2020 05:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20201028145117.1731876-1-geert+renesas@glider.be>
In-Reply-To: <20201028145117.1731876-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 14:57:44 +0100
Message-ID: <CACRpkdayhrcfyXEB4P+apjOyF=8DZgmu=_H8+aQEr4XEbB0NeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Remove hole in pinctrl_gpio_range
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 3:51 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> On 64-bit platforms, pointer size and alignment are 64-bit, hence two
> 4-byte holes are present before the pins and gc members of the
> pinctrl_gpio_range structure.  Get rid of these holes by moving the
> pins pointer.
>
> This reduces kernel size of an arm64 Rockchip kernel by ca. 512 bytes.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only (arm/multi_v7_defconfig and arm64/defconfig).

Patch applied.

Do you think it'd be worth it to add a check to checkpatch to suggest
to move pointers toward the end of any struct?

Yours,
Linus Walleij
