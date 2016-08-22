From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] i2c: pca953x: fix a lockdep warning
Date: Mon, 22 Aug 2016 16:15:31 +0200
Message-ID: <CAMpxmJVzCgSWJkS2RNx9T9Y0gpmsBe5MzczfJhKj=SiEMOfy4Q@mail.gmail.com>
References: <1471872572-25818-1-git-send-email-bgolaszewski@baylibre.com> <CACRpkdZjDGDY=Kez-4C6pUV8Xpj3t+jP8DtqxdWwQ_EiPDMt6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f169.google.com ([209.85.213.169]:33273 "EHLO
        mail-yb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752495AbcHVOVg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2016 10:21:36 -0400
Received: by mail-yb0-f169.google.com with SMTP id b96so2830694ybi.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2016 07:21:35 -0700 (PDT)
In-Reply-To: <CACRpkdZjDGDY=Kez-4C6pUV8Xpj3t+jP8DtqxdWwQ_EiPDMt6Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2016-08-22 16:06 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Mon, Aug 22, 2016 at 3:29 PM, Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>
> The $SUBJECT of this patch should be something beginning with
> gpio: atleast.
>

Oops, it was supposed to be gpio, but I was working on i2c stuff and
mixed it. I'll fix that in v2 after getting some reviews.

Best regards,
Bartosz Golaszewski

> Apart from that it'd be nice to get review from the other people using
> the PCA953x driver, since it's rather complex.
>
> Yours,
> Linus Walleij
