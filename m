From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH -next v2] pinctrl: artpec6: Fix return value check in
 artpec6_pmx_probe()
Date: Fri, 28 Apr 2017 09:58:14 +0200
Message-ID: <20170428075814.GE10068@axis.com>
References: <20170425032945.22157-1-weiyj.lk@gmail.com>
 <20170425112930.19555-1-weiyj.lk@gmail.com>
 <20170425134000.GN18509@axis.com>
 <CACRpkdZCKcsk1aR00w5DCrkSrbkzUmt9qcrwwFtH4LDsY+B3gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:54806 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424629AbdD1H6W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 03:58:22 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZCKcsk1aR00w5DCrkSrbkzUmt9qcrwwFtH4LDsY+B3gw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jesper Nilsson <jespern@axis.com>, ext Tony Lindgren <tony@atomide.com>, Wei Yongjun <weiyj.lk@gmail.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@axis.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 28, 2017 at 09:43:07AM +0200, Linus Walleij wrote:
> On Tue, Apr 25, 2017 at 3:40 PM, Jesper Nilsson <jesper.nilsson@axis.com> wrote:
> > On Tue, Apr 25, 2017 at 11:29:30AM +0000, Wei Yongjun wrote:
> >> From: Wei Yongjun <weiyongjun1@huawei.com>
> >>
> >> In case of error, the function pinctrl_register() returns
> >> ERR_PTR() not NULL. The NULL test in the return value check
> >> should be replaced with IS_ERR().
> >>
> >> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> >
> > Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> >
> > Although I'm wondering if moving to pinctrl_register_and_init()
> > would sense here. Linus?
> 
> That depends, check on the commits introducing it for the
> usecase.
> 
> OTOMH it was introduced for when you have hogs in drivers
> doing all set-up of groups and functions from the device tree.

Yeah, so in this case it is not necessary, but
the comment above pinctrl_register() explicitly says:
"To avoid issues later on, please use the
new pinctrl_register_and_init() below instead."
Which to me indicates that it is recommended
to use the pinctrl_register_and_init() in future code...

> Tony?
> 
> Yours,
> Linus Walleij

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
