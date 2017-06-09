From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpio: mockup: use devm_kcalloc() where applicable
Date: Fri, 9 Jun 2017 13:29:49 +0200
Message-ID: <CAMRc=Md4Wne5zBzC25YHyESC91SRiQvUX-5kVhBtMy5dT9VY_Q@mail.gmail.com>
References: <1496317623-24026-1-git-send-email-brgl@bgdev.pl>
 <1496317623-24026-2-git-send-email-brgl@bgdev.pl> <CACRpkdZbvhqd0LETS3CJ_V5D_aqsmezC-ehhgyXcsfHU9J_2hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33836 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751554AbdFIL3u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 07:29:50 -0400
Received: by mail-oi0-f46.google.com with SMTP id o65so29535599oif.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 04:29:50 -0700 (PDT)
In-Reply-To: <CACRpkdZbvhqd0LETS3CJ_V5D_aqsmezC-ehhgyXcsfHU9J_2hQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-06-09 10:06 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Jun 1, 2017 at 1:47 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
>> When allocating a zeroed array of objects use devm_kcalloc() instead
>> of manually calculating the required size and using devm_kzalloc().
>>
>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> This does not apply on the GPIO "devel" branch in my tree,
> probably because of other patches from you :)
>
> Could you rebase and resend?
>
> Yours,
> Linus Walleij

I thought you would apply the previous patches first, but sure, I'll resend.

Thanks,
Bartosz
