From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH -next v2] pinctrl: artpec6: Fix return value check in
 artpec6_pmx_probe()
Date: Fri, 28 Apr 2017 07:26:14 -0700
Message-ID: <20170428142613.GI3777@atomide.com>
References: <20170425032945.22157-1-weiyj.lk@gmail.com>
 <20170425112930.19555-1-weiyj.lk@gmail.com>
 <20170425134000.GN18509@axis.com>
 <CACRpkdZCKcsk1aR00w5DCrkSrbkzUmt9qcrwwFtH4LDsY+B3gw@mail.gmail.com>
 <20170428075814.GE10068@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:45502 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S938127AbdD1O0S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Apr 2017 10:26:18 -0400
Content-Disposition: inline
In-Reply-To: <20170428075814.GE10068@axis.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jesper Nilsson <jespern@axis.com>, Wei Yongjun <weiyj.lk@gmail.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@axis.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

* Jesper Nilsson <jesper.nilsson@axis.com> [170428 01:01]:
> On Fri, Apr 28, 2017 at 09:43:07AM +0200, Linus Walleij wrote:
> > On Tue, Apr 25, 2017 at 3:40 PM, Jesper Nilsson <jesper.nilsson@axis.com> wrote:
> > > On Tue, Apr 25, 2017 at 11:29:30AM +0000, Wei Yongjun wrote:
> > >> From: Wei Yongjun <weiyongjun1@huawei.com>
> > >>
> > >> In case of error, the function pinctrl_register() returns
> > >> ERR_PTR() not NULL. The NULL test in the return value check
> > >> should be replaced with IS_ERR().
> > >>
> > >> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > >
> > > Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> > >
> > > Although I'm wondering if moving to pinctrl_register_and_init()
> > > would sense here. Linus?
> > 
> > That depends, check on the commits introducing it for the
> > usecase.
> > 
> > OTOMH it was introduced for when you have hogs in drivers
> > doing all set-up of groups and functions from the device tree.
> 
> Yeah, so in this case it is not necessary, but
> the comment above pinctrl_register() explicitly says:
> "To avoid issues later on, please use the
> new pinctrl_register_and_init() below instead."
> Which to me indicates that it is recommended
> to use the pinctrl_register_and_init() in future code...
> 
> > Tony?

If you want to use GENERIC_PINCTRL_GROUPS or GENERIC_PINMUX_FUNCTIONS
want or allocate pins dynamically in the driver, then init needs to be
updated. So yeah I'd use that style init for any new code.

Regards,

Tony
