From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/8] gpio: mockup: improve the debugfs input sanitization
Date: Tue, 20 Jun 2017 09:12:34 +0200
Message-ID: <CACRpkdZaokvYkk-giyxPyqpcYsvJdeKQt8EMCRcTPhs-_b83og@mail.gmail.com>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl> <1497008492-14907-2-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:34641 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751768AbdFTHMl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 03:12:41 -0400
Received: by mail-io0-f170.google.com with SMTP id i7so78430632ioe.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 00:12:36 -0700 (PDT)
In-Reply-To: <1497008492-14907-2-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 9, 2017 at 1:41 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> We're currently only checking the first character of the input to the
> debugfs event files, so a string like '0sdfdsf' is valid and indicates
> a falling edge event.
>
> Be more strict and only allow '0', '1', '0\n' & '1\n'.
>
> While we're at it: move the sanitization code before the irq_enabled
> check so that we indicate an error on invalid input even if nobody is
> waiting for events.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
