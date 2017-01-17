From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpiolib: Convert fwnode_get_named_gpiod() to
 configure GPIO
Date: Tue, 17 Jan 2017 16:05:13 +0100
Message-ID: <CACRpkdY+FLXj9RCDMfki7=OBfwzwib7N+cbnPfXAmoiz+mPn_w@mail.gmail.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com> <20170109140228.47613-4-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:35840 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750741AbdAQPNe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2017 10:13:34 -0500
Received: by mail-qt0-f181.google.com with SMTP id k15so162319073qtg.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2017 07:13:34 -0800 (PST)
In-Reply-To: <20170109140228.47613-4-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Mon, Jan 9, 2017 at 3:02 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Make fwnode_get_named_gpiod() consistent with the rest of gpiod_get() like API,
> i.e. configure GPIO pin immediately after request.
>
> Besides obvious clean up it will help to configure pins based on firmware
> provided resources.
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied. Will apply Alex' patch on top.

Yours,
Linus Walleij
