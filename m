From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: tps65218: use devm_gpiochip_add_data() for
 gpio registration
Date: Sun, 18 Sep 2016 13:18:39 +0200
Message-ID: <CACRpkdbF_m-W4wih+=1YudKP2mb2kq4XfVq0VrTBgOV6R3aX5A@mail.gmail.com>
References: <1473990670-19979-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:36248 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754009AbcIRLSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2016 07:18:41 -0400
Received: by mail-oi0-f45.google.com with SMTP id t83so30837197oie.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2016 04:18:40 -0700 (PDT)
In-Reply-To: <1473990670-19979-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 16, 2016 at 3:51 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Use devm_gpiochip_add_data() for GPIO registration and remove the need
> of driver callback .remove.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
