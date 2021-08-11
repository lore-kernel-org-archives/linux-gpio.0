Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE08C4338F
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Aug 2021 12:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8F9B60E78
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Aug 2021 12:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236679AbhHKMBj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Aug 2021 08:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbhHKMBi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:01:38 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E6FC0613D5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:01:14 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id n17so5070131lft.13
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3GJTHSzcRfHRR7rYGofO7K/3tvMaQU+g+vXNUrYfNc=;
        b=s8jSb/4Uxm7mLtCWQ2a4ZTfZNKh0PtCo+djrABMmW9bWNgE7UtV3CM2Nn+QNxReuga
         UaW/eQhPCJP6y6RUK1U2BdjaY3497uDkyKPiZXuyDtEY9oitBvzPhnvauHAbdfWA0Mwv
         PBW0sy6nkTx5NyMZu4n1vnT1YjISbuHLBQSfrSyiqFTmQCPqTwpEUuwldJvOObR8QPtg
         gj0Nngb6I2Si6VNexA/DIbO8AD1h6bpUl8qlVCay2qX3If2E1Jph3ZeWi+vLsF7aGVQy
         qm/KBlXngnTnojVwCGJc3n1phgHBkCKkXgBf9vjJGC9c+yUxu6R7h9RAaFSBmRbW5Okm
         iZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3GJTHSzcRfHRR7rYGofO7K/3tvMaQU+g+vXNUrYfNc=;
        b=aQdA+vJ1NeWUcUHtq2ytqWOHTYxWy5jKCHwYG8fu85Sn26U3T9mWQN4aa+/jlu/ex3
         KdyQet4FfbdJUbvetrgd31l/WhVn1z9BHR4YY3WTHtdRxFgQdVRZG5SWy5sFkROcjGcb
         fD0kB7vKT91iSNtW7+VvQcflLak0B/qheKi4bIX+wFHdz/zbGwuqcIS5yLSYbNKPu1uP
         VCcYaO7FWkOFDY16KkSoMNC1BWytEPWeK2ryyCVyC/0rnHtN6d56C/5xkuOxJRMJMR2r
         zJ0+HY48ADmAe9YF/jT4l86gjBYvc6m13BAf7EdmdhvURzzSvunxfxs8vYXcPAyAtiLD
         5Udw==
X-Gm-Message-State: AOAM532DDci2tEovxR0A4MgPRYHt1QKftuF78f1DGS8FPFh0Oq0Gj3V5
        f3nU6RBH9tb17Tgamb6eXcXDlY4EuZ6x7zxZK6FZ3Q==
X-Google-Smtp-Source: ABdhPJxASVpzZF63UvkPFlBxtwrWbbdQ5itq42p8VSocVX8aKD/TLTr8NlFYMefpF+MYtCEpIEz1YBiNJfYM7nhiEsU=
X-Received: by 2002:a05:6512:32a3:: with SMTP id q3mr13681368lfe.157.1628683272677;
 Wed, 11 Aug 2021 05:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <1627910464-19363-1-git-send-email-skakit@codeaurora.org> <182fc9a13b78d114bd209f9658274f0c@codeaurora.org>
In-Reply-To: <182fc9a13b78d114bd209f9658274f0c@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:01:01 +0200
Message-ID: <CACRpkdYQ-r2Xw0BHt0Mu78FWemXWU0jjKixTSPpspH9wkEmtCA@mail.gmail.com>
Subject: Re: [RESEND PATCH V7 0/3] Convert qcom pmic gpio bindings to YAML
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 8:17 AM <skakit@codeaurora.org> wrote:

> Can you pls merge these patches? I have rebased them on linux-next.

Yeah I tried, hope it worked. Sorry for the delay.

Yours,
Linus Walleij
