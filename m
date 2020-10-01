Return-Path: <SRS0=XA7Z=DI=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E921C4727C
	for <linux-gpio@archiver.kernel.org>; Thu,  1 Oct 2020 08:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B997C208B8
	for <linux-gpio@archiver.kernel.org>; Thu,  1 Oct 2020 08:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qjLT8LO+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgJAICN (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 1 Oct 2020 04:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgJAICN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 04:02:13 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCE4C0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 01:02:12 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 197so4804704lfo.11
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kk1et6klii5Zo0sScHftdns1wm+Pulwjox7BPY9aq4I=;
        b=qjLT8LO+1jQKrNe4xARF1pdyrbs+8pVXMnQJtj2MgGxkNeB+tWEexed3ynRuJSXUgv
         hkGxpROp8qwZOJorS0MapEuJp9ES+S2wXl6dA9CAvQ6f4vWg9Its+CKIUrkfebYynoFM
         2sUqqt+Duc3MO6UY5VnoKraYvBjzXyrNgd8uVQg9I3IGcYesh9fUC/jGxEuRs3+YDm07
         3+97+nCiHr9l9jiH3zbXWyKNzbTFixD5e4qp5FxOWXo/+KYQmcUz5HeQJBxeuM8pV6Ng
         CZiI5kJIH6DgSUKSBAk7ewRfHHHuPb1wFxoZmFfIH6vlYQOHug0fvmTHG8pyVbT38dLp
         p+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kk1et6klii5Zo0sScHftdns1wm+Pulwjox7BPY9aq4I=;
        b=AlgrMAZhZmvoAv/RgmdeOQshoAditsyUPtwJgMIMbvFNth4jDoiWns1nMDW0qMUIAT
         V4KqAIasiQH0Vp/E9P2vjhVFepHNmefbGlU9tg6yDmwuWwj2k2kXnajMzo1omVyg1kJh
         Hz0kZ7Q7Ke5KOljgDmhDnvfMAfbrbSHrmivYKs29t+fIuOjRtAWshvqlMYTbzL7TBgEv
         qYxjTUU7nXUD/puNJrNtJ9BWwtRLIJsm8+fXrg3Y3o6BdOOBnmlWDsAUFjZygwcQ5LcY
         8vsLms6iwit665BVFtqmpO60Zwrsgfa9OOFwRKY6bvENoaAZJz9Z4MGud5BlTsb0LqoJ
         zsPA==
X-Gm-Message-State: AOAM533Z8Wr/wh9k0UuhysSnhqq93Yy73NgvbkYqOeARoNStuWfSDJbY
        sXGgsK3A6N+bfP9lqeg3+ZHx3J6Vy0PeIrgjIMlCGZyM8mjnBQ==
X-Google-Smtp-Source: ABdhPJyYQlod2Lfc3hz8RCyiNFoEmuJr2Yjm1/Qw0q7k2fpcowBI2B+didObr2drV4NGvLMo8i3SZy3XpyOh0IHx6Pg=
X-Received: by 2002:a05:6512:20c3:: with SMTP id u3mr1994250lfr.572.1601539331126;
 Thu, 01 Oct 2020 01:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200930142013.59247-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200930142013.59247-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Oct 2020 10:02:00 +0200
Message-ID: <CACRpkdaXBRfEA8XDi25T3wTmohBu3ca_yPGuTA_b992HhZVcgw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: pca953x: Use bitmap API over implicit GCC extension
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 4:20 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In IRQ handler we have to clear bitmap before use. Currently
> the GCC extension has been used for that. For sake of the consistency
> switch to bitmap API. As expected bloat-o-meter shows no difference
> in the object size.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Both patches applied!

Yours,
Linus Walleij
