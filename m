From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/3] gpiolib: Update documentation of struct acpi_gpio_info
Date: Wed, 11 Jan 2017 12:10:17 +0100
Message-ID: <CACRpkdaS4jsiLr9+MM=x-Xro8Bbryec4f_6aNeLjypHnDMBbSg@mail.gmail.com>
References: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com> <20170103170119.35950-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:35989 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752794AbdAKLKT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 06:10:19 -0500
Received: by mail-qt0-f181.google.com with SMTP id k15so421608960qtg.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 03:10:18 -0800 (PST)
In-Reply-To: <20170103170119.35950-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Christophe RICARD <christophe.ricard@gmail.com>

On Tue, Jan 3, 2017 at 6:01 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It seems the code had been changed, but description left untouched.
>
> Update description of the struct acpi_gpio_info and relative comments
> accordingly.
>
> Fixes: commit 52044723cd27 ("ACPI / gpio: Add irq_type when a GPIO is used as an interrupt")
> Cc: Christophe RICARD <christophe.ricard@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
