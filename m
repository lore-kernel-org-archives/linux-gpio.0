From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 1/5] gpio: pca953x: code shrink
Date: Mon, 12 Sep 2016 14:46:06 +0200
Message-ID: <CACRpkdYMk7VzqwmwXEc+TKY5WpRcHcueqZjz_q9hp98KNaoQgw@mail.gmail.com>
References: <1473412658-13120-1-git-send-email-bgolaszewski@baylibre.com> <1473412658-13120-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:37719 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758284AbcILMqI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 08:46:08 -0400
Received: by mail-it0-f48.google.com with SMTP id 186so9734861itf.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 05:46:07 -0700 (PDT)
In-Reply-To: <1473412658-13120-2-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Sep 9, 2016 at 11:17 AM, Bartosz Golaszewski
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
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
