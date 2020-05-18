Return-Path: <SRS0=01Zh=7A=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECABC433E0
	for <linux-gpio@archiver.kernel.org>; Mon, 18 May 2020 07:16:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EDD52070A
	for <linux-gpio@archiver.kernel.org>; Mon, 18 May 2020 07:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T5KLTC/R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgERHQN (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 18 May 2020 03:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgERHQN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:16:13 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3B7C061A0C
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:16:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g4so8653207ljl.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rKubmRO7B6ZJH2nTSWi+19cjgs+G10d8Vl7/a67wm4A=;
        b=T5KLTC/RcOldGQVKiQ7WH7+7cu5xVXrfBPWPQi2+/X3qH0sC1rFEXGDVuGHim/aKQl
         fBHuWzKInnBJqVAPeTpVH3YJFOaa9jeD3ncOv1+D/SVxzD6bFNXJyHZQXkvUrV6ZN2I8
         9yb7JmLgAI/DG3UY22QQ72E0TWpOsRH+hrPzmHHw9jm40V868i1YLMvxuAVm6VK4ruBL
         /EuYa8YQnl0tSqTdvI7NkrAX8CVVrXcwhkcAYZZtiLQYjnC2DNa2n8X9nlHXJYhXWIa0
         SS4juRoMIP9HM6L0X7GcItjdcgDmaL7pG5jiD29xghqolNjOx8M0mxiR4EqrnlC1EBbf
         s91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rKubmRO7B6ZJH2nTSWi+19cjgs+G10d8Vl7/a67wm4A=;
        b=NOzf5Yr5e+tdMd4D8XFPrHFif6JzoByuMjEm4RKNosNv53l7v4/UbQfLGlOxiPbm7J
         suWvN9wxTP9al9syiXeQJ2L6oowRD01bbuuY00K3B1TUcB2lMMu5j5/qacKphcM76CBS
         sUtpC3XzIZUFvI31YtNksJLMLk660DRfcvmVB+GLMu6QcwuorZaueMTPslLdlLZkrNxp
         wds4NvMYwqwohc2DSU2BA+mZjObbVrc32ty5fjT9dvblqMPkzkd40zw9f1fwAS9xXtlK
         j2LARZM8KQ7VM5SmK0YjeU00qTdG29XAFf/4XQ9m/wJGCDWQMyttijOHvxWT3SA9xAm9
         oWOw==
X-Gm-Message-State: AOAM5314aMkuASJbYLvlkZpOhkDxiCinZI54b1Ve9XbV57Nig+Djezs5
        Kp6DfLzT4q2RB2ApY2Gt2KvuAVSlaFds5gH77gmWHQ==
X-Google-Smtp-Source: ABdhPJzcA9cyidr2tc1VD8cfd0B3HvHJdCg0TKpKLPqsE4V1kEjrb+zWHfIJTuBOdJt4Hz+wzCh5IzrJdFKolCeepiU=
X-Received: by 2002:a05:651c:154:: with SMTP id c20mr8877477ljd.99.1589786170726;
 Mon, 18 May 2020 00:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200512182623.54990-1-andriy.shevchenko@linux.intel.com> <20200512182623.54990-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200512182623.54990-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:16:00 +0200
Message-ID: <CACRpkdbHdTt2CsV3R4ro0b9dTwVUg4T3CdgyK9XjE3yiarB6pw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: mb86s7x: Remove superfluous test for ACPI companion
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 8:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> acpi_gpiochip_request_interrupts() will check for ACPI handle of
> the GPIO chip parent device and bail out if there is none defined.
> Thus, has_acpi_companion() is effectively repeating above and
> is not needed in the individual driver.
>
> Assigning ->to_irq() unconditionally doesn't change anything, except
> an error code, but this we fix as well by propagating it from
> platform_get_irq().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
