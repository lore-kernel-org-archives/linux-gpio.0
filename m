Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1BBEB64D9
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Jun 2023 09:54:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245066AbjFOJye convert rfc822-to-8bit (ORCPT
        <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 15 Jun 2023 05:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245692AbjFOJyQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 05:54:16 -0400
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6F92D61;
        Thu, 15 Jun 2023 02:53:42 -0700 (PDT)
X-QQ-mid: Yeas50t1686822773t395t65381
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [183.159.171.58])
X-QQ-SSF: 00400000000000F0FPF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 8017873442922814828
To:     "'Michael Walle'" <michael@walle.cc>,
        "'Andy Shevchenko'" <andy.shevchenko@gmail.com>
Cc:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <shreeya.patel@collabora.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20230607081803.778223-1-jiawenwu@trustnetic.com> <CAHp75Vdbq3uHOyrfT-KFYRSj6v+s9GgOQjQ9a8mGn-4HSCpB9Q@mail.gmail.com> <15e2fc098a1e63317368f4812290ca35@walle.cc>
In-Reply-To: <15e2fc098a1e63317368f4812290ca35@walle.cc>
Subject: RE: [PATCH v2] gpiolib: Fix GPIO chip IRQ initialization restriction
Date:   Thu, 15 Jun 2023 17:52:52 +0800
Message-ID: <010401d99f6f$26d41600$747c4200$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQJryWnquP8Y9u98p8GNjzLx69HVGQGrRNiSAZtbv0+uTRIGMA==
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thursday, June 15, 2023 5:26 PM, Michael Walle wrote:
> Am 2023-06-07 16:12, schrieb Andy Shevchenko:
> > +Cc: Michael
> >
> > On Wed, Jun 7, 2023 at 11:20 AM Jiawen Wu <jiawenwu@trustnetic.com>
> > wrote:
> >>
> >> In case of gpio-regmap, IRQ chip is added by regmap-irq and associated
> >> with
> >> GPIO chip by gpiochip_irqchip_add_domain(). The initialization flag
> >> was not
> >> added in gpiochip_irqchip_add_domain(), causing gpiochip_to_irq() to
> >> return
> >> -EPROBE_DEFER.
> >
> > Makes sense to me.
> > FWIW,
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > But it would be nice to hear from Michael about this.
> 
> Thanks for bringing this to my attention. In fact, currently
> my sl28cpld is broken due to this. So:

Thanks for your test, it's exciting for me to actually fix a bug.

BTW, I wonder if it has problems when unregistering gpio-regmap.
Call Trace of irq_domain_remove() always exits in my test:
https://lore.kernel.org/all/011c01d98d3d$99e6c6e0$cdb454a0$@trustnetic.com/

Of course, it could be because there was something wrong with my
test code. But I want to be clear about this.

> 
> Reviewed-by: Michael Walle <michael@walle.cc>
> Tested-by: Michael Walle <michael@walle.cc> # on kontron-sl28
> 
> >> Fixes: 5467801f1fcb ("gpio: Restrict usage of GPIO chip irq members
> >> before initialization")
> >> Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
> 
> -michael
> 

