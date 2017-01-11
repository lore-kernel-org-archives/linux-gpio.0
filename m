From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpiolib: Switch to for_each_set_bit()
Date: Wed, 11 Jan 2017 12:11:13 +0100
Message-ID: <CACRpkdbBJZ-4O_H7kAp_QY+zP03nA+odL820EOZz-F=FKcLNLw@mail.gmail.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com> <20170109140228.47613-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:34074 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933835AbdAKLLP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 06:11:15 -0500
Received: by mail-qk0-f173.google.com with SMTP id a20so205600928qkc.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 03:11:14 -0800 (PST)
In-Reply-To: <20170109140228.47613-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Mon, Jan 9, 2017 at 3:02 PM, Andy Shevchenko
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
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I hope v1 is just as fine. It looks the same.

Yours,
Linus Walleij
