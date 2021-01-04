Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8DAC433E0
	for <linux-gpio@archiver.kernel.org>; Mon,  4 Jan 2021 10:38:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F38D221D79
	for <linux-gpio@archiver.kernel.org>; Mon,  4 Jan 2021 10:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbhADKiL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 4 Jan 2021 05:38:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbhADKiL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 05:38:11 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5051C061793
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 02:37:30 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id x20so63148589lfe.12
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 02:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Irv4bODSEyX5XuG9TV4/17jq5rkGQP+jA8EeoSsmog0=;
        b=yM/HspTPWUOUdDtGnjbz69E6rk8+MvJdzll4p3tIgPVeMhh46SvXxLeMZbDKiKHQAq
         aWwOynY75uJHaxml4DYcMpEOav2D/ifRbOwPnCi1InYMRMBTlR5nZCSD8xuXs2GrueHo
         cQ5Fw9+ypOODVbrOwTwgjg/Z6UZ+Jm7jIUX10Wwq0jtVYmhQz9PQ9tuD498wJSCaDCcR
         NKSFfBl7OYIQMP3G8v8mJtv/lZp7DWHDTvrIT3OOMOB5Pbirxv+oqg86hQCyl1z7stKv
         L2Bgo40CIw3cQCMl7Gf0T+WMDFdd//OmSgxeJ1c1JZctF6oOHd9167p+a1pFwDp1KYIm
         U2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Irv4bODSEyX5XuG9TV4/17jq5rkGQP+jA8EeoSsmog0=;
        b=UGM/R/PKyl2qGkeZhZWSL2O3A2sJWJ24ZCn708/ZkMdIkyVcSh6bKHOxL7aVSdOSVF
         LTJent7gcyW9tZc9/jx2btorha79fg2WZxxYKEwMr+DHvyahS50u4RQsqj6kRjsfQM0Q
         mM6nLciiWUhuAZakjV2gxO1S6oRNbyYCT9IV65UJNc1uYo4bJ58mm4VsccBGy0uuxa5O
         JESEf2oep5LUUThzMX9reTKa8us46ActtShNmBfpmuxbRnIuMGkxuAVCIwcI7peCYwHQ
         nV8ryrsq0TSiaAsLTlokG8W9y985mEEQ8j7Mh4NQ1r0otPftEsIz9dt455I76JYgscbl
         MV0Q==
X-Gm-Message-State: AOAM533QVmpVQX0nMKb6JI6LvETpaZq8z6TC+PwV9gBQEZocUG+Yq47V
        dn6AoAZnx7XjujK16UC4itImONlZB4xS9ps+Ra8jRA==
X-Google-Smtp-Source: ABdhPJyCnxVWy/iIBCxCsmDOVLxJmjJwlmPAsbExyn0NTrsorfovm2BiIrmx2Nh9utTkaKG/wOKDmRD7Leg6ZImBQQI=
X-Received: by 2002:a2e:586:: with SMTP id 128mr37945106ljf.273.1609756649236;
 Mon, 04 Jan 2021 02:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20201211084541.2318-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201211084541.2318-1-zhengyongjun3@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 11:37:18 +0100
Message-ID: <CACRpkda9NMy9vPnnxQm-go+hK1D_JbiK0RJ3iLYnULnpV63GqA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl/pinctrl-at91: convert comma to semicolon
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 9:45 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:

> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Patch applied.

Yours,
Linus Walleij
