Return-Path: <SRS0=IWnn=YJ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23006FA3728
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Oct 2019 12:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7BBD2067D
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Oct 2019 12:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKDHkw+A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393230AbfJPMpv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Oct 2019 08:45:51 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37762 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393227AbfJPMpu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 08:45:50 -0400
Received: by mail-qk1-f196.google.com with SMTP id u184so22593056qkd.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i4Tlr8aaqHcqUHLIi1olwgg1FH4Wnc+VjJ6hwR+CHZ4=;
        b=UKDHkw+AsWNstYEdbran6nGCcRGuySyOhWzrs1M+lF6UxheGXfo+LcAWpEEbBx+GjI
         HjCtcPXBKQn4jwJy1cZJVsUKfW7IO6g+YkpfauBjo4HyT9qSp02EWBGyi3sOIeJrqugJ
         aNGP9AwBpU3FcCHdLXdwuvd0t0yyMgPBETbTKtu2DJj+lWiGvu+3fDWYAeAUK+WOEA4H
         F8rc+vcjQUPehy7NV4y5BA6xRXQqtAm5Nw1nm8zc582Y3Dcivh6Z7Y2lxO5s11cE/WnM
         Jkct9SJXs7YpPuGDgp+lQ+hSbBaEXPMKYZarrYIGCt8VYRjlw3XqOdiH5adCuAlguYgC
         XyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i4Tlr8aaqHcqUHLIi1olwgg1FH4Wnc+VjJ6hwR+CHZ4=;
        b=Q1CdRU1syn3Wv8V4zPC1AKTCPAWravw5k+AUALr4zJY4ODLDQJyktRsVJlR34j4uUR
         p0yDAFDKfYhUvXObkPhVFOzHi/eBBH6kVJkDwOAA+BUyp/St8SNW59wCfEQ2i01uhYGW
         LnRWbt4Bua7kt4Y61GWnasyyOA86fTvVpUjo4l4o/4XZWCbUjEjKFyuPbGgMU6HBvbYR
         UobwtuP0Hx5IDqq5WGCRmzPlC2A1YuDWySlsMjLHtWfQaC8aGQ5STKUBmdBGkehkDrvx
         byS1LX0Q8WQTBNfuqP//Y8LOMFKql7DOnTM2uI8OSZTdzP1FZFuilxRBME98mI+dwbEH
         wkWA==
X-Gm-Message-State: APjAAAXgJiUZgVR8TCBgwmQqn/uXTxwsPrrmOF3U1qY4O3fS+vNxdvig
        occDyXDLg05+wYS5Ayh5QlCl1C3fG3hW0W7IFCg9sA==
X-Google-Smtp-Source: APXvYqwOzWo5VbcvN0U8TDnN+1xwjUKgMyRheHPwsr6x9P70GL0NWL/tbYoCuW4aAJr51oKXjooJFWTyMu0zdWYL5a0=
X-Received: by 2002:a05:620a:751:: with SMTP id i17mr39890335qki.340.1571229949254;
 Wed, 16 Oct 2019 05:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191015091708.7934-1-jay.xu@rock-chips.com> <20191015091708.7934-3-jay.xu@rock-chips.com>
In-Reply-To: <20191015091708.7934-3-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:45:38 +0200
Message-ID: <CACRpkdbtfamz4H-RNUfdSz7eAOzRMgu-QPbVAVZKtC+Lg5VP9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: rockchip: add rk3308 SoC support
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 15, 2019 at 11:17 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> This patch do support pinctrl for RK3308 SoCs.
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Patch applied!

Yours,
Linus Walleij
