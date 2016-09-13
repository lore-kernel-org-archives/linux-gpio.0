From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: lp873x: Use devm_gpiochip_add_data() for gpio registration
Date: Tue, 13 Sep 2016 10:34:42 +0200
Message-ID: <CACRpkdZ3-H5ekHn2p3owhEmpBFLkWxPUJP_a2jgq_DUz2D+Dbw@mail.gmail.com>
References: <1473509082-3996-1-git-send-email-weiyj.lk@gmail.com> <CACRpkdZnfUfPj19Wts1pd5Nxqi-Zp+kTxZCvXrsSM6DjjJpHUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34960 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755463AbcIMIen (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 04:34:43 -0400
Received: by mail-oi0-f48.google.com with SMTP id d191so154706072oih.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 01:34:43 -0700 (PDT)
In-Reply-To: <CACRpkdZnfUfPj19Wts1pd5Nxqi-Zp+kTxZCvXrsSM6DjjJpHUQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Keerthy <j-keerthy@ti.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 13, 2016 at 10:27 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Sat, Sep 10, 2016 at 2:04 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
>
>> From: Wei Yongjun <weiyongjun1@huawei.com>
>>
>> Use devm_gpiochip_add_data() for GPIO registration and remove the need
>> of driver callback .remove.
>>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/gpio/gpio-lp873x.c | 12 +-----------
>
> This patch is in Lee's MFD tree, either send it to him so he can merge it
> or defer to after the merge window and I can take it.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> (Yeah I know I can also pull in Lee's immutable branch, just
> want to avoid the complexity.)

Changed my mind: pulled in Lee's immutable branch and applied
this on top. Much better idea. Thanks both Wei and Lee.

Yours,
Linus Walleij
