Return-Path: <SRS0=Yh4R=VB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE16C0650E
	for <linux-gpio@archiver.kernel.org>; Thu,  4 Jul 2019 07:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3C19218AD
	for <linux-gpio@archiver.kernel.org>; Thu,  4 Jul 2019 07:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaqgVE1s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfGDHpm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 4 Jul 2019 03:45:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36752 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfGDHpm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:45:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so5186277ljj.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VqIbRmpqLMGOAT/gnCMxZj540BB+nzZMlAbEvE7fDYw=;
        b=LaqgVE1ssRbhWRJYHPBJhjqh1E8z7JtSWBk911qy/D6r9hoZ3eK1gS+E0H4HqyNfo+
         X2d7vDwKXfMv1lslLTwS47ZIau/5Xn0/1EgFb2Rup+kBttMFiDvppkhRTITPthtcNJwj
         2kDGQBGwgicxgJSJlTRgCgbR+lMO6pGTpiGY5Dl1irjYQavim9ri6XiOh7HtXgUTV+q2
         qY+teMEzE0tgqp6rf674urI9PnH8HCyBhwie21kZy9Anw3Df+hVf83jSHwdaMBKy5iG+
         5BR2O7VurH+pRwKn6pW0JZ4IKVIsN35yPePp/ilP3wgAYhhb7LTFswtXr1ORP6PWbfNE
         WL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VqIbRmpqLMGOAT/gnCMxZj540BB+nzZMlAbEvE7fDYw=;
        b=pNYnM5hTRcD1Ab1UsroJryaoyaxe4iFeVVTmpRfMewcnOaXHbK+jlDut5xKn465OGF
         DDw71Ou/I5Xb0nu7cuqB5tmNVh6rCeflkKAQci1FhDAeVULwwv5nl+UAJbyFE2gloys4
         gBHZazSGK6P+OTsplxshppit+ipkBzzNsPSo0FFrJ35WekT/E3rI85XXmQHuGbT/9Thj
         EqyXFtUSSkPDPI6hr/qHR/2q1n2YCVakZM6v/R1B7rXm53tHoPerY8gWTuVxWkUxUyoh
         N7oQi7bCmNrUI396QhsykPXk11JLliyK2narmD4M/Jh8Ds4MYVe04t2bfiJT67mf0zft
         BBqQ==
X-Gm-Message-State: APjAAAU34oaaHyw9XG39DbzWBh9viYtOIa7a4FMMBPZWDfws4vCtCHTV
        5s/evnOYmlLKBVu0V/E8xUEwY2jhSxHy8YiM6AvjXg==
X-Google-Smtp-Source: APXvYqyvGakK4ylSdsFrtpyn/uqOct9HbmkohFRyFJ5vpJo68nXnvqeMHK72Apyap33ZaUPwqSHgwe9f8bkEGi5kvxI=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr24161474ljm.69.1562226340137;
 Thu, 04 Jul 2019 00:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190702105045.27646-1-vkoul@kernel.org> <20190702105045.27646-2-vkoul@kernel.org>
In-Reply-To: <20190702105045.27646-2-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:45:28 +0200
Message-ID: <CACRpkdatEKYaZF1LEy-O4qfbBFeMQihp4m3Y5TmgBQcXA+v2qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Document missing gpio nodes
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 2, 2019 at 12:54 PM Vinod Koul <vkoul@kernel.org> wrote:

> The bindings for msm8998-pinctrl was missing gpio-ranges and
> gpio-reserved-ranges, so document them as well
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied with Bjorn's ACK.

Yours,
Linus Walleij
