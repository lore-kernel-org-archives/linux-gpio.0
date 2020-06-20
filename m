Return-Path: <SRS0=EYic=AB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC89C433DF
	for <linux-gpio@archiver.kernel.org>; Sat, 20 Jun 2020 20:43:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F91F2469C
	for <linux-gpio@archiver.kernel.org>; Sat, 20 Jun 2020 20:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJDRoyXf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgFTUnP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 20 Jun 2020 16:43:15 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33755 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgFTUnO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 16:43:14 -0400
Received: by mail-lf1-f66.google.com with SMTP id g2so7510053lfb.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 13:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lcFxZDJV0JE7EILOFQLnvdmPuPHbFA43GAORC1SuIgc=;
        b=UJDRoyXfza9eu6l9hI9fr7ez3X/6F/4uo85Ob3sf281CMgHH3m+Mtx913shdmjDCe0
         wzT1brbPxl7u1YLem58YAbAa4VpZFhvnGvMihW/TlnF6bZ1DoH/Wu+ayNVzRC6yB28kw
         7TlBjKeoqPAGw7KP7ahp3CrVxtxGP+gXNgau75MLjl6u/z5yMPZf5QKKEy7le2fxjfjk
         q92+piYiIAsi8zTdAD0tFoH7sTEIpefFXSn3742nZAZBLtDSIGpF65YMY/aPDU7SHUs+
         M/HOxh1ELVqvlSqscMPa0KBYOA8R8J5zdAbxcXIxdltWl0DL8oMAxbyMonfdoQHqtsRR
         oLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lcFxZDJV0JE7EILOFQLnvdmPuPHbFA43GAORC1SuIgc=;
        b=skcuV0Z7JBvELciqaNCfyq9oZMp5mEvYyjGNJbbmkbir4aQJgjsh4Z2V+u9+GXF2ND
         nsSeBxTQKytdvuW8b36cY9it95ydx259OZsIpIfhkeqxxByPvov4QmE2hWhRP8NM0OBt
         F8ts+sDjMAL3nwTKnrLmGZ+7BWheAUFv05dM0m25qmabbQVVDyi9686rTTAtghAaSXbu
         iSZ4xUJu7352pdHngZI+Abz6hMIMU0B9QV+AVdlw8h+UkcE7y6PIlLRt9lgYbcvujsPI
         G8jSZD2P6w6nyyPgfmKPOilScMOfofAtqL4PcaTB43/dqwua0t9HVFM2zhRETDXgnm0k
         E5zA==
X-Gm-Message-State: AOAM531NJW50vmj6FUFzZ90T7Re4bRLtvVfBcSoaxzSUGwngHXq05dOL
        OzIS2y7RW1bpk5fezI9pZhnjtvZ9GawZhXuf9ypeGw==
X-Google-Smtp-Source: ABdhPJxYtAEDvRBSpp8tdmOckarOes/SsxhEPpZ0qNeeF/xp2t4qLjK5NUS7m1mNGy9cL9z49GKsu9JGaSMlrHxtXso=
X-Received: by 2002:a05:6512:31ce:: with SMTP id j14mr1633403lfe.47.1592685732304;
 Sat, 20 Jun 2020 13:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200612112758.GA3407886@x1>
In-Reply-To: <20200612112758.GA3407886@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 22:42:01 +0200
Message-ID: <CACRpkdY8u8DxtO9nv5_Y17H3cs+ExvUOGEhmwWqz34q-QTRNtg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: fix function name in documentation
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 12, 2020 at 1:28 PM Drew Fustini <drew@beagleboard.org> wrote:

> Use the correct the function name in the documentation for
> "pcs_parse_one_pinctrl_entry()".
>
> "smux_parse_one_pinctrl_entry()" appears to be an artifact from the
> development of a prior patch series ("simple pinmux driver") which
> transformed into pinctrl-single.
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Patch applied for fixes.

Yours,
Linus Walleij
