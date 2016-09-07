From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] gpio: pca953x: coding style fixes
Date: Wed, 7 Sep 2016 23:55:10 +0200
Message-ID: <CACRpkdb18bvEasNLoOvMXYcKcig1UL2hBDGRgOoT1yto5t6+qQ@mail.gmail.com>
References: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com> <1473085895-31711-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:32891 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752887AbcIGVzL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 17:55:11 -0400
Received: by mail-oi0-f43.google.com with SMTP id y2so45848967oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 14:55:11 -0700 (PDT)
In-Reply-To: <1473085895-31711-2-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Sep 5, 2016 at 4:31 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> pca953x_gpio_set_multiple() has some coding style issues that make it
> harder to read. Tweak the code a bit.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Much better like this.

Patch applied.

Yours,
Linus Walleij
