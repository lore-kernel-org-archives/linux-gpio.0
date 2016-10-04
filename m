From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: add a comment explaining the need for a
 lockdep subclass
Date: Tue, 4 Oct 2016 14:17:45 +0200
Message-ID: <CACRpkdbAF5sOf6FJTqT5i9xLm_3ykc3YNu71s5aobHpzKKGo+w@mail.gmail.com>
References: <1474883655-15824-1-git-send-email-bgolaszewski@baylibre.com>
 <1474883655-15824-2-git-send-email-bgolaszewski@baylibre.com> <20160926100030.GA5606@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:32814 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751549AbcJDMRq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2016 08:17:46 -0400
Received: by mail-oi0-f45.google.com with SMTP id r126so232215431oib.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2016 05:17:46 -0700 (PDT)
In-Reply-To: <20160926100030.GA5606@katana>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Peter Rosin <peda@axentia.se>, linux-i2c <linux-i2c@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Sep 26, 2016 at 12:00 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Mon, Sep 26, 2016 at 11:54:15AM +0200, Bartosz Golaszewski wrote:
>> This is a follow-up to commit 559b46990e76 ("gpio: pca953x: fix an
>> incorrect lockdep warning"). The reason for calling
>> lockdep_set_subclass() in pca953x_probe() is not explained in
>> the code.
>>
>> Add a comment describing the problem, partial solution and required
>> future extensions.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Acked-by: Wolfram Sang <wsa@the-dreams.de>
>
> Linus, because of dependencies, I should probably pick it up?

Yes Acked-by: Linus Walleij <linus.walleij@linaro.org>

Sorry was travelling.

Yours,
Linus Walleij
