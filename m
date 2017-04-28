From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next v2] pinctrl: artpec6: Fix return value check in artpec6_pmx_probe()
Date: Fri, 28 Apr 2017 09:43:07 +0200
Message-ID: <CACRpkdZCKcsk1aR00w5DCrkSrbkzUmt9qcrwwFtH4LDsY+B3gw@mail.gmail.com>
References: <20170425032945.22157-1-weiyj.lk@gmail.com> <20170425112930.19555-1-weiyj.lk@gmail.com>
 <20170425134000.GN18509@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:38867 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755081AbdD1HnJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 03:43:09 -0400
Received: by mail-it0-f45.google.com with SMTP id f187so31682131ite.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Apr 2017 00:43:09 -0700 (PDT)
In-Reply-To: <20170425134000.GN18509@axis.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesper Nilsson <jesper.nilsson@axis.com>, ext Tony Lindgren <tony@atomide.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@axis.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 25, 2017 at 3:40 PM, Jesper Nilsson <jesper.nilsson@axis.com> wrote:
> On Tue, Apr 25, 2017 at 11:29:30AM +0000, Wei Yongjun wrote:
>> From: Wei Yongjun <weiyongjun1@huawei.com>
>>
>> In case of error, the function pinctrl_register() returns
>> ERR_PTR() not NULL. The NULL test in the return value check
>> should be replaced with IS_ERR().
>>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
>
> Although I'm wondering if moving to pinctrl_register_and_init()
> would sense here. Linus?

That depends, check on the commits introducing it for the
usecase.

OTOMH it was introduced for when you have hogs in drivers
doing all set-up of groups and functions from the device tree.

Tony?

Yours,
Linus Walleij
