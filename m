From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] gpiolib: Switch to for_each_set_bit()
Date: Wed, 11 Jan 2017 12:08:23 +0100
Message-ID: <CACRpkdYpjk59zqtB970NNm+vG6i9pa5paELwQkT8=E3nuwdOcw@mail.gmail.com>
References: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:36589 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752231AbdAKLIY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 06:08:24 -0500
Received: by mail-qk0-f177.google.com with SMTP id 11so106090833qkl.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 03:08:23 -0800 (PST)
In-Reply-To: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Jan 3, 2017 at 6:01 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The macro for_each_set_bit() effectively looks up to the next set bit in array
> of bits.
>
> Instead of open coding that switch to for_each_set_bit() in
> gpio_chip_set_multiple().
>
> While here, make gpio_chip_set_multiple() non-destructive against its
> parameters. We are safe since all callers, i.e.
> gpiod_set_array_value_complex(), handle that already.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Irrestible clarification patch, applied with Mika's review tag.
Thanks!

Yours,
Linus Walleij
