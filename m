Return-Path: <SRS0=IE7s=CG=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4000BC433E6
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Aug 2020 14:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DFB720757
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Aug 2020 14:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJNfiaDz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgH1Ohe (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 28 Aug 2020 10:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgH1Ohc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 10:37:32 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEACDC061264
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:37:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r13so1587015ljm.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4mU7k790HuWLIpNETwnz7Qzfl109PAxDhdZuzU9xKJQ=;
        b=UJNfiaDzdbzf5ty9QvZhyk7ZCWmYoGqsdmjASmP7eTi9cKLQeuopls1a5lNFUBiiD4
         tbg9XnZc0fkbNQ4QIdwJf6V9sLu/nuLmygZPU3mxuHYBVqNTDJ1qF2xIampR2yzGbdX2
         UITbKOG5KIB5poCrDMUHFjBXCQDjgnYQ4eB0K68KyrCAkdGPw+CYsQ7TG5DvY6BvrPwX
         bzpyanzBxhLqulrClklfkTkTynK9KX3UJCMbRShHzvJV8SI6hca4pKpCezGkX2MKvR0N
         hHGem4BZITKd0S1zadSg/qZG/ac6vwbo2C+BN1l5CKXrT3pE8H+ThQzYolLv4sYF+/Y8
         9yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4mU7k790HuWLIpNETwnz7Qzfl109PAxDhdZuzU9xKJQ=;
        b=YrzRcVGdSBFFEw7e/ZB3yurSNAFIJgFC+b3hHNSbh6GQj+UN55qeKH+lAnmSkL1zWl
         dwqUrwGXKI+JAVOi/yp0NA+QLADj5wZByVn2vXBxBut9PmzlXggFXYA4VibAH1+/8KUi
         a+CIQnz2PAy2GKRkHxrujA1nEd4eijlN3WkCVJ0wNydlr73Sjx6ERNnOmH+ZZquH6w/u
         I3y+7w1vJuW6gkwqnvxiaMwRJLuTni4hckNNxxDRyKj27MHQiIXbxN9Z3pGBPSW2AKty
         55P/EBFgf3fmBhMYk4FyMJcPwO+CrYnQsHCTY6ck/mScBRE+QKFDLdO+QhEu3x94WxGF
         Mhvw==
X-Gm-Message-State: AOAM532/cGr2ry7x72z1kR9WX/F1a8AXRTVL6TVTJrnIxrOIT2JIFl7u
        LxF3DEh9rdrvigRHesaPiv2kcVT/jfHYFH4UFaViZg==
X-Google-Smtp-Source: ABdhPJwBaJfqMTHl4gS94f7uT2FW6lkcdrgQLQnL1S8tsLSV8XSM4cZOnybzOcN13V3S4EZHTiST1oz2Juyk/AZAgh8=
X-Received: by 2002:a2e:8144:: with SMTP id t4mr1139879ljg.100.1598625450137;
 Fri, 28 Aug 2020 07:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200827140020.159627-1-warthog618@gmail.com> <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
 <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com> <20200827224742.GA3714@sol>
In-Reply-To: <20200827224742.GA3714@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:37:19 +0200
Message-ID: <CACRpkdZroNFFsHoBHUFTUUQij7nOcPQiXP-567+fH-Xerv=L4w@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] gpio: cdev: add uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 28, 2020 at 12:47 AM Kent Gibson <warthog618@gmail.com> wrote:

> The particular use case I am considering is one I had been asked about -
> changing a requested line from input with edge detection to output, and
> vice versa. Losing interrupts isn't really an issue for this use case -
> it is expected.  Yet the current implementation requires a re-request.

This is possible to do for in-kernel users, but I don't know if that makes
sense for userspace. It is for one-offs and prototyping after all, there
is no need (IMO) to make it overly convenient for users to implement
all kind of weirdness in userspace unless there is a very real use case.

Yours,
Linus Walleij
