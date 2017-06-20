From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 4/8] gpio: mockup: improve readability
Date: Tue, 20 Jun 2017 09:14:50 +0200
Message-ID: <CACRpkdaZ-jaK=6eoTRc4aVGOiq-tskvb5ywB1UeSawxBD4rs9w@mail.gmail.com>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl> <1497008492-14907-5-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:33551 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbdFTHOv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 03:14:51 -0400
Received: by mail-it0-f46.google.com with SMTP id g184so15977417ita.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 00:14:51 -0700 (PDT)
In-Reply-To: <1497008492-14907-5-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 9, 2017 at 1:41 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> We currently shift bits here and there without actually explaining
> what we're doing. Add some helper variables with names indicating
> their purpose to improve the code readability.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
