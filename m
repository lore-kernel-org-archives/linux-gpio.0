From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: pca953x: Sort headers alphabetically
Date: Thu, 23 Mar 2017 10:42:21 +0100
Message-ID: <CACRpkdaaG4tdOaGq2+mpvTUhd2JOTT48dwTjo1uf=2Fzx7ypLw@mail.gmail.com>
References: <20170322141113.34396-1-andriy.shevchenko@linux.intel.com> <20170322141113.34396-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:33617 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752760AbdCWJmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 05:42:23 -0400
Received: by mail-io0-f176.google.com with SMTP id f84so78910257ioj.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 02:42:23 -0700 (PDT)
In-Reply-To: <20170322141113.34396-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Wed, Mar 22, 2017 at 3:11 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> For sake of better maintenance sort the headers by alphabetical order.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Unrelated:

>  #include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>

#include <linux/gpio/driver.h> should normally be all that is needed.

Yours,
Linus Walleij
