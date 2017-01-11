From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpiolib: Update documentation of struct acpi_gpio_info
Date: Wed, 11 Jan 2017 12:11:56 +0100
Message-ID: <CACRpkdZytHGor3XxSGYFthdfht8o=aO5iGzCxV6xMm61E4Q-1Q@mail.gmail.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com> <20170109140228.47613-3-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:36168 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762322AbdAKLTJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 06:19:09 -0500
Received: by mail-qt0-f177.google.com with SMTP id k15so421788431qtg.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 03:19:09 -0800 (PST)
In-Reply-To: <20170109140228.47613-3-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Christophe RICARD <christophe.ricard@gmail.com>

On Mon, Jan 9, 2017 at 3:02 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It seems the code had been changed, but description left untouched.
>
> Update description of the struct acpi_gpio_info and relative comments
> accordingly.
>
> Fixes: commit 52044723cd27 ("ACPI / gpio: Add irq_type when a GPIO is used as an interrupt")
> Cc: Christophe RICARD <christophe.ricard@gmail.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This too seems identical to v1.

Yours,
Linus Walleij
