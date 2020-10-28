Return-Path: <SRS0=HCPu=ED=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AC1C4363A
	for <linux-gpio@archiver.kernel.org>; Wed, 28 Oct 2020 22:44:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 292C92072C
	for <linux-gpio@archiver.kernel.org>; Wed, 28 Oct 2020 22:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o7y3xKxu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388381AbgJ1Wnq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389470AbgJ1WnF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:43:05 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED03C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:43:04 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id s15so1171520ejf.8
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hatfo1xwFEDynogYQDEhCt1lpMjNGoJQpQEAAPUn4fY=;
        b=o7y3xKxud6jpWJiD7Y/D54i7FmuhCdJjwT+WBVsmaMPt3nLT6r/eT2RK7+eSFFJh+N
         C/QVs+MZ4Lm7rwEX2dqJ0I3QCAT+OdhVTJmk2WhagbTrBfLj3o895BBWKbRm1hIYCEMM
         6/lB/QNEWcsELphJiVQmi94u/Boca3tez7YBz6e3p5yZjHRCFWwAGovezFOFSGFbS7kh
         exEW3HvfxSOBS3fQp94B1TXeSks+8Zd21nrupBBq3K77pKSG5UOGVltHfNGOQVgDurTz
         8e6vs6QD0PHSN243mURr9pUb6EWOPRR/E/U35y7EpmhJIQtMpHOxDXd/9HLLUOPrI7KR
         pjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hatfo1xwFEDynogYQDEhCt1lpMjNGoJQpQEAAPUn4fY=;
        b=FvWkK+5izE3FmFf1nj6e+8Yp1fn76XNjLR3K4NCMCDam4aeRsC8MoS4rACD+6o4EhP
         T9jLCPvYt/qoPnb6q3iakZY9WiSIxihptrVry3KgoSE3bvu4wd2LI/NIue0tA2G7TEn1
         JsyROTY813euppqlopQpLzUGfXmJRrl6i0nWsqLYC0HCMhjhOEReV6MTj6Q02L0J19X1
         zQkRKYZCZmk5DsgOTX02JStgE3giqz6SbKZ41xZ1PQRlIbK6z5Sla/guCXVZ9Olz8lG5
         iEo5WtNmkkCIPt9Kyz6Jf2dDbJTZ4w2Xb+gRfEBdGFpNLhwORJ8M+5Hz82I2lQjq8kaB
         yHZg==
X-Gm-Message-State: AOAM531wz2TQLqH+T4KUMRyjAdGHfq+gJ3cbn1Mn0FzTGwfy6rxi4hYh
        jR/7LlGuGixQDAZmYvOHG6EEbQWn1OZdq7uXSdL9JEeAUgBULw==
X-Google-Smtp-Source: ABdhPJw+Y+AFcpZE5IrWDaF75uBlkljVPeaRqxNXP6B8aDvxXTWl++DYovIgyPQUxwMCkmQBdRS/3260GiTYigirY18=
X-Received: by 2002:a2e:86d4:: with SMTP id n20mr3755779ljj.293.1603900056645;
 Wed, 28 Oct 2020 08:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201007160611.942754-1-junak.pub@gmail.com>
In-Reply-To: <20201007160611.942754-1-junak.pub@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 16:47:25 +0100
Message-ID: <CACRpkdb=0iEqT0+6UnB2y09_XdQWwf5za43Sn-g7vA_dEkgSuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: add pinctrl driver for msm8953
To:     Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 7, 2020 at 6:26 PM Vladimir Lypak <junak.pub@gmail.com> wrote:

> Add inititial pinctrl driver for MSM8953 platform. Compatible SoCs are:
> MSM8953, APQ8053, SDM(SDA)450, SDM(SDA)632.
> Based off CAF implementation.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> ---
> Changes in V2:
> - sorted SDC_QDSD_PINGROUP entries in msm8953_groups array.

Bjorn can you look at this?

I was submitted right before the merge window so I guess it got
lost in the storm.

Yours,
Linus Walleij
