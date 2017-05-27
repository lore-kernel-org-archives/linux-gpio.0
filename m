From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 05/10] gpio: mockup: improve the debugfs input sanitization
Date: Sat, 27 May 2017 19:47:46 +0300
Message-ID: <CAHp75Ve2ne5Y76kG0rvuGO0_QtTRu1hM3GW+d7se2m_M3MwiZg@mail.gmail.com>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
 <1495701227-28809-6-git-send-email-brgl@bgdev.pl> <CAHp75Vfx_Ft50ha1FNzzLi-Pp8ex27M05-bChn-uLBZ7H_ThNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33001 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750828AbdE0Qrr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 May 2017 12:47:47 -0400
In-Reply-To: <CAHp75Vfx_Ft50ha1FNzzLi-Pp8ex27M05-bChn-uLBZ7H_ThNg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, May 27, 2017 at 7:45 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, May 25, 2017 at 11:33 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> We're currently only checking the first character of the input to the
>> debugfs event files, so a string like '0sdfdsf' is valid and indicates
>> a falling edge event.
>>
>> Be more strict and only allow '0', '1', '0\n' & '1\n'.
>
> Why not to be so strict and use
>
> kstrtobool_from_user();
>
> instead?

Or if you still wish to be strict,
ret = kstrtou8_from_user();
if (ret)
 return ret;

if (val > 1)
 return -ERANGE;

or alike.

-- 
With Best Regards,
Andy Shevchenko
