Return-Path: <SRS0=HYd6=7H=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3496C433E0
	for <linux-gpio@archiver.kernel.org>; Mon, 25 May 2020 11:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD85320723
	for <linux-gpio@archiver.kernel.org>; Mon, 25 May 2020 11:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EdSxjRSD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390189AbgEYLmR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 25 May 2020 07:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388696AbgEYLmR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 07:42:17 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C87C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:42:16 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m12so18018878ljc.6
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yvtww6jVPHdISeT6csiqLTbFH0Gov1r9YtbJ5CPJPLg=;
        b=EdSxjRSDXgbY4KEcQ2hzxMVL2CBP4aUTI6LL2hd7KTPsww/BPsm/fd418408B4j1hB
         zkZaR0wL2wWLo8uqNIOHFFdjn5KAEsaHdxilb6V4U4uYMNFH6tYaTdlSzGwh7BZH5D8H
         T/bQDBsGc1ma9RCGpGDfDOKeXOAmeKZLstRJZ3/hkjgZ+A4Mz4w8ZGOkY1Igw+FI4uYG
         7kNzmkwOdPDPdpO7wxU1qYik4m9l0ZxHKUsNdyvUOyus2NFyLiMrh6quyg17fiLzfXc5
         jNc0IL3LvBgvTM1v5YEC/DRlIIF+ftkV48jPCnfCrF5Ry//RNb9NRyJdX66PrIHeReQP
         k1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yvtww6jVPHdISeT6csiqLTbFH0Gov1r9YtbJ5CPJPLg=;
        b=OLBY3Kf3U59owtcUIG5SLSiOaz2gImP4jBcoyRTtmYyWTtsjOy7BX4/q4uPwrMRetI
         FVJZdTvq5sv+DgaStEdmHB1q3rCf/5PutWssq8tveUa2jQDaB7MLy5z6b4J3XQ6p1bnw
         glct7Nf0GrwNUsqqnvsQEOZ4GmShOyVTsgREjtErh2fSGfBp3FkRjCE9dg8G4Gy97an7
         Mm3mc2PWA6BAYGal4XIkFgw/L2gqPFTNjZgwCEUxsH17/nrAwpDR4Sx8A+iRLkqtYbkL
         3yiOyvsrzS0SkIj+37zKj1l7mP6TUZwqNB26pC0rpD2Ipksw0+DJGFFBWtUhbVf1z1Pw
         n1Xw==
X-Gm-Message-State: AOAM530dQd5vrJ9biUM8/GdE+Z9cZEpPSfTPm1np29rcub24hykOAt3B
        Au7EGlbRg0S4PmnTbFCTUpWUxyy/Uhl7Lnc4/jV/Gip3
X-Google-Smtp-Source: ABdhPJx2AfcllQTpapyVNb6BHkrFVf9eM3BgGJa98ASkxug+8NUxurx/Wn6WlZe6fcs8D39uD5EKt8t2HSKSe6n5SlU=
X-Received: by 2002:a2e:8703:: with SMTP id m3mr14352935lji.286.1590406935269;
 Mon, 25 May 2020 04:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <1590234326-2194-1-git-send-email-yangtiezhu@loongson.cn> <1590234326-2194-2-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1590234326-2194-2-git-send-email-yangtiezhu@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 13:42:04 +0200
Message-ID: <CACRpkdb9UHxBDeU-o3bLWryuv=7D5qz5JM23T1omLiOsMjE-6Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: at91-pio4: Add COMPILE_TEST support
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 23, 2020 at 1:45 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> Add COMPILE_TEST support to the AT91 PIO4 pinctrl driver for better compile
> testing coverage.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Patch applied, if there is some compile error we will notice shorty :D

Yours,
Linus Walleij
