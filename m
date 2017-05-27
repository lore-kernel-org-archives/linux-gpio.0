From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 05/10] gpio: mockup: improve the debugfs input sanitization
Date: Sat, 27 May 2017 19:45:41 +0300
Message-ID: <CAHp75Vfx_Ft50ha1FNzzLi-Pp8ex27M05-bChn-uLBZ7H_ThNg@mail.gmail.com>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl> <1495701227-28809-6-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:33107 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbdE0Qpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 May 2017 12:45:44 -0400
In-Reply-To: <1495701227-28809-6-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 25, 2017 at 11:33 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> We're currently only checking the first character of the input to the
> debugfs event files, so a string like '0sdfdsf' is valid and indicates
> a falling edge event.
>
> Be more strict and only allow '0', '1', '0\n' & '1\n'.

Why not to be so strict and use

kstrtobool_from_user();

instead?

-- 
With Best Regards,
Andy Shevchenko
