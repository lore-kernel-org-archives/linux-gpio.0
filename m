Return-Path: <SRS0=mvGR=DG=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAAEC4727C
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 13:30:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E3B221531
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 13:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DboFVTgh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgI2NaM (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728695AbgI2NaL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 09:30:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA87C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:30:11 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id w11so5540360lfn.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B3ONy2UEfURniD/LDED8tr1xeJcvKDrV1FhcEDlZN1c=;
        b=DboFVTgh1Vv4/th8goHVm+l+ZI1CAqWmQVQJvrAvlBKZLAf2LuPQA13+FuSil6SHPo
         zDEiMXkESJR6U4icHIUWiGERxFEx3vRv77rmhstzV4pEdJ/P0uYjgo1H6gh3Ut4SXpZF
         a+E/G8YlfO7tFA7IutFv/D6zxXnHnaSXn0ae9mt6teXXuFUi8CGfaz0veISib02iByMt
         nMgo6K+vNpZNyg+oW676x0FTmwgZU00lBL3WaRBK4mljnn/wWxKGaPLx1dZp1UZv8Hye
         7VeAgD0O/XYZ1SCFmw+/hwcagEQnMKNY9HMTReL9rvCmUEm6BXX3rHeK+9e4y1VrYuD9
         Qchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B3ONy2UEfURniD/LDED8tr1xeJcvKDrV1FhcEDlZN1c=;
        b=g1KyE+1UyJFnLdYhoX/QY2lptgU/0aSgwZPX5r0ApWO6+kWAblfqStDw4iOWb6nSSr
         vyDDdpS3tqvpjdcMl0kD/XGCrS1OT3xmQiIw/nmOgK4TUXJr4euyZ96UW/3EDU7kZyA2
         iLp+0uxJe/vt4OYzUI5uxbqSrNOy6Tsib6bnBIZSIpT240S9GQlsCYgiSOHBYINyNtwn
         hEZJb/sdUx/oJk6WXSSR2dJWEuoC7E69ZJ3Jpix7jsxKZqkV77Wen8rMIvfeiAAUges4
         h7lUkHcKiS8yv6TVCTgtqLV0o0NoyxB1lfxDuIPP5uMIaKh/sS2kNKfO0uOGSy9NftUm
         eRwg==
X-Gm-Message-State: AOAM532FYa60As8T0niFFxYMMseQcE5IelUEkpCqy/iSy3FghoXt6Ebk
        6+b0kNjRtfjyECEGI0LvRLUQOixDiDRotPtRrmX7rg==
X-Google-Smtp-Source: ABdhPJyzlua0o08I4JVfAjPGkfZqJYDJ4sDtSEjU2PS5clrzOCyQejVxSNo1L881M6bwkyGp0lENoYgckNIh9Ii/D/Y=
X-Received: by 2002:a05:6512:370b:: with SMTP id z11mr1137498lfr.571.1601386209889;
 Tue, 29 Sep 2020 06:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131057.92895-1-miaoqinglang@huawei.com>
In-Reply-To: <20200921131057.92895-1-miaoqinglang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 15:29:58 +0200
Message-ID: <CACRpkdan6xt9AOy8bQdb44V1ciK36gM_fd+ELT6cPWKXe+oVrA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: ocelot: simplify the return expression of ocelot_gpiochip_register()
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 21, 2020 at 3:10 PM Qinglang Miao <miaoqinglang@huawei.com> wrote:

> Simplify the return expression.
>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Patch applied.

Yours,
Linus Walleij
