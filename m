From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 06/10] gpio: mockup: refuse to accept an odd number of
 GPIO ranges
Date: Sat, 27 May 2017 20:29:33 +0300
Message-ID: <CAHp75VfwAS3fKfnDGb6cGEC0-YhpR2J_mwSHzjykh6vbQ=p4eQ@mail.gmail.com>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl> <1495701227-28809-7-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:36828 "EHLO
        mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750724AbdE0R3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 May 2017 13:29:35 -0400
In-Reply-To: <1495701227-28809-7-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 25, 2017 at 11:33 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Currently we ignore the last odd range value, since each chip is
> described by two values. Be more strict and require the user to
> pass an even number of ranges.

> -       if (gpio_mockup_params_nr < 2)
> +       if (gpio_mockup_params_nr < 2 || (gpio_mockup_params_nr % 2))

     if (((gpio_mockup_params_nr + 1) & ~3) < 3)

3 might have a suffix regarding to the type of variable.

-- 
With Best Regards,
Andy Shevchenko
