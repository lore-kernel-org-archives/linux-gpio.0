From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/8] gpio: mockup: refuse to accept an odd number of
 GPIO ranges
Date: Tue, 20 Jun 2017 09:14:04 +0200
Message-ID: <CACRpkdYGj-pd+WjwjQ+tSwOxs6mKwm+Z6hyfg7ELURHrvvHzKw@mail.gmail.com>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl> <1497008492-14907-4-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:34418 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750971AbdFTHOG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 03:14:06 -0400
Received: by mail-it0-f50.google.com with SMTP id m47so15880902iti.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 00:14:06 -0700 (PDT)
In-Reply-To: <1497008492-14907-4-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 9, 2017 at 1:41 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Currently we ignore the last odd range value, since each chip is
> described by two values. Be more strict and require the user to
> pass an even number of ranges.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
