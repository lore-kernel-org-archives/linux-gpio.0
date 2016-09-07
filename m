From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: pca953x: code shrink
Date: Thu, 8 Sep 2016 00:01:46 +0200
Message-ID: <CACRpkdZtVqVgmEoqqrU-xmMTL_4Jbpf3_dfhj-BQsr6NiQHryA@mail.gmail.com>
References: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com> <1473085895-31711-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33746 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751917AbcIGWBs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 18:01:48 -0400
Received: by mail-oi0-f45.google.com with SMTP id y2so46055046oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 15:01:47 -0700 (PDT)
In-Reply-To: <1473085895-31711-3-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Phil Reid <preid@electromag.com.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Sep 5, 2016 at 4:31 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> There are multiple places in the driver code where a
> switch (chip->chip_type) is used to determine the proper register
> offset.
>
> Unduplicate the code by adding a simple structure holding the possible
> offsets that differ between the pca953x and pca957x chip families and
> use it to avoid the checks.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This doesn't apply beacuse of other changes made to the driver by
Phil Reid et al.

Can you please rebase your work on top of my gpio "devel" branch:
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel
and at the same time fix Geert's reported const thing?

I'm overall happy with the patch series and would like to apply
also patches 2-5 for v4.9 soon.

Yours,
Linus Walleij
