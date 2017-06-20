From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 8/8] gpio: mockup: use devm_kcalloc() where applicable
Date: Tue, 20 Jun 2017 09:17:59 +0200
Message-ID: <CACRpkdYEsRG+GP8sC=VhfYeMJ4O7sQQi_yjttyc2bDYKXOoT3A@mail.gmail.com>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl> <1497008492-14907-9-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:35769 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750990AbdFTHSB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 03:18:01 -0400
Received: by mail-it0-f44.google.com with SMTP id m62so8778093itc.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 00:18:01 -0700 (PDT)
In-Reply-To: <1497008492-14907-9-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 9, 2017 at 1:41 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> When allocating a zeroed array of objects use devm_kcalloc() instead
> of manually calculating the required size and using devm_kzalloc().
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
