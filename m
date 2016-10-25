From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: altera-a10sr: Drop unnecessary gpiochip_remove
Date: Tue, 25 Oct 2016 13:59:08 +0200
Message-ID: <CACRpkdagz_Pxu-hTov857hgbJrGwJ+Bj-Hpb5gb+xK0AtONvOA@mail.gmail.com>
References: <1477320553-4676-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:37511 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbcJYL7K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 07:59:10 -0400
Received: by mail-qt0-f171.google.com with SMTP id r21so8999061qtr.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2016 04:59:09 -0700 (PDT)
In-Reply-To: <1477320553-4676-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Thor Thayer <tthayer@opensource.altera.com>, Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 24, 2016 at 4:49 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> It's not necessary to unregister gpio_chip which registered
> with devm_gpiochip_add_data().
> Also get rid of useless altr_a10sr_gpio_remove().
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
