Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00474C388F9
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 22:10:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95AD7208B3
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 22:10:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfrXGfXs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgKKWKY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Nov 2020 17:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgKKWKY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 17:10:24 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A95C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:10:21 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id u2so1691725pls.10
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3y3n+ki3u41mi6k5wDNqXFpkq5aM538XV2t4JM5Dnaw=;
        b=ZfrXGfXshgHwK+1KXO69GdLko6/f40OGc9NCEVyApATO7mfEqQbd/TcymC+zvtkRBq
         9/XHP7Pz+ZJGRMbwZ+oxXmnFJSMeEzN0lnMnZGLeq/O7FVauZUr5lckS5jM7VX6B7Ts/
         hg5s1gfInHEhHLD9euG5fBGpvrk8OJ20XUO/fwH60I7a48IIS9tjo2U6oMnoOfv6sFpO
         OfCMQcU9+7sAasyGMtRI2QuTPMr1EOS43zE3TEXFvDW5TzXZAMdTlcHmHwcMS9w2SVcr
         lLAanvBMHVID7WWr3d2n1es//YqEnHFOs6OP3Iz9TVuz43EmvQojfQ5WRLhEQLKjAwyG
         hXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3y3n+ki3u41mi6k5wDNqXFpkq5aM538XV2t4JM5Dnaw=;
        b=UXRrbv1s9RRWGASqTzuRxoaFTcpaNE+545/4gdwch9v7OO8Ql4VLoK9tWewIoqtrKn
         /VGnSa2YBjN//AqUkBg94dX8U1lqqyMkZs6UUlUK5407Flob4v+/jVIvSDMk7i3yeh/U
         vHUuypaUHMDjAn3gkENG8TLmdGCE+k2c5kZlsLXdyirE6J31FbyW5k+da9Ib1AFSujzq
         UUD+bpHzCa7x14VDb+gNJJwvmk3/5ZRPg2u3bstHcQoRRgSPuQlSNnnOZRWCOnCskkmL
         LqzYGv3vo5kYcLp3FdmlEwSTEiZ1X5IzlMhxZH+8dtGh+lw/tPlK0FPv144pi12ueIg0
         L+KQ==
X-Gm-Message-State: AOAM532waCY9gUZJ4ciCLVwF3DFfN4MLELR1HNEvPDMhLHXb6f4TW1vB
        701hVvdR3SfiB+0Q2LaJzPiW7J1Li16j4MTILPU=
X-Google-Smtp-Source: ABdhPJyRninn0dwOomdAgiptDIelhZKYulASdrMjq289OMl1bdglHkajSdZOkZWNq6z4A0v6HB9U1At9v4SCYKNUdhE=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr23370789plr.0.1605132621071; Wed, 11
 Nov 2020 14:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com> <20201111220559.39680-18-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201111220559.39680-18-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 12 Nov 2020 00:11:09 +0200
Message-ID: <CAHp75VcPd1oHkmFZ35SiPwu7bNCj+MnAYVOL4mhcv1bbNnCBQw@mail.gmail.com>
Subject: Re: [PATCH v6 17/18] sh: Drop ARCH_NR_GPIOS definition
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:07 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The default by generic header is the same, hence drop unnecessary definition.

Sorry, sent by mistake, please ignore this email.

-- 
With Best Regards,
Andy Shevchenko
