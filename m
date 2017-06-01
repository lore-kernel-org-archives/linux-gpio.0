From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpio: mockup: use devm_kcalloc() where applicable
Date: Thu, 1 Jun 2017 13:47:59 +0200
Message-ID: <CAMRc=MdrS6ML97tS79G77S+R6Rj5k8Qb3mWOmdi6i91fEQ+YbQ@mail.gmail.com>
References: <1496317623-24026-1-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35148 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdFALsA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2017 07:48:00 -0400
Received: by mail-oi0-f51.google.com with SMTP id l18so50362384oig.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2017 04:48:00 -0700 (PDT)
In-Reply-To: <1496317623-24026-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

2017-06-01 13:47 GMT+02:00 Bartosz Golaszewski <brgl@bgdev.pl>:
> This is a follow up to [1]. The patch proposes to use devm_kcalloc()
> when allocating arrays of elements.
>
> Bartosz Golaszewski (1):
>   gpio: mockup: use devm_kcalloc() where applicable
>
>  drivers/gpio/gpio-mockup.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --
> 2.9.3
>

[1] https://lkml.org/lkml/2017/5/30/180
