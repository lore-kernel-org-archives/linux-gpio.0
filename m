From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 0/8] gpio: mockup: updates for 4.13
Date: Fri, 9 Jun 2017 18:46:17 +0300
Message-ID: <CAHp75VehEo9XSXO3RueNiN2WcZ7K2fPE3a7U90Bd0nH91Vi7FQ@mail.gmail.com>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:33037 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751562AbdFIPqS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 11:46:18 -0400
In-Reply-To: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 9, 2017 at 2:41 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> v1 -> v2:
> - omit applied patches
> - use kstrtoint_from_user() for debugfs input sanitization
> - add a patch improving the code in gpio_mockup_event_write()
> - bail out from gpio_mockup_event_write() on invalid input even when
>   nobody is listening for events
>
> v2 -> v3:
> - added the patch replacing devm_kzalloc() with devm_kcalloc() where
>   applicable
>

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Bartosz Golaszewski (8):
>   gpio: mockup: improve the debugfs input sanitization
>   gpio: mockup: tweak gpio_mockup_event_write()
>   gpio: mockup: refuse to accept an odd number of GPIO ranges
>   gpio: mockup: improve readability
>   gpio: mockup: don't return magic numbers from probe()
>   gpio: mockup: improve the error message
>   gpio: mockup: add myself as author
>   gpio: mockup: use devm_kcalloc() where applicable
>
>  drivers/gpio/gpio-mockup.c | 67 ++++++++++++++++++++++++----------------------
>  1 file changed, 35 insertions(+), 32 deletions(-)
>
> --
> 2.9.3
>



-- 
With Best Regards,
Andy Shevchenko
