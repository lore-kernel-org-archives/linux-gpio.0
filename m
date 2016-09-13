From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH -next] gpio: lp873x: Use devm_gpiochip_add_data() for
 gpio registration
Date: Tue, 13 Sep 2016 09:45:52 +0100
Message-ID: <20160913084552.GC22903@dell>
References: <1473509082-3996-1-git-send-email-weiyj.lk@gmail.com>
 <CACRpkdZnfUfPj19Wts1pd5Nxqi-Zp+kTxZCvXrsSM6DjjJpHUQ@mail.gmail.com>
 <CACRpkdZ3-H5ekHn2p3owhEmpBFLkWxPUJP_a2jgq_DUz2D+Dbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:38844 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752456AbcIMInz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 04:43:55 -0400
Received: by mail-wm0-f50.google.com with SMTP id 1so187703590wmz.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 01:43:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdZ3-H5ekHn2p3owhEmpBFLkWxPUJP_a2jgq_DUz2D+Dbw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Keerthy <j-keerthy@ti.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, 13 Sep 2016, Linus Walleij wrote:

> On Tue, Sep 13, 2016 at 10:27 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
> > On Sat, Sep 10, 2016 at 2:04 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
> >
> >> From: Wei Yongjun <weiyongjun1@huawei.com>
> >>
> >> Use devm_gpiochip_add_data() for GPIO registration and remove the need
> >> of driver callback .remove.
> >>
> >> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> >> ---
> >>  drivers/gpio/gpio-lp873x.c | 12 +-----------
> >
> > This patch is in Lee's MFD tree, either send it to him so he can merge it
> > or defer to after the merge window and I can take it.
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > (Yeah I know I can also pull in Lee's immutable branch, just
> > want to avoid the complexity.)
> 
> Changed my mind: pulled in Lee's immutable branch and applied
> this on top. Much better idea. Thanks both Wei and Lee.

:)

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
