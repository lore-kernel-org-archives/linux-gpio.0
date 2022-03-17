Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FD5C433F5
	for <linux-gpio@archiver.kernel.org>; Thu, 17 Mar 2022 16:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235658AbiCQQZL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 17 Mar 2022 12:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbiCQQZK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2022 12:25:10 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644A2B6E52
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 09:23:53 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id h13so7229505ede.5
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2022 09:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oOWGHERmob5Yygo6U30wRIjXch1iO8mQksl3MvPNZYc=;
        b=TNELMIY3MXOF2GBX9BA9ZnCz9GYppJYJGkJcIlJ++/RDCq8RGZDwV4kO/c7u5r98I+
         5s2z9oydfButOB56JW335d80acACxqYvL5Zx14kaE+1ER7tbuWjGilETtCnxYL/FCl8I
         ADUzc/NkoP7+DOPB/MCa/eB9TL+BJb1J0z4ATEdhrpt379eyC0etJnGrnrUTlM3f2+oj
         RqYF/wwoIaqlmGJcHlGXw3IW4cjAbSLjRRtSYJErQb4eX/qnWN5W4/kQDsi/yti5jWe9
         xFFDT5vHeWFlwqGa0/MsENX1Np8LJ4D4b9HJWNfycC/MI/Ukkm0geVYi8KSciTO0Ai7l
         FLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oOWGHERmob5Yygo6U30wRIjXch1iO8mQksl3MvPNZYc=;
        b=TNaVrwxq+GoMODovKHw+HQ3uW+vEAt/mBERzgucFsfezf+ydooghu6+DRruDcMa9XG
         6ksw5PWa44u5aIcQs1RcuGjFe6Q+cqJ8PxuOQby+8TtS79PntSFVBqBIYSAwltLBNPys
         GtxOBe6YY3MzYFrAHtcQ1nimZEcGCKYVzvwPKTrIR1D0Y625o9pwkPiV2wXjMuxoHVBI
         2x499CK4VwMC59GmBuGPYxdzAYtaxUvJ8MlZJFp8LzzbvUbpQe/BsSLJHzjoOjK8tLCW
         kZtFR75LsNyiIq5sVHla9UnvrR4Np5NRkpY69mZidMnLPx9vY7Hl+8QP7e7J+g52BmyE
         CSJw==
X-Gm-Message-State: AOAM532hny3e4QnhegDkTTlNtC685UXFLkefOpf7+vwMCklWOjk33c4n
        iPCGHCXpnqxynepBWVDVruyiGOuXNyLueiLhjeXRFvNtQDoLyBxx
X-Google-Smtp-Source: ABdhPJwJrXXai3HZfO0xbMZ0vWCfJI2jhJa+tx357DiSTlv+bynSjMu0iR9EqX7GtKNjX2t59zxFTfvkE6xnoX9inn4=
X-Received: by 2002:aa7:c55a:0:b0:418:681a:d65c with SMTP id
 s26-20020aa7c55a000000b00418681ad65cmr5408111edr.145.1647534231584; Thu, 17
 Mar 2022 09:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220316020441.30001-1-warthog618@gmail.com> <20220316020441.30001-4-warthog618@gmail.com>
In-Reply-To: <20220316020441.30001-4-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Mar 2022 17:23:41 +0100
Message-ID: <CAMRc=Me5meD11s1Ea0r9yAe-4==J2N7O0yf=umtfukwcxRgMQg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 3/3] core: rename uAPI related variables and
 functions to uapi.
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 16, 2022 at 3:05 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Rename variables using the "buf" suffix to a "uapi_" prefix to identify
> them as being uAPI types.
> Similarly, rename the corresponding uAPI conversion functions from
> "kernel" to "uapi".
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Applied, thanks!

Bart
