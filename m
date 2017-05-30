From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 6/7] gpio: mockup: improve the error message
Date: Tue, 30 May 2017 21:59:05 +0300
Message-ID: <CAHp75VdiCsE2nHXHjvYfeG43oVCF0i8x8-hk=uTTLBOdH91U6Q@mail.gmail.com>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl> <1496134720-5363-7-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:36434 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750902AbdE3S7G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 14:59:06 -0400
In-Reply-To: <1496134720-5363-7-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 30, 2017 at 11:58 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Indicate the error number and make the message a bit more elaborate.

> +                       dev_err(dev,
> +                               "adding gpiochip failed: %d (base: %d, ngpio: %d)\n",
> +                               ret, base, base < 0 ? ngpio : base + ngpio);

You may consider to use
'gpio_mockup_add' instead of 'adding gpiochip'. The latter points the
reader first to gpiochip_add family of functions while you run a
wrapper on top of it.

-- 
With Best Regards,
Andy Shevchenko
