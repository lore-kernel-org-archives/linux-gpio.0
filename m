Return-Path: <SRS0=J+Mb=A4=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2961C433E1
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Jul 2020 12:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0B96206BE
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Jul 2020 12:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aabBGO/8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgGQMGW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 17 Jul 2020 08:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgGQMGV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 08:06:21 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D36EC08C5C0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 05:06:21 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f5so12273499ljj.10
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LJR0i6k7cO0ZZMPI9z4MOM+krNnMR1fBcC0/4RFxoRc=;
        b=aabBGO/8gdwSRkA/BTM3UdLB2r8u3KjxQfPB0aFML2rV2ttywdWnH96KH8Qq8+gwjk
         qRzYI7lSm4R0yDFu54T/gxVFsYj84X17IVGB7iNgU3E8MuVhBiV+x5SymzPAhd6Fc0y2
         GEL8k/lj8gVhMb7CshyoECk/icp7txJXkBXD5U54sL1C+DWvjnp9+BCYWzV69XsLeY8O
         QRjDqd3wDlNx5SVGzMEZIuuFpIiDeoew8GJ02t33OzSEcpxOtbSWKR4bviqGQq1PaID0
         1VOPixmOcBSH8zngj6epCfWITMdLCksuL8lTYXPhxaZ8PPdqHxc+g7qSXpa2QNpqloHx
         Z08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LJR0i6k7cO0ZZMPI9z4MOM+krNnMR1fBcC0/4RFxoRc=;
        b=CJHNSwDDjlb2r2apUqLJaySiz1/OaP6FGIGnEecp+ujfMs3z+O58gEvW1zkc1AT82L
         es49hxhqB3EULf2GcSynU2r9TZ5uxacJH0KBqk9w8QkSuBwDIJFrIwwnwGJO6GiCMDPl
         KVvBPdA/FUmfIHGQ/nF7ONZndURidgJBsnwsOjJ2ub1WOhZFVcuHiClDtp1ZGdrvKSYZ
         VvlBTwtY7ydl6I16NR+zWotRq9PjgKdZziViPRlDEGsS2PQ7zQQvDO9sFSrS6PArFTCh
         vOyQYv0t3j0Dvq3bDNYrT1cYPqqfcxzHRAZ8hfSNHqxgupKcrCU719BP2ObH19a+aEbx
         UvbA==
X-Gm-Message-State: AOAM532fBiiAdPkNYGALAIjTaQWeceOY7Wzd7aJGrOQuHzAkEYLi7CnE
        x/XtUOzsA0imUEya5yGChFH5HX7mH+Z400Uc/WZdFg==
X-Google-Smtp-Source: ABdhPJzM5ABK4ZPfUhITf86CQcHTzH09tokmVlULmlOslvOaUvuycksIQdKNexusQpjUZ7Pg1QWEtnYM7wvpKL6m+hA=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr4643357ljj.283.1594987579348;
 Fri, 17 Jul 2020 05:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200716212109.GA17525@embeddedor>
In-Reply-To: <20200716212109.GA17525@embeddedor>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jul 2020 14:06:08 +0200
Message-ID: <CACRpkdYXFOOv8yh+wMKSZ_7E2oXXXZZO2b9C-jLJN055mLdSzA@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: lpc18xx: Use fallthrough pseudo-keyword
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 11:15 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:

> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Patch applied.

Yours,
Linus Walleij
