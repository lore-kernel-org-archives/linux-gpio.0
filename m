From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: mockup: dynamically allocate memory for chip name
Date: Wed, 28 Dec 2016 14:13:16 +0100
Message-ID: <CACRpkdYmfB6vaM=tFqsZO24_Rah8sFmnriHd-FT+RvPK=xxEnw@mail.gmail.com>
References: <1482233300-20078-1-git-send-email-bgolaszewski@baylibre.com> <1482233300-20078-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:34484 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751522AbcL1NNW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2016 08:13:22 -0500
Received: by mail-qt0-f176.google.com with SMTP id d45so127336240qta.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2016 05:13:22 -0800 (PST)
In-Reply-To: <1482233300-20078-3-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Dec 20, 2016 at 12:28 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Currently the chip name buffer is allocated on the stack and the
> address of the buffer is passed to the gpio framework. It's invalid
> after probe() returns, so the sysfs label attribute displays garbage.
>
> Use devm_kasprintf() for each string instead.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied.

Yours,
Linus Walleij
